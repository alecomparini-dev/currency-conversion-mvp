//
//  ListRemoteCurrenciesViewModel.swift
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
    private var currencies = [Currency]()
    
    init(listCurrenciesUseCase: ListCurrenciesUseCase) {
        self.listCurrenciesUseCase = listCurrenciesUseCase
    }
    
    
//  MARK: - PUBLIC FUNCTIONS
    func listCurrencies() {
        Task {
            do {
                let currencies = try await listCurrenciesUseCase.execute()
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

    func acronym(index: Int) -> String { currencies[index].acronym }

    func name(index: Int) -> String { currencies[index].name }
}

//protocol MainThreadOutput: AnyObject {
//    var block: () -> Void { get set }
//    func dispatch(block: () -> Void )
//}
//
//struct MainTread {
//
//    typealias Block = () -> Void
//
//    var mainDispatch: Block?
//
//
//    var dispatch: Block {
//
//    }
//}
