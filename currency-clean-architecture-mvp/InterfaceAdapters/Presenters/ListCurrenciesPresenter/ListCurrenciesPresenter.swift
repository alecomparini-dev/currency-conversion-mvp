//
//  ListCurrenciesPresenter.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 20/08/23.
//

import Foundation


//  MARK: - PROTOCOL PRESENTER
protocol ListCurrenciesPresenter: AnyObject {
    var delegate: ListCurrenciesPresenterOutput? { get set }
    func fetchCurrencies()
    func getCurrencies() -> [CurrencyPresenterDTO]
    func getCurrencyBy(index: Int) -> CurrencyPresenterDTO
    func filterCurrencies(_ text: String)
    func sortByAcronym()
    func sortByName()
    func addFavoriteCurrency(_ currencyISO: FavoriteCurrencyDTO)
    func deleteFavoriteCurrency(_ currencyISO: String)
}


