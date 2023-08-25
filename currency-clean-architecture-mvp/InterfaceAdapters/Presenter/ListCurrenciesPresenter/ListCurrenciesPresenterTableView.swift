//
//  ListCurrenciesPresenterTableView.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 24/08/23.
//

import Foundation

protocol ListCurrenciesPresenterTableView: AnyObject {
    func numberOfCurrencies() -> Int
    

    func symbol(index: Int) -> String
    func title(index: Int) -> String
    func subTitle(index: Int) -> String
    func favorite(index: Int) -> Bool
}
