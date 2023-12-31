//
//  ListFavoriteCurrenciesUseCaseGateway.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 28/08/23.
//

import Foundation

protocol ListFavoriteCurrenciesUseCaseGateway: AnyObject {
    
    func listAll() async throws -> [ListFavoriteCurrenciesUseCaseDTO.Output]
    
}
