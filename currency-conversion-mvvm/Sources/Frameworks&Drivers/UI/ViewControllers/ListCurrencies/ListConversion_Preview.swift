//
//  ListConversionPreview.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 14/08/23.
//

import SwiftUI

#if DEBUG
struct ListCurrencies_Preview: PreviewProvider {
    static var previews: some View {
        ListCurrenciesControllerFactory.make()
        .asSwiftUIViewController
    }
}
#endif
