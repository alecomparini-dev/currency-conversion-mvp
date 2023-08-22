//
//  UIViewController+Extension.swift
//  UI
//
//  Created by Alessandro Comparini on 09/08/23.
//

import UIKit
import SwiftUI

//  MARK: - PREVIEW CONTROLLER SWIFTUI
public extension UIViewController {
    
    private struct SwiftUIViewControllerWrapper: UIViewControllerRepresentable {
        let viewController: UIViewController
        
        func makeUIViewController(context: Self.Context) -> UIViewController {
            viewController
        }
        
        func updateUIViewController(
            _ uiViewController: UIViewController,
            context: Self.Context
        ) {}
    }
    
    var asSwiftUIViewController: some View {
        SwiftUIViewControllerWrapper(viewController: self)
    }
    
}


public extension UIView {
    private struct SwiftUIViewWrapper: UIViewRepresentable {
        typealias UIViewType = UIView
        let view: UIView
        
        func makeUIView(context: Context) -> UIView {
            view
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {
            
        }
    }
    
    var asSwiftUIView: some View {
        SwiftUIViewWrapper(view: self)
    }
}



//  MARK: - HIDE KEYBOARD
public extension UIViewController {
    func hideKeyboardOnTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    @objc private func hideKeyboard() {
        self.view.endEditing(true)
    }
}
