//
//  ListCurrencySymbolsUseCaseFactory.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 14/09/23.
//

import Foundation


class ListCurrencySymbolsUseCaseFactory {
    
    static func make() -> ListCurrencySymbolsUseCaseImpl {
        let listSymbolFileGateway = FileListCurrencySymbolsUseCaseGatewayFactory.make()
        return ListCurrencySymbolsUseCaseImpl(listSymbolsGateway: listSymbolFileGateway)
    }
    
}
