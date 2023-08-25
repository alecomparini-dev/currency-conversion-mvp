//
//  CardCurrencyViewPreview.swift
//  currency-conversion-mvvm
//
//  Created by Alessandro Comparini on 17/08/23.
//

import SwiftUI

#if DEBUG
struct CardCurrencyView_Preview: PreviewProvider {
    static var previews: some View {
        CardCurrencyView()
        .asSwiftUIView
        .frame(height: 100, alignment: .center)
        .padding(15)
    }
}
#endif
