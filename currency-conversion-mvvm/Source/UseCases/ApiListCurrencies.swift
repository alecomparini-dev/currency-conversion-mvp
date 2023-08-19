//
//  ApiListCurrencies.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 19/08/23.
//

import Foundation

class ApiListCurrencies {
    
    private let url: URL
    private let httpClient: HTTPGetClient

    init(url: URL, httpClient: HTTPGetClient) {
        self.url = url
        self.httpClient = httpClient
    }
    
    func listCurrencies() {
        
    }
    
}
