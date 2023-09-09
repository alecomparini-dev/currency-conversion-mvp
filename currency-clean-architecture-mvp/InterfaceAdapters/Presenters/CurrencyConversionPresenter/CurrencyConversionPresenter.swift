//
//  CurrencyConversionPresenter.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 08/09/23.
//

import Foundation

protocol CurrencyConversionPresenter: AnyObject {
    var delegate: CurrencyConversionPresenterOutput? { get set }
    func conversion(_ input: ConversionDTO)
}
