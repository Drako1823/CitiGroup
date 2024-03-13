//
//  MenuTabDomainProtocolMock.swift
//  CitiTests
//
//  Created by El Reymon . on 11/03/24.
//

import Foundation
import Combine
@testable import Citi

final class MenuTabDomainProtocolMock: MenuTabDomainProtocol {
    let valueExpectedMock: DataModelExchange = DataModelExchange(baseCurrency: "USD", currencies: [Currencies(country: "MX", code: "MXN", name: "Mexico", tradeValue: 17.02, flagURL: "")])
    
    var isExecuteTap: Bool = false
    
    func execute() -> AnyPublisher<DataModelExchange, Error> {
        isExecuteTap = true
        return Just<DataModelExchange>(valueExpectedMock)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
