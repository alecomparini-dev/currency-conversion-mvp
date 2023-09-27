//  Created by Alessandro Comparini on 08/09/23.
//

import Foundation

class ConversionUseCaseImpl: ConversionUseCase {
    
    private let conversionEntity: ConversionEntity
    
    init(conversionEntity: ConversionEntity) {
        self.conversionEntity = conversionEntity
    }
    
    func conversion(input: ConversionUseCaseDTO.Input) -> ConversionUseCaseDTO.Output {
        
        
        
        
        let quoteCurrencyOf: Double = 1
        let quoteCurrencyTo: Double = 4.9843
        let value: Double = input.value
        
        let result = conversionEntity.conversion(value: value, quoteCurrencyOf: quoteCurrencyOf, quoteCurrencyTo: quoteCurrencyTo)
        
        return ConversionUseCaseDTO.Output(conversionResult: result)
    }
    
    
    
    
}
