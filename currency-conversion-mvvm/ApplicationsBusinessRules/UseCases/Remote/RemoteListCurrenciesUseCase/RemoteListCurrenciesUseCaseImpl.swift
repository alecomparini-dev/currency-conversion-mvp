//
//  RemoteListCurrenciesUseCaseImpl.swift.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 19/08/23.
//

import Foundation

//  MARK: - DELEGATE
protocol RemoteListCurrenciesUseCaseDelegate: AnyObject {
    
}


//  MARK: - CLASS
class RemoteListCurrenciesUseCaseImpl: RemoteListCurrenciesUseCase {
    weak var delegate: RemoteListCurrenciesUseCaseDelegate?
    
    private let url: URL
    private let adapter: RemoteListCurrenciesUseCaseAdapter

    init(url: URL, adapter: RemoteListCurrenciesUseCaseAdapter) {
        self.url = url
        self.adapter = adapter
    }
    
    func listCurrencies() {
        let currencies = adapter.remoteListCurrencies(url: url, parameters: ["access_key": Environment.variable(.accessKey)])
        
        print("tem que estar vazio", currencies)
    }
    
}

