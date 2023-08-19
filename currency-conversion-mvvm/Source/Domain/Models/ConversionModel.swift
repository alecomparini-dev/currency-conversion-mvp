//
//  ConversionModel.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 19/08/23.
//

import Foundation

struct Currencies {
    var acronym: String
    var name: String
}

struct DollarToCurrencyQuotes {
    var acronym: String
    var quotes: Double
}


//Gerenciador de Cache de Taxas de Câmbio --> ESPECIFICO DO USE CASE QUE GRAVA OFF LINE OU RECUPERA OFFLINE
struct ExchangeRateCacheManager {
    var quotes: [DollarToCurrencyQuotes]
    var dateRate: Date
}



