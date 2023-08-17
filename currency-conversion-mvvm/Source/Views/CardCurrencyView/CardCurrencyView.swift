//
//  CardCurrencyView.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 17/08/23.
//

import UIKit


class CardCurrencyView: UIView {
    private let input: CardCurrencyInput
    
    init(cardCurrencyInput: CardCurrencyInput = CardCurrencyInput(currentySymbolViewInput: CurrencySymbolViewInput(symbol: "R$", sizeFrame: 70), titleCurrency: "BRL", subTitleCurrency: "Real")) {
        self.input = cardCurrencyInput
        super.init(frame: .null)
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
    
    lazy var currencyView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerCurve = .circular
        view.layer.cornerRadius = 12
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 6
        view.layer.shadowOffset = CGSize(width: 3, height: 5)
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
        lbl.textColor = .black
        return lbl
    }()
    
    lazy var subTitleCurrencyLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = input.subTitleCurrency
        lbl.numberOfLines = 1
        lbl.font = UIFont.preferredFont(forTextStyle: .title3)
        lbl.textAlignment = .natural
        lbl.textColor = .black
        return lbl
    }()
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        addElements()
        configConstraints()
    }
    
    private func addElements() {
        addSubview(currencyView)
        addSubview(symbolCurrency)
        currencyView.addSubview(titleCurrencyLabel)
        currencyView.addSubview(subTitleCurrencyLabel)
    }
    
    private func configConstraints() {
        configCurrencyViewConstraints()
        configSymbolCurrencyConstraints()
        configCodeCurrencyLabelConstraints()
        configDescriptionCurrencyOfLabelConstraints()
    }
    
    private func configCurrencyViewConstraints() {
        NSLayoutConstraint.activate([
            currencyView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            currencyView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            currencyView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            currencyView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func configSymbolCurrencyConstraints() {
        NSLayoutConstraint.activate([
            symbolCurrency.centerYAnchor.constraint(equalTo: currencyView.centerYAnchor),
            symbolCurrency.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            symbolCurrency.widthAnchor.constraint(equalToConstant: input.currentySymbolViewInput.sizeFrame),
            symbolCurrency.heightAnchor.constraint(equalToConstant: input.currentySymbolViewInput.sizeFrame),
        ])
    }
    
    private func configCodeCurrencyLabelConstraints() {
        NSLayoutConstraint.activate([
            titleCurrencyLabel.centerYAnchor.constraint(equalTo: currencyView.centerYAnchor, constant: -15),
            titleCurrencyLabel.leadingAnchor.constraint(equalTo: self.symbolCurrency.trailingAnchor, constant: 10),
        ])
    }
    
    private func configDescriptionCurrencyOfLabelConstraints() {
        NSLayoutConstraint.activate([
            subTitleCurrencyLabel.topAnchor.constraint(equalTo: self.titleCurrencyLabel.bottomAnchor),
            subTitleCurrencyLabel.leadingAnchor.constraint(equalTo: self.titleCurrencyLabel.leadingAnchor, constant: 3 ),
            subTitleCurrencyLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10 )
        ])
    }
    
}
