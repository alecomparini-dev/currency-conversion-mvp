//
//  AddRepository.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 28/08/23.
//

import Foundation

protocol AddRepository: AnyObject {
    associatedtype T
    
    func add(_ item: T) async throws -> T?
    
}
