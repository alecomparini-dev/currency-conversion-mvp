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

        if let controller = HasViewControllerBeenPushedValidation<ListCurrenciesViewController>(navigation: navigationController).validate() {
            navigationController.popToViewController(controller, animated: true)
            return
        }
        
        startListCurrencies()   
    }
    
    
//  MARK: - PRIVATE AREA
    
    private func startListCurrencies() {
        let controller = ListCurrenciesControllerFactory.make()
        controller.coordinator = self
        navigationController.pushViewController(controller)
    }
    
}


//  MARK: - EXTENSION - ListCurrenciesViewControllerCoordinator
extension ListCurrenciesCoordinator: ListCurrenciesViewControllerCoordinator {
    
    func goToCurrencyConversionVC(dto: CurrencyConversionDTO?) {
        let coordinator = CurrencyConversionCoordinator(navigationController)
        coordinator.passData = dto
        coordinator.start()
        childCoordinators = nil
    }
    
    
}

