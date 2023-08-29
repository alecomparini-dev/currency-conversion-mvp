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

    var passData: CurrencyConversionVCDTO?
    
    required init(_ navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        childCoordinators?.append(self)
        
        if let controller = HasViewControllerBeenPushedValidation<CurrencyConversionViewController>(navigation: navigationController).validate() {
            receivedDataViewController(controller, passData: self.passData )
            navigationController.popToViewController(controller, animated: true)
            return
        }
        
        let controller: CurrencyConversionViewController = CurrencyConversionControllerFactory.make()
        receivedDataViewController(controller, passData: self.passData )
        navigationController.pushViewController(controller)
    }
    
    
    
//  MARK: - PRIVATE AREA
    
    private func receivedDataViewController(_ vc: CurrencyConversionViewController, passData: CurrencyConversionVCDTO?) {
        vc.coordinator = self
        guard let passData else { return }
        vc.receivedData = passData
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

