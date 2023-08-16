//
//  SearchCurrenciesViewController.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 15/08/23.
//

import UIKit

class SearchCurrenciesViewController: UIViewController {
    
    lazy var screen: SearchCurrenciesView = {
        let view = SearchCurrenciesView()
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