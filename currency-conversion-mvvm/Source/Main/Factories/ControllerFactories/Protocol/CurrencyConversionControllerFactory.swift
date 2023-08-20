//
//  CurrencyConversionControllerFactory.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 20/08/23.
//

import UIKit

class CurrencyConversionControllerFactory: ViewControllerFactoryProtocol {
    typealias T = CurrencyConversionViewController
    
    static func make() -> CurrencyConversionViewController {
        return CurrencyConversionViewController()
    }
}
