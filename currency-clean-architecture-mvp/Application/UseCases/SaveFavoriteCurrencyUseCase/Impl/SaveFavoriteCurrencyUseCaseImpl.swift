//
//  SaveFavoriteCurrencyUseCaseImpl.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 28/08/23.
//

import Foundation

class SaveFavoriteCurrencyUseCaseImpl: SaveFavoriteCurrencyUseCase {
    
    private let saveFavoriteGateway: SaveFavoriteCurrencyUseCaseGateway
    
    init(saveFavoriteGateway: SaveFavoriteCurrencyUseCaseGateway) {
        self.saveFavoriteGateway = saveFavoriteGateway
    }
    
    func save() async throws {
        
    }
    
    
}
