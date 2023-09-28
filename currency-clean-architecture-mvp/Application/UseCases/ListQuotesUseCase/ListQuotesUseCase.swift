//  Created by Alessandro Comparini on 11/09/23.
//

import Foundation

protocol ListQuotesUseCase: AnyObject {
    func listQuotes(currencyReferency: String) async throws -> [ListQuotesUseCaseDTO.Output]
    func getQuotesByCurrency(currencyReferency: String, listCurrency: [String]) async throws -> [ListQuotesUseCaseDTO.Output]
}
