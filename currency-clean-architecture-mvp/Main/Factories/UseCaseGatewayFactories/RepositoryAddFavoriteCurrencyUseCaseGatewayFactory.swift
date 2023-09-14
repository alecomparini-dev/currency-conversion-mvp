//
//  RepositoryAddFavoriteCurrencyUseCaseGatewayFactory.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 14/09/23.
//

import Foundation

class RepositoryAddFavoriteCurrencyUseCaseGatewayFactory {
    static func make() -> RepositoryAddFavoriteCurrencyUseCaseGatewayImpl {
        let addRepository = try! UserDefaultsProviderRepository(mainKey: MainConstants.FavoriteCurrency.mainKey)
        return RepositoryAddFavoriteCurrencyUseCaseGatewayImpl(repository: addRepository)
    }
}
