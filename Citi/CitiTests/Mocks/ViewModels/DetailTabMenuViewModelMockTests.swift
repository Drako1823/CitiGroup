//
//  DetailTabMenuViewModelMockTests.swift
//  CitiTests
//
//  Created by El Reymon . on 12/03/24.
//

import Foundation
@testable import Citi

final class DetailTabMenuViewModelMockTests: DetailTabMenuViewModelProtocol {
    var listCurrencies: Citi.Currencies
    var isGetSelectCurrencieTap: Bool = false
    
    init(listCurrencies: Citi.Currencies) {
        self.listCurrencies = listCurrencies
    }
    
    func getSelectCurrencie() -> Citi.Currencies {
        self.isGetSelectCurrencieTap = true
        return listCurrencies
    }
}
