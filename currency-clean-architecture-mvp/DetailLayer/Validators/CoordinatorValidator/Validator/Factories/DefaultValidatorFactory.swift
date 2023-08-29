//
//  DefaultValidatorFactory.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 17/08/23.
//

import UIKit

func defaultValidatorFactory<T: UIViewController>(ofTypeViewController: T, navigationController: NavigationController, coordinator: any Coordinator) -> Validator
where T: ViewControllerCoordinator {
    let validator = Validator()
    validator.add(AuthenticationValidation())
//    validator.add(HasViewControllerBeenPushedValidation<T>(navigation: navigationController, coordinator: coordinator))
    return validator
}