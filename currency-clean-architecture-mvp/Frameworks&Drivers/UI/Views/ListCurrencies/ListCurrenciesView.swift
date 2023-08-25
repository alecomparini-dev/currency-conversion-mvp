//
//  ListCurrenciesView.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 15/08/23.
//

import UIKit


//  MARK: - PROTOCOL

protocol ListCurrenciesViewDelegate: AnyObject {
    func backPageButtonTapped()
}


//  MARK: -

class ListCurrenciesView: UIView {
    weak var delegate: ListCurrenciesViewDelegate?
    
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//  MARK: - LAZY AREA
    
    lazy var loading: UIActivityIndicatorView = {
        let ind = UIActivityIndicatorView()
        ind.translatesAutoresizingMaskIntoConstraints = false
        ind.color = UIColor.HEX("#000000")
        ind.style = .large
        ind.hidesWhenStopped = true
        return ind
    }()
    
    lazy var backPageButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "chevron.left")?.applyingSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 25)), for: .normal)
        btn.tintColor = .black
        btn.contentMode = .scaleAspectFill
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(backPageButtonTapped), for: .touchUpInside)
        return btn
    }()
    @objc private func backPageButtonTapped() {
        delegate?.backPageButtonTapped()
    }
    
    lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.clipsToBounds = true
        search.layer.cornerRadius = 8
        search.searchTextField.backgroundColor = .clear
        search.barTintColor = .white
        search.placeholder = "Search currency"
        return search
    }()
    
    lazy var sortCurrencies: SortCurrenciesView = {
        let sort = SortCurrenciesView()
        sort.translatesAutoresizingMaskIntoConstraints = false
        return sort
    }()
    
    lazy var tableView: UITableView = {
        let tab = UITableView()
        tab.translatesAutoresizingMaskIntoConstraints = false
        tab.separatorStyle = .none
        tab.register(CurrencyTableViewCell.self, forCellReuseIdentifier: CurrencyTableViewCell.identifier)
        return tab
    }()
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        configBackgroundColor()
        addElements()
        configConstraints()
    }
    
    private func configBackgroundColor() {
        backgroundColor = .white
    }
    
    private func addElements() {
        addSubview(searchBar)
        addSubview(backPageButton)
        addSubview(sortCurrencies)
        addSubview(tableView)
        addSubview(loading)
    }
    
    private func configConstraints() {
        configBackPageButtonConstraints()
        configSearchBarConstraints()
        configSortCurrenciesConstraints()
        configTableViewConstraints()
        configLoadingConstraints()
    }
    
    private func configSearchBarConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: backPageButton.trailingAnchor, constant: 5),
            searchBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -25),
            searchBar.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    private func configBackPageButtonConstraints() {
        NSLayoutConstraint.activate([
            backPageButton.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor),
            backPageButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            backPageButton.widthAnchor.constraint(equalToConstant: 40),
            backPageButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func configSortCurrenciesConstraints() {
        NSLayoutConstraint.activate([
            sortCurrencies.topAnchor.constraint(equalTo: backPageButton.bottomAnchor, constant: 20),
            sortCurrencies.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 50),
            sortCurrencies.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -75),
            sortCurrencies.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
    
    private func configTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: sortCurrencies.bottomAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    private func configLoadingConstraints() {
        NSLayoutConstraint.activate([
            loading.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: 10),
            loading.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
    
    
}
