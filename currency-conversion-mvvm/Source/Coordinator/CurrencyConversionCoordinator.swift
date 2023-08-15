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
        navigationController.pushViewController(controller)
    }
    
}
