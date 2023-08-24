//
//  CurrenciesToDTO.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 23/08/23.
//

import Foundation


struct CurrenciesMapper {
    static func toListCurrencyResponse(domain: [Currency]) -> [ListCurrencyResponse] {
        return domain.map { ListCurrencyResponse(symbol: "",
                                             title: $0.acronym,
                                             subTitle: $0.name,
                                             favorite: false) }
    }

}

