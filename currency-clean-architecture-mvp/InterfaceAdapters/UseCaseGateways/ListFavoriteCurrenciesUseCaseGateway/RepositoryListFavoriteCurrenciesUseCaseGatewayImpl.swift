//
//  RepositoryListFavoriteCurrenciesUseCaseGatewayImpl.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 28/08/23.
//

import Foundation

class RepositoryListFavoriteCurrenciesUseCaseGatewayImpl: ListFavoriteCurrenciesUseCaseGateway {
    
    private let repository: FetchRepository
    
    init(repository: FetchRepository) {
        self.repository = repository
    }
    
    func listAll() async throws -> [ListFavoriteCurrenciesUseCaseDTO.Output] {
        let favorites: [String] = try await repository.fetch()
        return favorites.map({ ListFavoriteCurrenciesUseCaseDTO.Output(currencyISO: $0) })
    }
    
    
}
