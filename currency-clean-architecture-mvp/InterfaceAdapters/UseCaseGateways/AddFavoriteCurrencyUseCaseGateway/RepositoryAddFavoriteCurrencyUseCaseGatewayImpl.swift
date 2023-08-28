//
//  RepositoryAddFavoriteCurrencyUseCaseGatewayImpl.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 28/08/23.
//

import Foundation


class RepositoryAddFavoriteCurrencyUseCaseGatewayImpl: AddFavoriteCurrencyUseCaseGateway {
    
    private let repository: AddRepository
    
    init(repository: AddRepository) {
        self.repository = repository
    }

    func add(_ currencyISO: [String] ) async throws {
        try await repository.add(item: currencyISO)
    }
    
    
}
