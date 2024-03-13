//
//  ContentView.swift
//  Citi
//
//  Created by El Reymon . on 11/03/24.
//

import SwiftUI
import Combine

struct MenuTab<ViewModel: MenuTabViewModelProtocol>: View {
    @StateObject var viewModel: ViewModel
    @State private var path = NavigationPath()
    
    var body: some View {
        ZStack {
            NavigationStack(path: $path) {
                VStack {
                    Text("Tipo de Divisas")
                        .font(.system(size: 36)
                            .weight(.bold))
                    List(viewModel.listCurrencies ?? [Currencies(country: "", code: "", name: "", tradeValue: 0, flagURL: "")]) { currencies in
                        DetailRow(currencies: currencies)
                            .onTapGesture {
                                path.append("Detail")
                                viewModel.setSelectCurrencie(currencies)
                            }
                        
                    }.padding(.bottom)
                        .navigationDestination(for: String.self) { view in
                            switch view {
                            case "Detail":
                                DetailTabMenuWireframe().detailMenuTabView(viewModel.getSelectCurrencie())
                            default:
                                Text("No view has been set for \(view)")
                            }
                        }
                }
            }
            if viewModel.isLoading {
                LoadingView()
            }
            
            if viewModel.isAlertShow {
                CustomAlert(presentAlert: $viewModel.isAlertShow, alertType: .error(title: "Error", message: viewModel.errorDescription)) {
                    withAnimation{
                        viewModel.onAppear()
                        viewModel.isAlertShow.toggle()
                    }
                } rightButtonAction: {
                    withAnimation{
                        viewModel.isAlertShow.toggle()
                    }
                }
            }
        }
        .onAppear() {
            viewModel.onAppear()
        }
    }
}
