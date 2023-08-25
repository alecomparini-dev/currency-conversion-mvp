//
//  ListCurrenciesTableViewCell.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 24/08/23.
//

import Foundation

protocol ListCurrenciesTableViewCell: AnyObject {
    func numberOfCurrencies() -> Int
    
    //TODO: REMOVER
    func symbol(index: Int) -> String
    func title(index: Int) -> String
    func subTitle(index: Int) -> String
    func favorite(index: Int) -> Bool
}