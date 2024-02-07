//
//  AddFavoriteCurrencyUseCaseImpl.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 28/08/23.
//

import Foundation

class AddFavoriteCurrencyUseCaseImpl: AddFavoriteCurrencyUseCase {
    
    private let addFavoriteGateway: AddFavoriteCurrencyUseCaseGateway
    
    init(addFavoriteGateway: AddFavoriteCurrencyUseCaseGateway) {
        self.addFavoriteGateway = addFavoriteGateway
    }
    
    func add(_ currenciesISO: [String]) async throws {
        try await addFavoriteGateway.add(currenciesISO)
    }
    
    
}
