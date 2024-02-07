//  Created by Alessandro Comparini on 08/09/23.
//

import Foundation

class ConversionUseCaseImpl: ConversionUseCase {
    
    private let conversionEntity: ConversionEntity
    private let listQuotes: ListQuotesUseCase
    
    init(conversionEntity: ConversionEntity, listQuotes: ListQuotesUseCase) {
        self.conversionEntity = conversionEntity
        self.listQuotes = listQuotes
    }
    
    func conversion(input: ConversionUseCaseDTO.Input) async throws -> ConversionUseCaseDTO.Output {
        let quotesResponse: [ListQuotesUseCaseDTO.Output] = try await listQuotes.listQuotesByCurrencies( currencyReference: input.currencyReference , currencies: [input.currencyOf, input.currencyTo])
        
        let quoteCurrencyOf: Double = getQuote(currencyReference: input.currencyReference,
                                               currency: input.currencyOf, quotesResponse: quotesResponse)
        let quoteCurrencyTo: Double = getQuote(currencyReference: input.currencyReference,
                                               currency: input.currencyTo, quotesResponse: quotesResponse)
        let value: Double = input.value
        
        let result = conversionEntity.conversion(value: value, quoteCurrencyOf: quoteCurrencyOf, quoteCurrencyTo: quoteCurrencyTo)
        
        return ConversionUseCaseDTO.Output(conversionResult: result)
        
        
    }
    
    
//  MARK: - PRIVATE AREA
    private func getQuote(currencyReference: String, currency: String, quotesResponse: [ListQuotesUseCaseDTO.Output] ) -> Double {
        
        if currency == currencyReference {
            return 1.0
        }
        
        if let quotes = quotesResponse.first(where: { $0.currencyISO == currency } )?.quotes {
            return quotes
        }
            
        return 1.0
        
    }
    
    
    
}
