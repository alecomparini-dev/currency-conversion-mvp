//
//  ListCurrenciesPresenter.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 20/08/23.
//

import Foundation


//  MARK: - PROTOCOL VIEWMODEL
protocol ListCurrenciesPresenter: AnyObject {
    var delegate: ListCurrenciesPresenterOutput? { get set }
    func listCurrencies()
}

