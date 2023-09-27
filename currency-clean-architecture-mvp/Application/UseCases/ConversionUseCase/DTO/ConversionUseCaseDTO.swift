//  Created by Alessandro Comparini on 08/09/23.
//

import Foundation

enum ConversionUseCaseDTO {

    struct Input {
        let currencyOf: String
        let currencyTo: String
        let value: Double
    }
    
    struct Output {
        var conversionResult: Double
    }

}

