//  Created by Alessandro Comparini on 08/09/23.
//

import Foundation

enum ConversionUseCaseDTO {

    struct Input {
        let currencyReference: String
        let currencyOf: String
        let currencyTo: String
        let value: Double
        
        init(currencyReference: String = "USD", currencyOf: String, currencyTo: String, value: Double) {
            self.currencyReference = currencyReference
            self.currencyOf = currencyOf
            self.currencyTo = currencyTo
            self.value = value
        }
    }
    
    struct Output {
        var conversionResult: Double
    }

}

