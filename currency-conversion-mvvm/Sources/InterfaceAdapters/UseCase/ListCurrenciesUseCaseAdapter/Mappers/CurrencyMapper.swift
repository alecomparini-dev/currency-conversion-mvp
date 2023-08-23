//
//  CurrencyMapper.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 23/08/23.
//

import Foundation

struct CurrencyMapper {
    
    static func mapDTOToDomain(dto: CurrenciesDTO) -> [Currency] {
        guard let currencies = dto.currencies else {return []}
        return currencies.map { Currency(acronym: $0.key , name: $0.value) }
    }
    
}
