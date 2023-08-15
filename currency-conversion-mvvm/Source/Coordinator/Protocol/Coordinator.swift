//
//  Coordinator.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 15/08/23.
//

import UIKit

protocol Coordinator {
    var navigationController: NavigationController { get }
    
    init(_ navigationController: NavigationController)
    
    func start()
}
