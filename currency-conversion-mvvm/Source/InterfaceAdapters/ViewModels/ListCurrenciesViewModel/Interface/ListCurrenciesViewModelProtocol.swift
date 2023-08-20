//
//  ListCurrenciesViewModelProtocol.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 20/08/23.
//

import Foundation


//  MARK: - PROTOCOL VIEWMODEL
protocol ListCurrenciesViewModelProtocol: AnyObject {
    func listCurrencies()
}


//  MARK: - PROTOCOL VIEWMODEL
protocol searchCurrenciesViewModelProtocol: AnyObject {
    func searchCurrencies()
}


//  MARK: - PROTOCOL VIEWMODEL
protocol sortCurrenciesViewModelProtocol: AnyObject {
    func sortCurrencies()
}


//  MARK: - PROTOCOL VIEWMODEL
protocol favoriteCurrencyViewModelProtocol: AnyObject {
    func favoriteCurrency()
}
