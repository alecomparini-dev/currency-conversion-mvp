//
//  Validator.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 17/08/23.
//

import Foundation

class Validator {
    private var strategies: [Validation] = []
    
    func add(_ strategy: Validation) {
        strategies.append(strategy)
    }
    
    func validate() -> Continue {
        for validation in strategies {
            if !validation.validate() {
                return false
            }
        }
        return true
    }
    
}
