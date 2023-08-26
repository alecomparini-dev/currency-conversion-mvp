//
//  ViewControllerCoordinator.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 17/08/23.
//

import UIKit

protocol ViewControllerCoordinator: AnyObject  {
    associatedtype T
    associatedtype D
    var coordinator: T? { get set }
    var receivedData: D? { get set }
}


