//
//  HTTPPost.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 19/08/23.
//

import Foundation

protocol HTTPPost {
    func post(url: URL, parameters: Dictionary<String, String>) async throws -> Data
}
