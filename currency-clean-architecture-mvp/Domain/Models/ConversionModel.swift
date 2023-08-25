//
//  ConversionModel.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 19/08/23.
//

import Foundation

struct Currency {
    var currencyISO: String
    var name: String
}


struct DollarToCurrencyQuotes {
    let acronym: String
    let quotes: Double
}




//Gerenciador de Cache de Taxas de Câmbio --> ESPECIFICO DO USE CASE QUE GRAVA OFF LINE OU RECUPERA OFFLINE
struct ExchangeRateCacheManager {
    let dateRate: Date
    let quotes: [DollarToCurrencyQuotes]
}



