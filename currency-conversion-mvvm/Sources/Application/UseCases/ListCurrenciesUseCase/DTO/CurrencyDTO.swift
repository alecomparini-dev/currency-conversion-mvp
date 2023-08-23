//
//  CurrencyTableViewCellDTO.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 23/08/23.
//

import Foundation

struct CurrencyDTO {
    var symbol: String
    var title: String
    var subTitle: String
    var favorite: Bool
    
    
    static func toDTO(domain: [Currency]) -> [CurrencyDTO] {
        return domain.map { .init(symbol: "",
                                  title: $0.acronym,
                                  subTitle: $0.name,
                                  favorite: false) }
    }
}


