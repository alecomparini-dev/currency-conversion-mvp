//
//  ListCurrenciesControllerFactory.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 20/08/23.
//

import UIKit

class ListCurrenciesControllerFactory: ViewControllerFactory {
    typealias T = ListCurrenciesViewController
    
    static func make() -> T {
        let listCurrenciesPR = ListCurrenciesPresenterFactory.make()
        return ListCurrenciesViewController(listCurrenciesPR: listCurrenciesPR, listCurrenciesDS: listCurrenciesPR)
    }
    
}
