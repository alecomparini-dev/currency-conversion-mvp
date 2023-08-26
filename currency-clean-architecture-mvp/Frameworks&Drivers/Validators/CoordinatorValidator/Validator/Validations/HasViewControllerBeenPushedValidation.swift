//
//  HasViewControllerBeenPushedValidation.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 17/08/23.
//

import UIKit

class HasViewControllerBeenPushedValidation<T: UIViewController>
where T: ViewControllerCoordinator {
    
    private let navigation: NavigationController
    private let coordinator: any Coordinator
    
    init(navigation: NavigationController, coordinator: any Coordinator) {
        self.navigation = navigation
        self.coordinator = coordinator
    }

    func validate() -> T? {
        if let vc = navigation.containsViewController(ofType: T.self ) as? T {
            vc.coordinator = coordinator as? T.T
//            navigation.popToViewController(vc, animated: true)
            return vc
        }
        return nil
    }
    
}
