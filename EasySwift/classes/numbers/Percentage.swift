//
//  Percentage.swift
//  EasySwift
//
//  Created by lubos plavucha on 27/02/15.
//  Copyright (c) 2015 lubos plavucha. All rights reserved.
//

import Foundation

open class Percentage {
    
    
    open class func percentageOfNumberFromNumber(_ baseNumber: NSDecimalNumber, quotientNumber: NSDecimalNumber) -> Float {
        if(baseNumber.compare(NSDecimalNumber.zero) == .orderedSame) {
            return 0;	// number cannot be divided by 0
        }
        return quotientNumber.dividing(by: baseNumber).floatValue * 100
    }
    
    
    open class func numberFromPercentageOfNumber(_ baseNumber: NSDecimalNumber, percentage: NSDecimalNumber) -> Double {
        return (baseNumber.doubleValue / 100) * percentage.doubleValue
    }
    
    
    open class func numberFromPercentageOfNumber(_ baseNumber: Float, percentage: Float) -> Float {
        return (baseNumber / 100) * percentage
    }
    
}
