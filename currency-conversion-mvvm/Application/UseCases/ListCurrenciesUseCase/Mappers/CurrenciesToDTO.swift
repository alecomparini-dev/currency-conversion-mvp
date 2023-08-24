//
//  CurrenciesToDTO.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 23/08/23.
//

import Foundation


struct CurrenciesMapper {
    static func toCurrencyResponse(domain: [Currency]) -> [CurrencyResponse] {
        return domain.map { CurrencyResponse(symbol: "",
                                             title: $0.acronym,
                                             subTitle: $0.name,
                                             favorite: false) }
    }

}

