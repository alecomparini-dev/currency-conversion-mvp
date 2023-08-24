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
        
        let listCurrenciesAPIGateway = ListCurrenciesUseCaseAPIGatewayImpl(http: httpClient, url: url, parameters: parameters)
        
        let listCurrenciesUseCase = ListCurrenciesUseCaseImpl(listCurrenciesGateway: listCurrenciesAPIGateway )
        
        let listCurrenciesVM = ListCurrenciesViewModelImpl(listCurrenciesUseCase: listCurrenciesUseCase)
        
        return ListCurrenciesViewController(listCurrenciesVM: listCurrenciesVM, listCurrenciesTableView: listCurrenciesVM)
    }
    
}
