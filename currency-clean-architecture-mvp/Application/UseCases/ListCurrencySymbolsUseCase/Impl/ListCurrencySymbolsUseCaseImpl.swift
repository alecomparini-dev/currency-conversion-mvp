//
//  ListCurrencySymbolsUseCaseImpl.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 23/08/23.
//

import Foundation

class ListCurrencySymbolsUseCaseImpl: ListCurrencySymbolsUseCase {
    
    private let listSymbolsGateway: ListCurrencySymbolsUseCaseGateway

    init(listSymbolsGateway: ListCurrencySymbolsUseCaseGateway) {
        self.listSymbolsGateway = listSymbolsGateway
    }
    
    func listSymbols() async throws -> [ListCurrencySymbolsUseCaseDTO.Output] {
        let symbols: ListCurrencySymbolsUseCaseGatewayDTO.Output = try await listSymbolsGateway.getCurrencySymbols()
        
        let presenterOutput = symbols.currencySymbols.map { ListCurrencySymbolsUseCaseDTO.Output(currencyISO: $0.key, symbol: $0.value)  }
        
        return presenterOutput
    }
    
    
}
