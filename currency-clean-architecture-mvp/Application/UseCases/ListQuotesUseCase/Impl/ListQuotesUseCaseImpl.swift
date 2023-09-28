//  Created by Alessandro Comparini on 11/09/23.
//

import Foundation

class ListQuotesUseCaseImpl: ListQuotesUseCase {
    private let listQuotesGateway: ListQuotesUseCaseGateway
    
    init(listQuotesGateway: ListQuotesUseCaseGateway) {
        self.listQuotesGateway = listQuotesGateway
    }
    
    func listQuotes(currencyReferency: String = "USD") async throws -> [ListQuotesUseCaseDTO.Output] {
        
        return []
    }
    

    func getQuotesByCurrency(currencyReferency: String, listCurrency: [String]) async throws -> [ListQuotesUseCaseDTO.Output] {
        
        return []
    }

}
