//
//  CurrencyConversionPreview.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 14/08/23.
//

import SwiftUI

#if DEBUG
struct SearchCurrencies_Preview: PreviewProvider {
    static var previews: some View {
        ListCurrenciesViewControllerFactory.make()
        .asSwiftUIViewController
    }
}
#endif
