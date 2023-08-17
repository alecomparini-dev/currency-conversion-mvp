//
//  SearchCurrenciesView.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 15/08/23.
//

import UIKit

protocol SearchCurrenciesViewDelegate: AnyObject {
    func backPageButtonTapped()
}

class SearchCurrenciesView: UIView {
    weak var delegate: SearchCurrenciesViewDelegate?
    
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//  MARK: - LAZY AREA
    lazy var backPageButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "chevron.left")?.applyingSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 25)), for: .normal)
        btn.tintColor = .white
        btn.contentMode = .scaleAspectFill
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(backPageButtonTapped), for: .touchUpInside)
        return btn
    }()
    @objc private func backPageButtonTapped() {
        delegate?.backPageButtonTapped()
    }
    
    
//  MARK: - PRIVATE AREA
    private func configure() {
        configBackgroundColor()
        addElements()
        configConstraints()
    }
    
    
    private func configBackgroundColor() {
        backgroundColor = .red
    }
    
    private func addElements() {
        addSubview(backPageButton)
    }
    
    private func configConstraints() {
        configBackPageButtonConstraints()
    }
    
    private func configBackPageButtonConstraints() {
        NSLayoutConstraint.activate([
            backPageButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            backPageButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            backPageButton.widthAnchor.constraint(equalToConstant: 40),
            backPageButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    
}
