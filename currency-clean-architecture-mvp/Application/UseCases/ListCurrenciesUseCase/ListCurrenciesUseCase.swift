//
//  ListCurrenciesUseCase.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 21/08/23.
//

import Foundation

protocol ListCurrenciesUseCase {
    func listCurrencies() async throws -> [ListCurrenciesUseCaseDTO.Output]
}
