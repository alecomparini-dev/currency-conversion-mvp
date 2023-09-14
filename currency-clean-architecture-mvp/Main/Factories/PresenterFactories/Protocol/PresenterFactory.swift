//
//  PresenterFactory.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 14/09/23.
//

import Foundation

protocol PresenterFactory {
    associatedtype T
    static func make() -> T
}
