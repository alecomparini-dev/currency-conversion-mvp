//
//  CurrenciesToDTO.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 23/08/23.
//

import Foundation


struct CurrenciesMapper {
    static func toListCurrencyResponse(domain: [Currency]) -> [ListCurrencyPresenterResponse] {
        return domain.map { ListCurrencyPresenterResponse(symbol: "",
                                             title: $0.currencyISO,
                                             subTitle: $0.name,
                                             favorite: false) }
    }

}

