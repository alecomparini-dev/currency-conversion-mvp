//
//  ListCurrencySymbolsUseCase.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 23/08/23.
//

import Foundation

protocol ListCurrencySymbolsUseCase {
    func perform() async throws -> [ListCurrencySymbolsPresenterResponse]
}
