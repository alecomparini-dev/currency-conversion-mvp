//
//  ListCurrenciesPresenterImpl.swift
//  currency-conversion-mvp
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
    private let listSymbolsUseCase: ListCurrencySymbolsUseCase
    
    private var currencies = [ListCurrencyPresenterResponse]()
    
    init(listCurrenciesUseCase: ListCurrenciesUseCase, listSymbolsUseCase: ListCurrencySymbolsUseCase) {
        self.listCurrenciesUseCase = listCurrenciesUseCase
        self.listSymbolsUseCase = listSymbolsUseCase
    }
    
    
//  MARK: - PUBLIC FUNCTIONS
    func listCurrencies() {
        Task {
            do {
                let currencies = try await listCurrenciesUseCase.listCurrencies()
                self.currencies = currencies
                
                let symbols: [ListCurrencySymbolsPresenterResponse] = try await listSymbolsUseCase.listSymbols()
                
                self.currencies = currencies.map { var currency = $0
                    if let symbol = symbols.first(where: { $0.title == currency.title } ) {
                        currency.symbol = symbol.symbol
                    }
                    return currency
                }
                
                DispatchQueue.main.async { [weak self] in
                    guard let self else {return}
                    delegate?.successListCurrencies()
                }
                
            } catch (let error) {
                DispatchQueue.main.async { [weak self] in
                    guard let self else {return}
                    delegate?.error(title: "Error", message: "Error: \(error.localizedDescription)" )
                }
            }
            
        }
    }
    
    
}


//  MARK: - EXTENSION - ListCurrenciesPresenterTableView

extension ListCurrenciesPresenterImpl: ListCurrenciesPresenterTableView {
    func numberOfCurrencies() -> Int { currencies.count  }
    
    func symbol(index: Int) -> String { currencies[index].symbol }
    
    func title(index: Int) -> String { currencies[index].title }
    
    func subTitle(index: Int) -> String { currencies[index].subTitle }

    func favorite(index: Int) -> Bool { currencies[index].favorite }
    
}

