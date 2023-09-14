//
//  ListCurrenciesUseCaseFactory.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 14/09/23.
//

import Foundation

class ListCurrenciesUseCaseFactory {
    
    static func make() -> ListCurrenciesUseCaseImpl {
        let listCurrenciesAPIGateway = RemoteListCurrenciesUseCaseGatewayFactory.make()

        return ListCurrenciesUseCaseImpl(listCurrenciesGateway: listCurrenciesAPIGateway )
        
    }
    
}
