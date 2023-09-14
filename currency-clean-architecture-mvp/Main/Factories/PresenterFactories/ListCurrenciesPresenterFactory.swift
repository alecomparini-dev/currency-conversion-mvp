//
//  ListCurrenciesPresenterFactory.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 20/08/23.
//

import Foundation

class ListCurrenciesPresenterFactory: PresenterFactory {
    typealias T = ListCurrenciesPresenterImpl
    
    static func make() -> ListCurrenciesPresenterImpl {
        
        return ListCurrenciesPresenterImpl(listCurrenciesUseCase: ListCurrenciesUseCaseFactory.make(),
                                           listSymbolsUseCase: ListCurrencySymbolsUseCaseFactory.make(),
                                           addFavoriteCurrencyUseCase: AddFavoriteCurrencyUseCaseFactory.make(),
                                           listFavoriteCurrenciesUseCase: ListFavoriteCurrenciesUseCaseFactory.make())
    }
    
}
