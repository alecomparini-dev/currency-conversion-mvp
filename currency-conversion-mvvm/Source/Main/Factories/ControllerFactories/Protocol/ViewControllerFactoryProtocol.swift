//
//  ViewControllerFactoryProtocol.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 20/08/23.
//

import UIKit

protocol ViewControllerFactoryProtocol {
    associatedtype T: UIViewController
    static func make() -> T
}
