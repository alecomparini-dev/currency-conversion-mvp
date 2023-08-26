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
        let file = ReadFileImp()
        let listSymbolFileGateway = FileListCurrencySymbolsUseCaseGateway(file: file)
        let listSymbolUseCase = FileListCurrencySymbolsUseCaseImpl(listSymbolsGateway: listSymbolFileGateway)

        let httpClient = Alamofire()
//        let httpClient = URLSessionNetwork()        
        let url = makeApiURL(path: "/list")
        let parameters = ["access_key": Environment.variable(.accessKey)]
        let listCurrenciesAPIGateway = RemoteListCurrenciesUseCaseGateway(http: httpClient, url: url, parameters: parameters)
        let listCurrenciesUseCase = ListCurrenciesUseCaseImpl(listCurrenciesGateway: listCurrenciesAPIGateway )

        let listCurrenciesPR = ListCurrenciesPresenterImpl(listCurrenciesUseCase: listCurrenciesUseCase, listSymbolsUseCase: listSymbolUseCase)
        
        return ListCurrenciesViewController(listCurrenciesPR: listCurrenciesPR, listCurrenciesDS: listCurrenciesPR)
    }
    
}
