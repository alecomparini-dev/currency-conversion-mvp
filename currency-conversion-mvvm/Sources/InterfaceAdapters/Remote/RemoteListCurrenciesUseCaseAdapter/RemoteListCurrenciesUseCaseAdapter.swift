//
//  RemoteListCurrenciesUseCaseAdapter.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 21/08/23.
//

import Foundation

protocol RemoteListCurrenciesUseCaseAdapter: AnyObject {
    func remoteListCurrencies() -> [Currency]
}


//  MARK: -
class RemoteListCurrenciesUseCaseAdapterImpl: RemoteListCurrenciesUseCaseAdapter {
    private let http: HTTPGet
    
    init(http: HTTPGet) {
        self.http = http
    }
    
    func remoteListCurrencies() -> [Currency] {
        let url: URL = URL(string: "")!
        let parameters: Dictionary<String,String> = ["access_key": Environment.variable(.accessKey)]
        
        Task {
            let data = try await http.get(url: url, parameters: parameters)
        }
        
        return []
    }
    
}
