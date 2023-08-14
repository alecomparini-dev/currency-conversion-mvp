//
//  CurrencyConversionView.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 14/08/23.
//

import UIKit

class CurrencyConversionView: UIView {
    
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//  MARK: - LAZY AREA
    
    
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        configBackgroundColor()
        addElements()
        configConstraints()
    }
    
    private func configBackgroundColor() {
//        self.backgroundColor = "#0d2959"
        self.backgroundColor = .systemBlue
    }
    
    private func addElements() {
        
    }
    
    private func configConstraints() {
        
    }
    
    
    
}
