//
//  CurrencyConversionImpl.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 19/08/23.
//

import Foundation

class ConversionEntityImpl: ConversionEntity {
    
    init() {  }
    
    func conversion(value: Double = 1, quoteCurrencyOf: Double, quoteCurrencyTo: Double) -> Double {
        if quoteCurrencyOf == .zero { return .zero }
        return value * (quoteCurrencyTo / quoteCurrencyOf)
    }
    
}
