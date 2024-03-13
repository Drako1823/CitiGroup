//
//  CurrencyExchangeTabMenuViewModelProtocol.swift
//  Citi
//
//  Created by El Reymon . on 12/03/24.
//

import Foundation

protocol CurrencyExchangeTabMenuViewModelProtocol: ObservableObject{
    func onAppear()
    func getSymbol(_ code: String) -> String
    func getData(_ index: UUID, _ value: String) -> Double
    var baseCurrency: String { get set }
    var changeCurrency: String { get set }
    var listCurrencies: [Currencies] { get set }
    var baseCurrenciesSelected: Currencies { get set }
}
