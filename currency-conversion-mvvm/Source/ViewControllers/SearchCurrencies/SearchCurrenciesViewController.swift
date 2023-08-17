//
//  SearchCurrenciesViewController.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 15/08/23.
//

import UIKit


//  MARK: - PROTOCOL

protocol SearchCurrenciesViewControllerCoordinator: AnyObject {
    func goToCurrencyConversionVC()
}


//  MARK: - CLASS

class SearchCurrenciesViewController: UIViewController, ViewControllerCoordinator {
    weak var coordinator: SearchCurrenciesViewControllerCoordinator?
    
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
        configureDelegates()
    }
    
    private func configureDelegates() {
        configSearchCurrenciesViewDelegate()
        configSearchBarDelegate()
        configTableViewDelegate()
    }
    
    private func configSearchCurrenciesViewDelegate() {
        screen.delegate = self
    }
    
    private func configSearchBarDelegate() {
        screen.searchBar.delegate = self
    }
    
    private func configTableViewDelegate() {
        screen.tableView.delegate = self
        screen.tableView.dataSource = self
    }
    
}



//  MARK: - EXTENSION SearchCurrenciesViewDelegate

extension SearchCurrenciesViewController: SearchCurrenciesViewDelegate {
    func backPageButtonTapped() {
        coordinator?.goToCurrencyConversionVC()
    }
    
}


//  MARK: - EXTENSION UISearchBarDelegate

extension SearchCurrenciesViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}


//  MARK: - EXTENSION UITableViewDelegate

extension SearchCurrenciesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}


//  MARK: - EXTENSION UITableViewDataSource

extension SearchCurrenciesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

