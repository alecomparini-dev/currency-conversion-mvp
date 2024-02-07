
//  ListCurrenciesUseCaseGateway.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 22/08/23.
//

import Foundation

protocol ListCurrenciesUseCaseGateway: AnyObject {
    func listCurrencies() async throws -> [Currency]
}
