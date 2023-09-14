//
//  URLSessionFactory.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 14/09/23.
//

import Foundation

class URLSessionFactory {
    
    static func make() -> URLSessionNetwork {
        return URLSessionNetwork()
    }
    
}
