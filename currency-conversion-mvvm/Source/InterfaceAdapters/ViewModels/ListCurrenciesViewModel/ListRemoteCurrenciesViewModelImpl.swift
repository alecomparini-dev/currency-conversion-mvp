//
//  ListRemoteCurrenciesViewModel.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 20/08/23.
//

import Foundation

protocol ListCurrenciesViewModelDelegate: AnyObject {
    func startLoading()
    func finishLoading()
    func successListCurrencies(_ currencies: Any)
    func error()
}


//  MARK: -
class ListRemoteCurrenciesViewModelImpl: ListCurrenciesViewModel  {
    weak var delegate: ListCurrenciesViewModelDelegate?
    
    private let listCurrenciesUseCase: RemoteListCurrenciesUseCase
    
    init(listCurrenciesUseCase: RemoteListCurrenciesUseCase) {
        self.listCurrenciesUseCase = listCurrenciesUseCase
    }
    
    func numberOfCurrencies() -> Int {
        return 5
    }
    
    func listCurrencies() {
        delegate?.startLoading()
        
        print("CHAMOUUUUUUUU")
        
        
        delegate?.finishLoading()
    }

    
    
}
