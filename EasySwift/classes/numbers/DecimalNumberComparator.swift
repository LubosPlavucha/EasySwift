

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
}
