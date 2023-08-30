//
//  HTTPPost.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 19/08/23.
//

import Foundation

protocol HTTPGetClient {
    var startTime: Date {get}
    func get(url: URL, parameters: Dictionary<String, String>) async throws -> ResponseDTO}

