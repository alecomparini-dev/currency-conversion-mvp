//
//  ListCurrenciesControllerFactory.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 20/08/23.
//

import UIKit

class ListCurrenciesControllerFactory: ViewControllerFactory {
    typealias T = ListCurrenciesViewController
    
    static func make() -> T {
        let http = HTTPListCurrencies()
        
        let url = makeApiURL(path: "/live")
        
        let listCurrenciesUseCase = RemoteListCurrenciesUseCaseImpl(url: url, remote: http)
        
        let listCurrenciesVM = ListRemoteCurrenciesViewModelImpl(listCurrenciesUseCase: listCurrenciesUseCase)
        
        return ListCurrenciesViewController(listCurrenciesVM: listCurrenciesVM)
    }
    
}
