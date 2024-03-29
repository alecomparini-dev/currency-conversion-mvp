//
//  ListCurrenciesViewController.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 15/08/23.
//

import UIKit


//  MARK: - PROTOCOL COORDINATOR
protocol ListCurrenciesViewControllerCoordinator: AnyObject {
    func goToCurrencyConversionVC(dto: CurrencyConversionVCDTO?)
}


//  MARK: - CLASS

class ListCurrenciesViewController: UIViewController, ViewControllerCoordinator {
    weak var coordinator: ListCurrenciesViewControllerCoordinator?
        
    private var listCurrenciesPR: ListCurrenciesPresenter
    private var listCurrenciesDataSource: ListCurrenciesPresenterDataSource?
    
    
//  MARK: - Initializers
    init(listCurrenciesPR: ListCurrenciesPresenter, 
         listCurrenciesDS: ListCurrenciesPresenterDataSource? = nil) {
        self.listCurrenciesPR = listCurrenciesPR
        self.listCurrenciesDataSource = listCurrenciesDS
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
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
        configListCurrenciesPresenterDelegate()
        configSortDelegate()
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
    
    private func configListCurrenciesPresenterDelegate() {
        listCurrenciesPR.delegate = self
    }
    
    private func configSortDelegate() {
        screen.sortCurrencies.delegate = self
    }
    
    private func fetchCurrencies() {
        listCurrenciesPR.fetchCurrencies()
    }
    
    private func startAnimationLoading() {
        screen.loading.startAnimating()
    }
    
}


//  MARK: - EXTENSION ListCurrenciesViewDelegate
extension ListCurrenciesViewController: ListCurrenciesViewDelegate {
    
    func backPageButtonTapped() {
        coordinator?.goToCurrencyConversionVC(dto: nil)
    }
    
}


//  MARK: - EXTENSION ListCurrenciesPresenterDelegate - [Presenter]
extension ListCurrenciesViewController: ListCurrenciesPresenterOutput {
    
    func sortingType(_ type: SortingTypes) {
        screen.sortCurrencies.sortCodeButton.setImage(UIImage(), for: .normal)
        screen.sortCurrencies.sortNameButton.setImage(UIImage(), for: .normal)
        let imgChevronDown = UIImage(systemName: K.Screen.ListCurrencies.Images.sortAcronymButtonDown)?.applyingSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 14))
        let imgChevronUp = UIImage(systemName: K.Screen.ListCurrencies.Images.sortAcronymButtonUp)?.applyingSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 14))

        switch type {
            case .currencyISOAscending:
                screen.sortCurrencies.sortCodeButton.setImage(imgChevronDown, for: .normal)
            
            case .currencyISODescending:
                screen.sortCurrencies.sortCodeButton.setImage(imgChevronUp, for: .normal)
            
            case .nameAscending:
                screen.sortCurrencies.sortNameButton.setImage(imgChevronDown, for: .normal)
            
            case .nameDescending:
                screen.sortCurrencies.sortNameButton.setImage(imgChevronUp, for: .normal)
        }
    }
    
    func reloadTableView() {
        screen.tableView.reloadData()
    }
    
    func successListCurrencies() {
        configTableViewDelegate()
        reloadTableView()
        screen.loading.stopAnimating()
    }
    
    func error(title: String, message: String) {
        screen.loading.stopAnimating()
    }
    
}


//  MARK: - EXTENSION - UISearchBarDelegate
extension ListCurrenciesViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listCurrenciesPR.filterCurrencies(searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}


//  MARK: - EXTENSION - SortCurrenciesViewDelegate
extension ListCurrenciesViewController: SortCurrenciesViewDelegate {
    func sortCodeButtonTapped() {
        listCurrenciesPR.sortByAcronym()
    }
    
    func sortDescriptionButtonTapped() {
        listCurrenciesPR.sortByName()
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
        return listCurrenciesDataSource?.numberOfCurrencies() ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currency = listCurrenciesPR.getCurrencyBy(index: indexPath.row)
        let currencyDTO = CurrencyConversionVCDTO(symbol: currency.symbol ?? "" ,
                                                  currencyISO: currency.currencyISO ?? "",
                                                  name: currency.name ?? "" )
        
        coordinator?.goToCurrencyConversionVC(dto: currencyDTO)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyTableViewCell.identifier, for: indexPath) as? CurrencyTableViewCell
        
        guard let cell else { return UITableViewCell() }
        
        let currency = listCurrenciesPR.getCurrencyBy(index: indexPath.row)
        
        let parameter = CurrencyTableViewCellDTO(symbol: currency.symbol ?? "",
                                                 currencyISO: currency.currencyISO ?? "",
                                                 name: currency.name ?? "",
                                                 favorite: currency.favorite ?? false)

        cell.setup(parameter, completion: { [weak self] currencyISO, favorite in
            guard let self else {return}
            if favorite {
                listCurrenciesPR.addFavoriteCurrency(FavoriteCurrencyDTO(currencyISO: currencyISO ))
            } else {
                listCurrenciesPR.deleteFavoriteCurrency(currencyISO)
            }
            
        })
        
        return cell
    }
    
    
}

