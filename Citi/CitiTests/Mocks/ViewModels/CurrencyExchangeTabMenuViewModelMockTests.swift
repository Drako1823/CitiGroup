//
//  CurrencyExchangeTabMenuViewModelMockTests.swift
//  CitiTests
//
//  Created by El Reymon . on 12/03/24.
//

import Foundation
@testable import Citi

final class CurrencyExchangeTabMenuViewModelMockTests: CurrencyExchangeTabMenuViewModelProtocol {
  
    var baseCurrency: String = ""
    var changeCurrency: String = ""
    var listCurrencies: [Currencies]
    var baseCurrenciesSelected: Currencies = Currencies(country: "United States of America", code: "USD", name: "American Dollar", tradeValue: 1.0, flagURL: "https://flagsapi.com/US/flat/64.png")

    var isOnAppearTap: Bool = false
    var isLimitTextTap: Bool = false
    var isGetSymbolTap: Bool = false
    var isGetDataTap: Bool = false

    init(listCurrencies: [Currencies]) {
        self.listCurrencies = listCurrencies
    }
    
    func onAppear() {
        isOnAppearTap = true
    }
    
    func getSymbol(_ code: String) -> String {
        isGetSymbolTap = true
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
    
    func getData(_ index: UUID, _ value: String) -> Double {
        isGetDataTap = true
        let newValue: Double = Double(value) ?? 0
        let base: Currencies = listCurrencies.filter { $0.id == index}.first ?? Currencies(country: "", code: "", name: "", tradeValue: 0, flagURL: "")
        
        return (baseCurrenciesSelected.tradeValue * base.tradeValue) * newValue
    }
}
