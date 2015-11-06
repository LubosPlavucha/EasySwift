//
//  DecimalNumberFactory.swift
//  HomeBudgetSoft
//
//  Created by lubos plavucha on 04/11/14.
//  Copyright (c) 2014 Acepricot. All rights reserved.
//

import Foundation

public class DecimalNumberFactory {
 
    
    
    public class func getDecimal(value:Int, scale:Int = 0) -> NSDecimalNumber {
        var negative = value < 0
        let numberFormatter = NSNumberFormatter()
        numberFormatter.minimumFractionDigits = scale
        numberFormatter.maximumFractionDigits = scale
        numberFormatter.numberStyle = .DecimalStyle
        numberFormatter.roundingMode = .RoundUp
        let number = numberFormatter.stringFromNumber(value)
        return NSDecimalNumber(string: number)
    }

    
    public class func makeNegative(value:NSDecimalNumber) -> NSDecimalNumber {
        // if the number is positive, make it negative, otherwise return the same number
        if value.compare(NSDecimalNumber.zero()) == .OrderedDescending {
            return NSDecimalNumber(string: "-" + value.stringValue)
        }
        return value
    }
    
    
    public class func makePositive(value:NSDecimalNumber) -> NSDecimalNumber {
        // make number positive, but only if it is negative, otherwise return the same number
        if value.compare(NSDecimalNumber.zero()) == .OrderedAscending {
            let negative = NSDecimalNumber(mantissa: 1, exponent: 0, isNegative: true)
            return value.decimalNumberByMultiplyingBy(negative) // multiplying negative number by negative number brings us positive one
        }
        return value
    }
    
    
    public class func round(value:NSDecimalNumber, scale:Int16) -> NSDecimalNumber {
        
        let numberHandler = NSDecimalNumberHandler(roundingMode: .RoundUp, scale: scale, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
        return value.decimalNumberByRoundingAccordingToBehavior(numberHandler)
    }
    
    
    public class func parseDecimal(value:String, formatter:NSNumberFormatter) -> NSDecimalNumber? {
        
        let openingBalanceNumber = formatter.numberFromString(value)
        if openingBalanceNumber == nil {
            return nil
        }
        return NSDecimalNumber(string: openingBalanceNumber!.stringValue)
    }

}
