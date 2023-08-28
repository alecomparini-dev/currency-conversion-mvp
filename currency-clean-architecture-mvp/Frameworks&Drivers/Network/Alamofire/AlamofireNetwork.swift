//
//  AlamofireNetwork.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 19/08/23.
//

import Foundation
import Alamofire

class AlamofireNetwork {

    private let session: Session
    
    init(session: Session = .default) {
        self.session = session
    }
            
}


//  MARK: - EXTENSION - HTTPGetClient
extension AlamofireNetwork: HTTPGetClient {
    
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
