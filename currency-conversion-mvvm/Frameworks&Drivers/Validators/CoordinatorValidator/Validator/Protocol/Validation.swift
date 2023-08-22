//
//  Validator.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 17/08/23.
//

import Foundation

typealias Continue = Bool

protocol Validation {
    func validate() -> Continue
}
