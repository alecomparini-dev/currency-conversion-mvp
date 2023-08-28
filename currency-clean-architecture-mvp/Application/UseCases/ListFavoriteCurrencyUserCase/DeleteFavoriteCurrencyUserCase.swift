//
//  ListFavoriteCurrencyUserCase.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 28/08/23.
//

import Foundation

protocol ListFavoriteCurrenciesUseCase: AnyObject {
    func listFavorites() async throws -> [FavoriteCurrenciesUseCaseOutput]
}
