//
//  Percentage.swift
//  EasySwift
//
//  Created by lubos plavucha on 27/02/15.
//  Copyright (c) 2015 lubos plavucha. All rights reserved.
//

import Foundation

public class Percentage {
    
    
    public class func percentageOfNumberFromNumber(baseNumber: NSDecimalNumber, quotientNumber: NSDecimalNumber) -> Float {
        if(baseNumber.compare(NSDecimalNumber.zero()) == .OrderedSame) {
            return 0;	// number cannot be divided by 0
        }
        return quotientNumber.decimalNumberByDividingBy(baseNumber).floatValue * 100
    }
    
    
    public class func numberFromPercentageOfNumber(baseNumber: NSDecimalNumber, percentage: NSDecimalNumber) -> Double {
        return (baseNumber.doubleValue / 100) * percentage.doubleValue
    }
    
    
    public class func numberFromPercentageOfNumber(baseNumber: Float, percentage: Float) -> Float {
        return (baseNumber / 100) * percentage
    }
    
}
