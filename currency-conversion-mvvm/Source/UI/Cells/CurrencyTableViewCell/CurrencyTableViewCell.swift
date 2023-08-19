//
//  CurrencyTableViewCell.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 17/08/23.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {
    static let identifier = String(String(describing: CurrencyTableViewCell.self))
    
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
            screen.leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: 25),
            screen.trailingAnchor.constraint(equalTo: super.trailingAnchor, constant: -20),
        ])
    }
    
    private func configDelegate() {
        screen.delegate = self
    }
    
}

//  MARK: - EXTENSION DELEGATE

extension CurrencyTableViewCell: CurrencyTableViewCellViewDelegate {
    func favoriteButtonTapped(_ button: UIButton) {
        if button.currentImage == UIImage(systemName: "heart.fill") {
            button.setImage(UIImage(systemName: "heart"), for: .normal)
            button.tintColor = screen.getTintColorHeart(.normal)
        } else {
            button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            button.tintColor = screen.getTintColorHeart(.fill)
        }

        
    }
}