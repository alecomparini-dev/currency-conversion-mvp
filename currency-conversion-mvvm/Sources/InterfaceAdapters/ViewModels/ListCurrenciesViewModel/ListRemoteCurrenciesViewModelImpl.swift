//
//  ListRemoteCurrenciesViewModel.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 20/08/23.
//

import Foundation


//  MARK: - DELEGATE
protocol ListCurrenciesViewModelDelegate: AnyObject {
    func startLoading()
    func finishLoading()
}


//  MARK: - CLASS
class ListCurrenciesViewModelImpl: ListCurrenciesViewModel  {
    weak var delegate: ListCurrenciesViewModelDelegate?
    
    private let listCurrenciesUseCase: ListCurrenciesUseCase
    
    init(listCurrenciesUseCase: ListCurrenciesUseCase) {
        self.listCurrenciesUseCase = listCurrenciesUseCase
    }
    
    func numberOfCurrencies() -> Int {
        return 5
    }
    
    func listCurrencies() {
        delegate?.startLoading()
        Task {
            do {
                let currency = try await listCurrenciesUseCase.execute()
                print(#function, currency)
            } catch (let error) {
                print(error.localizedDescription)
            }
            delegate?.finishLoading()
        }
        
    }

}
