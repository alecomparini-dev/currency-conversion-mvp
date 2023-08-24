//
//  ListCurrenciesUseCaseAPIGateway.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 21/08/23.
//

import Foundation


class ListCurrenciesUseCaseAPIGateway: ListCurrenciesUseCaseGateway {
    private let http: HTTPGetClient
    private let url: URL
    private let parameters: Dictionary<String,String>
    
    init(http: HTTPGetClient, url: URL, parameters: Dictionary<String, String>) { 
        self.http = http
        self.url = url
        self.parameters = parameters
    }
    
    func getCurrencies() async throws -> [Currency] {
        let data = try await http.get(url: url, parameters: parameters)
        let currenciesCodable = try JSONDecoder().decode(CurrenciesCodable.self, from: data)
        return currenciesCodable.mapperToDomain()
    }
    
}
    
