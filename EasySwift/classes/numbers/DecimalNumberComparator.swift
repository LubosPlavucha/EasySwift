

import Foundation

public class DecimalNumberComparator {
 
    
    public class func greaterThanZero(value: NSDecimalNumber) -> Bool {
        if value.compare(NSDecimalNumber.zero()) == .OrderedDescending {
            return true
        }
        return false
    }
    
    
    public class func lessThanZero(value: NSDecimalNumber) -> Bool {
        if value.compare(NSDecimalNumber.zero()) == .OrderedAscending {
            return true
        }
        return false
    }
    
    
    public class func equalsZero(value: NSDecimalNumber) -> Bool {
        if value.compare(NSDecimalNumber.zero()) == .OrderedSame {
            return true
        }
        return false
    }
    
    /** Compares if 2 decimals equals. */
    public class func equals(value1: NSDecimalNumber, value2: NSDecimalNumber) -> Bool {
        if value1.compare(value2) == .OrderedSame {
            return true
        }
        return false
    }
    
    
    /** Compares if the first decimal is greater than the second one. */
    public class func greaterThan(value1: NSDecimalNumber, value2: NSDecimalNumber) -> Bool {
        if value1.compare(value2) == .OrderedDescending {
            return true
        }
        return false
    }
    
    
    /** Compares if the first decimal is less than the second one. */
    public class func lessThan(value1: NSDecimalNumber, value2: NSDecimalNumber) -> Bool {
        if value1.compare(value2) == .OrderedAscending {
            return true
        }
        return false
    }
}
