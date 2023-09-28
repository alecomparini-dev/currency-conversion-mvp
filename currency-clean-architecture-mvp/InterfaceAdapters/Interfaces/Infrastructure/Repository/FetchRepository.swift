//
//  FetchRepository.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 11/09/23.
//

import Foundation

protocol FetchRepository: AnyObject {
    
    @discardableResult
    func fetch<T>() async throws -> [T]
}
