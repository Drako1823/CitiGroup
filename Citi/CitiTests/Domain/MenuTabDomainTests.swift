//
//  MenuTabDomainTests.swift
//  CitiTests
//
//  Created by El Reymon . on 13/03/24.
//

import XCTest
import Combine
@testable import Citi

final class MenuTabDomainTests: XCTestCase {
    var sut: MenuTabDomainProtocolMock?
    private var cancellable: Set<AnyCancellable> = []
    let valueExpected: DataModelExchange = DataModelExchange(baseCurrency: "USD", currencies: [Currencies(country: "MX", code: "MXN", name: "Mexico", tradeValue: 17.02, flagURL: "")])
    
    override func setUp() {
        super.setUp()
        sut = MenuTabDomainProtocolMock()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testExecute() {
        let expect = expectation(description: "data")
        
        sut?.execute()
            .sink(receiveCompletion: { [weak self] subscriptionComplet in
                guard let self: MenuTabDomainTests = self else { return }
                XCTAssertTrue(self.sut?.isExecuteTap ?? false)
                expect.fulfill()
            }, receiveValue: { data in
                XCTAssertEqual(self.valueExpected.baseCurrency, data.baseCurrency)
                XCTAssertEqual(self.valueExpected.currencies.first?.country, data.currencies.first?.country)
                XCTAssertEqual(self.valueExpected.currencies.first?.code, data.currencies.first?.code)
                XCTAssertEqual(self.valueExpected.currencies.first?.name, data.currencies.first?.name)
                XCTAssertEqual(self.valueExpected.currencies.first?.tradeValue, data.currencies.first?.tradeValue)
                XCTAssertEqual(self.valueExpected.currencies.first?.flagURL, data.currencies.first?.flagURL)
            })
            .store(in: &cancellable)
        wait(for: [expect], timeout: 3)
        
    }
}
