//
//  Main+Constants.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 28/08/23.
//

import Foundation


struct MainConstants {
    static let access_key = "access_key"
    static let pathList = "/list"
    static let pathLive = "/live"
    
    struct ListSymbolFile {
        static let fileName = "CurrencySymbols"
        static let withExtension = "json"
    }
    
    struct FavoriteCurrency {
        static let mainKey = "Favorite"
    }
    
}
