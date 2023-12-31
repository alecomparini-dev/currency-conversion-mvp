//
//  FileListCurrencySymbolsUseCaseGatewayImpl.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 23/08/23.
//

import Foundation

class FileListCurrencySymbolsUseCaseGatewayImpl: ListCurrencySymbolsUseCaseGateway {
    
    private let file: ReadFile
    private let fileName: String
    private let withExtension: String
        
    init(file: ReadFile, fileName: String, withExtension: String) {
        self.file = file
        self.fileName = fileName
        self.withExtension = withExtension
    }
    
    func getCurrencySymbols() async throws -> ListCurrencySymbolsUseCaseGatewayDTO.Output {
        
        let data = try file.getData(fileName: fileName, withExtension: withExtension)
        
        let currencySymbols = try JSONDecoder().decode([String:String] .self, from: data)
        
        return ListCurrencySymbolsUseCaseGatewayDTO.Output.init(currencySymbols: currencySymbols)
    }

    
    
}
