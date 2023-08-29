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
    
    init(navigation: NavigationController) {
        self.navigation = navigation
    }

    func validate() -> T? {
        return navigation.containsViewController(ofType: T.self ) as? T 
    }
    
}
