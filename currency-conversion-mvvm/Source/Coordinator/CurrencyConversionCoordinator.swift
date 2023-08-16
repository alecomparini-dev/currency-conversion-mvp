//
//  CurrencyConversionCoordinator.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 15/08/23.
//

import UIKit

class CurrencyConversionCoordinator: Coordinator {
    var navigationController: NavigationController
    
    required init(_ navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = CurrencyConversionViewController()
        controller.coordinator = self
        navigationController.pushViewController(controller)
    }
    
}


//  MARK: - EXTENSION CurrencyConversionViewControllerCoordinator
extension CurrencyConversionCoordinator: CurrencyConversionViewControllerCoordinator {
    func goToSearchCurrencies() {
        let coordinator = SearchCurrenciesCoordinator(self.navigationController)
        coordinator.start()
    }
    
}

