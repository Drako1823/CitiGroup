//
//  DetailTabMenuViewModel.swift
//  Citi
//
//  Created by El Reymon . on 11/03/24.
//

import Foundation

protocol DetailTabMenuViewModelProtocol: ObservableObject {
    func getSelectCurrencie() -> Currencies
    var listCurrencies: Currencies { get set }
}

final class DetailTabMenuViewModel: DetailTabMenuViewModelProtocol {
    var listCurrencies: Currencies
    
    init(listCurrencies: Currencies) {
        self.listCurrencies = listCurrencies
    }
    
    func getSelectCurrencie() -> Currencies {
        return listCurrencies
    }
}
