//
//  DetailTabMenuViewModelTests.swift
//  CitiTests
//
//  Created by El Reymon . on 12/03/24.
//

import XCTest
@testable import Citi

final class DetailTabMenuViewModelTests: XCTestCase {

    var sut: DetailTabMenuViewModelMockTests?
    
    override func setUp() {
        super.setUp()
        sut = DetailTabMenuViewModelMockTests (listCurrencies: Currencies(country: "MX", code: "MXN", name: "Mexico", tradeValue: 10.05, flagURL: ""))
    }

    override func tearDown() {
        sut = nil
    }
             
    func testGetSelectCurrencie() {
        let expectationValue = Currencies(country: "MX", code: "MXN", name: "Mexico", tradeValue: 10.05, flagURL: "")
        
        let valueSut = sut?.getSelectCurrencie()
        
        XCTAssertEqual(valueSut?.country, expectationValue.country)
        XCTAssertEqual(valueSut?.code, expectationValue.code)
        XCTAssertEqual(valueSut?.name, expectationValue.name)
        XCTAssertEqual(valueSut?.tradeValue, expectationValue.tradeValue)
        XCTAssertTrue(sut?.isGetSelectCurrencieTap ?? false)
    }
}
