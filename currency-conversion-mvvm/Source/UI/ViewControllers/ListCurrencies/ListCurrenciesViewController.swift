//
//  ListCurrenciesViewController.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 15/08/23.
//

import UIKit


//  MARK: - PROTOCOL COORDINATOR
protocol ListCurrenciesViewControllerCoordinator: AnyObject {
    func goToCurrencyConversionVC()
}


//  MARK: - CLASS
class ListCurrenciesViewController: UIViewController, ViewControllerCoordinator {
    weak var coordinator: ListCurrenciesViewControllerCoordinator?
    private var listCurrenciesVM: ListCurrenciesViewModelProtocol
    
    init(listCurrenciesVM: ListCurrenciesViewModelProtocol) {
        self.listCurrenciesVM = listCurrenciesVM
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var screen: ListCurrenciesView = {
        let view = ListCurrenciesView()
        return view
    }()
    
    override func loadView() {
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        fetchCurrencies()
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
    
    private func fetchCurrencies() {
        listCurrenciesVM.listCurrencies()
    }
    
}


//  MARK: - EXTENSION ListCurrenciesViewDelegate
extension ListCurrenciesViewController: ListCurrenciesViewDelegate {
    func backPageButtonTapped() {
        coordinator?.goToCurrencyConversionVC()
    }
    
}


//  MARK: - EXTENSION ListCurrenciesViewDelegate
extension ListCurrenciesViewController: ListCurrenciesViewModelProtocol {
    func listCurrencies() {
        listCurrenciesVM.listCurrencies()
    }
    
}


//  MARK: - EXTENSION UISearchBarDelegate

extension ListCurrenciesViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}


//  MARK: - EXTENSION UITableViewDelegate

extension ListCurrenciesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}


//  MARK: - EXTENSION UITableViewDataSource

extension ListCurrenciesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyTableViewCell.identifier, for: indexPath) as? CurrencyTableViewCell
        
        return cell ?? UITableViewCell()
    }
    
    
}

