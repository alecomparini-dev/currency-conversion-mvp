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
    
    func perform() async throws -> [ListCurrencyPresenterResponse] {
        let currencies: [Currency] = try await listCurrenciesGateway.getListCurrencies()
        
        let listCurrencyResponse = CurrenciesMapper.toListCurrencyResponse(domain: currencies)
        
        let listSortedBycurrencyISO = listCurrencyResponse.sorted { $0.title < $1.title }
        
        return listSortedBycurrencyISO
    }
    
}

