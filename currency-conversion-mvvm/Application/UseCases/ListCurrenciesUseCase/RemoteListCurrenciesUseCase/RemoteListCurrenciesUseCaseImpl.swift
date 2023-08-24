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
    
    private let remoteCurrenciesAdapter: ListCurrenciesUseCaseGateway
    
    init(remoteCurrenciesAdapter: ListCurrenciesUseCaseGateway) {
        self.remoteCurrenciesAdapter = remoteCurrenciesAdapter
    }
    
    func execute() async throws -> [CurrencyDTO] {
        let currencies: [Currency] = try await remoteCurrenciesAdapter.getCurrencies()
        
        let dto = CurrenciesMapper.toCurrencyDTO(domain: currencies)
        
        return dto
    }
    
}

