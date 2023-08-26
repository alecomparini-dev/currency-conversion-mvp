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

        if let vc = HasViewControllerBeenPushedValidation<ListCurrenciesViewController>(navigation: navigationController, coordinator: self).validate() {
            navigationController.popToViewController(vc, animated: true)
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



//  MARK: - EXTENSION - ListCurrenciesViewControllerCoordinator
extension ListCurrenciesCoordinator: ListCurrenciesViewControllerCoordinator {
    
    func goToCurrencyConversionVC() {
        let coordinator = CurrencyConversionCoordinator(navigationController)
        coordinator.passData(data: "VAIIIIIIIIII TOMAR NO CUUUUUUUUUUUUUUUUUUUUUUUUU")
        coordinator.start()
        childCoordinators = nil
    }
    
    
}

