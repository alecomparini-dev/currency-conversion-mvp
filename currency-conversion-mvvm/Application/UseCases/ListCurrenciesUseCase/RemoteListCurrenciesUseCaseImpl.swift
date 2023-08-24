//
//  RemoteListCurrenciesUseCaseImpl.swift.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 19/08/23.
//

import Foundation


//  MARK: - CLASS
class RemoteListCurrenciesUseCaseImpl: ListCurrenciesUseCase {
    
    private let listCurrenciesAPIGateway: ListCurrenciesUseCaseGateway
    
    init(listCurrenciesAPIGateway: ListCurrenciesUseCaseGateway) {
        self.listCurrenciesAPIGateway = listCurrenciesAPIGateway
    }
    
    func execute() async throws -> [CurrencyResponse] {
        let currencies: [Currency] = try await listCurrenciesAPIGateway.getCurrencies()
        
        let dto = CurrenciesMapper.toCurrencyResponse(domain: currencies)
        
        return dto
    }
    
}

