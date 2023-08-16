//
//  SearchCurrenciesCoordinator.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 15/08/23.
//

import Foundation

class SearchCurrenciesCoordinator: Coordinator {
    var navigationController: NavigationController
    
    required init(_ navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = SearchCurrenciesViewController()
//        navigationController.pushViewController(controller)
        navigationController.present(controller, animated: true)
    }
    
}
