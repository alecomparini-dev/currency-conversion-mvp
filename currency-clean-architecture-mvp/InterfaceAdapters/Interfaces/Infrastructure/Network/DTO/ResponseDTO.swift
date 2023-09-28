//  Created by Alessandro Comparini on 29/08/23.
//

import Foundation

struct ResponseDTO {
    let data: Data?
    let statusCode: Int
    let headers: Dictionary<String, String>?
    let responseTimeInMilliseconds: TimeInterval
    
    init(data: Data? = nil, statusCode: Int, headers: Dictionary<String, String>? = nil, responseTimeInMilliseconds: TimeInterval) {
        self.data = data
        self.statusCode = statusCode
        self.headers = headers
        self.responseTimeInMilliseconds = responseTimeInMilliseconds
    }
}
