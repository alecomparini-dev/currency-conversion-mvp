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
        let input = CurrencySymbolInput(symbol: "د.إ", sizeFrame: 70, fontSize: .title2)
        let view = CurrencySymbolView(currencySymbolInput: input)
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
        btn.setImage(UIImage(systemName: "arrow.up.forward.app")?.applyingSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 40)), for: .normal)
        btn.tintColor = .white.withAlphaComponent(0.7)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    lazy var currencyValueTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.text = "1"
        tf.textAlignment = .center
        tf.font = UIFont.preferredFont(forTextStyle: .title1)
        tf.attributedPlaceholder = NSMutableAttributedString(string: "Input value", attributes: [.foregroundColor: UIColor.gray.withAlphaComponent(0.6) ])
        tf.layer.cornerRadius = 8
        tf.clipsToBounds = true
        tf.backgroundColor = .white
        tf.keyboardType = .decimalPad
        tf.textColor = UIColor.HEX("#08132b")
        return tf
    }()
    
    lazy var separatorView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.HEX("#12408d")
        return view
    }()
    
    lazy var invertCurrencyButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "arrow.up.arrow.down.circle.fill")?.applyingSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 40)), for: .normal)
        btn.tintColor = .white.withAlphaComponent(0.5)
        btn.backgroundColor = UIColor.HEX("#0d2959")
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    
//  MARK: - CURRENCY 2
    lazy var symbolCurrency2: CurrencySymbolView = {
        let input = CurrencySymbolInput(symbol: "R$", sizeFrame: 70, fontSize: .title2)
        let view = CurrencySymbolView(currencySymbolInput: input)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var codeLabel2: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "BRL"
        var font = UIFont.preferredFont(forTextStyle: .largeTitle)
        if let descriptor = font.fontDescriptor.withSymbolicTraits(.traitBold) {
            font = UIFont(descriptor: descriptor, size: 0)
        }
        lbl.font = font
        lbl.textAlignment = .natural
        lbl.textColor = .white
        return lbl
    }()
    
    lazy var descriptionLabel2: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Real"
        lbl.numberOfLines = 1
        lbl.font = UIFont.preferredFont(forTextStyle: .title3)
        lbl.textAlignment = .natural
        lbl.textColor = .white
        return lbl
    }()
    
    lazy var currencyButton2: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "arrow.up.forward.app")?.applyingSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 40)), for: .normal)
        btn.tintColor = .white.withAlphaComponent(0.7)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    
    lazy var resultConversionView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var underlineConversionView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.HEX("#ffffff")
        return view
    }()
    
    lazy var resultLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "29,469.54"
        lbl.numberOfLines = 2
        var font = UIFont.preferredFont(forTextStyle: .largeTitle)
        if let descriptor = font.fontDescriptor.withSymbolicTraits(.traitBold) {
            font = UIFont(descriptor: descriptor, size: 0)
        }
        lbl.font = font
        lbl.textAlignment = .center
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
        addCurrencyOneElements()
        self.addSubview(currencyValueTextField)
        self.addSubview(separatorView)
        self.addSubview(invertCurrencyButton)
        addCurrencyTwoElements()
        self.addSubview(resultConversionView)
        resultConversionView.addSubview(resultLabel)
        resultConversionView.addSubview(underlineConversionView)
    }
    
    private func addCurrencyOneElements() {
        self.addSubview(symbolCurrency1)
        self.addSubview(codeLabel1)
        self.addSubview(descriptionLabel1)
        self.addSubview(currencyButton1)
    }
    
    private func addCurrencyTwoElements() {
        self.addSubview(symbolCurrency2)
        self.addSubview(codeLabel2)
        self.addSubview(descriptionLabel2)
        self.addSubview(currencyButton2)
    }
    
    
    private func configConstraints() {
        configTitleLabelConstraints()
        configCurrencyOneConstraints()
        configCurrencyValueTextFieldConstraints()
        configSeparatorViewConstraints()
        configInvertCurrencyButtonConstraints()
        configCurrencyTwoConstraints()
        configResultConversionViewConstraints()
        configUnderlineConversionViewConstraints()
        configResultLabelConstraints()
    }
    
    private func configCurrencyOneConstraints() {
        configSymbolCurrency1Constraints()
        configCodeLabel1Constraints()
        configDescriptionLabel1Constraints()
        configCurrencyButton1Constraints()
    }
    
    private func configCurrencyTwoConstraints() {
        configSymbolCurrency2Constraints()
        configCodeLabel2Constraints()
        configDescriptionLabel2Constraints()
        configCurrencyButton2Constraints()
    }
    
    private func configTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -15),
        ])
    }

    private func configSymbolCurrency1Constraints() {
        NSLayoutConstraint.activate([
            symbolCurrency1.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 60),
            symbolCurrency1.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            symbolCurrency1.widthAnchor.constraint(equalToConstant: 70),
            symbolCurrency1.heightAnchor.constraint(equalToConstant: 70),
        ])
    }
    
    private func configCodeLabel1Constraints() {
        NSLayoutConstraint.activate([
            codeLabel1.topAnchor.constraint(equalTo: self.symbolCurrency1.topAnchor, constant: 3),
            codeLabel1.leadingAnchor.constraint(equalTo: self.symbolCurrency1.trailingAnchor, constant: 12),
        ])
    }

    private func configDescriptionLabel1Constraints() {
        NSLayoutConstraint.activate([
            descriptionLabel1.topAnchor.constraint(equalTo: self.codeLabel1.bottomAnchor),
            descriptionLabel1.leadingAnchor.constraint(equalTo: self.codeLabel1.leadingAnchor),
            descriptionLabel1.trailingAnchor.constraint(equalTo: currencyButton1.leadingAnchor, constant: -5)
        ])
    }

    private func configCurrencyButton1Constraints() {
        NSLayoutConstraint.activate([
            currencyButton1.centerYAnchor.constraint(equalTo: symbolCurrency1.centerYAnchor),
            currencyButton1.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            currencyButton1.widthAnchor.constraint(equalToConstant: 40),
            currencyButton1.heightAnchor.constraint(equalToConstant: 35),
        ])
    }

    private func configCurrencyValueTextFieldConstraints() {
        NSLayoutConstraint.activate([
            currencyValueTextField.topAnchor.constraint(equalTo: currencyButton1.bottomAnchor, constant: 50),
            currencyValueTextField.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.6),
            currencyValueTextField.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            currencyValueTextField.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
    
    private func configSeparatorViewConstraints() {
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: currencyValueTextField.bottomAnchor, constant: 85),
            separatorView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            separatorView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 2),
        ])
    }

    private func configInvertCurrencyButtonConstraints() {
        NSLayoutConstraint.activate([
            invertCurrencyButton.centerXAnchor.constraint(equalTo: separatorView.centerXAnchor),
            invertCurrencyButton.centerYAnchor.constraint(equalTo: separatorView.centerYAnchor),
            invertCurrencyButton.widthAnchor.constraint(equalToConstant: 50),
            invertCurrencyButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    
//  MARK: - CURRENCY 2
    private func configSymbolCurrency2Constraints() {
        NSLayoutConstraint.activate([
            symbolCurrency2.topAnchor.constraint(equalTo: currencyValueTextField.bottomAnchor, constant: 160),
            symbolCurrency2.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            symbolCurrency2.widthAnchor.constraint(equalToConstant: 70),
            symbolCurrency2.heightAnchor.constraint(equalToConstant: 70),
        ])
    }
    
    private func configCodeLabel2Constraints() {
        NSLayoutConstraint.activate([
            codeLabel2.topAnchor.constraint(equalTo: self.symbolCurrency2.topAnchor, constant: 3),
            codeLabel2.leadingAnchor.constraint(equalTo: self.symbolCurrency2.trailingAnchor, constant: 12),
        ])
    }

    private func configDescriptionLabel2Constraints() {
        NSLayoutConstraint.activate([
            descriptionLabel2.topAnchor.constraint(equalTo: self.codeLabel2.bottomAnchor),
            descriptionLabel2.leadingAnchor.constraint(equalTo: self.codeLabel2.leadingAnchor),
            descriptionLabel2.trailingAnchor.constraint(equalTo: currencyButton2.leadingAnchor, constant: -5)
        ])
    }

    private func configCurrencyButton2Constraints() {
        NSLayoutConstraint.activate([
            currencyButton2.centerYAnchor.constraint(equalTo: symbolCurrency2.centerYAnchor),
            currencyButton2.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            currencyButton2.widthAnchor.constraint(equalToConstant: 40),
            currencyButton2.heightAnchor.constraint(equalToConstant: 35),
        ])
    }
    
    private func configResultConversionViewConstraints() {
        NSLayoutConstraint.activate([
            resultConversionView.topAnchor.constraint(equalTo: descriptionLabel2.bottomAnchor),
            resultConversionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            resultConversionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            resultConversionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
    
    private func configResultLabelConstraints() {
        NSLayoutConstraint.activate([
            resultLabel.centerXAnchor.constraint(equalTo: resultConversionView.centerXAnchor),
            resultLabel.centerYAnchor.constraint(equalTo: resultConversionView.centerYAnchor, constant: -10),
            resultLabel.widthAnchor.constraint(lessThanOrEqualTo: resultConversionView.widthAnchor, multiplier: 0.7),
        ])
    }
    
    private func configUnderlineConversionViewConstraints() {
        NSLayoutConstraint.activate([
            underlineConversionView.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 8),
            underlineConversionView.leadingAnchor.constraint(equalTo: resultLabel.leadingAnchor, constant: -25),
            underlineConversionView.trailingAnchor.constraint(equalTo: resultLabel.trailingAnchor, constant: 25),
            underlineConversionView.heightAnchor.constraint(equalToConstant: 3),
        ])
    }
    

    
}
