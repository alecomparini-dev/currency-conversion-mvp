//
//  CurrencyConversionCoordinator.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 15/08/23.
//

import Foundation

class CurrencyConversionCoordinator: Coordinator {
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
        startCurrencyConversion()
    }
        
    
//  MARK: - PRIVATE AREA
    private func validatorFactory() -> Validator {
        defaultValidatorFactory(ofTypeViewController: CurrencyConversionViewController(),
                                                navigationController: navigationController,
                                                coordinator: self)
    }
    
    private func startCurrencyConversion() {
        let controller = CurrencyConversionViewController()
        controller.coordinator = self
        navigationController.pushViewController(controller)
    }
}


//  MARK: - EXTENSION CurrencyConversionViewControllerCoordinator
extension CurrencyConversionCoordinator: CurrencyConversionViewControllerCoordinator {
    func goToSearchCurrenciesVC() {
        let coordinator = SearchCurrenciesCoordinator(navigationController)
        coordinator.start()
        childCoordinators = nil
    }
    
}

