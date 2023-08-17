//
//  SearchCurrenciesView.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 15/08/23.
//

import UIKit


//  MARK: - PROTOCOL

protocol SearchCurrenciesViewDelegate: AnyObject {
    func backPageButtonTapped()
}


//  MARK: -

class SearchCurrenciesView: UIView {
    weak var delegate: SearchCurrenciesViewDelegate?
    
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//  MARK: - LAZY AREA
    lazy var backPageButton: UIButton = {
        let btn = UIButton()
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
        addSubview(backPageButton)
        addSubview(searchBar)
        addSubview(sortCurrencies)
        addSubview(tableView)
    }
    
    private func configConstraints() {
        configBackPageButtonConstraints()
        configSearchBarConstraints()
        configSortCurrenciesConstraints()
        configTableViewConstraints()
    }
    
    private func configBackPageButtonConstraints() {
        NSLayoutConstraint.activate([
            backPageButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            backPageButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            backPageButton.widthAnchor.constraint(equalToConstant: 40),
            backPageButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func configSearchBarConstraints() {
        NSLayoutConstraint.activate([
            searchBar.centerYAnchor.constraint(equalTo: backPageButton.centerYAnchor),
            searchBar.leadingAnchor.constraint(equalTo: backPageButton.trailingAnchor, constant: 5),
            searchBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -25),
            searchBar.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    private func configSortCurrenciesConstraints() {
        NSLayoutConstraint.activate([
            sortCurrencies.topAnchor.constraint(equalTo: backPageButton.bottomAnchor, constant: 20),
            sortCurrencies.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 50),
            sortCurrencies.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -60),
            sortCurrencies.heightAnchor.constraint(equalToConstant: 35),
        ])
    }
    
    private func configTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: sortCurrencies.bottomAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    
}
