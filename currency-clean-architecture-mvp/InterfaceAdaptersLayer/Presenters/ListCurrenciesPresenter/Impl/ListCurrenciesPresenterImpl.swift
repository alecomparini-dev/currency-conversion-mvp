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
    func reloadTableView()
}


enum SortingTypes {
    case currencyISO
    case name
}

//  MARK: - CLASS
class ListCurrenciesPresenterImpl: ListCurrenciesPresenter {
    weak var delegate: ListCurrenciesPresenterOutput?
    
    struct Control {
        static var sortingTypeSelected: SortingTypes = .currencyISO
    }
    
    
    private let listCurrenciesUseCase: ListCurrenciesUseCase
    private let listSymbolsUseCase: ListCurrencySymbolsUseCase
    private let addFavoriteCurrencyUseCase: AddFavoriteCurrencyUseCase?
    private let listFavoriteCurrenciesUseCase: ListFavoriteCurrenciesUseCase?
    
    private var favoriteCurrencies = [FavoriteCurrencyDTO]()
    private var currenciesData = [ListCurrencyPresenterDTO]()
    
    //mudar para filtered, quando eu fizer o methodo de filtro
    var listCurrenciesTableView = [ListCurrencyPresenterDTO]()
    
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
        return currenciesData
    }
    
    func addFavoriteCurrency(_ currency: FavoriteCurrencyDTO) {
        favoriteCurrencies.append(currency)
        refreshFavoritesCurrenciesData()
        saveFavorites()
    }
    
    func deleteFavoriteCurrency(_ currencyISO: String) {
        favoriteCurrencies.removeAll(where: {$0.currencyISO == currencyISO} )
        refreshFavoritesCurrenciesData()
        saveFavorites()
    }

    func listCurrencies() {
        Task {
            do {
                //TODO: - Passar estas 3 chamadas para o DispatchGroup
                let currencies: [ListCurrenciesUseCaseDTO.Output] = try await listCurrenciesUseCase.listCurrencies()
                let symbols: [ListCurrencySymbolsUseCaseDTO.Output] = try await listSymbolsUseCase.listSymbols()
                let favorites: [ListFavoriteCurrenciesUseCaseDTO.Output]? = try await listFavoriteCurrenciesUseCase?.listFavorites()
                
                currenciesData = currencies.map { let currency = $0
                    var dto = ListCurrencyPresenterDTO()
                    dto.currencyISO = currency.currencyISO
                    dto.name = NSLocalizedString(currency.name, comment: "")
                    if let symbol = symbols.first(where: { $0.currencyISO == currency.currencyISO } ) {
                        dto.symbol = symbol.symbol
                    }
                    if let fav = favorites?.first(where: { $0.currencyISO == currency.currencyISO }) {
                        self.favoriteCurrencies.append(FavoriteCurrencyDTO(currencyISO: fav.currencyISO))
                    }
                    return dto
                }
                                
                refreshFavoritesCurrenciesData()
                
                sortedCurrenciesData(by: .currencyISO)
                
                successListCurrenciesData()
                
            } catch (let error) {
                DispatchQueue.main.async { [weak self] in
                    guard let self else {return}
                    delegate?.error(title: "Error", message: "Error: \(error.localizedDescription)" )
                }
            }
            
        }

    }
    
    
    
//  MARK: - PRIVATE AREA
    
    private func refreshFavoritesCurrenciesData() {
        currenciesData = currenciesData.map { var filtered = $0
            if self.favoriteCurrencies.contains(where: { $0.currencyISO == filtered.currencyISO }) {
                filtered.favorite = true
            } else {
                filtered.favorite = false
            }
            return filtered
        }
    }
    
    private func saveFavorites() {
        guard let addFavoriteCurrencyUseCase else {return}
        Task {
            do {
                try await addFavoriteCurrencyUseCase.add(favoriteCurrencies.compactMap({ $0.currencyISO }))
                sortedCurrenciesData(by: Control.sortingTypeSelected)
            } catch (let error) {
                delegate?.error(title: "Error", message: "Error: \(error.localizedDescription)" )
            }
        }
    }
    
    private func sortedCurrenciesData(by selected: SortingTypes) {
        Control.sortingTypeSelected = selected
        
        currenciesData = currenciesData.sorted { (currency1, currency2) in
            if currency1.favorite == currency2.favorite {
                
                if Control.sortingTypeSelected == .currencyISO {
                    return  (currency1.currencyISO ?? "") < (currency2.currencyISO ?? "")
                }
                return  (currency1.name ?? "") < (currency2.name ?? "")
                
            } else {
                return (currency1.favorite ?? false) && !(currency2.favorite ?? false)
            }
        }
        
        reloadTablaView()
        
    }
    
    private func reloadTablaView() {
        DispatchQueue.main.async { [weak self] in
            guard let self else {return}
            delegate?.reloadTableView()
        }
    }
    
    private func successListCurrenciesData() {
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


