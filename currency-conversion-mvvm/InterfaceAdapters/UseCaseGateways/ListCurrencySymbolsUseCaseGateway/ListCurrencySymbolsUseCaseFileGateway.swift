//
//  ListCurrencySymbolsUseCaseFileGateway.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 23/08/23.
//

import Foundation

class ListCurrencySymbolsUseCaseFileGateway: ListCurrencySymbolsUseCaseGateway {
    
    private let file: ReadFile
    
    init(file: ReadFile) {
        self.file = file
    }
    
    func getCurrencySymbols() async throws -> CurrencySymbolsCodable {
        let data = try await file.read()
        let currencySymbols = try JSONDecoder().decode(CurrencySymbolsCodable.self, from: data)
        print(currencySymbols)
        return currencySymbols
    }
    
    
}
