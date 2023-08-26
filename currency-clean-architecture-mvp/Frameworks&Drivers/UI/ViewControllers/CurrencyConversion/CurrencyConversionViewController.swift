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
    var receivedData: String?
    
    private var tap: (currencyOf: UITapGestureRecognizer?, currencyTo: UITapGestureRecognizer?)
    
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("RECEBIIIIIIIIIIIIIIIIII:", self.receivedData ?? "")
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeTapGesture()
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
        if let tapCurrencyOf = tap.currencyOf, let tapCurrencyTo = tap.currencyTo {
            screen.currencyOf.removeGestureRecognizer(tapCurrencyOf)
            screen.currencyTo.removeGestureRecognizer(tapCurrencyTo)
        }
    }
    

    
//  MARK: - @OBJC AREA
    @objc private func currencyOfTapped() {
        currencyOfButtonTapped()
    }
    
    @objc private func currencyToTapped() {
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
        print("Invert Currencies")
    }
    
}

