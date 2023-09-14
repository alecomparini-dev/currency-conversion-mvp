//
//  ViewControllerFactoryProtocol.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 20/08/23.
//

import UIKit

protocol ViewControllerFactory {
    associatedtype T: UIViewController
    static func make() -> T
}
