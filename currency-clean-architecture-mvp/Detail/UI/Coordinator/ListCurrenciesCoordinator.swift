
//  Created by Alessandro Comparini on 15/08/23.
//

import Foundation

class ListCurrenciesCoordinator: Coordinator {
    var childCoordinator: Coordinator?
    
    unowned let navigationController: NavigationController
    
    required init(_ navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    
    func start() {
        childCoordinator = self
        var controller: ListCurrenciesViewController = ListCurrenciesControllerFactory.make()
        controller = navigationController.pushViewController(controller)
        controller.coordinator = self
    }
    
}


//  MARK: - EXTENSION - ListCurrenciesViewControllerCoordinator
extension ListCurrenciesCoordinator: ListCurrenciesViewControllerCoordinator {
    
    func goToCurrencyConversionVC(dto: CurrencyConversionVCDTO?) {
        let coordinator = CurrencyConversionCoordinator(navigationController)
        coordinator.receivedData = dto
        coordinator.start()
        childCoordinator = nil
    }
    
    
}

