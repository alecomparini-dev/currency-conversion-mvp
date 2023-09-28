//  Created by Alessandro Comparini on 27/09/23.
//

import Foundation

class RemoteListQuotesUseCaseGatewayImpl: ListQuotesUseCaseGateway {
    private let http: HTTPGetClient
    private let url: URL
    private var parameters: Dictionary<String,String>
    
    init(http: HTTPGetClient, url: URL, parameters: Dictionary<String, String>) {
        self.http = http
        self.url = url
        self.parameters = parameters
    }
    

    func listQuotes() async throws -> [CurrencyQuotes] {
        let responseDTO: ResponseDTO = try await http.get(url: url, parameters: parameters)
        
        print(responseDTO)
        
        return []
    }

    
    func getQuotesByCurrency(currencyReferency: String, listCurrency: [String]) async throws -> [CurrencyQuotes] {
        
        parameters.updateValue(listCurrency.joined(separator: ","), forKey: "currencies")
        
        let responseDTO: ResponseDTO = try await http.get(url: url, parameters: parameters)
        
        guard let data = responseDTO.data else {return []}
        
        let quotesCodable = try JSONDecoder().decode(QuotesCodable.self, from: data)
        
        return quotesCodable.mapperToDomain()
    }
    
}
