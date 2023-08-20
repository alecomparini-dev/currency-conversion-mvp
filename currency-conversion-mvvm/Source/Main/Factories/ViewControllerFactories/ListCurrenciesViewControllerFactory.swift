//
//  ListCurrenciesViewControllerFactory.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 20/08/23.
//

import UIKit

class ListCurrenciesViewControllerFactory: ViewControllerFactoryProtocol {
    typealias T = ListCurrenciesViewController
    
    static func make() -> T {
        return ListCurrenciesViewController(listCurrenciesVM: ListRemoteCurrenciesViewModel())
    }
    
}
