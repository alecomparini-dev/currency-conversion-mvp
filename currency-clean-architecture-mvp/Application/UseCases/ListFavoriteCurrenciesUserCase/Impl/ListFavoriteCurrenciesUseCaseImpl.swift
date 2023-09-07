//
//  ListFavoriteCurrenciesUseCaseImpl.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 28/08/23.
//

import Foundation


class ListFavoriteCurrenciesUseCaseImpl : ListFavoriteCurrenciesUseCase {
    
    private let listFavoriteGateway: ListFavoriteCurrenciesUseCaseGateway
    
    init(listFavoriteGateway: ListFavoriteCurrenciesUseCaseGateway) {
        self.listFavoriteGateway = listFavoriteGateway
    }
    
    func listFavorites() async throws -> [ListFavoriteCurrenciesUseCaseDTO.Output] {
        return try await listFavoriteGateway.listAll()
    }
    
    
}
