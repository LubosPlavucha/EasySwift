

import Foundation

open class DecimalNumberComparator {
 
    
    open class func greaterThanZero(_ value: NSDecimalNumber) -> Bool {
        if value.compare(NSDecimalNumber.zero) == .orderedDescending {
            return true
        }
        return false
    }
    
    
    open class func lessThanZero(_ value: NSDecimalNumber) -> Bool {
        if value.compare(NSDecimalNumber.zero) == .orderedAscending {
            return true
        }
        return false
    }
    
    
    open class func equalsZero(_ value: NSDecimalNumber) -> Bool {
        if value.compare(NSDecimalNumber.zero) == .orderedSame {
            return true
        }
        return false
    }
    
    /** Compares if 2 decimals equals. */
    open class func equals(_ value1: NSDecimalNumber, value2: NSDecimalNumber) -> Bool {
        if value1.compare(value2) == .orderedSame {
            return true
        }
        return false
    }
    
    
    /** Compares if the first decimal is greater than the second one. */
    open class func greaterThan(_ value1: NSDecimalNumber, value2: NSDecimalNumber) -> Bool {
        if value1.compare(value2) == .orderedDescending {
            return true
        }
        return false
    }
    
    
    /** Compares if the first decimal is less than the second one. */
    open class func lessThan(_ value1: NSDecimalNumber, value2: NSDecimalNumber) -> Bool {
        if value1.compare(value2) == .orderedAscending {
            return true
        }
        return false
    }
}
