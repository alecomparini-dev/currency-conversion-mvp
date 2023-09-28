//  Created by Alessandro Comparini on 27/09/23.
//

import Foundation


// MARK: - Quotes
struct QuotesCodable: Codable {
    var success: Bool?
    var terms: String?
    var privacy: String?
    var timestamp: Int?
    var source: String?
    var quotes: [String: Double]?
    
    init(success: Bool? = nil, terms: String? = nil, privacy: String? = nil, timestamp: Int? = nil, source: String? = nil, quotes: [String : Double]? = nil) {
        self.success = success
        self.terms = terms
        self.privacy = privacy
        self.timestamp = timestamp
        self.source = source
        self.quotes = quotes
    }
    
    func mapperToDomain() -> [CurrencyQuotes] {
        guard let currencyQuotes = self.quotes else {return []}
        return currencyQuotes.map {
            CurrencyQuotes(currencyReference: self.source ?? "USD", currencyISO: separateCurrency($0.key), quotes: $0.value)
        }

    }
    
    private func separateCurrency(_ currency: String) -> String {
        if currency.count > 3 {
            return String(currency.suffix(3))
        }
        return currency
    }
    
}
