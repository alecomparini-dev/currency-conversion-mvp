//
//  Coordinator.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 15/08/23.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    
    init(_ navigationController: UINavigationController)
    
    func start()
}
