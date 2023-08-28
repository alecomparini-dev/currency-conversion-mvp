//
//  ListCurrenciesPresenterTableView.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 24/08/23.
//

import Foundation

protocol ListCurrenciesPresenterDataSource: AnyObject {
    func numberOfCurrencies() -> Int
}
