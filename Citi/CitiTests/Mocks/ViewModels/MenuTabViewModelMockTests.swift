//
//  MenuTabViewModelMockTests.swift
//  CitiTests
//
//  Created by El Reymon . on 12/03/24.
//

import Foundation
@testable import Citi

final class MenuTabViewModelMockTests: MenuTabViewModelProtocol {
    
    //Variable of protocols
    var listCurrencies: [Citi.Currencies]?
    var isLoading: Bool = false
    var isAlertShow: Bool = false
    var errorDescription: String  = ""

    var isOnAppearTap: Bool = false
    var isSetSelectCurrencieTap: Bool = false
    var isGetSelectCurrencieTap: Bool = false
    
    init(listCurrencies: [Citi.Currencies]? = nil) {
        self.listCurrencies = listCurrencies
    }
    
    func onAppear() {
        self.isOnAppearTap = true
    }
    
    func setSelectCurrencie(_ withOption: Citi.Currencies) {
        self.isSetSelectCurrencieTap = true
    }
    
    func getSelectCurrencie() -> Citi.Currencies {
        self.isGetSelectCurrencieTap = true
        return Currencies(country: "MX", code: "MXN", name: "Mexico", tradeValue: 17.02, flagURL: "")
    }
}
