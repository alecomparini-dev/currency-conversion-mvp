//
//  CurrencyConversion.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 19/08/23.
//

import Foundation

class CurrencyConversion {
    private let value: Double
    private let quoteToCurrencyOf: Double
    private let quoteToCurrencyTo: Double
    
    init(value: Double = 1, quoteToCurrencyOf: Double = 1, quoteToCurrencyTo: Double) {
        self.value = value
        self.quoteToCurrencyOf = quoteToCurrencyOf
        self.quoteToCurrencyTo = quoteToCurrencyTo
    }
    
    func conversion() -> Double {
        if quoteToCurrencyOf == .zero { return .zero }
        return value * (quoteToCurrencyTo / quoteToCurrencyOf)
    }
    
}
