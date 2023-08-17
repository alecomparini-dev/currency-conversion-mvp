//
//  SearchCurrenciesCoordinator.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 15/08/23.
//

import Foundation

class SearchCurrenciesCoordinator: Coordinator {
    var childCoordinators: [Coordinator]? = []
    
    unowned let navigationController: NavigationController
    
    required init(_ navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        childCoordinators?.append(self)
        childCoordinators?.append(self)
        let validator = defaultValidatorFactory(ofTypeViewController: SearchCurrenciesViewController(),
                                                navigationController: navigationController,
                                                coordinator: self)
        if !validator.validate() {
            return
        }
        let controller = SearchCurrenciesViewController()
        controller.coordinator = self
        navigationController.pushViewController(controller)
    }
    
}


extension SearchCurrenciesCoordinator: SearchCurrenciesViewControllerCoordinator {
    func goToCurrencyConversionVC() {
        let coordinator = CurrencyConversionCoordinator(navigationController)
        coordinator.start()
        childCoordinators = nil
    }
    
    
}

