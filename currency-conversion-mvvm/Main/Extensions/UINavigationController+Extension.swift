//
//  UINavigationController+Extension.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 16/08/23.
//

import UIKit

extension UINavigationController {
    func containsViewController(ofType viewControllerType: UIViewController.Type) -> UIViewController? {
        return self.viewControllers.first(where: { $0.isKind(of: viewControllerType) })
    }
}
