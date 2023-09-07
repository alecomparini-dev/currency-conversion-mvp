//
//  ListCurrencySymbolsUseCaseGateway.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 23/08/23.
//

import Foundation

protocol ListCurrencySymbolsUseCaseGateway {
    
    func getCurrencySymbols() async throws -> ListCurrencySymbolsUseCaseGatewayDTO.Output
}
