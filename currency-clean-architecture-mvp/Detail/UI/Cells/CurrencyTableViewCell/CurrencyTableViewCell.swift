//
//  CurrencyTableViewCell.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 17/08/23.
//

import UIKit



class CurrencyTableViewCell: UITableViewCell {
    typealias completionAlias = (_ currencyISO: String, _ favorite: Bool) -> Void
    static let identifier = String(String(describing: CurrencyTableViewCell.self))
    
    private var currencyISO: String?
    private var action: completionAlias?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//  MARK: - CREATE ELEMENT SCREEN
    private lazy var screen: CurrencyTableViewCellView = {
        let view = CurrencyTableViewCellView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
//  MARK: - SETUP CELL
    func setup(_ parameter: CurrencyTableViewCellDTO, completion: (completionAlias)? ) {
        setSymbol(parameter.symbol)
        setTitle(parameter.currencyISO)
        setSubTitle(parameter.name)
        setFavorite(parameter.favorite)
        setActionFavoriteButton(completion)
    }
    
    
    
//  MARK: - PRIVATE AREA
    
    private func configure() {
        configSelectionStyle()
        addElements()
        configConstraints()
        configDelegate()
    }
    
    private func configSelectionStyle() {
        self.selectionStyle = .none
    }
    
    private func addElements() {
        contentView.addSubview(screen)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            screen.topAnchor.constraint(equalTo: super.topAnchor),
            screen.bottomAnchor.constraint(equalTo: super.bottomAnchor),
            screen.leadingAnchor.constraint(equalTo: super.leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: super.trailingAnchor),
        ])
    }
    
    private func configDelegate() {
        screen.delegate = self
    }
    
    private func setSymbol(_ symbol: String) {
        screen.cardCurrencyView.symbolCurrency.symbolLabel.text = symbol
    }
    
    private func setTitle(_ title: String) {
        self.currencyISO = title
        screen.cardCurrencyView.titleCurrencyLabel.text = title
    }
    
    private func setSubTitle(_ subTitle: String) {
        screen.cardCurrencyView.subTitleCurrencyLabel.text = subTitle
    }
    
    private func setFavorite(_ favorite: Bool) {
        if favorite {
            setHeartFill(screen.favoriteButton)
            return
        }
        setHeart(screen.favoriteButton)
    }
    
    private func setActionFavoriteButton(_ completion: (completionAlias)?) {
        self.action = completion
    }
    
    private func setHeart(_ button: UIButton) {
        button.setImage(UIImage(systemName: K.Screen.ListCurrencies.Images.favoriteButton), for: .normal)
        button.tintColor = screen.getTintColorHeart(.normal)
    }
    
    private func setHeartFill(_ button: UIButton) {
        button.setImage(UIImage(systemName: K.Screen.ListCurrencies.Images.favoriteFillButton), for: .normal)
        button.tintColor = screen.getTintColorHeart(.fill)
    }
    
    
}

//  MARK: - EXTENSION DELEGATE

extension CurrencyTableViewCell: CurrencyTableViewCellViewDelegate {
    
    func favoriteButtonTapped(_ button: UIButton) {
        var favorite = true
        if button.currentImage == UIImage(systemName: K.Screen.ListCurrencies.Images.favoriteFillButton) {
            setHeart(button)
            favorite = false
        } else {
            setHeartFill(button)
        }
        
        if let currencyISO {action?(currencyISO, favorite)}
        
    }
    
}
