//
//  ListCurrenciesAPI.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 21/08/23.
//

import Foundation

protocol ListCurrenciesAdapter: AnyObject {
    func getCurrencies()
}


//  MARK: -
class ListCurrenciesAPI: ListCurrenciesAdapter {
    private let http: HTTPGetClient
    private let url: URL
    private let parameters: Dictionary<String,String>
    
    init(http: HTTPGetClient, url: URL, parameters: Dictionary<String, String>) {
        self.http = http
        self.url = url
        self.parameters = parameters
    }
    
    func getCurrencies() {
        Task {
            let data = try await http.get(url: url, parameters: parameters)
            let currenciesDTO = try JSONDecoder().decode(CurrenciesDTO.self, from: data)
            print(currenciesDTO)
        }
    }
    
}
