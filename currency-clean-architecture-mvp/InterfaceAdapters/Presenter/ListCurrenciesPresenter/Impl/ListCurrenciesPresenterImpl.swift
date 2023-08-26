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
                
                //TODO: - Passar estas 3 chamadas para o DispatchGroup
                //Mark: - Get Currencies
                let currencies = try await listCurrenciesUseCase.listCurrencies()
                self.currencies = currencies
                
                //Mark: - Get Symbols
                let symbols: [ListCurrencySymbolsPresenterResponse] = try await listSymbolsUseCase.listSymbols()
                
                //Mark: - Get Favorites
                let favorites: [String] = ["favorites ta atoa"]
                debugPrint(favorites)
                
                
                //TODO: - UNIR AS 3 CHAMADAS E RETORNAR
                self.currencies = currencies.map { var currency = $0
                    if let symbol = symbols.first(where: { $0.currencyISO == currency.title } ) {
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
    
    func currencyISO(index: Int) -> String { currencies[index].title }
    
    func name(index: Int) -> String { currencies[index].subTitle }

    func favorite(index: Int) -> Bool { currencies[index].favorite }
    
}

