//
//  ListCurrencySymbolsUseCase.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 23/08/23.
//

import Foundation

protocol ListCurrencySymbolsUseCase {
    func listSymbols() async throws -> [ListCurrencySymbolsUseCaseDTO.Output]
}
