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
        let listSymbolFileGateway = FileListCurrencySymbolsUseCaseGatewayImpl(file: file,
                                                                              fileName: MainConstants.ListSymbolFile.fileName,
                                                                              withExtension: MainConstants.ListSymbolFile.withExtension)
        let listSymbolUseCase = FileListCurrencySymbolsUseCaseImpl(listSymbolsGateway: listSymbolFileGateway)

        
        let addRepository = UserDefaultsRepository<[FavoriteCurrencyDTO]>(mainKey: MainConstants.FavoriteCurrency.mainKey)
        let repositoryAddFavoriteUseCaseGateway = RepositoryAddFavoriteCurrencyUseCaseGatewayImpl(repository: addRepository)
        let saveFavoriteUseCase = AddFavoriteCurrencyUseCaseImpl(addFavoriteGateway: repositoryAddFavoriteUseCaseGateway)
        
        
//        let httpClient = AlamofireNetwork()
        let httpClient = URLSessionNetwork()
        let url = makeApiURL(path: MainConstants.ListCurrencies.pathList)
        let parameters = [MainConstants.ListCurrencies.access_key: Environment.variable(.accessKey)]
        let listCurrenciesAPIGateway = RemoteListCurrenciesUseCaseGatewayImpl(http: httpClient, url: url, parameters: parameters)
        let listCurrenciesUseCase = ListCurrenciesUseCaseImpl(listCurrenciesGateway: listCurrenciesAPIGateway )

        let listCurrenciesPR = ListCurrenciesPresenterImpl(listCurrenciesUseCase: listCurrenciesUseCase,
                                                           listSymbolsUseCase: listSymbolUseCase,
                                                           saveFavoriteCurrencyUseCase: saveFavoriteUseCase)
        
        return ListCurrenciesViewController(listCurrenciesPR: listCurrenciesPR, listCurrenciesDS: listCurrenciesPR)
    }
    
}
