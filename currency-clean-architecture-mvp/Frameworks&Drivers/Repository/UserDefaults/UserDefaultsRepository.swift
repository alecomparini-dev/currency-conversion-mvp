//
//  UserDefaultsRepository.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 28/08/23.
//

import Foundation


class UserDefaultsRepository<T>: AddRepository  {
//    po NSHomeDirectory()
    private let userDefaults: UserDefaults
    private let mainKey: String
    
    init(mainKey: String, userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
        self.mainKey = mainKey
    }
    
    @discardableResult
    func add<T>(item: T) async throws -> T? {
        userDefaults.set(item, forKey: mainKey)
        return item
    }
  
}


//  MARK: - EXTENSION
extension UserDefaultsRepository: GetAllRepository {
    
    func get<T>() async throws -> T? {
        return userDefaults.value(forKey: mainKey) as? T
    }
    
}
