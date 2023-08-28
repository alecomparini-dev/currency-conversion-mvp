//
//  SaveFavoriteCurrencyUseCaseGateway.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 28/08/23.
//

import Foundation

protocol SaveFavoriteCurrencyUseCaseGateway: AnyObject {
    func save(_ currencyISO: String)
}
