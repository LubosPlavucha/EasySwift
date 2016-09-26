//
//  DecimalNumberFactory.swift
//  HomeBudgetSoft
//
//  Created by lubos plavucha on 04/11/14.
//  Copyright (c) 2014 Acepricot. All rights reserved.
//

import Foundation

open class DecimalNumberFactory {
 
    
    
    open class func getDecimal(_ value:Int, scale:Int = 0) -> NSDecimalNumber {
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = scale
        numberFormatter.maximumFractionDigits = scale
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .up
        let number = numberFormatter.string(from: NSNumber(value: value))
        return NSDecimalNumber(string: number)
    }

    
    open class func makeNegative(_ value:NSDecimalNumber) -> NSDecimalNumber {
        // if the number is positive, make it negative, otherwise return the same number
        if value.compare(NSDecimalNumber.zero) == .orderedDescending {
            return NSDecimalNumber(string: "-" + value.stringValue)
        }
        return value
    }
    
    
    open class func makePositive(_ value:NSDecimalNumber) -> NSDecimalNumber {
        // make number positive, but only if it is negative, otherwise return the same number
        if value.compare(NSDecimalNumber.zero) == .orderedAscending {
            let negative = NSDecimalNumber(mantissa: 1, exponent: 0, isNegative: true)
            return value.multiplying(by: negative) // multiplying negative number by negative number brings us positive one
        }
        return value
    }
    
    
    open class func round(_ value:NSDecimalNumber, scale:Int16) -> NSDecimalNumber {
        
        let numberHandler = NSDecimalNumberHandler(roundingMode: .up, scale: scale, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
        return value.rounding(accordingToBehavior: numberHandler)
    }
    
    
    open class func parseDecimal(_ value:String, formatter:NumberFormatter) -> NSDecimalNumber? {
        
        let openingBalanceNumber = formatter.number(from: value)
        if openingBalanceNumber == nil {
            return nil
        }
        return NSDecimalNumber(string: openingBalanceNumber!.stringValue)
    }

}
