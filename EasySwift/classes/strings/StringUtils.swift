

import Foundation


open class StringUtils {
    
    
    // TODO - test more cases (unit test)
    open class func isAlphabetical(_ string: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", "[A-Za-z]*")
        return predicate.evaluate(with: string)
    }
}
