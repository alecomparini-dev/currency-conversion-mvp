//
//  CurrenciesToDTO.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 23/08/23.
//

import Foundation


struct CurrenciesMapper {
    static func toListCurrencyResponse(domain: [Currency]) -> [ListCurrencyUseCaseResponse] {
        return domain.map { ListCurrencyUseCaseResponse( currencyISO: $0.currencyISO, name: $0.name) }
    }

}

