//
//  ListCurrenciesViewModelProtocol.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 20/08/23.
//

import Foundation


//  MARK: - PROTOCOL VIEWMODEL
protocol ListCurrenciesViewModelProtocol: AnyObject {
    var delegate: ListCurrenciesViewModelDelegate? { get set }
    func numberOfCurrencies() -> Int
    func listCurrencies()
}



//  MARK: - PROTOCOL VIEWMODEL
protocol SearchCurrenciesViewModelProtocol: AnyObject {
    func searchCurrencies()
}


//  MARK: - PROTOCOL VIEWMODEL
protocol SortCurrenciesViewModelProtocol: AnyObject {
    func sortCurrencies()
}


//  MARK: - PROTOCOL VIEWMODEL
protocol FavoriteCurrencyViewModelProtocol: AnyObject {
    func favoriteCurrency()
}
