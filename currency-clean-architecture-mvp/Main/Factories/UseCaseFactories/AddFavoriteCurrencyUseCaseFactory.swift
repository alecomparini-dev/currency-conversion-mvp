//
//  AddFavoriteCurrencyUseCaseFactory.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 14/09/23.
//

import Foundation

class AddFavoriteCurrencyUseCaseFactory {
    
    static func make() -> AddFavoriteCurrencyUseCaseImpl {
        let repositoryAddFavoriteUseCaseGateway = RepositoryAddFavoriteCurrencyUseCaseGatewayFactory.make()
        return AddFavoriteCurrencyUseCaseImpl(addFavoriteGateway: repositoryAddFavoriteUseCaseGateway)
    }
}
