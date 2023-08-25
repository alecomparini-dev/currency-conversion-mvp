//
//  CurrencySymbolViewInput.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 14/08/23.
//

import UIKit

struct CurrencySymbolViewInput {
    let symbol: String
    let backgroundColor: UIColor
    let sizeFrame: CGFloat
    let fontSize: UIFont.TextStyle
    
    init(symbol: String, backgroundColor: UIColor = UIColor.HEX("#08132b"),
              sizeFrame: CGFloat = 50,
              fontSize: UIFont.TextStyle = .title2) {
        self.symbol = symbol
        self.backgroundColor = backgroundColor
        self.sizeFrame = sizeFrame
        self.fontSize = fontSize
    }
}
