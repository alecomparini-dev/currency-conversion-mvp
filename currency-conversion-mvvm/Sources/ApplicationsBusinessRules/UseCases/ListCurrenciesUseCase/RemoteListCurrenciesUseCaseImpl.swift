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
class RemoteListCurrenciesUseCaseImpl: ListCurrenciesUseCase {
    weak var delegate: RemoteListCurrenciesUseCaseDelegate?
    
    private let url: URL
    private let adapter: RemoteListCurrenciesUseCaseAdapter

    init(url: URL, adapter: RemoteListCurrenciesUseCaseAdapter) {
        self.url = url
        self.adapter = adapter
    }
    
    func listCurrencies() {
//    url: url, parameters: ["access_key": Environment.variable(.accessKey)]
        
        let currencies = adapter.remoteListCurrencies()
        print("tem que estar vazio", currencies)
    }
    
}

