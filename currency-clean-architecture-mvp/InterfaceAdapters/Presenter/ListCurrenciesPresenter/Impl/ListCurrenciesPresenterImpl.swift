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
    
    private var currenciesData = [ListCurrencyPresenterDTO]()
    var filteredCurrencies = [ListCurrencyPresenterDTO]()
    
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
                let currencies: [ListCurrencyUseCaseResponse] = try await listCurrenciesUseCase.listCurrencies()
                
                //Mark: - Get Symbols
                let symbols: [ListCurrencySymbolsUseCaseResponse] = try await listSymbolsUseCase.listSymbols()
                
                //Mark: - Get Favorites
                let favorites: Bool = false
                
                //TODO: - UNIR AS 3 CHAMADAS E RETORNAR
                self.currenciesData = currencies.map { let currency = $0
                    var dto = ListCurrencyPresenterDTO()
                    dto.currencyISO = $0.currencyISO
                    dto.name = currency.name
                    dto.favorite = favorites
                    if let symbol = symbols.first(where: { $0.currencyISO == currency.currencyISO } ) {
                        dto.symbol = symbol.symbol
                    }
                    return dto
                }
                
                self.filteredCurrencies = self.currenciesData
                
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


//  MARK: - EXTENSION - ListCurrenciesPresenterDataSource

extension ListCurrenciesPresenterImpl: ListCurrenciesPresenterDataSource {
    func numberOfCurrencies() -> Int { currenciesData.count  }
    
    func setFilteredCurrencies(_ currencies: [ListCurrencyPresenterDTO] ) {
        self.filteredCurrencies = currencies
    }
    
    func symbol(index: Int) -> String { filteredCurrencies[index].symbol ?? "" }
    
    func currencyISO(index: Int) -> String { filteredCurrencies[index].currencyISO ?? "" }
    
    func name(index: Int) -> String { NSLocalizedString(filteredCurrencies[index].name ?? "", comment: "") }
    
    func favorite(index: Int) -> Bool { filteredCurrencies[index].favorite ?? false }
    
}



/* ##########################################################################################
 
 TODO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 AMANHA MUDAR OS PRESENTERS PARA CADA UM FAZER UAM COISA, O PRESETNER QUE CUIDA DOS DATA SOURCE, OUTRO DO SEARCH E OUTRO DO FAVORITE

 */

