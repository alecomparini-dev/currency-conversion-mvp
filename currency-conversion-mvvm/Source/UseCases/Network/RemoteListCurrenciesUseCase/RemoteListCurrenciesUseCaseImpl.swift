//
//  RemoteListCurrenciesUseCaseImpl.swift.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 19/08/23.
//

import Foundation



class RemoteListCurrenciesUseCaseImpl: RemoteListCurrenciesUseCase {
    private let url: URL
    private let remote: RemoteGetClient

    init(url: URL, remote: RemoteGetClient) {
        self.url = url
        self.remote = remote
    }
    
    func listCurrencies() {
        remote.get(url: url)
    }
    
}

