//
//  CurrencyConversionControllerFactory.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 20/08/23.
//

import UIKit

class CurrencyConversionControllerFactory: ViewControllerFactory {
    typealias T = CurrencyConversionViewController
    
    static func make() -> CurrencyConversionViewController {
        return CurrencyConversionViewController()
    }
}
