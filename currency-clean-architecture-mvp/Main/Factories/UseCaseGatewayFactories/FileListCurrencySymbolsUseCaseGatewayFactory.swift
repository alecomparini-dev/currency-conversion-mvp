//
//  FileListCurrencySymbolsUseCaseGatewayFactory.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 14/09/23.
//

import Foundation

class FileListCurrencySymbolsUseCaseGatewayFactory {
    
    static func make() -> FileListCurrencySymbolsUseCaseGatewayImpl {
        let file = ReadFileImp()
        return FileListCurrencySymbolsUseCaseGatewayImpl(file: file,
                                                         fileName: MainConstants.ListSymbolFile.fileName,
                                                         withExtension: MainConstants.ListSymbolFile.withExtension)
    }
    
}
