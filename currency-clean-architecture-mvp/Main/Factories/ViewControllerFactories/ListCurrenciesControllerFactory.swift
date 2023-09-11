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
        
//        let httpClient = AlamofireNetwork()
        let httpClient = URLSessionNetwork()
        let url = makeApiURL(path: MainConstants.ListCurrencies.pathList)
        let parameters = [MainConstants.ListCurrencies.access_key: Environment.variable(.accessKey)]
        let listCurrenciesAPIGateway = RemoteListCurrenciesUseCaseGatewayImpl(http: httpClient, url: url, parameters: parameters)
        let listCurrenciesUseCase = ListCurrenciesUseCaseImpl(listCurrenciesGateway: listCurrenciesAPIGateway )


        let file = ReadFileImp()
        let listSymbolFileGateway = FileListCurrencySymbolsUseCaseGatewayImpl(file: file,
                                                                              fileName: MainConstants.ListSymbolFile.fileName,
                                                                              withExtension: MainConstants.ListSymbolFile.withExtension)
        let listSymbolUseCase = FileListCurrencySymbolsUseCaseImpl(listSymbolsGateway: listSymbolFileGateway)

        
        let addRepository = try! UserDefaultsProviderRepository(mainKey: MainConstants.FavoriteCurrency.mainKey)
        let repositoryAddFavoriteUseCaseGateway = RepositoryAddFavoriteCurrencyUseCaseGatewayImpl(repository: addRepository)
        let addFavoriteUseCase = AddFavoriteCurrencyUseCaseImpl(addFavoriteGateway: repositoryAddFavoriteUseCaseGateway)

        let getRepository = try! UserDefaultsProviderRepository(mainKey: MainConstants.FavoriteCurrency.mainKey)
        let repositoryListFavoriteUseCaseGateway = RepositoryListFavoriteCurrenciesUseCaseGatewayImpl(repository: getRepository)
        let listFavoriteCurrenciesUseCase = ListFavoriteCurrenciesUseCaseImpl(listFavoriteGateway: repositoryListFavoriteUseCaseGateway)

        
        let listCurrenciesPR = ListCurrenciesPresenterImpl(listCurrenciesUseCase: listCurrenciesUseCase,
                                                           listSymbolsUseCase: listSymbolUseCase,
                                                           addFavoriteCurrencyUseCase: addFavoriteUseCase,
                                                           listFavoriteCurrenciesUseCase: listFavoriteCurrenciesUseCase)
        
        return ListCurrenciesViewController(listCurrenciesPR: listCurrenciesPR, listCurrenciesDS: listCurrenciesPR)
    }
    
}
