//
//  URLSession.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 19/08/23.
//

import Foundation


class URLSessionNetwork {
    
    private let session: URLSession
    let startTime = Date()
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
}


//  MARK: - EXTENSION - HTTPGetClient
extension URLSessionNetwork: HTTPGetClient {
    
    func get(url: URL, parameters: Dictionary<String,String>) async throws -> ResponseDTO {
        
        // TODO: - Extract the code to its own file
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        components.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }

        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")

        var request = URLRequest(url: components.url!)
        request.method = .get

        let (data, response) = try await session.data(for: request)
                
        return ResponseDTOFactory.makeResponseDTO(data: data, response as? HTTPURLResponse, startTime)
        
    }
    
    
}
