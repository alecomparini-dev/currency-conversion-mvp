//
//  HTTPPost.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 19/08/23.
//

import Foundation

protocol HTTPPost {
    func post() async throws -> Result<Data?, HTTPError>
}

