//
//  ListCurrenciesUseCase.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 21/08/23.
//

import Foundation

protocol ListCurrenciesUseCase {
    func execute() async throws -> [CurrencyResponse]
}
