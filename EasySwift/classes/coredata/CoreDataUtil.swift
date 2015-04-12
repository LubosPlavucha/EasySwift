//
//  CoreDataUtil.swift
//  HomeBudgetSoft
//
//  Created by lubos plavucha on 17/11/14.
//  Copyright (c) 2014 Acepricot. All rights reserved.
//

import Foundation
import CoreData

public class CoreDataUtil {
    
    
    public class func retrieve(managedObjectContext: NSManagedObjectContext, entityName: String, sortBy: String? = nil, isAscending:
        Bool = true, predicate: NSPredicate? = nil, properties: Array<String>? = nil, limit: Int? = nil) -> [AnyObject] {
        
        let request = NSFetchRequest(entityName: entityName)
        request.returnsObjectsAsFaults = false
        request.predicate = predicate
            
        if limit != nil {
            request.fetchLimit = limit!
        }
        
        if (sortBy != nil) {
            var sorter = NSSortDescriptor(key:sortBy! , ascending:isAscending)
            request.sortDescriptors = [sorter]
        }
            
        if properties != nil {
            request.resultType = .DictionaryResultType
            request.propertiesToFetch = properties
        }
        
        var error: NSError? = nil
        var fetchedResult = managedObjectContext.executeFetchRequest(request, error: &error)
        if error != nil {
            NSLog("errore: \(error)")
        }
        
        return fetchedResult!
    }
    
    
    public class func getByObjectId(managedObjectContext: NSManagedObjectContext, objectId: NSManagedObjectID) -> AnyObject? {
        
        var error: NSError? = nil
        let entity = managedObjectContext.existingObjectWithID(objectId, error: &error)
        
        if error != nil {
            NSLog("errore: \(error)")
        }
        
        return entity
    }
    
    
    // this method checks if entity exists in store
    public class func entityExists(managedObjectContext: NSManagedObjectContext, entityName: String, predicate:NSPredicate? = nil) -> Bool {
        return entityCount(managedObjectContext, entityName: entityName, predicate: predicate) > 0
    }
    
    
    public class func entityCount(managedObjectContext: NSManagedObjectContext, entityName: String, predicate:NSPredicate? = nil) -> Int {
        
        let request = NSFetchRequest(entityName: entityName)
        request.predicate = predicate
        
        var error: NSError? = nil
        let count = managedObjectContext.countForFetchRequest(request, error: &error)
        
        if error != nil {
            NSLog("error: \(error)")
        }
        return count
    }
    
    
    // saves and commits new entity in default state
    public class func insertAndCommit(managedObjectContext: NSManagedObjectContext, entityName: String) -> Result<AnyObject, String> {
        
        let newObject: AnyObject = NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: managedObjectContext)
        
        let result = commit(managedObjectContext, rollbackIfError: true)
        if result.isSuccess() {
            return Result(success: newObject)
        } else {
            return Result(error: result.getFailureMessage()!)
        }
    }
    
    
    // deletes and commits entities fetched by predicate
    public class func deleteAndCommit(managedObjectContext: NSManagedObjectContext, entityName: String, predicate: NSPredicate) -> Result<Bool, String> {
        
        let entities = CoreDataUtil.retrieve(managedObjectContext, entityName: entityName, predicate: predicate) as! [NSManagedObject]
        
        if !entities.isEmpty {
            for entity in entities {
                managedObjectContext.deleteObject(entity)
            }
        }
        return commit(managedObjectContext, rollbackIfError: true)
    }
    
    
    // deletes entities fetched by predicate
    public class func delete(managedObjectContext: NSManagedObjectContext, entityName: String, predicate: NSPredicate) {
        
        let entities = CoreDataUtil.retrieve(managedObjectContext, entityName: entityName, predicate: predicate) as! [NSManagedObject]
        
        if !entities.isEmpty {
            for entity in entities {
                managedObjectContext.deleteObject(entity)
            }
        }
    }
    
    
    public class func deleteAndCommit(managedObjectContext: NSManagedObjectContext, entity: NSManagedObject) -> Result<Bool, String> {
        
        managedObjectContext.deleteObject(entity)
        return commit(managedObjectContext, rollbackIfError: true)
    }
    
    
    /** Saves (commits) changes in managed object context. The saving is executed only if there are unsaved changes. */
    public class func commit(managedObjectContext: NSManagedObjectContext, rollbackIfError:Bool = false) -> Result<Bool, String> {
        
        var error: NSError? = nil
        if managedObjectContext.hasChanges && !managedObjectContext.save(&error) {
            NSLog("Could not save \(error), \(error?.userInfo)")  // TODO error is nil when saving fails ?
            if rollbackIfError {
                managedObjectContext.rollback()
            }
            return Result(error: "Saving failed")  // TODO returns validation ?
        }
        return Result(success: true)
    }
}
