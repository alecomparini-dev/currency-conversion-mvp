//
//  ReachabilityInternetAvailable.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 11/09/23.
//

import Foundation
import Reachability


public class ReachabilityInternetAvailable: InternetAvailable  {
    
    private let reachability: Reachability?
    
    public init(reachability: Reachability) {
        self.reachability = try? Reachability()
    }
    
    deinit {
        reachability?.stopNotifier()
    }
    
    public func isInternetAvailable() -> Bool {
        guard let reachability else { return false }
        
        if reachability.connection == .unavailable {
            return false
        }
        return true
    }
    
}
