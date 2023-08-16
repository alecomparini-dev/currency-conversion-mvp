//
//  SearchCurrenciesCoordinator.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 15/08/23.
//

import Foundation

class SearchCurrenciesCoordinator: Coordinator {
    var childCoordinators: Coordinator?
    
    unowned let navigationController: NavigationController
    
    required init(_ navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = SearchCurrenciesViewController()
        navigationController.present(controller, animated: true)
    }
    
}
