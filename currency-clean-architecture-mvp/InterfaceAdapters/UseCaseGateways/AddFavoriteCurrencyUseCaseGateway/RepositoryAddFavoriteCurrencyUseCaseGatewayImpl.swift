//
//  RepositoryAddFavoriteCurrencyUseCaseGatewayImpl.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 28/08/23.
//

import Foundation


class RepositoryAddFavoriteCurrencyUseCaseGatewayImpl: AddFavoriteCurrencyUseCaseGateway {
    
    private let repository: InsertRepository
    
    init(repository: InsertRepository) {
        self.repository = repository
    }

    func add(_ currencyISO: [String] ) async throws {
        try await repository.insert(currencyISO)
    }
    
    
}
