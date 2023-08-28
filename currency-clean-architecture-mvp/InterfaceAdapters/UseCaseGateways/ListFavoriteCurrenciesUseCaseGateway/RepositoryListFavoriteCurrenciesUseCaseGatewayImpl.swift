//
//  RepositoryListFavoriteCurrenciesUseCaseGatewayImpl.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 28/08/23.
//

import Foundation

class RepositoryListFavoriteCurrenciesUseCaseGatewayImpl: ListFavoriteCurrenciesUseCaseGateway {
    
    private let repository: GetAllRepository
    
    init(repository: GetAllRepository) {
        self.repository = repository
    }
    
    func listAll() async throws -> [ListFavoriteCurrenciesUseCaseDTO.Output] {
        guard let favorites: [String] = try await repository.get() else { return []  }
        return favorites.map({ ListFavoriteCurrenciesUseCaseDTO.Output(currencyISO: $0) })
    }
    
    
}
