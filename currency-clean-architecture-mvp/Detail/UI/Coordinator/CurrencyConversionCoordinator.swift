//
//  CurrencyConversionCoordinator.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 15/08/23.
//

import Foundation

class CurrencyConversionCoordinator: Coordinator {
    var childCoordinator: Coordinator?
    unowned let navigationController: NavigationController

    var receivedData: CurrencyConversionVCDTO?
    
    required init(_ navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        childCoordinator = self
        var controller: CurrencyConversionViewController = CurrencyConversionControllerFactory.make()
        controller = navigationController.pushViewController(controller)
        controller.coordinator = self
        controller.receivedData = receivedData
    }
        
}


//  MARK: - EXTENSION CurrencyConversionViewControllerCoordinator
extension CurrencyConversionCoordinator: CurrencyConversionViewControllerCoordinator {
    
    func goToSearchCurrenciesVC() {
        let coordinator = ListCurrenciesCoordinator(navigationController)
        coordinator.start()
        childCoordinator = nil
    }
        
}

