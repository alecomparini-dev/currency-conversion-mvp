//
//  GetAllRepository.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 28/08/23.
//

import Foundation

protocol GetAllRepository: AnyObject {
    
    func get<T>() async throws -> T?
    
}


