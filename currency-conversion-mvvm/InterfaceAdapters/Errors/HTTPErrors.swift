//
//  HTTPErrors.swift
//  Data
//
//  Created by Alessandro Comparini on 07/08/23.
//

import Foundation

public enum HTTPError: Error {
    case noConnectivity
    case badRequest
    case serverError
    case unauthorized
    case forbidden
}
