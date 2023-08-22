//
//  RemoteListCurrenciesUseCaseAdapter.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 21/08/23.
//

import Foundation

protocol RemoteListCurrenciesUseCaseAdapter: AnyObject {
    func remoteListCurrencies(url: URL, parameters: Dictionary<String,String>) -> [Currency]
}


//  MARK: -
class RemoteListCurrenciesUseCaseAdapterImpl: RemoteListCurrenciesUseCaseAdapter {
    private let http: HTTPGet
    
    init(http: HTTPGet) {
        self.http = http
    }
    
    func remoteListCurrencies(url: URL, parameters: Dictionary<String, String>) -> [Currency] {
        Task {
            let data = try await http.get(url: url, parameters: parameters)
            print(try! JSONSerialization.jsonObject(with: data))
        }
        return []
    }
    
}
