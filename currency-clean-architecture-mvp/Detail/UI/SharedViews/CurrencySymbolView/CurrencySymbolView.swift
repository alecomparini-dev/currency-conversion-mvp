//
//  CurrencySymbolView.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 14/08/23.
//

import UIKit

class CurrencySymbolView: UIView {
    
    private let currencySymbolDTO: CurrencySymbolViewDTO?
    
    init(currencySymbolDTO: CurrencySymbolViewDTO?) {
        self.currencySymbolDTO = currencySymbolDTO
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//  MARK: - LAZY AREA
    lazy var symbolView: UIView = {
        let v = UIView(frame: CGRect(origin: CGPointZero, size: CGSize(width: currencySymbolDTO?.sizeFrame ?? .zero, height: currencySymbolDTO?.sizeFrame ?? .zero)))
        v.backgroundColor = currencySymbolDTO?.backgroundColor ?? .white
        v.layer.cornerRadius = (currencySymbolDTO?.sizeFrame ?? .zero)/2  
        v.clipsToBounds = true
        return v
    }()
    
    lazy var symbolLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = currencySymbolDTO?.symbol ?? K.Strings.empty
        lbl.textColor = .white
        var font = UIFont.preferredFont(forTextStyle: currencySymbolDTO?.fontSize ?? .body)
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
