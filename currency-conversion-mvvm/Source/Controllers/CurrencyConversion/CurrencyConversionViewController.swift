//
//  CurrencyConversionViewController.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 14/08/23.
//

import UIKit

protocol CurrencyConversionViewControllerCoordinator: AnyObject {
    func openSearchCurrenciesScreen()
}

class CurrencyConversionViewController: UIViewController {
    
    var coordinator: CurrencyConversionViewControllerCoordinator?
    
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
    }
    
    private func configDelegate() {
        screen.delegate = self
    }
    
}


//  MARK: - EXTENSION CURRENCY CONVERSION VIEW
extension CurrencyConversionViewController: CurrencyConversionViewDelegate {
    func currencyOfButtonTapped() {
        coordinator?.openSearchCurrenciesScreen()
    }
    
    func currencyToButtonTapped() {
        coordinator?.openSearchCurrenciesScreen()
    }
    
    
}

