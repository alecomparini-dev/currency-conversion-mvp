//
//  ListFavoriteCurrenciesUseCaseFactory.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 14/09/23.
//

import Foundation


class ListFavoriteCurrenciesUseCaseFactory {
    
    static func make() -> ListFavoriteCurrenciesUseCaseImpl {
        let repositoryListFavoriteUseCaseGateway = RepositoryListFavoriteCurrenciesUseCaseGatewayFactory.make()
        return ListFavoriteCurrenciesUseCaseImpl(listFavoriteGateway: repositoryListFavoriteUseCaseGateway)
    }
    
}
