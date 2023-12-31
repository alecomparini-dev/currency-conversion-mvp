//
//  AddFavoriteCurrencyUseCaseGateway.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 28/08/23.
//

import Foundation

protocol AddFavoriteCurrencyUseCaseGateway: AnyObject {
    func add(_ currencyISO: [String]) async throws
}
