//
//  FileListCurrencySymbolsUseCaseImpl.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 23/08/23.
//

import Foundation

class FileListCurrencySymbolsUseCaseImpl: ListCurrencySymbolsUseCase {
    
    private let listSymbolsGateway: ListCurrencySymbolsUseCaseGateway

    init(listSymbolsGateway: ListCurrencySymbolsUseCaseGateway) {
        self.listSymbolsGateway = listSymbolsGateway
    }
    
    func perform() async throws -> [ListCurrencySymbolsPresenterResponse] {
        let symbols: CurrencySymbolsCodable = try await listSymbolsGateway.getCurrencySymbols()
        
        //MARK: Mapper
        let presenterResponse = symbols.map { ListCurrencySymbolsPresenterResponse(title: $0.key, symbol: $0.value)  }
        
        return presenterResponse
    }
    
    
}
