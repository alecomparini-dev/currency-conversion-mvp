//  Created by Alessandro Comparini on 11/09/23.
//

import Foundation

class ListQuotesUseCaseImpl: ListQuotesUseCase {
    private let listQuotesGateway: ListQuotesUseCaseGateway
    
    init(listQuotesGateway: ListQuotesUseCaseGateway) {
        self.listQuotesGateway = listQuotesGateway
    }
    
    func listQuotes(currencyReference: String) async throws -> [ListQuotesUseCaseDTO.Output] {
        return try await listQuotesByCurrencies(currencyReference: currencyReference, currencies: [])
    }
    

    func listQuotesByCurrencies(currencyReference: String, currencies: [String]) async throws -> [ListQuotesUseCaseDTO.Output] {
        let currencyQuotes: [CurrencyQuotes] = try await listQuotesGateway.listQuotesByCurrencies(currencyReference: currencyReference, currencies: currencies)
        
        return CurrencyQuotesMapper.toOutputDTO(currencyQuotes: currencyQuotes)
    }
    
}
