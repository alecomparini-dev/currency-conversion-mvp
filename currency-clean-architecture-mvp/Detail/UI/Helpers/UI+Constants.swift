//
//  UI+Constants.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 27/08/23.
//

import Foundation

struct K {
    struct Strings {
        static let one = "1"
        static let questionMark = "?"
        static let empty = ""
        static let value = NSLocalizedString("Value", comment: "")
    }
    
    struct Screen {
        
        //  MARK: - CURRENCIES CONVERSION SCREEN
        struct CurrencyConversion {
            static let currencyValueTextField = K.Strings.one
            static let resultLabel = "        "
            static let titleScreen = NSLocalizedString("Currency Conversion", comment: "")
            static let symbolCurrencyOf = "$"
            static let titleCurrencyOf = "USD"
            static let subTitleCurrencyOf = NSLocalizedString("United States Dollar", comment: "")
            static let symbolCurrencyTo = K.Strings.questionMark
            static let titleCurrencyTo = NSLocalizedString("Select", comment: "")
            static let subTitleCurrencyTo = NSLocalizedString("a currency", comment: "")

            struct Images {
                static let currencyOf = "arrow.up.forward.app"
                static let currencyTo = "arrow.up.forward.app"
                static let invertCurrency = "arrow.up.arrow.down.circle.fill"
            }
        }
        
        //  MARK: - LIST CURRENCIES SCREEN
        struct ListCurrencies {
            static let searchBar = NSLocalizedString("Search currency", comment: "")
            static let sortCodeButtonTitle = NSLocalizedString("Acronym", comment: "")
            static let sortNameButtonTitle = NSLocalizedString("Name", comment: "")
            
            struct Images {
                static let backPageButton = "chevron.left"
                static let sortCodeButton = "chevron.down"
                static let favoriteButton = "heart"
                static let favoriteFillButton = "heart.fill"
            }
        }
        
    }
    
    

    
    
    
    
}
