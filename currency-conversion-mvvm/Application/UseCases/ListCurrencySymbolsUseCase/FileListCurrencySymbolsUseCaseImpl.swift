//
//  FileListCurrencySymbolsUseCaseImpl.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 23/08/23.
//

import Foundation

class FileListCurrencySymbolsUseCaseImpl: ListCurrencySymbolsUseCase {
    
    private let listSymbolsFileGateway: ListCurrencySymbolsUseCaseGateway

    init(listSymbolsFileGateway: ListCurrencySymbolsUseCaseGateway) {
        self.listSymbolsFileGateway = listSymbolsFileGateway
    }
    
    func execute() async throws -> [ListCurrencySymbolsViewModelResponse] {
        let symbols: CurrencySymbolsCodable = try await listSymbolsFileGateway.getCurrencySymbols()
        print(symbols)
        return []
    }
    
    
}
