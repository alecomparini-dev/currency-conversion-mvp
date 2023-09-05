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

    var receivedData: CurrencyConversionVCDTO?
    
    required init(_ navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        childCoordinators?.append(self)
        
        if let controller = HasViewControllerBeenPushedValidation<CurrencyConversionViewController>(navigation: navigationController).validate() {
            receivedDataViewController(controller, receivedData: self.receivedData )
            navigationController.popToViewController(controller, animated: true)
            return
        }
        
        let controller: CurrencyConversionViewController = CurrencyConversionControllerFactory.make()
        receivedDataViewController(controller, receivedData: self.receivedData )
        navigationController.pushViewController(controller)
    }
    
    
    
//  MARK: - PRIVATE AREA
    
    private func receivedDataViewController(_ vc: CurrencyConversionViewController, receivedData: CurrencyConversionVCDTO?) {
        vc.coordinator = self
        guard let receivedData else { return }
        vc.receivedData = receivedData
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

