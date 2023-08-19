//
//  AlamofireAdapter.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 19/08/23.
//

import Foundation
import Alamofire

class AlamofireAdapter: HTTPGetClient {
    private let session: Session
    
    init(session: Session = .default) {
        self.session = session
    }
    
    func get() async throws -> Data {
        let url = URL(string: Environment.variable(.apiBaseUrl) + "/live" )! 
        
        return try await withCheckedThrowingContinuation { continuation in
            session.request(url,
                            method: .get,
                            parameters: ["access_key": Environment.variable(.accessKey)]
            )
            .responseData { response in
                switch(response.result) {
                    case .success(let data):
                        continuation.resume(returning: data)
                    
                    case .failure:
                        continuation.resume(throwing: HTTPError.noConnectivity)
                }
            }
            
            
        }
        
    }
    
}
