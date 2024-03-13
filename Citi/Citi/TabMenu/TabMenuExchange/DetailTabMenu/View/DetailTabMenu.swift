//
//  DetailTabMenu.swift
//  Citi
//
//  Created by El Reymon . on 11/03/24.
//

import SwiftUI

struct DetailTabMenu<ViewModel: DetailTabMenuViewModelProtocol>: View {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.vertical) {
                Text("Detalle de la divisa seleccionada")
                    .font(.system(size: 24)
                        .weight(.bold))
                AsyncImage(url: URL(string: viewModel.listCurrencies.flagURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .edgesIgnoringSafeArea(.top)
                } placeholder: {
                    LoadingView().frame(width: 80, height: 80)
                }
                .frame(idealHeight: 100)
                .overlay(
                    CardGradient()
                ).padding()
                VStack (alignment: .leading, spacing: 10){
                    
                    Text("Pais: \(viewModel.listCurrencies.country)")
                        .font(.system(size: 20)
                            .weight(.bold))
                    Divider()
                    Text("Codigo: \(viewModel.listCurrencies.code)")
                        .font(.system(size: 16)
                            .weight(.light))
                    Divider()
                    
                    Text("Moneda usada: \(viewModel.listCurrencies.name)")
                        .font(.system(size: 16)
                            .weight(.light))
                    Divider()
                    Text("Valor comercial: \(viewModel.listCurrencies.tradeValue, specifier: "%.2f")")
                        .font(.system(size: 16)
                            .weight(.light))
                }.padding()
            }
        }.padding()
    }
}

struct CardGradient: View{
    var myGradient = Gradient(
        colors: [
            Color(.systemGray),
            Color(.systemIndigo)
        ]
    )
    
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .stroke(
                LinearGradient(
                    gradient: myGradient,
                    startPoint: .leading,
                    endPoint: .trailing
                ),
                lineWidth: 4
            )
    }
}
