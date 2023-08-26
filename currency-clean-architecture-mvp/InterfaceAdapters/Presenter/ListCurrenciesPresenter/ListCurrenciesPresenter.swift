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
    func listCurrencies()
}

