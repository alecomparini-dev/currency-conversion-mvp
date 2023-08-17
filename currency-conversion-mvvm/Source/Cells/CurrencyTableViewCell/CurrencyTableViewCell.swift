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
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//  MARK: - CREATE ELEMENT SCREEN
    private lazy var screen: CurrencyTableViewCellView = {
        let view = CurrencyTableViewCellView()
        return view
    }()
    
    
//  MARK: - PRIVATE AREA
    
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
    
    
}
