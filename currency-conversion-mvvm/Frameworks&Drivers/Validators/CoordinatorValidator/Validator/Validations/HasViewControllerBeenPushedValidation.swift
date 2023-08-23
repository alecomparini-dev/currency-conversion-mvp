//
//  HasViewControllerBeenPushedValidation.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 17/08/23.
//

import UIKit

class HasViewControllerBeenPushedValidation<T: UIViewController>: Validation
where T: ViewControllerCoordinator {
    
    private let navigation: NavigationController
    private let coordinator: Coordinator
    
    init(navigation: NavigationController, coordinator: Coordinator) {
        self.navigation = navigation
        self.coordinator = coordinator
    }

    func validate() -> Continue {
        if let vc = navigation.containsViewController(ofType: T.self ) as? T {
            vc.coordinator = coordinator as? T.T
            navigation.popToViewController(vc, animated: true)
            return false
        }
        return true
    }
    
}
