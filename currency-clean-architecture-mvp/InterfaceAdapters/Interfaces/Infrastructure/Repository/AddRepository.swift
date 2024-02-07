//
//  AddRepository.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 28/08/23.
//

import Foundation

protocol AddRepository {
    @discardableResult
    func add<T>(item: T) async throws -> T?
}
