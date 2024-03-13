//
//  CurrencyExchangeTabMenuViewModel.swift
//  Citi
//
//  Created by El Reymon . on 12/03/24.
//

import Combine
import SwiftUI
import Foundation

final class CurrencyExchangeTabMenuViewModel: CurrencyExchangeTabMenuViewModelProtocol {
    
    let usesCase: MenuTabDomain
    var listCurrencies: [Currencies] = [Currencies(country: "", code: "", name: "", tradeValue: 0, flagURL: "")]
    var baseCurrenciesSelected: Currencies = Currencies(country: "", code: "", name: "", tradeValue: 0, flagURL: "")
    var baseCurrency: String = ""
    
    @Published var changeCurrency: String = ""
    @Published var isLoading: Bool = false
    @Published var isAlertShow: Bool = false
    @Published var errorDescription: String = ""
    
    private var cancellable: Set<AnyCancellable> = []
    
    
    init(usesCase: MenuTabDomain) {
        self.usesCase = usesCase
    }
    
    func onAppear() {
        execute()
    }
    
    private func execute() {
        self.isLoading = true
        usesCase.execute()
            .sink(receiveCompletion: { [weak self] subscriptionComplet in
                guard let self: CurrencyExchangeTabMenuViewModel = self else { return }
                switch subscriptionComplet {
                case .failure(let error):
                    self.errorDescription = error.localizedDescription
                    self.isLoading = false
                    self.isAlertShow = true
                case .finished:
                    self.isLoading = false
                    self.isAlertShow = false
                }
            }, receiveValue: { model in
                self.baseCurrency = model.baseCurrency
                self.listCurrencies = model.currencies
                self.baseCurrenciesSelected = model.currencies.filter { $0.code == model.baseCurrency }.first ?? Currencies(country: "", code: "", name: "", tradeValue: 0, flagURL: "")
            })
            .store(in: &cancellable)
    }
    
    func getData(_ index: UUID, _ value: String) -> Double {
        var cleanText = value.replacingOccurrences(of:"$", with: "")
        cleanText = cleanText.replacingOccurrences(of:",", with: "")
        
        let newValue: Double = Double(cleanText) ?? 0
        let base: Currencies = listCurrencies.filter { $0.id == index}.first ?? Currencies(country: "", code: "", name: "", tradeValue: 0, flagURL: "")
        
        return (baseCurrenciesSelected.tradeValue * base.tradeValue) * newValue
    }
    
    func getSymbol(_ code: String) -> String {
        switch code {
        case "USD":
            return "US$"
        case "CAD":
            return "C$"
        case "MXN", "ARS":
            return "$"
        case "EUR":
            return "€"
        default:
            return "$"
        }
    }
}
