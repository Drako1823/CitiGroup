//
//  DetailMenuTapRow.swift
//  Citi
//
//  Created by El Reymon . on 11/03/24.
//

import SwiftUI

struct DetailRow: View {
    var currencies: Currencies
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: currencies.flagURL)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 120)
            } placeholder: {
                LoadingView().frame(width: 80, height: 80)
            }
            .frame(idealHeight: 100)
            VStack (alignment: .leading, spacing: 10){
                Text("Pais: \(currencies.country)")
                    .font(.system(size: 22)
                        .weight(.bold))
                
                Text("Moneda usada: \(currencies.name)")
                    .font(.system(size: 16)
                        .weight(.light))
            }
        }
    }
}
