//
//  ListCurrenciesPresenterImpl.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 20/08/23.
//

import Foundation


public enum SortingTypes {
    case currencyISOAscending
    case currencyISODescending
    case nameAscending
    case nameDescending
}


//  MARK: - DELEGATE
protocol ListCurrenciesPresenterOutput: AnyObject {
    func successListCurrencies()
    func error(title: String, message: String)
    func reloadTableView()
    func sortingType(_ type: SortingTypes)
}


//  MARK: - CLASS
class ListCurrenciesPresenterImpl: ListCurrenciesPresenter {
    weak var delegate: ListCurrenciesPresenterOutput?
    private var filteredText = ""
    
    struct Control {
        static var sortingTypeSelected: SortingTypes = .currencyISOAscending
    }
    
    private let listCurrenciesUseCase: ListCurrenciesUseCase
    private let listSymbolsUseCase: ListCurrencySymbolsUseCase
    private let addFavoriteCurrencyUseCase: AddFavoriteCurrencyUseCase?
    private let listFavoriteCurrenciesUseCase: ListFavoriteCurrenciesUseCase?
    
    private var currenciesData = [CurrencyPresenterDTO]()
    private var filteredCurrencies = [CurrencyPresenterDTO]()
    private var favoriteCurrencies = [FavoriteCurrencyDTO]()
    
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
    
    func getCurrencies() -> [CurrencyPresenterDTO] {
        return filteredText.isEmpty ? currenciesData : filteredCurrencies
    }
    
    func getCurrencyBy(index: Int) -> CurrencyPresenterDTO {
        return getCurrencies()[index]
    }
    
    func filterCurrencies(_ text: String) {
        filteredText = text
        self.filteredCurrencies = currenciesData.filter({
            let currencyISO = $0.currencyISO?.lowercased() ?? ""
            
            let currencyName = $0.name?.lowercased().folding(options: .diacriticInsensitive, locale: nil) ?? ""
            
            let text = text.lowercased().folding(options: .diacriticInsensitive, locale: nil)
            
            return (currencyISO.contains(text)) || (currencyName.contains(text.lowercased()))
        })
        reloadTableView()
    }
    
    func sortByAcronym() {
        if Control.sortingTypeSelected == .currencyISOAscending {
            sortedCurrenciesData(by: .currencyISODescending)
        } else {
            sortedCurrenciesData(by: .currencyISOAscending)
        }
        filterCurrencies(filteredText)
    }
    
    func sortByName() {
        if Control.sortingTypeSelected == .nameAscending {
            sortedCurrenciesData(by: .nameDescending)
        } else {
            sortedCurrenciesData(by: .nameAscending)
        }
        filterCurrencies(filteredText)
    }
    
    func addFavoriteCurrency(_ currency: FavoriteCurrencyDTO) {
        favoriteCurrencies.append(currency)
        refreshFavoritesCurrenciesData()
        saveFavorites()
        sortedCurrenciesData(by: Control.sortingTypeSelected)
        filterCurrencies(filteredText)
    }
    
    func deleteFavoriteCurrency(_ currencyISO: String) {
        favoriteCurrencies.removeAll(where: {$0.currencyISO == currencyISO} )
        refreshFavoritesCurrenciesData()
        saveFavorites()
        sortedCurrenciesData(by: Control.sortingTypeSelected)
        filterCurrencies(filteredText)
    }

    func fetchCurrencies() {
        Task {
            do {
                //TODO: - Passar estas 3 chamadas para o DispatchGroup
                let currencies: [ListCurrenciesUseCaseDTO.Output] = try await listCurrenciesUseCase.listCurrencies()
                let symbols: [ListCurrencySymbolsUseCaseDTO.Output] = try await listSymbolsUseCase.listSymbols()
                let favorites: [ListFavoriteCurrenciesUseCaseDTO.Output]? = try await listFavoriteCurrenciesUseCase?.listFavorites()
                
                currenciesData = currencies.map { let currency = $0
                    var dto = CurrencyPresenterDTO()
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
                
                sortedCurrenciesData(by: .currencyISOAscending)
                
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
            } catch (let error) {
                delegate?.error(title: "Error", message: "Error: \(error.localizedDescription)" )
            }
        }
    }
    
    private func sortedCurrenciesData(by selected: SortingTypes) {
        Control.sortingTypeSelected = selected
        DispatchQueue.main.async { [weak self] in
            self?.delegate?.sortingType(selected)
        }
        
        currenciesData = currenciesData.sorted { (currency1, currency2) in
            
            if currency1.favorite == currency2.favorite {
                
                if Control.sortingTypeSelected == .currencyISOAscending {
                    return  (currency1.currencyISO ?? "") < (currency2.currencyISO ?? "")
                }
                
                if Control.sortingTypeSelected == .currencyISODescending {
                    return  (currency1.currencyISO ?? "") > (currency2.currencyISO ?? "")
                }
                
                if Control.sortingTypeSelected == .nameAscending {
                    return  (currency1.name ?? "") < (currency2.name ?? "")
                }

                return  (currency1.name ?? "") > (currency2.name ?? "")
                
            } else {
                return (currency1.favorite ?? false) && !(currency2.favorite ?? false)
            }
        }
        
        reloadTableView()
        
    }
    
    private func reloadTableView() {
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
    func numberOfCurrencies() -> Int { getCurrencies().count  }
        
}


