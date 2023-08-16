//
//  SearchCurrenciesView.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 15/08/23.
//

import UIKit

class SearchCurrenciesView: UIView {
    
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        configBackgroundColor()
        addElements()
        configConstraints()
    }
    
    
    private func configBackgroundColor() {
        backgroundColor = .red
    }
    
    private func addElements() {
        
    }
    
    private func configConstraints() {
        
    }
    
    
}
