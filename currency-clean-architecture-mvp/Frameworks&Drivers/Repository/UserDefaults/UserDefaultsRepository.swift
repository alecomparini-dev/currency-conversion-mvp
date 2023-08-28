//
//  UserDefaultsRepository.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 28/08/23.
//

import Foundation


class UserDefaultsRepository: AddRepository  {
    
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    func add(_ item: AddItemDTO) async throws -> AddItemDTO? {
        userDefaults.set(item.values, forKey: item.key)
        return item
    }
  
}


//  MARK: - EXTENSION - DeleteRepository
extension UserDefaultsRepository: DeleteRepository{
    
    func delete(_ id: DeleteItemDTO) async throws -> DeleteItemDTO? {
        userDefaults.removeObject(forKey: id.key)
        return nil
    }
    
}

