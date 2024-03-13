//
//  MenuTabViewModelTests.swift
//  CitiTests
//
//  Created by El Reymon . on 12/03/24.
//

import XCTest
@testable import Citi

final class MenuTabViewModelTests: XCTestCase {

    var sut: MenuTabViewModelMockTests?
    
    override func setUp() {
        super.setUp()
        sut = MenuTabViewModelMockTests(listCurrencies: [Currencies(country: "MX", code: "MXN", name: "Mexico", tradeValue: 17.02, flagURL: "")])
    }

    override func tearDown() {
        sut = nil
    }
    
    func testGetSelectCurrencie() {
        let expectedValue = Currencies(country: "MX", code: "MXN", name: "Mexico", tradeValue: 17.02, flagURL: "")
        let valueSut = sut?.getSelectCurrencie()

        XCTAssertEqual(expectedValue.country, valueSut?.country)
        XCTAssertEqual(expectedValue.code, valueSut?.code)
        XCTAssertEqual(expectedValue.name, valueSut?.name)
        XCTAssertEqual(expectedValue.tradeValue, valueSut?.tradeValue)
        XCTAssertTrue(sut?.isGetSelectCurrencieTap ?? false)
    }
    
    func testSetSelectCurrencie() {
        sut?.setSelectCurrencie(Currencies(country: "MX", code: "MXN", name: "Mexico", tradeValue: 17.02, flagURL: ""))
        XCTAssertTrue(sut?.isSetSelectCurrencieTap ?? false)
    }
    
    func testOnAppear() {
        sut?.onAppear()
        XCTAssertTrue(sut?.isOnAppearTap ?? false)
    }

}
