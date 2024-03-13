//
//  DetailTabMenuWireframe.swift
//  Citi
//
//  Created by El Reymon . on 11/03/24.
//

import SwiftUI

final class DetailTabMenuWireframe {
    
    func detailMenuTabView(_ withOption: Currencies) -> some View {
        let viewModel: DetailTabMenuViewModel = DetailTabMenuViewModel(listCurrencies: withOption)
        return DetailTabMenu(viewModel: viewModel)
    }
}
