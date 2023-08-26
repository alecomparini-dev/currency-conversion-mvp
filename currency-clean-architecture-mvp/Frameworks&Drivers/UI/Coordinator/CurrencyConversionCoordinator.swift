//
//  CurrencyConversionCoordinator.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 15/08/23.
//

import Foundation

class CurrencyConversionCoordinator: Coordinator {
    var childCoordinators: [Coordinator]? = []
    unowned let navigationController: NavigationController
    
    private var passData: String?
    
    func passData<D>(data: D) {
        passData = data as? String
    }

    required init(_ navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        childCoordinators?.append(self)
        
        if let vc = HasViewControllerBeenPushedValidation<CurrencyConversionViewController>(navigation: navigationController, coordinator: self).validate() {
            vc.receivedData = passData
            navigationController.popToViewController(vc, animated: true)
            return
        }
        
        let controller: CurrencyConversionViewController = CurrencyConversionControllerFactory.make()
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

