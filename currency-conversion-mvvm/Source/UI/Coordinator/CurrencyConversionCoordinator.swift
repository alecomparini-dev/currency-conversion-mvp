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
        let coordinator = self
        childCoordinators?.append(coordinator)
        if !validatorFactory().validate() {
            return
        }
        startCurrencyConversion()
    }
        
    
//  MARK: - PRIVATE AREA
    private func validatorFactory() -> Validator {
        defaultValidatorFactory(ofTypeViewController: CurrencyConversionControllerFactory.make(),
                                navigationController: navigationController,
                                coordinator: self)
    }
    
    private func startCurrencyConversion() {
        let controller = CurrencyConversionControllerFactory.make()
        controller.coordinator = self
        navigationController.pushViewController(controller)
    }
}


//  MARK: - EXTENSION CurrencyConversionViewControllerCoordinator
extension CurrencyConversionCoordinator: CurrencyConversionViewControllerCoordinator {
    func goToSearchCurrenciesVC() {
        let coordinator = ListCurrenciesCoordinator(navigationController)
        coordinator.start()
        childCoordinators = nil
    }
    
}

