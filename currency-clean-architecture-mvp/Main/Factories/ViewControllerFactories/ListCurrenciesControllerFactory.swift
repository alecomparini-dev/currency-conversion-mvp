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
//        let httpClient = URLSessionNetwork()
        
        let url = makeApiURL(path: "/list")
        
        let parameters = ["access_key": Environment.variable(.accessKey)]
        
        let listCurrenciesAPIGateway = RemoteListCurrenciesUseCaseGateway(http: httpClient, url: url, parameters: parameters)
        
        let listCurrenciesUseCase = ListCurrenciesUseCaseImpl(listCurrenciesGateway: listCurrenciesAPIGateway )
        
        let listCurrenciesP = ListCurrenciesPresenterImpl(listCurrenciesUseCase: listCurrenciesUseCase)
        
        return ListCurrenciesViewController(listCurrenciesP: listCurrenciesP, listCurrenciesTableView: listCurrenciesP)
    }
    
}
