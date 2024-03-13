//
//  MenuTabViewModelProtocol.swift
//  Citi
//
//  Created by El Reymon . on 12/03/24.
//

import Foundation

protocol MenuTabViewModelProtocol: ObservableObject{
    func onAppear()
    func setSelectCurrencie(_ withOption: Currencies)
    func getSelectCurrencie() -> Currencies
    var listCurrencies: [Currencies]? { get set }
    var isLoading: Bool { get set }
    var isAlertShow: Bool { get set }
    var errorDescription: String { get set }
}
