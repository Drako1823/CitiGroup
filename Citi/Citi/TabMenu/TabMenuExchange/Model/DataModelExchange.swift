//
//  DataModelExchange.swift
//  Citi
//
//  Created by El Reymon . on 11/03/24.
//

import Foundation

struct DataModelExchange: Decodable {
    let baseCurrency: String
    let currencies: [Currencies]
}

struct Currencies: Decodable, Identifiable, Hashable {
    let id = UUID()
    let country: String
    let code: String
    let name: String
    let tradeValue: Double
    let flagURL: String
}
