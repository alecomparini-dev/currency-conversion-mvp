//
//  CurrencyPresenterDTO.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 26/08/23.
//

import Foundation

struct CurrencyPresenterDTO: Hashable {   
    var symbol: String?
    var currencyISO: String?
    var name: String?
    var favorite: Bool?
}
