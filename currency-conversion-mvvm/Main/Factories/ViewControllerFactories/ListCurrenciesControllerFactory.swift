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
        let httpClient = Alamofire()
        
        let url = makeApiURL(path: "/list")
        
        let parameters = ["access_key": Environment.variable(.accessKey)]
        
        let remoteCurrencies = RemoteListCurrenciesUseCaseAdapter(http: httpClient, url: url, parameters: parameters)
        
        let remoteListCurrenciesUseCase = RemoteListCurrenciesUseCaseImpl(remoteCurrenciesAdapter: remoteCurrencies )
        
        let listCurrenciesVM = ListCurrenciesViewModelImpl(listCurrenciesUseCase: remoteListCurrenciesUseCase)
        
        return ListCurrenciesViewController(listCurrenciesVM: listCurrenciesVM, listCurrenciesTableView: listCurrenciesVM)
    }
    
}
