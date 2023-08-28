//
//  RemoteListCurrenciesUseCaseImpl.swift.swift
//  currency-conversion-mvp
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
    
    func listCurrencies() async throws -> [ListCurrenciesUseCaseDTO.Output] {
        let currencies: [Currency] = try await listCurrenciesGateway.getListCurrencies()
        
        let listCurrencyResponse = CurrenciesMapper.toListCurrencyResponse(domain: currencies)
        
        let listSortedBycurrencyISO = listCurrencyResponse.sorted { $0.currencyISO < $1.currencyISO }
        
        return listSortedBycurrencyISO
    }
    
}

