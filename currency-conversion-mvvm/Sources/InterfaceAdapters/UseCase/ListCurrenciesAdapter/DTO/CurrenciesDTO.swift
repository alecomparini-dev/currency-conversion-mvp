//
//  CurrenciesDTO.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 22/08/23.
//

import Foundation


// MARK: - CurrenciesDTO

struct CurrenciesDTO: Codable {
    let success: Bool?
    let terms: String?
    let privacy: String?
    let currencies: [String: String]?
    
    init(success: Bool? = nil, terms: String? = nil , privacy: String? = nil, currencies: [String : String]? = nil) {
        self.success = success
        self.terms = terms
        self.privacy = privacy
        self.currencies = currencies
    }
    
}
