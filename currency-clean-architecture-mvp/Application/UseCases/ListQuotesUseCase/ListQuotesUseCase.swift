//  Created by Alessandro Comparini on 11/09/23.
//

import Foundation

protocol ListQuotesUseCase: AnyObject {
    func listQuotes(currencyReference: String) async throws -> [ListQuotesUseCaseDTO.Output]
    func listQuotesByCurrencies(currencyReference: String, currencies: [String]) async throws -> [ListQuotesUseCaseDTO.Output]
}
