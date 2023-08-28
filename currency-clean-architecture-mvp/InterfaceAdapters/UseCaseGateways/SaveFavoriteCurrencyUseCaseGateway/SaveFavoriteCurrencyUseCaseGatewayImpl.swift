//
//  SaveFavoriteCurrencyUseCaseGatewayImpl.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 28/08/23.
//

import Foundation


class SaveFavoriteCurrencyUseCaseGatewayImpl: SaveFavoriteCurrencyUseCaseGateway {
    
    private let repository: AddRepository
    
    init(repository: AddRepository) {
        self.repository = repository
    }

    func save(_ currencyISO: [String] ) async throws {
        try await repository.add(item: currencyISO)
    }
    
    
}
