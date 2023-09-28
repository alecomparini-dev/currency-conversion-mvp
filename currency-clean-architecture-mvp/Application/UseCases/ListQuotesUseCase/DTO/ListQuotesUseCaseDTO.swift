//  Created by Alessandro Comparini on 11/09/23.
//

import Foundation


enum ListQuotesUseCaseDTO {

    struct Input {
        let currencyReference: String = "USD"
    }
    
    struct Output {
        var currencyISO: String?
        var quotes: Double?
    }

}

