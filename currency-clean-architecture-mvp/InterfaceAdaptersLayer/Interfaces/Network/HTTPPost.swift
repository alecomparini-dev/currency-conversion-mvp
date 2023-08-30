//
//  HTTPPost.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 19/08/23.
//

import Foundation

protocol HTTPPost {
    var startTime: Date { get }
    func post(url: URL, parameters: Dictionary<String, String>) async throws -> Data
}

