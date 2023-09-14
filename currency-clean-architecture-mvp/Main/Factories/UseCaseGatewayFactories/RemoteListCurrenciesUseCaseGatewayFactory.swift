//
//  RemoteListCurrenciesUseCaseGatewayFactory.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 14/09/23.
//

import Foundation

class RemoteListCurrenciesUseCaseGatewayFactory {
    
    static func make() -> RemoteListCurrenciesUseCaseGatewayImpl {
//        let httpClient = AlamofireFactory.make()
        let httpClient = URLSessionFactory.make()
        
        let url = makeApiURL(path: MainConstants.ListCurrencies.pathList)
        
        let parameters = [MainConstants.ListCurrencies.access_key: Environment.variable(.accessKey)]
        
        return RemoteListCurrenciesUseCaseGatewayImpl(http: httpClient, url: url, parameters: parameters)
        
    }
    
}
