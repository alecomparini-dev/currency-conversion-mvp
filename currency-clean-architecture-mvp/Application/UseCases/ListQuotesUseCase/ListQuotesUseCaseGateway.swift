//  Created by Alessandro Comparini on 11/09/23.
//

import Foundation

protocol ListQuotesUseCaseGateway: AnyObject {
    func listQuotesByCurrencies(currencyReference: String,
                                currencies: [String]) async throws -> [CurrencyQuotes]
}
