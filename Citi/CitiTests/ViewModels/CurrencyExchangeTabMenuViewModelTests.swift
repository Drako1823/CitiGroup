//
//  CurrencyExchangeTabMenuViewModelTests.swift
//  CitiTests
//
//  Created by El Reymon . on 12/03/24.
//

import XCTest
@testable import Citi

final class CurrencyExchangeTabMenuViewModelTests: XCTestCase {

    var sut: CurrencyExchangeTabMenuViewModelMockTests?
    let expectationValueMock: [Currencies] = [Currencies(country: "MX", code: "MXN", name: "Mexico", tradeValue: 120.29, flagURL: "http://www.google.com")]
    
    override func setUp() {
        super.setUp()
        sut = CurrencyExchangeTabMenuViewModelMockTests(listCurrencies: expectationValueMock)
    }

    override func tearDown() {
        sut = nil
    }
    
    func testOnAppear() {
        sut?.onAppear()
        XCTAssertTrue(sut?.isOnAppearTap ?? false)
    }

    func testGetSymbol() {
        var valueSendSut: String = "CAD"
        var expectationValue = "C$"
        var valueSut = sut?.getSymbol(valueSendSut)
        
        XCTAssertEqual(valueSut, expectationValue)
        
        valueSendSut = "USD"
        expectationValue = "US$"
        valueSut = sut?.getSymbol(valueSendSut)
        XCTAssertEqual(valueSut, expectationValue)

        valueSendSut = "EUR"
        expectationValue = "€"
        valueSut = sut?.getSymbol(valueSendSut)
        XCTAssertEqual(valueSut, expectationValue)

        valueSendSut = "ARS"
        expectationValue = "$"
        valueSut = sut?.getSymbol(valueSendSut)
        XCTAssertEqual(valueSut, expectationValue)
        
        valueSendSut = "MXN"
        expectationValue = "$"
        valueSut = sut?.getSymbol(valueSendSut)
        XCTAssertEqual(valueSut, expectationValue)
        
        valueSendSut = "NT"
        expectationValue = "$"
        valueSut = sut?.getSymbol(valueSendSut)
        XCTAssertEqual(valueSut, expectationValue)
        
        XCTAssertTrue(sut?.isGetSymbolTap ?? false)
    }
    
    func testGetData() {
        let expectationValue: Double = 120.29
        let valueSendSut: String = "1" //Valor por el cual se multiplicara el resultado
        let valueSut = sut?.getData(expectationValueMock.first?.id ?? UUID(), valueSendSut)

        XCTAssertEqual(valueSut, expectationValue)
        XCTAssertTrue(sut?.isGetDataTap ?? false)
    }
}
