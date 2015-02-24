//
//  CloneUtil.swift
//  HomeBudgetSoft
//
//  Created by lubos plavucha on 17/12/14.
//  Copyright (c) 2014 Acepricot. All rights reserved.
//

import Foundation
import CoreData


public class CloneUtil {
    
    
    public class func insertClone(managedObject: NSManagedObject, managedObjectContext: NSManagedObjectContext, entityName: String) -> NSManagedObject {
        
        var clone = NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: managedObjectContext) as NSManagedObject
        
        for propertyName in managedObject.entity.propertiesByName.keys {
            clone.setValue(managedObject.valueForKey(propertyName as String), forKey: propertyName as String)
        }
        return clone
    }
}
