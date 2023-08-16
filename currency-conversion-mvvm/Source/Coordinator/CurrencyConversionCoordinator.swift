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
    
// SE USAR O WEAK SELF NAO CONSEGUE CHAMAR
//    func start() {
//        let controller = CurrencyConversionViewController()
//
//        controller.openSearchCurrenciesScreen = {
//            let coordinator = SearchCurrenciesCoordinator(self.navigationController)
//            coordinator.start()
//        }
//
//        navigationController.pushViewController(controller)
//    }
        
}


//  MARK: - EXTENSION CurrencyConversionViewControllerCoordinator
extension CurrencyConversionCoordinator: CurrencyConversionViewControllerCoordinator {
    func openSearchCurrenciesScreen() {
        let coordinator = SearchCurrenciesCoordinator(self.navigationController)
        coordinator.start()
    }
    
}

