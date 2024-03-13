//
//  CurrencyExchangeTabMenu.swift
//  Citi
//
//  Created by El Reymon . on 12/03/24.
//

import SwiftUI
import Combine

struct CurrencyExchangeTabMenu<ViewModel: CurrencyExchangeTabMenuViewModelProtocol>: View {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                Text("Cambio de Divisas")
                    .font(.system(size: 36)
                        .weight(.bold))
                VStack(alignment: .leading, spacing: 10) {
                    Spacer()
                    Text("Divisa base a cambio: \(viewModel.baseCurrency)")
                        .font(.system(size: 20)
                            .weight(.semibold))
                    Spacer()
                    Spacer()
                    Group {
                        TextField("¿ Cuanto deseas cambiar ?", text: $viewModel.changeCurrency)
                            .frame(height: 44)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                            .onChange(of: viewModel.changeCurrency, perform: { newValue in
                                let valueFormatted = format(string: newValue)
                                if viewModel.changeCurrency != valueFormatted {
                                    viewModel.changeCurrency = valueFormatted
                                }
                            })
                        
                        if !viewModel.changeCurrency.isEmpty {
                            ForEach (viewModel.listCurrencies) { currency in
                                if currency != viewModel.baseCurrenciesSelected {
                                    Text("Moneda: \(currency.name) a cambio: \(viewModel.getSymbol(currency.code)) \(viewModel.getData(currency.id, viewModel.changeCurrency), specifier: "%.2f")")
                                        .font(.system(size: 16)
                                            .weight(.semibold))
                                    Divider()
                                    Spacer()
                                }
                            }
                        }
                    }
                }.padding()
            }
        }
        .onAppear() {
            viewModel.onAppear()
        }
    }
    
    private func format(string: String) -> String {
        let digits = string.components(separatedBy: CharacterSet(charactersIn: "0123456789").inverted).joined()
        let value = (Double(digits) ?? 0) / 100.0
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.currencySymbol = (Locale.current as NSLocale).object(forKey: .currencySymbol) as? String ?? ""
        
        let valueFormatted = currencyFormatter.string(from: NSNumber(value: value)) ?? ""
        return valueFormatted
    }
}
