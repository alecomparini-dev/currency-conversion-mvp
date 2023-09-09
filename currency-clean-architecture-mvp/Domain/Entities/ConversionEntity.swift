//
//  CurrencyConversion.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 08/09/23.
//

import Foundation

protocol ConversionEntity: AnyObject {
    func conversion(value: Double, quoteCurrencyOf: Double, quoteCurrencyTo: Double) -> Double
}
