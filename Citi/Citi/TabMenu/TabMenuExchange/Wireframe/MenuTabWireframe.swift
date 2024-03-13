//
//  MenuTabWireframe.swift
//  Citi
//
//  Created by El Reymon . on 11/03/24.
//

import SwiftUI

final class MenuTabWireframe {
    
    func MenuTabView() -> some View {
        
        let viewModel: MenuTabViewModel = MenuTabViewModel(usesCase: MenuTabDomain(serviceManager: ServiceManager()))
        
        return MenuTab(viewModel: viewModel)
        
    }
}
