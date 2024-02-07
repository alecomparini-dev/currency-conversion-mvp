//  Created by Alessandro Comparini on 28/08/23.
//  po NSHomeDirectory()
//

import Foundation


final class UserDefaultsProviderRepository  {
    
    private let userDefaults: UserDefaults
    private let mainKey: String
    
    init(mainKey: String, userDefaults: UserDefaults = .standard) throws {
        self.userDefaults = userDefaults
        self.mainKey = mainKey
    }
    
}


//  MARK: - EXTENSION - InsertRepository
extension UserDefaultsProviderRepository: InsertRepository {
    
    func insert<T>(_ entity: T) async throws -> T {
        userDefaults.set(entity, forKey: mainKey)
        return entity
    }
}


//  MARK: - EXTENSION - FetchRepository
extension UserDefaultsProviderRepository: FetchRepository {
    
    func fetch<T>() async throws -> [T] {
        if let result = userDefaults.value(forKey: mainKey) as? [T] {
            return result
        }
        return []
    }
    
}



