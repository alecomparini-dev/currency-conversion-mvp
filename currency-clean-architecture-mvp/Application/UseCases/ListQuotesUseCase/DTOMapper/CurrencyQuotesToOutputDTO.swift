//  Created by Alessandro Comparini on 28/09/23.
//

import Foundation

struct CurrencyQuotesMapper {
    
    static func toOutputDTO(currencyQuotes: [CurrencyQuotes]) -> [ListQuotesUseCaseDTO.Output] {
        return currencyQuotes.map {    
            ListQuotesUseCaseDTO.Output(currencyISO: $0.currencyISO, quotes: $0.quotes)
        }
    }
    
}
