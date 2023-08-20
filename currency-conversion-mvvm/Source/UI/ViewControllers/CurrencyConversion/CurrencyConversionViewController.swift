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
        
        
        
        /*
         var dateAPI = Date(timeIntervalSince1970: jsonTime as! Double)
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
         dateFormatter.timeZone = TimeZone.current
         let formattedLocalDate = dateFormatter.string(from: dateAPI)
         print("FUSO LOCAL -->>>>>", formattedLocalDate)
         */
    }
    
    private func configDelegate() {
        screen.delegate = self
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
