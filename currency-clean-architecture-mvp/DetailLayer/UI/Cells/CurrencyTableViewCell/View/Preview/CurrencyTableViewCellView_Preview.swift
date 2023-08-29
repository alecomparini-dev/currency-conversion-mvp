//
//  CurrencyTableViewCellViewPreview.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 17/08/23.
//

import SwiftUI

#if DEBUG
struct CurrencyTableViewCellView_Preview: PreviewProvider {
    static var previews: some View {
        CurrencyTableViewCellView()
        .asSwiftUIView
        .padding(.horizontal, 20)
    }
}
#endif
