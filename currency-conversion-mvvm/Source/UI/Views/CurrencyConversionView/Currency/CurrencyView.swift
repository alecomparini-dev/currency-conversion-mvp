//
//  CurrencyView.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 15/08/23.
//

import UIKit

class CurrencyView: UIView {
    private let input: CurrencyViewInput
    
    init(currencyViewInput: CurrencyViewInput) {
        self.input = currencyViewInput
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
//  MARK: - LAZY AREA
    lazy var symbolCurrency: CurrencySymbolView = {
        let view = CurrencySymbolView(currencySymbolInput: input.currentySymbolViewInput)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleCurrencyLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = input.titleCurrency
        var font = UIFont.preferredFont(forTextStyle: .largeTitle)
        if let descriptor = font.fontDescriptor.withSymbolicTraits(.traitBold) {
            font = UIFont(descriptor: descriptor, size: 0)
        }
        lbl.font = font
        lbl.textAlignment = .natural
        lbl.textColor = .white
        return lbl
    }()
    
    lazy var subTitleCurrencyLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = input.subTitleCurrency
        lbl.numberOfLines = 1
        lbl.font = UIFont.preferredFont(forTextStyle: .title3)
        lbl.textAlignment = .natural
        lbl.textColor = .white
        return lbl
    }()
    
    lazy var changeCurrencyButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: input.imageButton)?.applyingSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: input.sizeButton.width)), for: .normal)
        btn.tintColor = .white.withAlphaComponent(0.7)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
        
    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configConstraints()
    }
    
    private func addElements() {
        self.addSubview(symbolCurrency)
        self.addSubview(titleCurrencyLabel)
        self.addSubview(subTitleCurrencyLabel)
        self.addSubview(changeCurrencyButton)
    }
    
    private func configConstraints() {
        configSymbolCurrencyConstraints()
        configCodeCurrencyLabelConstraints()
        configDescriptionCurrencyOfLabelConstraints()
        configChangeCurrencyOfButtonConstraints()
    }
    
    private func configSymbolCurrencyConstraints() {
        NSLayoutConstraint.activate([
            symbolCurrency.topAnchor.constraint(equalTo: self.topAnchor),
            symbolCurrency.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            symbolCurrency.widthAnchor.constraint(equalToConstant: input.currentySymbolViewInput.sizeFrame),
            symbolCurrency.heightAnchor.constraint(equalToConstant: input.currentySymbolViewInput.sizeFrame),
        ])
    }
    
    private func configCodeCurrencyLabelConstraints() {
        NSLayoutConstraint.activate([
            titleCurrencyLabel.topAnchor.constraint(equalTo: self.symbolCurrency.topAnchor, constant: 3),
            titleCurrencyLabel.leadingAnchor.constraint(equalTo: self.symbolCurrency.trailingAnchor, constant: 12),
        ])
    }
    
    private func configDescriptionCurrencyOfLabelConstraints() {
        NSLayoutConstraint.activate([
            subTitleCurrencyLabel.topAnchor.constraint(equalTo: self.titleCurrencyLabel.bottomAnchor),
            subTitleCurrencyLabel.leadingAnchor.constraint(equalTo: self.titleCurrencyLabel.leadingAnchor),
            subTitleCurrencyLabel.trailingAnchor.constraint(equalTo: changeCurrencyButton.leadingAnchor, constant: -5)
        ])
    }
    
    private func configChangeCurrencyOfButtonConstraints() {
        NSLayoutConstraint.activate([
            changeCurrencyButton.centerYAnchor.constraint(equalTo: symbolCurrency.centerYAnchor),
            changeCurrencyButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            changeCurrencyButton.widthAnchor.constraint(equalToConstant: input.sizeButton.width),
            changeCurrencyButton.heightAnchor.constraint(equalToConstant: input.sizeButton.height),
        ])
    }
}
