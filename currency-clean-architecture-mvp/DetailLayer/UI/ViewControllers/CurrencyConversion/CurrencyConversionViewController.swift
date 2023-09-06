//
//  CurrencyConversionViewController.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 14/08/23.
//

import UIKit


//  MARK: - PROTOCOL COORDINATOR
protocol CurrencyConversionViewControllerCoordinator: AnyObject {
    func goToSearchCurrenciesVC()
}


//  MARK: - CLASS

class CurrencyConversionViewController: UIViewController, ViewControllerCoordinator {
    weak var coordinator: CurrencyConversionViewControllerCoordinator?
    
    private var currencyOf: CurrencyConversionVCDTO?
    private var currencyTo: CurrencyConversionVCDTO?
    
    var receivedData: CurrencyConversionVCDTO?
    
    private var tap: (currencyOf: UITapGestureRecognizer?, currencyTo: UITapGestureRecognizer?)
    
    private struct Control {
        enum CurrencyType {
            case currencyOf
            case currencyTo
        }
        static var selectedCurrency: CurrencyType = .currencyTo
    }
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addTapGestureCurrency()
        refreshSelectedCurrency()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeTapGesture()
    }
    
    
//  MARK: - PRIVATE AREA
    
    private func configure() {
        hideKeyboardOnTap()
        configDelegate()
        configInitialCurrencies()
        /*
         var dateAPI = Date(timeIntervalSince1970: jsonTime as! Double)
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
         dateFormatter.timeZone = TimeZone.current
         let formattedLocalDate = dateFormatter.string(from: dateAPI)
         print("FUSO LOCAL -->>>>>", formattedLocalDate)
         */
    }
    
    private func configInitialCurrencies() {
        let currencyOf = CurrencyConversionVCDTO(
            symbol: K.Screen.CurrencyConversion.symbolCurrencyOf,
            currencyISO: K.Screen.CurrencyConversion.titleCurrencyOf,
            name: K.Screen.CurrencyConversion.subTitleCurrencyOf)
        self.currencyOf = currencyOf
        updateCurrencyView(screen.currencyOf, currencyOf)
        
        let currencyTo = CurrencyConversionVCDTO(
            symbol: K.Screen.CurrencyConversion.symbolCurrencyTo,
            currencyISO: K.Screen.CurrencyConversion.titleCurrencyTo,
            name: K.Screen.CurrencyConversion.subTitleCurrencyTo)
        self.currencyTo = currencyTo
        updateCurrencyView(screen.currencyTo, currencyTo)
    }
    
    private func configDelegate() {
        screen.delegate = self
    }
    
    private func addTapGestureCurrency() {
        addTapGestureCurrencyOf()
        addTapGestureCurrencyTo()
    }
    
    private func addTapGestureCurrencyOf() {
        tap.currencyOf = makeTapGesture(#selector(currencyOfTapped))
        guard let tapCurrencyOf = tap.currencyOf else {return}
        addTapGesture(tap: tapCurrencyOf, screen.currencyOf)
    }

    private func addTapGestureCurrencyTo() {
        tap.currencyTo = makeTapGesture(#selector(currencyToTapped))
        guard let tapCurrencyTo = tap.currencyTo else {return}
        addTapGesture(tap: tapCurrencyTo, screen.currencyTo)
    }

    private func addTapGesture(tap: UITapGestureRecognizer, _ currencyView: CurrencyView) {
        currencyView.addGestureRecognizer(tap)
    }
    
    private func makeTapGesture(_ action: Selector) -> UITapGestureRecognizer {
        return UITapGestureRecognizer(target: self, action: action)
    }
    
    private func removeTapGesture() {
        if let tapCurrencyOf = tap.currencyOf {
            screen.currencyOf.removeGestureRecognizer(tapCurrencyOf)
        }
        
        if let tapCurrencyTo = tap.currencyTo {
            screen.currencyTo.removeGestureRecognizer(tapCurrencyTo)
        }
    }
    
    private func refreshSelectedCurrency() {
        guard let receivedData else {return}
        if Control.selectedCurrency == .currencyOf {
            currencyOf = receivedData
            return updateCurrencyView(screen.currencyOf, receivedData)
        }
        currencyTo = receivedData
        updateCurrencyView(screen.currencyTo, receivedData)
    }

    private func updateCurrencyView(_ currencyView: CurrencyView, _ currencyDTO: CurrencyConversionVCDTO ) {
        currencyView.symbolCurrency.symbolLabel.text = currencyDTO.symbol
        currencyView.titleCurrencyLabel.text = currencyDTO.currencyISO
        currencyView.subTitleCurrencyLabel.text = currencyDTO.name
    }

    
//  MARK: - @OBJC AREA
    @objc private func currencyOfTapped() {
        Control.selectedCurrency = .currencyOf
        currencyOfButtonTapped()
    }
    
    @objc private func currencyToTapped() {
        Control.selectedCurrency = .currencyTo
        currencyToButtonTapped()
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
    
    func invertCurrencyButtonTapped() {
        let currencyChange = currencyOf
        currencyOf = currencyTo
        currencyTo = currencyChange
        guard let currencyOf, let currencyTo else {return}
        updateCurrencyView(screen.currencyOf, currencyOf)
        updateCurrencyView(screen.currencyTo, currencyTo)
        
    }
    
}

