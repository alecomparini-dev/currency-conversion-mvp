//
//  CurrencyConversionViewController.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 14/08/23.
//

import UIKit

class CurrencyConversionViewController: UIViewController {
    
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
    }
    
    
}







