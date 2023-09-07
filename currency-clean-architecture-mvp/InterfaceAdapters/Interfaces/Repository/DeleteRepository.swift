//
//  DeleteRepository.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 28/08/23.
//

import Foundation

protocol DeleteRepository: AnyObject {
    associatedtype D
    func delete(_ id: D) async throws -> D?
}
