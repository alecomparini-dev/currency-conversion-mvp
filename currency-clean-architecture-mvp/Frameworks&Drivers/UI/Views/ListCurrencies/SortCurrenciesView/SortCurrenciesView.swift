//
//  SortCurrenciesView.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro uiarini on 17/08/23.
//

import UIKit


//  MARK: - PROTOCOL

protocol SortCurrenciesViewDelegate: AnyObject {
    func sortCodeButtonTapped()
    func sortDescriptionButtonTapped()
}


//  MARK: -
class SortCurrenciesView: UIView {
    weak var delegate: SortCurrenciesViewDelegate?
    
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//  MARK: - LAZY AREA
    
    lazy var sortCodeButton: UIButton = {
        let img = UIImage(systemName: "chevron.down")?.applyingSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 14))
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.configuration = UIButton.Configuration.plain()
        btn.configuration?.imagePlacement = .trailing
        btn.setImage(img, for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.tintColor = .black
        let container = AttributeContainer([NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .title2)])
        btn.configuration?.attributedTitle = AttributedString("Sigla", attributes: container)
        btn.addTarget(self, action: #selector(sortCodeButtonTapped), for: .touchUpInside)
        return btn
    }()
    @objc private func sortCodeButtonTapped() {
        delegate?.sortCodeButtonTapped()
    }
    
    lazy var sortDescriptionButton: UIButton = {
        let img = UIImage(systemName: "")?.applyingSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 14))
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.configuration = UIButton.Configuration.plain()
        btn.configuration?.imagePlacement = .trailing
        btn.setImage(img, for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.tintColor = .black
        let container = AttributeContainer([NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .title2)])
        btn.configuration?.attributedTitle = AttributedString("Nome", attributes: container)
        btn.addTarget(self, action: #selector(sortDescriptionButtonTapped), for: .touchUpInside)
        return btn
    }()
    @objc private func sortDescriptionButtonTapped() {
        delegate?.sortDescriptionButtonTapped()
    }
    
    lazy var stackView: UIStackView = {
        let st = UIStackView()
        st.translatesAutoresizingMaskIntoConstraints = false
        st.axis = .horizontal
        st.spacing = 20
        st.alignment = .center
        st.distribution = .fillEqually
        return st
    }()
    
//  MARK: - PRIVATE AREA
    
    private func configure() {
        addElements()
        configConstraints()
    }
    
    private func addElements() {
        addSubview(stackView)
        stackView.addArrangedSubview(sortCodeButton)
        stackView.addArrangedSubview(sortDescriptionButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: super.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: super.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: super.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: super.bottomAnchor),
        ])
    }
        
}
