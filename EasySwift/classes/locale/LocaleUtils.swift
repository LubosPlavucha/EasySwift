//  Created by lubos plavucha on 05/11/14.
//  Copyright (c) 2014 Acepricot. All rights reserved.
//

import Foundation

public class LocaleUtils {
    
    
    public struct Currency {
        
        /** load currency codes and currency symbols - derived from all available locales */
        private static var currencies: [String:String?] = {
            var currencyCodes = [String:String?]()
            for localeIdentifier in NSLocale.availableLocaleIdentifiers() {
                let locale = NSLocale(localeIdentifier: localeIdentifier )
                if let currencyCode = locale.objectForKey(NSLocaleCurrencyCode) as? String {
                    if currencyCode == "USD" {
                        currencyCodes[currencyCode] = "$"   // the runtime return "US$" for US Dollar, which doesn't look nice -> check if this is changed in next iOS versions
                    } else {
                        currencyCodes[currencyCode] = locale.objectForKey(NSLocaleCurrencySymbol) as? String
                    }
                }
            }
            return currencyCodes
        }()
        
        
        // TODO add mapping Locale -> Currency Code
        
        
        /** Returns all currency codes derived from all available locales */
        public static func getCurrencyCodes() -> Array<String> {
            return Array(currencies.keys)
        }
        
        /** Return currency symbol for currency code. The currency code should be valid code derivable from locale. */
        public static func getCurrencySymbol(currencyCode: String) -> String? {
            if let symbol = currencies[currencyCode] {
                return symbol
            }
            return ""
        }
    }
    
}
