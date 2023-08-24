//
//  CurrenciesToDTO.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 23/08/23.
//

import Foundation


struct CurrenciesMapper {
    static func toListCurrencyResponse(domain: [Currency]) -> [ListCurrencyViewModelResponse] {
        return domain.map { ListCurrencyViewModelResponse(symbol: "",
                                             title: $0.currencyISO,
                                             subTitle: $0.name,
                                             favorite: false) }
    }

}

