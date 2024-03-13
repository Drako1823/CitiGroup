//
//  SplashView.swift
//  Citi
//
//  Created by El Reymon . on 12/03/24.
//

import SwiftUI

struct SplashView: View {
    @State private var size = 0.6
    @State private var opacity = 0.4
    @Binding var showSplash: Bool
    
    var body: some View {
        ZStack {
            Color(hex: 0x46C3F1)
                .ignoresSafeArea()
            VStack {
                Image("exchange")
                Text("Cambio de Divisas")
            }
            .font(.title)
            .foregroundColor(.white)
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeIn(duration: 2.0)) {
                    self.size = 0.9
                    self.opacity = 1.0
                }
            }
            
        }.ignoresSafeArea()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        self.showSplash = false
                    }
                }
            }
    }
}
