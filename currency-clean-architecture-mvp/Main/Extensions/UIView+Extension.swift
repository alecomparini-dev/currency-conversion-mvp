//
//  UIView+Extension.swift
//  UI
//
//  Created by Alessandro Comparini on 09/08/23.
//

import UIKit
import SwiftUI


//  MARK: - PREVIEW UIVIEW ON SWIFTUI

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

