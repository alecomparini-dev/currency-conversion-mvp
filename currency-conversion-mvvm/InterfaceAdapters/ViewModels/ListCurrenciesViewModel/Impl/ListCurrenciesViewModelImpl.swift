//
//  ListCurrenciesViewModelImpl.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 20/08/23.
//

import Foundation



//  MARK: - DELEGATE
protocol ListCurrenciesViewModelOutput: AnyObject {
    func successListCurrencies()
    func error(title: String, message: String)
}


//  MARK: - CLASS
class ListCurrenciesViewModelImpl: ListCurrenciesViewModel {
    weak var delegate: ListCurrenciesViewModelOutput?
    
    private let listCurrenciesUseCase: ListCurrenciesUseCase
    private var currencies = [ListCurrencyResponse]()
    
    init(listCurrenciesUseCase: ListCurrenciesUseCase) {
        self.listCurrenciesUseCase = listCurrenciesUseCase
    }
    
    
//  MARK: - PUBLIC FUNCTIONS
    func listCurrencies() {
        Task {
            do {
                let currencies = try await listCurrenciesUseCase.perform()
                self.currencies = currencies
            } catch (let error) {
                delegate?.error(title: "Error", message: error.localizedDescription)
            }
            
            DispatchQueue.main.async { [weak self] in
                guard let self else {return}
                delegate?.successListCurrencies()
            }
        }
    }
}


//  MARK: - EXTENSION - ListCurrenciesTableViewCell

extension ListCurrenciesViewModelImpl: ListCurrenciesTableViewCell {
    func numberOfCurrencies() -> Int { currencies.count  }
    
    func symbol(index: Int) -> String { currencies[index].symbol}
    
    func title(index: Int) -> String { currencies[index].title }
    
    func subTitle(index: Int) -> String { currencies[index].subTitle }

    func favorite(index: Int) -> Bool { currencies[index].favorite }
    
}

