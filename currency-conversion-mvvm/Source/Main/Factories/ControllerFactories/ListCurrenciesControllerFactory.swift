//
//  ListCurrenciesControllerFactory.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 20/08/23.
//

import UIKit

class ListCurrenciesControllerFactory: ViewControllerFactoryProtocol {
    typealias T = ListCurrenciesViewController
    
    static func make() -> T {
        let httpClient = AlamofireAdapter()
        
        let url = URL(string: Environment.variable(.apiBaseUrl) + "/live" )!
        
        let listCurrenciesUseCase = RemoteListCurrenciesUseCaseImpl(url: url, httpClient: httpClient)
        
        let listCurrenciesVM = ListRemoteCurrenciesViewModel(listCurrenciesUseCase: listCurrenciesUseCase)
        
        return ListCurrenciesViewController(listCurrenciesVM: listCurrenciesVM)
    }
    
}
