//
//  AlamofireAdapter.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 19/08/23.
//

import Foundation
import Alamofire

class Alamofire {

    private let session: Session
    
    init(session: Session = .default) {
        self.session = session
    }
            
}


//  MARK: - EXTENSION - HTTPGetClient
extension Alamofire: HTTPGetClient {
    
    func get(url: URL, parameters: Dictionary<String,String>) async throws -> Data {
        return try await withCheckedThrowingContinuation { continuation in
            session
                .request(url, method: .get, parameters: parameters)
                .responseData { response in
                    switch(response.result) {
                        case .success(let data):
                            continuation.resume(returning: data)
                        
                        case .failure (let error):
                            continuation.resume(throwing: error )
                    }
                }
        }
        
    }

    
}
