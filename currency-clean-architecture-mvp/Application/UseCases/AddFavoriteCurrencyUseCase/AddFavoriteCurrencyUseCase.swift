//
//  AddFavoriteCurrencyUseCase.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 28/08/23.
//

import Foundation

protocol AddFavoriteCurrencyUseCase {
    func add(_ currenciesISO: [String]) async throws
}
