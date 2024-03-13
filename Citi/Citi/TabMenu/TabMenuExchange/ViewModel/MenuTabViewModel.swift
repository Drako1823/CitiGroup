//
//  MenuTabViewModel.swift
//  Citi
//
//  Created by El Reymon . on 11/03/24.
//

import Foundation
import Combine

final class MenuTabViewModel: MenuTabViewModelProtocol {
    var listCurrencies: [Currencies]?
    let usesCase: MenuTabDomain
    var selectCurrencies: Currencies?
    
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
                guard let self: MenuTabViewModel = self else { return }
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
                self.listCurrencies = model.currencies
            })
            .store(in: &cancellable)
    }
    
    func setSelectCurrencie(_ withOption: Currencies) {
        self.selectCurrencies = withOption
    }
    
    func getSelectCurrencie() -> Currencies {
        selectCurrencies ?? Currencies(country: "", code: "", name: "", tradeValue: 0, flagURL: "")
    }
}
