//
//  Loader.swift
//  Citi
//
//  Created by El Reymon . on 11/03/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.black)
                .opacity(0.04)
                .ignoresSafeArea()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                .scaleEffect(3)
                .ignoresSafeArea()
            
        }
    }
}
