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
    
    lazy var symbolCurrency1: CurrencySymbolView = {
        let input = InputCurrencySymbol(symbol: "د.إ", sizeFrame: 70, fontSize: .title2)
        let view = CurrencySymbolView(inputCurrencySymbol: input)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var codeLabel1: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "AED"
        var font = UIFont.preferredFont(forTextStyle: .largeTitle)
        if let descriptor = font.fontDescriptor.withSymbolicTraits(.traitBold) {
            font = UIFont(descriptor: descriptor, size: 0)
        }
        lbl.font = font
        lbl.textAlignment = .natural
        lbl.textColor = .white
        return lbl
    }()
    
    lazy var descriptionLabel1: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Dirham dos Emirados Árabes Unidos"
        lbl.numberOfLines = 1
        lbl.font = UIFont.preferredFont(forTextStyle: .title3)
        lbl.textAlignment = .natural
        lbl.textColor = .white
        return lbl
    }()
    
    lazy var currencyButton1: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "arrow.up.forward.app.fill")?.applyingSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 50)), for: .normal)
        btn.tintColor = .white
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    
    lazy var currencyValueTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.text = "1.00"
        tf.textAlignment = .center
        tf.font = UIFont.preferredFont(forTextStyle: .title1)
        tf.attributedPlaceholder = NSMutableAttributedString(string: "Input value", attributes: [.foregroundColor: UIColor.gray ])
        tf.layer.cornerRadius = 8
        tf.clipsToBounds = true
        tf.backgroundColor = .white
        tf.keyboardType = .decimalPad
        tf.textColor = UIColor.HEX("#08132b")
        return tf
    }()
    
    
//  MARK: - CURRENCY 2
    

    
    
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
        self.addSubview(symbolCurrency1)
        self.addSubview(codeLabel1)
        self.addSubview(descriptionLabel1)
        self.addSubview(currencyButton1)
        self.addSubview(currencyValueTextField)
    }
    
    private func configConstraints() {
        configTitleLabelConstraints()
        configSymbolCurrencyConstraints()
        configCodeLabelConstraints()
        configDescriptionLabelConstraints()
        configCurrencyOneButtonConstraints()
        configCurrencyValueTextFieldConstraints()
    }
    
    private func configTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -15),
        ])
    }

    private func configSymbolCurrencyConstraints() {
        NSLayoutConstraint.activate([
            symbolCurrency1.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            symbolCurrency1.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            symbolCurrency1.widthAnchor.constraint(equalToConstant: 70),
            symbolCurrency1.heightAnchor.constraint(equalToConstant: 70),
        ])
    }
    
    private func configCodeLabelConstraints() {
        NSLayoutConstraint.activate([
            codeLabel1.topAnchor.constraint(equalTo: self.symbolCurrency1.topAnchor, constant: 3),
            codeLabel1.leadingAnchor.constraint(equalTo: self.symbolCurrency1.trailingAnchor, constant: 12),
        ])
    }

    private func configDescriptionLabelConstraints() {
        NSLayoutConstraint.activate([
            descriptionLabel1.topAnchor.constraint(equalTo: self.codeLabel1.bottomAnchor),
            descriptionLabel1.leadingAnchor.constraint(equalTo: self.codeLabel1.leadingAnchor),
            descriptionLabel1.trailingAnchor.constraint(equalTo: currencyButton1.leadingAnchor, constant: -5)
        ])
    }

    private func configCurrencyOneButtonConstraints() {
        NSLayoutConstraint.activate([
            currencyButton1.centerYAnchor.constraint(equalTo: symbolCurrency1.centerYAnchor),
            currencyButton1.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            currencyButton1.widthAnchor.constraint(equalToConstant: 50),
            currencyButton1.heightAnchor.constraint(equalToConstant: 45),
        ])
    }

    private func configCurrencyValueTextFieldConstraints() {
        NSLayoutConstraint.activate([
            currencyValueTextField.topAnchor.constraint(equalTo: currencyButton1.bottomAnchor, constant: 50),
            currencyValueTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 45),
            currencyValueTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -45),
            currencyValueTextField.heightAnchor.constraint(equalToConstant: 55),
        ])
    }
    
}
