//
//  CurrencySymbolView.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 14/08/23.
//

import UIKit

class CurrencySymbolView: UIView {
    
    private let input: CurrencySymbolInput
    
    init(currencySymbolInput: CurrencySymbolInput) {
        self.input = currencySymbolInput
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//  MARK: - LAZY AREA
    lazy var symbolView: UIView = {
        let v = UIView(frame: CGRect(origin: CGPointZero, size: CGSize(width: input.sizeFrame, height: input.sizeFrame)))
        v.backgroundColor = input.backgroundColor
        v.layer.cornerRadius = input.sizeFrame/2
        v.clipsToBounds = true
        return v
    }()
    
    lazy var symbolLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = input.symbol
        lbl.textColor = .white
        var font = UIFont.preferredFont(forTextStyle: input.fontSize)
        if let descriptor = font.fontDescriptor.withSymbolicTraits(.traitBold) {
            font = UIFont(descriptor: descriptor, size: 0)
        }
        lbl.font = font
        return lbl
    }()
    
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configConstraints()
    }
    
    private func addElements() {
        self.addSubview(symbolView)
        symbolView.addSubview(symbolLabel)
    }
    
    private func configConstraints() {
        configSymbolLabelConstraints()
    }
    
    private func configSymbolLabelConstraints() {
        NSLayoutConstraint.activate([
            symbolLabel.centerXAnchor.constraint(equalTo: symbolView.centerXAnchor),
            symbolLabel.centerYAnchor.constraint(equalTo: symbolView.centerYAnchor),
        ])
    }
    
    
    
}
