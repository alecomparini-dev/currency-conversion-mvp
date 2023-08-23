//
//  RemoteListCurrenciesUseCaseOutput.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 23/08/23.
//

import Foundation


//  MARK: - DELEGATE
protocol RemoteListCurrenciesUseCaseOutput: AnyObject {
    func returnCurrencies(_ currenciesViewModelDTO: CurrenciesViewModelDTO)
}

struct CurrenciesViewModelDTO {
    var symbol: String?
    var title: String?
    var subTitle: String?
    var favorite: Bool = false
}
