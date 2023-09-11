//
//  InsertRepository.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 11/09/23.
//

import Foundation

protocol InsertRepository: AnyObject {
    
    @discardableResult
    func insert<T>(_ entity: T) async throws -> T
}
