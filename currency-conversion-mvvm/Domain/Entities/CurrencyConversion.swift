//
//  CurrencyConversion.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 19/08/23.
//

import Foundation

class CurrencyConversion {
    private let value: Double
    private let quoteCurrencyOf: Double
    private let quoteCurrencyTo: Double
    
    init(value: Double = 1, quoteCurrencyOf: Double = 1, quoteCurrencyTo: Double) {
        self.value = value
        self.quoteCurrencyOf = quoteCurrencyOf
        self.quoteCurrencyTo = quoteCurrencyTo
    }
    
    func conversion() -> Double {
        if quoteCurrencyOf == .zero { return .zero }
        return value * (quoteCurrencyTo / quoteCurrencyOf)
    }
    
}
