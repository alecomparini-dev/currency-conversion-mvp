//
//  CurrencyTableViewCellView.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 17/08/23.
//

import UIKit


//  MARK: - PROTOCOL

protocol CurrencyTableViewCellViewDelegate: AnyObject {
    func favoriteButtonTapped(_ button: UIButton)
}


//  MARK: -
class CurrencyTableViewCellView: UIView {
    weak var delegate: CurrencyTableViewCellViewDelegate?
    
    enum TintColorHeart {
        case fill
        case normal
    }
    
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
        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var favoriteButton: UIButton = {
        let img = UIImage(systemName: K.Screen.ListCurrencies.Images.favoriteButton)
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(img, for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.tintColor = getTintColorHeart(.normal)
        btn.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        return btn
    }()
    @objc private func favoriteButtonTapped(_ button: UIButton) {
        delegate?.favoriteButtonTapped(button)
    }

    
//  MARK: - PUBLIC AREA
    func getTintColorHeart(_ tintColorHeart: TintColorHeart) -> UIColor {
        switch tintColorHeart {
        case .fill:
            return .red.withAlphaComponent(0.7)
        case .normal:
            return .black
        }
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
            cardCurrencyView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            cardCurrencyView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15),
            cardCurrencyView.trailingAnchor.constraint(equalTo: favoriteView.leadingAnchor),
            cardCurrencyView.heightAnchor.constraint(equalToConstant: 75),
        ])
    }
    
    private func configFavoriteViewConstraints() {
        NSLayoutConstraint.activate([
            favoriteView.topAnchor.constraint(equalTo: cardCurrencyView.topAnchor),
            favoriteView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 2),
            favoriteView.bottomAnchor.constraint(equalTo: cardCurrencyView.bottomAnchor),
            favoriteView.widthAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    private func configFavoriteButtonConstraints() {
        NSLayoutConstraint.activate([
            favoriteButton.topAnchor.constraint(equalTo: favoriteView.topAnchor),
            favoriteButton.leadingAnchor.constraint(equalTo: favoriteView.leadingAnchor),
            favoriteButton.trailingAnchor.constraint(equalTo: favoriteView.trailingAnchor),
            favoriteButton.bottomAnchor.constraint(equalTo: favoriteView.bottomAnchor),
//
//            favoriteButton.centerYAnchor.constraint(equalTo: favoriteView.centerYAnchor),
//            favoriteButton.centerXAnchor.constraint(equalTo: favoriteView.centerXAnchor),
        ])
    }
    
}
