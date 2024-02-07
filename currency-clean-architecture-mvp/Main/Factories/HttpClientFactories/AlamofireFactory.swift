//
//  AlamofireFactory.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 14/09/23.
//

import Foundation

class AlamofireFactory {
    
    static func make() -> AlamofireNetwork {
        return AlamofireNetwork()
    }
    
}
