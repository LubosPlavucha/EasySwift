//
//  CloneUtil.swift
//  HomeBudgetSoft
//
//  Created by lubos plavucha on 17/12/14.
//  Copyright (c) 2014 Acepricot. All rights reserved.
//

import Foundation
import CoreData


open class CloneUtil {
    
    
    open class func insertClone(_ managedObject: NSManagedObject, managedObjectContext: NSManagedObjectContext, entityName: String) -> NSManagedObject {
        
        let clone = NSEntityDescription.insertNewObject(forEntityName: entityName, into: managedObjectContext) 
        
        for propertyName in managedObject.entity.propertiesByName.keys {
            clone.setValue(managedObject.value(forKey: propertyName ), forKey: propertyName )
        }
        return clone
    }
}
