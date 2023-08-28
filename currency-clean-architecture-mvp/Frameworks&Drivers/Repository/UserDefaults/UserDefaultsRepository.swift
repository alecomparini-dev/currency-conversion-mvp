//
//  UserDefaultsRepository.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 28/08/23.
//

import Foundation


class UserDefaultsRepository<T>: AddRepository  {
    
    private let userDefaults: UserDefaults
    private let mainKey: String
    
    init(mainKey: String, userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
        self.mainKey = mainKey
    }
    
    func add<T>(item: T) async throws -> T? {
        userDefaults.set(item, forKey: mainKey)
        return item
    }
  
}


//  MARK: - EXTENSION - DeleteRepository
extension UserDefaultsRepository: DeleteRepository{
    
    func delete(_ id: DeleteItemDTO) async throws -> DeleteItemDTO? {
        userDefaults.removeObject(forKey: mainKey)
        return nil
    }
    
}

