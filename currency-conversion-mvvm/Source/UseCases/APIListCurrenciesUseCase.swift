//
//  ApiListCurrenciesUseCase.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 19/08/23.
//

import Foundation

class APIListCurrenciesUseCase {
    
    private let url: URL
//    private let httpClient: HTTPGetClient
    private let httpClient: AlamofireAdapter

    init(url: URL, httpClient: AlamofireAdapter) {
        self.url = url
        self.httpClient = httpClient
    }
    
    func listCurrencies() async throws -> Data {
        return try await httpClient.get()
    }
    
}
