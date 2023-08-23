//
//  ListCurrenciesViewModel.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 20/08/23.
//

import Foundation


//  MARK: - PROTOCOL VIEWMODEL
protocol ListCurrenciesViewModel: AnyObject {
    var delegate: ListCurrenciesViewModelOutput? { get set }
    func numberOfCurrencies() -> Int
    func listCurrencies()
}


protocol ListCurrenciesTableViewCell: AnyObject {
    func numberOfCurrencies() -> Int
    func acronym(index: Int) -> String
    func name(index: Int) -> String
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
