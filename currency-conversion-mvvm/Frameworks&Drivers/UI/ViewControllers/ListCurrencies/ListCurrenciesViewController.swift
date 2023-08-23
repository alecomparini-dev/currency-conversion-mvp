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
    
    private var listCurrenciesVM: ListCurrenciesViewModel
    private var listCurrenciesTableView: ListCurrenciesTableViewCell?
    
    
//  MARK: - Initializers
    init(listCurrenciesVM: ListCurrenciesViewModel, listCurrenciesTableView: ListCurrenciesTableViewCell? = nil) {
        self.listCurrenciesVM = listCurrenciesVM
        self.listCurrenciesTableView = listCurrenciesTableView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

//  MARK: - LAZY SCREEN
    lazy var screen: ListCurrenciesView = {
        let view = ListCurrenciesView()
        return view
    }()
    
    
//  MARK: - LIFE CYCLE
    
    override func loadView() {
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializations()
    }
    
    
//  MARK: - PRIVATE AREA
    
    private func initializations() {
        hideKeyboardOnTap()
        configureDelegates()
        fetchCurrencies()
        startAnimationLoading()
    }
    
    private func configureDelegates() {
        configSearchCurrenciesViewDelegate()
        configSearchBarDelegate()
        configListCurrenciesViewModelDelegate()
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
    
    private func configListCurrenciesViewModelDelegate() {
        listCurrenciesVM.delegate = self
    }
    
    private func fetchCurrencies() {
        listCurrenciesVM.listCurrencies()
    }
    
    private func startAnimationLoading() {
        screen.loading.startAnimating()
    }
    
    private func reloadTableView() {
        screen.tableView.reloadData()
    }
    
}


//  MARK: - EXTENSION ListCurrenciesViewDelegate - [View]
extension ListCurrenciesViewController: ListCurrenciesViewDelegate {
    func backPageButtonTapped() {
        coordinator?.goToCurrencyConversionVC()
    }
    
}


//  MARK: - EXTENSION ListCurrenciesViewModelDelegate - [ViewModel]
extension ListCurrenciesViewController: ListCurrenciesViewModelOutput {
    
    func successListCurrencies() {
        configTableViewDelegate()
        reloadTableView()
        screen.loading.stopAnimating()
    }
    
    func error(title: String, message: String) {
        print(message)
        screen.loading.stopAnimating()
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
        return listCurrenciesTableView?.numberOfCurrencies() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyTableViewCell.identifier, for: indexPath) as? CurrencyTableViewCell
        
        guard let listCurrenciesTableView else { return  UITableViewCell() }
        
        let input = CurrencyDTO(symbol: listCurrenciesTableView.symbol(index: indexPath.row),
                                         title: listCurrenciesTableView.title(index: indexPath.row),
                                         subTitle: listCurrenciesTableView.subTitle(index: indexPath.row),
                                         favorite: listCurrenciesTableView.favorite(index: indexPath.row))
        
        cell?.setup(input)
        
        return cell ?? UITableViewCell()
    }
    
    
}
