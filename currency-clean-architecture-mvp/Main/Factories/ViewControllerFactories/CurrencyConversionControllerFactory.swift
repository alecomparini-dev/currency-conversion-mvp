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
        
        let conversionEntity = ConversionEntityImpl()
        
        let conversionUseCase = ConversionUseCaseImpl(conversionEntity: conversionEntity)
        
        let currencyConversionPR = CurrencyConversionPresenterImpl(conversionUseCase: conversionUseCase)
        
        return CurrencyConversionViewController(currencyConversionPR: currencyConversionPR)
    }
}
