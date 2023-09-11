//
//  ExchangeRateCacheManager.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 28/08/23.
//

import Foundation

//Gerenciador de Cache de Taxas de Câmbio --> ESPECIFICO DO USE CASE QUE GRAVA OFF LINE OU RECUPERA OFFLINE
struct ExchangeRateCacheManager {
    let dateQuotes: Date
    let rates: [CurrencyQuotes]
}
