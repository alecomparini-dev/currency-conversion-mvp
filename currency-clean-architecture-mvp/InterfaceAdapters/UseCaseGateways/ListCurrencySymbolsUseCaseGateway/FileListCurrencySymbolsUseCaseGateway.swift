//
//  FileListCurrencySymbolsUseCaseGateway.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 23/08/23.
//

import Foundation

class FileListCurrencySymbolsUseCaseGateway: ListCurrencySymbolsUseCaseGateway {
    
    private let file: ReadFile
    
    init(file: ReadFile) {
        self.file = file
    }
    
    func getCurrencySymbols() async throws -> CurrencySymbolsCodable {
        
        //TODO: - mudar o local destes nomes -
        let data = try file.getData(fileName: "CurrencySymbols", fileExtension: "json")
        
        let currencySymbols = try JSONDecoder().decode(CurrencySymbolsCodable.self, from: data)
        
        return currencySymbols
    }

    
    
}
