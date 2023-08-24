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

