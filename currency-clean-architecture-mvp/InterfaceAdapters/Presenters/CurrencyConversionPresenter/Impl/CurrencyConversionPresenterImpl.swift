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
        
        
        Task {
            do {
                let dto = try await conversionUseCase.conversion(input: input)
                
                let formatConvertion = formatConvertion(dto.conversionResult)
                
                DispatchQueue.main.async { [weak self] in
                    self?.delegate?.successConversion(formatConvertion)
                }
            } catch let error {
                DispatchQueue.main.async { [weak self] in
                    self?.delegate?.error(title: "Error Conversion", message: error.localizedDescription)
                }
            }
        }
        
        
        
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
    
    private func formatConvertion(_ number: Double) -> String {
        let format = NumberFormatter()
        format.numberStyle = .decimal
        format.minimumFractionDigits = 2
        format.maximumFractionDigits = 2
        
        return format.string(from: number as NSNumber) ?? ""
    }
    
}
