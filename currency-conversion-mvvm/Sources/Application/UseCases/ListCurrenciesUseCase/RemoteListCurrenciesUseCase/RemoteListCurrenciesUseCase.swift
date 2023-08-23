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
    
    private let remoteCurrencies: ListCurrenciesUseCaseAdapter
    
    init(remoteCurrencies: ListCurrenciesUseCaseAdapter) {
        self.remoteCurrencies = remoteCurrencies
    }
    
    func execute() async throws -> [Currency] {
        remoteCurrencies.getCurrencies()
        return []
    }
    
}

