//
//  CurrencyExchangeTabMenuWireframe.swift
//  Citi
//
//  Created by El Reymon . on 12/03/24.
//

import SwiftUI

final class CurrencyExchangeTabMenuWireframe {
    
    func CurrencyExchangeTabMenuWireframe() -> some View {
        
        let viewModel: CurrencyExchangeTabMenuViewModel = CurrencyExchangeTabMenuViewModel(usesCase: MenuTabDomain(serviceManager: ServiceManager()))
        
        return CurrencyExchangeTabMenu(viewModel: viewModel)
        
    }
}
