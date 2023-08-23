//
//  RemoteListCurrenciesUseCase.swift.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 19/08/23.
//

import Foundation


//  MARK: - DELEGATE
protocol RemoteListCurrenciesUseCaseDelegate: AnyObject {
    
}


//  MARK: - CLASS
class RemoteListCurrenciesUseCase: ListCurrenciesUseCase {
    
    weak var delegate: RemoteListCurrenciesUseCaseDelegate?
    
    private let remoteCurrenciesAdapter: ListCurrenciesUseCaseAdapter
    
    init(remoteCurrenciesAdapter: ListCurrenciesUseCaseAdapter) {
        self.remoteCurrenciesAdapter = remoteCurrenciesAdapter
    }
    
    func execute() async throws -> [Currency] {
        let currencies = try await remoteCurrenciesAdapter.getCurrencies()
        print(currencies)
        return currencies
    }
    
}

