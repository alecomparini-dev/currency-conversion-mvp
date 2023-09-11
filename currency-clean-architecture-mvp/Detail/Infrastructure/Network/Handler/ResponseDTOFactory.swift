//
//  ResponseDTOFactory.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 30/08/23.
//

import Foundation


public struct ResponseDTOFactory {

    static func makeResponseDTO(data: Data, _ response: HTTPURLResponse?, _ startTime: Date) -> ResponseDTO {
        let endTime = Date()
        let responseTimeInMilliseconds = endTime.timeIntervalSince(startTime) * 1000
        let headersDictionary: [String:String] = getResponseAllHeaderFields(response)
        return ResponseDTO(data: data,
                           statusCode: response?.statusCode ?? 500,
                           headers: headersDictionary,
                           responseTimeInMilliseconds: responseTimeInMilliseconds)
    }

    static private func getResponseAllHeaderFields(_ response: HTTPURLResponse?) -> [String: String]{
        guard let httpResponse = response else {return [:]}
        let headers = httpResponse.allHeaderFields
        var headersDictionary: [String: String] = [:]
        for (key, value) in headers {
            if let keyString = key as? String, let valueString = value as? String {
                headersDictionary[keyString] = valueString
            }
        }
        return headersDictionary
    }
    
}



     
