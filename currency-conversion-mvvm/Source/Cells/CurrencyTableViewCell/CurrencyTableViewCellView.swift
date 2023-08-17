//
//  CurrencyTableViewCellView.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 17/08/23.
//

import UIKit


//  MARK: - PROTOCOL

protocol CurrencyTableViewCellViewDelegate: AnyObject {
    func favoriteButtonTapped()
}


//  MARK: -
class CurrencyTableViewCellView: UIView {
    weak var delegate: CurrencyTableViewCellViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //  MARK: - LAZY AREA
    lazy var cardCurrencyView: CardCurrencyView = {
        let card = CardCurrencyView()
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()
    
    lazy var favoriteView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var favoriteButton: UIButton = {
        let img = UIImage(systemName: "heart.fill")?.applyingSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 30))
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(img, for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.tintColor = .red.withAlphaComponent(0.7)
        btn.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        return btn
    }()
    @objc private func favoriteButtonTapped() {
        delegate?.favoriteButtonTapped()
    }

    
//  MARK: - PRIVATE AREA
    private func configure() {
        configBackgroundColor()
        addElements()
        configConstraints()
    }
    
    private func configBackgroundColor() {
        backgroundColor = .white
    }
    
    private func addElements() {
        addSubview(cardCurrencyView)
        addSubview(favoriteView)
        favoriteView.addSubview(favoriteButton)
    }
    
    private func configConstraints() {
        configCardCurrencyViewConstraints()
        configFavoriteViewConstraints()
        configFavoriteButtonConstraints()
    }
    
    private func configCardCurrencyViewConstraints() {
        NSLayoutConstraint.activate([
            cardCurrencyView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            cardCurrencyView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25),
            cardCurrencyView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -75),
            cardCurrencyView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    private func configFavoriteViewConstraints() {
        NSLayoutConstraint.activate([
            favoriteView.topAnchor.constraint(equalTo: cardCurrencyView.topAnchor),
            favoriteView.leadingAnchor.constraint(equalTo: cardCurrencyView.trailingAnchor),
            favoriteView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            favoriteView.bottomAnchor.constraint(equalTo: cardCurrencyView.bottomAnchor),
        ])
    }
    
    private func configFavoriteButtonConstraints() {
        NSLayoutConstraint.activate([
            favoriteButton.centerXAnchor.constraint(equalTo: favoriteView.centerXAnchor),
            favoriteButton.centerYAnchor.constraint(equalTo: favoriteView.centerYAnchor),
        ])
    }
    
}
