//
//  HTTPPostClient.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 19/08/23.
//

import Foundation

protocol HTTPPostClient {
    func post() async throws -> Result<Data?, HTTPError>
}

