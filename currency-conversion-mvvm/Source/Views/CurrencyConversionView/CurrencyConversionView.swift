//
//  CurrencyConversionView.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 14/08/23.
//

import UIKit

protocol CurrencyConversionViewDelegate: AnyObject {
    func currencyOfButtonTapped()
    func currencyToButtonTapped()
}

class CurrencyConversionView: UIView {
    
    weak var delegate: CurrencyConversionViewDelegate?
    
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//  MARK: - LAZY AREA
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Currency Conversion"
        lbl.font = UIFont.preferredFont(forTextStyle: .title1)
        lbl.textAlignment = .center
        lbl.textColor = .white
        return lbl
    }()
    
    lazy var currencyOf: CurrencyView = {
        let symbolInput = CurrencySymbolViewInput(symbol: "R$", sizeFrame: 70, fontSize: .title2)
        let currencyViewInput = CurrencyViewInput(currentySymbolViewInput: symbolInput,
                                                  titleCurrency: "BRL",
                                                  subTitleCurrency: "Real",
                                                  imageButton: "arrow.up.forward.app",
                                                  sizeButton: CGSize(width: 40, height: 35))
        let view = CurrencyView(currencyViewInput: currencyViewInput)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.changeCurrencyButton.addTarget(self, action: #selector(currencyOfButtonTapped), for: .touchUpInside)
        return view
    }()
    @objc private func currencyOfButtonTapped() {
        delegate?.currencyOfButtonTapped()
    }
    
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
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "arrow.up.arrow.down.circle.fill")?.applyingSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 40)), for: .normal)
        btn.tintColor = .white.withAlphaComponent(0.5)
        btn.backgroundColor = UIColor.HEX("#0d2959")
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    lazy var currencyTo: CurrencyView = {
        let symbolInput = CurrencySymbolViewInput(symbol: "$", sizeFrame: 70, fontSize: .title2)
        let currencyViewInput = CurrencyViewInput(currentySymbolViewInput: symbolInput,
                                                  titleCurrency: "USD",
                                                  subTitleCurrency: "Dólar Norte Americano",
                                                  imageButton: "arrow.up.forward.app",
                                                  sizeButton: CGSize(width: 40, height: 35))
        let view = CurrencyView(currencyViewInput: currencyViewInput)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.changeCurrencyButton.addTarget(self, action: #selector(currencyToButtonTapped), for: .touchUpInside)
        return view
    }()
    @objc private func currencyToButtonTapped() {
        delegate?.currencyToButtonTapped()
    }
    
    lazy var resultConversionView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var resultLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "4.54"
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
    
    lazy var underlineConversionView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.HEX("#ffffff")
        return view
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
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(currencyOf)
        contentView.addSubview(currencyValueTextField)
        contentView.addSubview(separatorView)
        contentView.addSubview(invertCurrencyButton)
        contentView.addSubview(currencyTo)
        contentView.addSubview(resultConversionView)
        resultConversionView.addSubview(resultLabel)
        resultConversionView.addSubview(underlineConversionView)
    }
    
    private func configConstraints() {
        configScrollViewConstraints()
        configContentViewConstraints()
        configTitleLabelConstraints()
        configCurrencyOfConstraints()
        configCurrencyValueTextFieldConstraints()
        configSeparatorViewConstraints()
        configInvertCurrencyButtonConstraints()
        configCurrencyToConstraints()
        configResultConversionViewConstraints()
        configUnderlineConversionViewConstraints()
        configResultLabelConstraints()
    }
    
    
    private func configScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func configContentViewConstraints() {
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func configCurrencyOfConstraints() {
        NSLayoutConstraint.activate([
            currencyOf.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 60),
            currencyOf.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 25),
            currencyOf.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -25),
            currencyOf.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    private func configTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15),
        ])
    }
    
    private func configCurrencyValueTextFieldConstraints() {
        NSLayoutConstraint.activate([
            currencyValueTextField.topAnchor.constraint(equalTo: currencyOf.bottomAnchor, constant: 50),
            currencyValueTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            currencyValueTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.7),
            currencyValueTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    private func configSeparatorViewConstraints() {
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: currencyValueTextField.bottomAnchor, constant: 80),
            separatorView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.8),
            separatorView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
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
    
    
//  MARK: - CURRENCY TO
    
    private func configCurrencyToConstraints() {
        NSLayoutConstraint.activate([
            currencyTo.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 70),
            currencyTo.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 25),
            currencyTo.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -25),
            currencyTo.heightAnchor.constraint(equalToConstant: 170),
        ])
    }
    
    private func configResultConversionViewConstraints() {
        NSLayoutConstraint.activate([
            resultConversionView.topAnchor.constraint(equalTo: currencyTo.bottomAnchor),
            resultConversionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            resultConversionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            resultConversionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50),
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
            underlineConversionView.heightAnchor.constraint(equalToConstant: 2),
        ])
    }
    

    
}
