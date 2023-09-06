//
//  Environment.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 18/08/23.
//
//
//API_BASE_URL = http:/$()/api.currencylayer.com
//ACCESS_KEY = 2b005329c06a0bbb773f6f1da65baedd

import Foundation

final class Environment {
    
    private static let ENV = "ENV"
    
    enum Variables: String {
        case apiBaseUrl = "API_BASE_URL"
        case accessKey = "ACCESS_KEY"
        case typeFetch = "TYPE_FETCH"
    }
    
    static func variable(_ key: Environment.Variables) -> String {
        let enviroment = Bundle.main.infoDictionary![ENV] as! [String: Any]
        return enviroment[key.rawValue] as! String
    }
    
}
