//  Created by Alessandro Comparini on 11/09/23.
//

import Foundation

protocol ListQuotesUseCaseGateway: AnyObject {
    func listQuotes() async throws -> [CurrencyQuotes]
    func getQuotesByCurrency(currencyReferency: String,
                             listCurrency: [String]) async throws -> [CurrencyQuotes]
}
