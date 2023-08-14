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
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Currency Conversion"
        lbl.font = UIFont.preferredFont(forTextStyle: .title1)
        lbl.textAlignment = .center
        lbl.textColor = .white
        return lbl
    }()
    
    lazy var symbolCurrency: CurrencySymbolView = {
        let input = InputCurrencySymbol(symbol: "¥", sizeFrame: 70, fontSize: .title1)
        let lbl = CurrencySymbolView(inputCurrencySymbol: input)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var codeLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "JPY"
        lbl.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        lbl.textAlignment = .natural
        lbl.textColor = .white
        return lbl
    }()
    
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        configBackgroundColor()
        addElements()
        configConstraints()
    }
    
    private func configBackgroundColor() {
        self.backgroundColor = UIColor.HEX("#0d2959")
    }
    
    private func addElements() {
        self.addSubview(titleLabel)
        self.addSubview(symbolCurrency)
        self.addSubview(codeLabel)
    }
    
    private func configConstraints() {
        configTitleLabelConstraints()
        configSymbolCurrencyConstraints()
        configCodeLabelConstraints()
    }
    
    private func configTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -15),
        ])
    }

    private func configSymbolCurrencyConstraints() {
        NSLayoutConstraint.activate([
            symbolCurrency.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            symbolCurrency.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 25),
        ])
    }
    
    private func configCodeLabelConstraints() {
        NSLayoutConstraint.activate([
            codeLabel.topAnchor.constraint(equalTo: self.symbolCurrency.topAnchor, constant: 10),
            codeLabel.leadingAnchor.constraint(equalTo: self.symbolCurrency.trailingAnchor, constant: 15),
        ])
    }

    
    
}
