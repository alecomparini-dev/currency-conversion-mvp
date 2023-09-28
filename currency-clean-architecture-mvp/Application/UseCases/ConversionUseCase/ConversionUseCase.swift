//  Created by Alessandro Comparini on 08/09/23.
//

import Foundation


protocol ConversionUseCase: AnyObject {
    func conversion(input: ConversionUseCaseDTO.Input) async throws -> ConversionUseCaseDTO.Output
}
