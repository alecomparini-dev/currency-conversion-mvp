//
//  CurrenciesCodable.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 22/08/23.
//

import Foundation


// MARK: - CurrenciesCodable

struct CurrenciesCodable: Codable {
    let success: Bool?
    let terms: String?
    let privacy: String?
    let currencies: [String: String]?
    
    init(success: Bool? = nil, terms: String? = nil, privacy: String? = nil, currencies: [String : String]? = nil) {
        self.success = success
        self.terms = terms
        self.privacy = privacy
        self.currencies = currencies
    }
    
    func mapperToDomain() -> [Currency] {
        guard let currencies = self.currencies else {return []}
        return currencies.map { Currency(currencyISO: $0.key , name: $0.value) }
    }
    
}
