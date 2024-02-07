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
    let startTime = Date()
    
    init(session: Session = .default) {
        self.session = session
    }
    
}


//  MARK: - EXTENSION - HTTPGetClient
extension AlamofireNetwork: HTTPGetClient {
    
    func get(url: URL, parameters: Dictionary<String,String>) async throws -> ResponseDTO {
        return try await withCheckedThrowingContinuation { continuation in
            session
                .request(url, method: .get, parameters: parameters)
                .responseData { [weak self] response in
                    guard let self else {return}
                    switch(response.result) {
                        case .success(let data):
                            continuation.resume(returning: ResponseDTOFactory.makeResponseDTO(data: data, response.response, startTime))
                        case .failure (let error):
                            continuation.resume(throwing: error )
                    }
                }
        }
        
    }

    
    
}
