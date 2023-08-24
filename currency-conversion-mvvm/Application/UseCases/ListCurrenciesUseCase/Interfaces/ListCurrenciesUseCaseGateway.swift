//
//  ListCurrenciesUseCaseGateway.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 22/08/23.
//

import Foundation

protocol ListCurrenciesUseCaseGateway: AnyObject {
    func getCurrencies() async throws -> [Currency]
}