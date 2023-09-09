//
//  CurrencyConversionPresenterImpl.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 08/09/23.
//

import Foundation

//  MARK: - DELEGATE
protocol CurrencyConversionPresenterOutput: AnyObject {
    func successConversion(_ conversionResult: String)
    func error(title: String, message: String)
}


class CurrencyConversionPresenterImpl: CurrencyConversionPresenter {
    weak var delegate: CurrencyConversionPresenterOutput?
    
    private let conversionUseCase: ConversionUseCase
    
    init(conversionUseCase: ConversionUseCase) {
        self.conversionUseCase = conversionUseCase
    }
    
    func conversion(_ conversionDTO: ConversionDTO) {
        if let message = isValidConversion(conversionDTO) {
            delegate?.error(title: "Invalid Data", message: message)
            return
        }
        
        let input = ConversionUseCaseDTO.Input(currencyOf: conversionDTO.currencyISOOf,
                                               currencyTo: conversionDTO.currencyISOTo,
                                               value: Double(conversionDTO.value)!)
        
        let dto = conversionUseCase.conversion(input: input)
        
        delegate?.successConversion(String(dto.conversionResult))
    }
    
    
//  MARK: - PRIVATE AREA
    
    private func isValidConversion(_ conversionDTO: ConversionDTO) -> String? {
        if conversionDTO.currencyISOOf.count != 3 { return "Currency Of Incorrect" }
        
        if conversionDTO.currencyISOTo.count != 3 { return "Currency To Incorrect" }
        
        if conversionDTO.value.isEmpty { return "Value cannot be empty" }
        
        if Double(conversionDTO.value) == nil {
            return "Value is not number"
        }

        return nil
    }
    
}
