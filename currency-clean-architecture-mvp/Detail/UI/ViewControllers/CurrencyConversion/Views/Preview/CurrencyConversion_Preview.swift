//
//  CurrencyConversionPreview.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 14/08/23.
//

import SwiftUI

#if DEBUG
struct CurrencyConversion_Preview: PreviewProvider {
    static var previews: some View {
        CurrencyConversionControllerFactory.make()
        .asSwiftUIViewController
    }
}
#endif
