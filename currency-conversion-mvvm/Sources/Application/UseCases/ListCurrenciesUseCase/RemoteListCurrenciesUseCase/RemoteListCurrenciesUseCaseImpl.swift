//
//  RemoteListCurrenciesUseCaseImpl.swift.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 19/08/23.
//

import Foundation




//  MARK: - CLASS
class RemoteListCurrenciesUseCaseImpl: ListCurrenciesUseCase {
    
    weak var delegate: RemoteListCurrenciesUseCaseOutput?
    
    private let remoteCurrenciesAdapter: ListCurrenciesUseCaseAdapter
    
    init(remoteCurrenciesAdapter: ListCurrenciesUseCaseAdapter) {
        self.remoteCurrenciesAdapter = remoteCurrenciesAdapter
    }
    
    func execute() async throws -> [CurrencyDTO] {
        let currencies: [Currency] = try await remoteCurrenciesAdapter.getCurrencies()
        
        let dto = CurrencyDTO.toDTO(domain: currencies)
        
        return dto
    }
    
}

