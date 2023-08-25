//
//  ListCurrenciesCoordinator.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 15/08/23.
//

import Foundation

class ListCurrenciesCoordinator: Coordinator {
    var childCoordinators: [Coordinator]? = []
    
    unowned let navigationController: NavigationController
    
    required init(_ navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        childCoordinators?.append(self)
        if !validatorFactory().validate() {
            return
        }
        startListCurrencies()
    }
    
    
//  MARK: - PRIVATE AREA
    private func validatorFactory() -> Validator {
        defaultValidatorFactory(ofTypeViewController: ListCurrenciesControllerFactory.make() ,
                                navigationController: navigationController,
                                coordinator: self)
    }
    
    private func startListCurrencies() {
        let controller = ListCurrenciesControllerFactory.make()
        controller.coordinator = self
        navigationController.pushViewController(controller)
    }
    
}


extension ListCurrenciesCoordinator: ListCurrenciesViewControllerCoordinator {
    func goToCurrencyConversionVC() {
        let coordinator = CurrencyConversionCoordinator(navigationController)
        coordinator.start()
        childCoordinators = nil
    }
    
    
}

