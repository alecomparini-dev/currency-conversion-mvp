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
    func listCurrencies()
}


protocol ListCurrenciesTableViewCell: AnyObject {
    func numberOfCurrencies() -> Int
    func symbol(index: Int) -> String
    func title(index: Int) -> String
    func subTitle(index: Int) -> String
    func favorite(index: Int) -> Bool
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
