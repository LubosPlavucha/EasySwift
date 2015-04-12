

import Foundation


public class StringUtils {
    
    
    // TODO - test more cases (unit test)
    public class func isAlphabetical(string: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", "[A-Za-z]*")
        return predicate.evaluateWithObject(string)
    }
}
