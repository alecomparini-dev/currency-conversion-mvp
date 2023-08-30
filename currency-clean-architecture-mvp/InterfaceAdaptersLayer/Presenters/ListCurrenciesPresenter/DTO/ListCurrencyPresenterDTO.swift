//
//  ListCurrencyPresenterDTO.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 26/08/23.
//

import Foundation

struct ListCurrencyPresenterDTO: Hashable {   
    var symbol: String?
    var currencyISO: String?
    var name: String?
    var favorite: Bool?
}
