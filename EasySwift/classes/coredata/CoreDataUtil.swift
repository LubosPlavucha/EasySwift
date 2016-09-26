//
//  CoreDataUtil.swift
//  HomeBudgetSoft
//
//  Created by lubos plavucha on 17/11/14.
//  Copyright (c) 2014 Acepricot. All rights reserved.
//

import Foundation
import CoreData

open class CoreDataUtil {
    
    
    open class func retrieve(_ managedObjectContext: NSManagedObjectContext, entityName: String, sortBy: String? = nil, isAscending:
        Bool = true, predicate: NSPredicate? = nil, properties: Array<String>? = nil, limit: Int? = nil, returnsObjectsAsFaults: Bool? = false) -> [AnyObject] {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        request.returnsObjectsAsFaults = returnsObjectsAsFaults!
        request.predicate = predicate
            
        if limit != nil {
            request.fetchLimit = limit!
        }
        
        if (sortBy != nil) {
            let sorter = NSSortDescriptor(key:sortBy! , ascending:isAscending)
            request.sortDescriptors = [sorter]
        }
            
        if properties != nil {
            request.resultType = .dictionaryResultType
            request.propertiesToFetch = properties
        }
        
        var error: NSError? = nil
        var fetchedResult: [AnyObject]?
        do {
            fetchedResult = try managedObjectContext.fetch(request)
        } catch let error1 as NSError {
            error = error1
            fetchedResult = nil
        }
        if error != nil {
            NSLog("errore: \(error)")
        }
        
        return fetchedResult!
    }
    
    
    open class func getByObjectId(_ managedObjectContext: NSManagedObjectContext, objectId: NSManagedObjectID) -> AnyObject? {
        
        var entity: NSManagedObject?
        do {
            entity = try managedObjectContext.existingObject(with: objectId)
        } catch let error as NSError {
            NSLog("error: \(error.localizedDescription)")
        }
        return entity
    }
    
    
    // this method checks if entity exists in store
    open class func entityExists(_ managedObjectContext: NSManagedObjectContext, entityName: String, predicate:NSPredicate? = nil) -> Bool {
        return entityCount(managedObjectContext, entityName: entityName, predicate: predicate) > 0
    }
    
    
    open class func entityCount(_ managedObjectContext: NSManagedObjectContext, entityName: String, predicate: NSPredicate? = nil) -> Int {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        request.predicate = predicate

        var count = 0
        do {
            try count = managedObjectContext.count(for: request)
        } catch let error as NSError {
            NSLog("error: \(error.localizedDescription)")
        }
        return count
    }
    
    
    // saves and commits new entity in default state
    open class func insertAndCommit(_ managedObjectContext: NSManagedObjectContext, entityName: String) -> Result<AnyObject, String> {
        
        let newObject: AnyObject = NSEntityDescription.insertNewObject(forEntityName: entityName, into: managedObjectContext)
        
        let result = commit(managedObjectContext, rollbackIfError: true)
        if result.isSuccess() {
            return Result(success: newObject)
        } else {
            return Result(error: result.getFailureMessage()!)
        }
    }
    
    
    // deletes and commits entities fetched by predicate
    open class func deleteAndCommit(_ managedObjectContext: NSManagedObjectContext, entityName: String, predicate: NSPredicate) -> Result<Bool, String> {
        
        let entities = CoreDataUtil.retrieve(managedObjectContext, entityName: entityName, predicate: predicate) as! [NSManagedObject]
        
        if !entities.isEmpty {
            for entity in entities {
                managedObjectContext.delete(entity)
            }
        }
        return commit(managedObjectContext, rollbackIfError: true)
    }
    
    
    // deletes entities fetched by predicate
    open class func delete(_ managedObjectContext: NSManagedObjectContext, entityName: String, predicate: NSPredicate) {
        
        let entities = CoreDataUtil.retrieve(managedObjectContext, entityName: entityName, predicate: predicate) as! [NSManagedObject]
        
        if !entities.isEmpty {
            for entity in entities {
                managedObjectContext.delete(entity)
            }
        }
    }
    
    
    open class func deleteAndCommit(_ managedObjectContext: NSManagedObjectContext, entity: NSManagedObject) -> Result<Bool, String> {
        
        managedObjectContext.delete(entity)
        return commit(managedObjectContext, rollbackIfError: true)
    }
    
    
    /** Saves (commits) changes in managed object context. The saving is executed only if there are unsaved changes. */
    open class func commit(_ managedObjectContext: NSManagedObjectContext, rollbackIfError:Bool = false) -> Result<Bool, String> {
        
        var error: NSError? = nil
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch let error1 as NSError {
                error = error1
                NSLog("Could not save \(error), \(error?.userInfo)")
                if rollbackIfError {
                    managedObjectContext.rollback()
                }
                return Result(error: "Saving failed")
            }
        }
        return Result(success: true)
    }
    
    
    // this version of the commit returns NSError (where the validation message can be encapsulated)
    open class func commitAndReturnError(_ managedObjectContext: NSManagedObjectContext, rollbackIfError: Bool = false) throws {
        
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch let error as NSError {
                if rollbackIfError {
                    managedObjectContext.rollback()
                }
                throw error
            }
        }
    }
}
