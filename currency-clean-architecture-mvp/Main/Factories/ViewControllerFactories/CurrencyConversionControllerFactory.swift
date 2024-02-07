//
//  CurrencyConversionControllerFactory.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 20/08/23.
//

import UIKit

class CurrencyConversionControllerFactory: ViewControllerFactory {
    typealias T = CurrencyConversionViewController
    
    static func make() -> CurrencyConversionViewController {
        
        let conversionEntity = ConversionEntityImpl()
        
        let httpClient = URLSessionFactory.make()
        let url = makeApiURL(path: MainConstants.pathLive)
        let parameters = [MainConstants.access_key: Environment.variable(.accessKey)]
        
        let listQuotesGateway = RemoteListQuotesUseCaseGatewayImpl(http: httpClient, url: url, parameters: parameters)
        
        let listQuotesUseCase = ListQuotesUseCaseImpl(listQuotesGateway: listQuotesGateway)
        
        let conversionUseCase = ConversionUseCaseImpl(conversionEntity: conversionEntity,
                                                      listQuotes: listQuotesUseCase)
        
        let currencyConversionPR = CurrencyConversionPresenterImpl(conversionUseCase: conversionUseCase)
        
        return CurrencyConversionViewController(currencyConversionPR: currencyConversionPR)
    }
}
