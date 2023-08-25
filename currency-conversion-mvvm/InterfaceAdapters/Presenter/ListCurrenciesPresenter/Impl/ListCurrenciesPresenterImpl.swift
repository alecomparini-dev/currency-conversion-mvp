//
//  ListCurrenciesPresenterImpl.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 20/08/23.
//

import Foundation



//  MARK: - DELEGATE
protocol ListCurrenciesPresenterOutput: AnyObject {
    func successListCurrencies()
    func error(title: String, message: String)
}


//  MARK: - CLASS
class ListCurrenciesPresenterImpl: ListCurrenciesPresenter {
    weak var delegate: ListCurrenciesPresenterOutput?
    
    private let listCurrenciesUseCase: ListCurrenciesUseCase
    private var currencies = [ListCurrencyPresenterResponse]()
    
    init(listCurrenciesUseCase: ListCurrenciesUseCase) {
        self.listCurrenciesUseCase = listCurrenciesUseCase
    }
    
    
//  MARK: - PUBLIC FUNCTIONS
    func listCurrencies() {
        Task {
            do {
                let currencies = try await listCurrenciesUseCase.perform()
                self.currencies = currencies
                DispatchQueue.main.async { [weak self] in
                    guard let self else {return}
                    delegate?.successListCurrencies()
                }
            } catch (let error) {
                DispatchQueue.main.async { [weak self] in
                    guard let self else {return}
                    delegate?.error(title: "Error", message: error.localizedDescription)
                }
            }
            
        }
    }
}


//  MARK: - EXTENSION - ListCurrenciesTableViewCell

extension ListCurrenciesPresenterImpl: ListCurrenciesTableViewCell {
    func numberOfCurrencies() -> Int { currencies.count  }
    
    func symbol(index: Int) -> String { currencies[index].symbol}
    
    func title(index: Int) -> String { currencies[index].title }
    
    func subTitle(index: Int) -> String { currencies[index].subTitle }

    func favorite(index: Int) -> Bool { currencies[index].favorite }
    
}

