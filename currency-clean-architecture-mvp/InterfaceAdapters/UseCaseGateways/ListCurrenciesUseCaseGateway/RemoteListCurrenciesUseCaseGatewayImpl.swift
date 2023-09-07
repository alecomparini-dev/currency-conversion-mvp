//
//  RemoteListCurrenciesUseCaseGatewayImpl.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 21/08/23.
//

import Foundation


class RemoteListCurrenciesUseCaseGatewayImpl: ListCurrenciesUseCaseGateway {
    
    private let http: HTTPGetClient
    private let url: URL
    private let parameters: Dictionary<String,String>
    
    init(http: HTTPGetClient, url: URL, parameters: Dictionary<String, String>) { 
        self.http = http
        self.url = url
        self.parameters = parameters
    }
    
    func listCurrencies() async throws -> [Currency] {
        let response = try await http.get(url: url, parameters: parameters)
        guard let data = response.data else {return []}
        
        let currenciesCodable = try JSONDecoder().decode(CurrenciesCodable.self, from: data)
        
        return currenciesCodable.mapperToDomain()
    }
    
    
    
}
    
