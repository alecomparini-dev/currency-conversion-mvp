//
//  ListCurrenciesUseCaseDTO.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 23/08/23.
//

import Foundation


enum ListCurrenciesUseCaseDTO {

    struct Input {}
    
    struct Output {
        var currencyISO: String
        var name: String
    }

}



