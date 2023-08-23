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
        
        let remoteCurrencies = ListCurrenciesAPI(http: httpClient, url: url, parameters: parameters)
        
        let remoteListCurrencies = RemoteListCurrenciesUseCaseImpl(remoteCurrencies: remoteCurrencies)
        
        let listCurrenciesVM = ListCurrenciesViewModelImpl(listCurrenciesUseCase: remoteListCurrencies)
        
        return ListCurrenciesViewController(listCurrenciesVM: listCurrenciesVM)
    }
    
}
