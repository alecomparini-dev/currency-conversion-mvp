//
//  NavigationController.swift
//  UI
//
//  Created by Alessandro Comparini on 11/08/23.
//

import UIKit

public final class NavigationController: UINavigationController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    public convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func pushViewController(_ viewController: UIViewController) {
        
        pushViewController(viewController, animated: true)
    }
    
    
    
//  MARK: - PRIVATE AREA
    private func setup() {
        navigationBar.barStyle = .black
        navigationBar.isHidden = true
    }
    
}

