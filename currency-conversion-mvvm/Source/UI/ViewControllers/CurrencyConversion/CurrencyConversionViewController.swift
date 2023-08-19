//
//  CurrencyConversionViewController.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 14/08/23.
//

import UIKit

protocol CurrencyConversionViewControllerCoordinator: AnyObject {
    func goToSearchCurrenciesVC()
}

class CurrencyConversionViewController: UIViewController, ViewControllerCoordinator {
    weak var coordinator: CurrencyConversionViewControllerCoordinator?
    
    lazy var screen: CurrencyConversionView = {
        let view = CurrencyConversionView()
        return view
    }()
    
    override func loadView() {
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    
//  MARK: - PRIVATE AREA
    
    private func configure() {
        hideKeyboardOnTap()
        configDelegate()
        
        Task {
            do {
                try await chamandoCaraio()
            } catch {
                print(error)
            }
        }
        
    }
    
    private func configDelegate() {
        screen.delegate = self
    }
    
    
    
    
    
    
    
    private func chamandoCaraio() async throws {
        let alamofire = AlamofireAdapter()
        let url = URL(string: Environment.variable(.apiBaseUrl) + "/live" )!
        let APIListCurrencies = APIListCurrenciesUseCase(url:url , httpClient: alamofire)
        
        let data = try await APIListCurrencies.listCurrencies()
        
        print(try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) )
    }
    
    
    
    
    
}


//  MARK: - EXTENSION CURRENCY CONVERSION VIEW
extension CurrencyConversionViewController: CurrencyConversionViewDelegate {
    func currencyOfButtonTapped() {
        coordinator?.goToSearchCurrenciesVC()
    }
    
    func currencyToButtonTapped() {
        coordinator?.goToSearchCurrenciesVC()
    }
       
}
