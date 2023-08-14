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
        let view = CurrencySymbolView(inputCurrencySymbol: input)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var codeLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "JPY"
        var font = UIFont.preferredFont(forTextStyle: .largeTitle)
        if let descriptor = font.fontDescriptor.withSymbolicTraits(.traitBold) {
            font = UIFont(descriptor: descriptor, size: 0)
        }
        lbl.font = font
        lbl.textAlignment = .natural
        lbl.textColor = .white
        return lbl
    }()
    
    lazy var descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Yen"
        lbl.font = UIFont.preferredFont(forTextStyle: .title3)
        lbl.textAlignment = .natural
        lbl.textColor = .white
        return lbl
    }()
    
    lazy var currencyOneButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "arrow.up.forward.app.fill")?.applyingSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 60)), for: .normal)
        btn.tintColor = .white
        btn.setTitleColor(.white, for: .normal)
        btn.layer.borderWidth = 0
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.cornerRadius = 8
        return btn
    }()
    
    
//    private func
    
    
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
        self.addSubview(descriptionLabel)
        self.addSubview(currencyOneButton)
    }
    
    private func configConstraints() {
        configTitleLabelConstraints()
        configSymbolCurrencyConstraints()
        configCodeLabelConstraints()
        configDescriptionLabelConstraints()
        configCurrencyOneButtonConstraints()
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
            symbolCurrency.widthAnchor.constraint(equalToConstant: 70),
            symbolCurrency.heightAnchor.constraint(equalToConstant: 70),
        ])
    }
    
    private func configCodeLabelConstraints() {
        NSLayoutConstraint.activate([
            codeLabel.topAnchor.constraint(equalTo: self.symbolCurrency.topAnchor, constant: 3),
            codeLabel.leadingAnchor.constraint(equalTo: self.symbolCurrency.trailingAnchor, constant: 12),
        ])
    }

    private func configDescriptionLabelConstraints() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: self.codeLabel.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.codeLabel.leadingAnchor),
        ])
    }

    private func configCurrencyOneButtonConstraints() {
        NSLayoutConstraint.activate([
            currencyOneButton.centerYAnchor.constraint(equalTo: symbolCurrency.centerYAnchor),
            currencyOneButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            currencyOneButton.widthAnchor.constraint(equalToConstant: 70),
            currencyOneButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
}
