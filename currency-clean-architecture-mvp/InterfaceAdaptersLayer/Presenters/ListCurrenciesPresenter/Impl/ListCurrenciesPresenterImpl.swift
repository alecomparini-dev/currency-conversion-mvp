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
    private let addFavoriteCurrencyUseCase: AddFavoriteCurrencyUseCase?
    private let listFavoriteCurrenciesUseCase: ListFavoriteCurrenciesUseCase?
    
    private var currenciesData = [ListCurrencyPresenterDTO]()
    private var favoriteCurrencies = [FavoriteCurrencyDTO]()
    var filteredCurrencies = [ListCurrencyPresenterDTO]()
    
    init(listCurrenciesUseCase: ListCurrenciesUseCase,
         listSymbolsUseCase: ListCurrencySymbolsUseCase,
         addFavoriteCurrencyUseCase: AddFavoriteCurrencyUseCase?,
         listFavoriteCurrenciesUseCase: ListFavoriteCurrenciesUseCase? ) {
        self.listCurrenciesUseCase = listCurrenciesUseCase
        self.listSymbolsUseCase = listSymbolsUseCase
        self.addFavoriteCurrencyUseCase = addFavoriteCurrencyUseCase
        self.listFavoriteCurrenciesUseCase = listFavoriteCurrenciesUseCase
    }
    
    
//  MARK: - PUBLIC FUNCTIONS
    
    func getCurrencies() -> [ListCurrencyPresenterDTO] {
        return filteredCurrencies
    }
    
    func addFavoriteCurrency(_ currency: FavoriteCurrencyDTO) {
        self.favoriteCurrencies.append(currency)
        saveFavorites()
    }
    
    func deleteFavoriteCurrency(_ currencyISO: String) {
        self.favoriteCurrencies.removeAll(where: {$0.currencyISO == currencyISO} )
        saveFavorites()
    }

    private func saveFavorites() {
        guard let addFavoriteCurrencyUseCase else {return}
        Task {
            do {
                try await addFavoriteCurrencyUseCase.add(self.favoriteCurrencies.compactMap({ $0.currencyISO }))
                await listCurrencies()
            } catch (let error) {
                delegate?.error(title: "Error", message: "Error: \(error.localizedDescription)" )
            }
        }
    }

    func listCurrencies() async {
        do {
            
            //TODO: - Passar estas 3 chamadas para o DispatchGroup
            //Mark: - Get Currencies
            let currencies: [ListCurrenciesUseCaseDTO.Output] = try await listCurrenciesUseCase.listCurrencies()
            
            //Mark: - Get Symbols
            let symbols: [ListCurrencySymbolsUseCaseDTO.Output] = try await listSymbolsUseCase.listSymbols()
            
            //Mark: - Get Favorites
            let favorites: [ListFavoriteCurrenciesUseCaseDTO.Output]? = try await listFavoriteCurrenciesUseCase?.listFavorites()
            
            //TODO: - UNIR AS 3 CHAMADAS E RETORNAR
            self.currenciesData = currencies.map { let currency = $0
                var dto = ListCurrencyPresenterDTO()
                dto.currencyISO = $0.currencyISO
                dto.name = currency.name
                
                if let symbol = symbols.first(where: { $0.currencyISO == currency.currencyISO } ) {
                    dto.symbol = symbol.symbol
                }
                
                if let fav = favorites?.first(where: { $0.currencyISO == currency.currencyISO }) {
                    dto.favorite = true
                    self.favoriteCurrencies.append(FavoriteCurrencyDTO(currencyISO: fav.currencyISO))
                }
                return dto
                
            }
            .sorted { (currency1, currency2) in
                if currency1.favorite == currency2.favorite {
                    return  (currency1.currencyISO ?? "") < (currency2.currencyISO ?? "")
                } else {
                    return (currency1.favorite ?? false) && !(currency2.favorite ?? false)
                }
            }
            
            self.filteredCurrencies = self.currenciesData.map({ var currency = $0
                currency.name = NSLocalizedString(currency.name ?? "", comment: "")
                return currency
            })
            
            
        } catch (let error) {
            DispatchQueue.main.async { [weak self] in
                guard let self else {return}
                delegate?.error(title: "Error", message: "Error: \(error.localizedDescription)" )
            }
        }
        
        DispatchQueue.main.async { [weak self] in
            guard let self else {return}
            delegate?.successListCurrencies()
        }

    }
    
    
}


//  MARK: - EXTENSION - ListCurrenciesPresenterDataSource

extension ListCurrenciesPresenterImpl: ListCurrenciesPresenterDataSource {
    func numberOfCurrencies() -> Int { currenciesData.count  }
        
}


