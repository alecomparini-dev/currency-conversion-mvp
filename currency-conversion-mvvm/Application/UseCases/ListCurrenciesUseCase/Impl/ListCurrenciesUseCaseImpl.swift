//
//  RemoteListCurrenciesUseCaseImpl.swift.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 19/08/23.
//

import Foundation


//  MARK: - CLASS
class ListCurrenciesUseCaseImpl: ListCurrenciesUseCase {
    
    private let listCurrenciesGateway: ListCurrenciesUseCaseGateway
    
    init(listCurrenciesGateway: ListCurrenciesUseCaseGateway) {
        self.listCurrenciesGateway = listCurrenciesGateway
    }
    
    func perform() async throws -> [ListCurrencyResponse] {
        let currencies: [Currency] = try await listCurrenciesGateway.getCurrencies()
        
        let listCurrencyResponse = CurrenciesMapper.toListCurrencyResponse(domain: currencies)
        
        return listCurrencyResponse
    }
    
}

