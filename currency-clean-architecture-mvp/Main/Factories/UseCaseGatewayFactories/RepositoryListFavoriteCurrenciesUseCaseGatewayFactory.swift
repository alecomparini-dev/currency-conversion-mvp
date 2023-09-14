//
//  RepositoryListFavoriteCurrenciesUseCaseGatewayFactory.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 14/09/23.
//

import Foundation

class RepositoryListFavoriteCurrenciesUseCaseGatewayFactory {
    
    static func make() -> RepositoryListFavoriteCurrenciesUseCaseGatewayImpl {
        let getRepository = try! UserDefaultsProviderRepository(mainKey: MainConstants.FavoriteCurrency.mainKey)
        return RepositoryListFavoriteCurrenciesUseCaseGatewayImpl(repository: getRepository)
    }
}
