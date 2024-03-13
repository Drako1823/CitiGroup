//
//  CitiApp.swift
//  Citi
//
//  Created by El Reymon . on 11/03/24.
//

import SwiftUI

@main
struct CitiApp: App {
    @State private var animationAmount = 1.0
    @State private var showSplash: Bool = true
    
    var body: some Scene {
        WindowGroup {
            ZStack{
                if showSplash {
                    SplashViewWireframe().SplashViewWireframe($showSplash)
                } else {
                    TabView {
                        MenuTabWireframe().MenuTabView().tabItem {
                            Label("Lista de divisas", systemImage: "list.dash")
                        }

                        CurrencyExchangeTabMenuWireframe().CurrencyExchangeTabMenuWireframe().tabItem {
                            Label("Cambio de divisas", systemImage: "coloncurrencysign.circle")
                        }
                    }
                }
            }
        }
    }
}
