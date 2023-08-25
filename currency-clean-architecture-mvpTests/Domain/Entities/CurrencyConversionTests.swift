//
//  CurrencyConversionTests.swift
//  currency-conversion-mvvmTests
//
//  Created by Alessandro Comparini on 14/08/23.
//

import XCTest
@testable import currency_clean_architecture_mvp

final class CurrencyConversionTests: XCTestCase {

    func test_conversion_should_convert_of_USD_to_BRL() {
        let quoteOfUSD = 1.0
        let quoteToBRL = 4.970404
        let sut = makeSUT(quoteToCurrencyOf: quoteOfUSD , quoteToCurrencyTo: quoteToBRL)
        
        let conversion = sut.conversion()
        
        XCTAssertEqual(conversion, 4.97, accuracy: 0.01)
    }
    
    func test_conversion_should_convert_of_BRL_to_USD() {
        let quoteOfBRL = 4.970404
        let quoteToUSD = 1.0
        let sut = makeSUT(quoteToCurrencyOf: quoteOfBRL , quoteToCurrencyTo: quoteToUSD)
        
        let conversion = sut.conversion()
        
        XCTAssertEqual(conversion, 0.20, accuracy: 0.01)
    }
    
    func test_conversion_should_return_zero_when_of_currency_igual_zero() {
        let quoteOfUSD = 0.0
        let quoteToBRL = 4.970404
        let sut = makeSUT(quoteToCurrencyOf: quoteOfUSD , quoteToCurrencyTo: quoteToBRL)
        
        let conversion = sut.conversion()
        
        XCTAssertEqual(conversion, 0.0)
    }

    func test_conversion_should_convert_of_BRL_to_AED() {
        let quoteOf = 4.970404
        let quoteTo = 3.673042
        let sut = makeSUT(quoteToCurrencyOf: quoteOf , quoteToCurrencyTo: quoteTo)
        
        let conversion = sut.conversion()
        
        XCTAssertEqual(conversion, 0.74, accuracy: 0.01)
    }
    
    func test_conversion_should_convert_of_BRL_to_UAH() {
        let quoteOf = 4.970404
        let quoteTo = 36.835514
        let sut = makeSUT(quoteToCurrencyOf: quoteOf , quoteToCurrencyTo: quoteTo)
        
        let conversion = sut.conversion()
        
        XCTAssertEqual(conversion, 7.41, accuracy: 0.01)
    }
    
    func test_conversion_should_convert_of_50BRL_to_ARS() {
        let value = 50.0
        let quoteOf = 4.970404
        let quoteTo = 349.075334
        let sut = makeSUT(value: value, quoteToCurrencyOf: quoteOf , quoteToCurrencyTo: quoteTo)
        
        let conversion = sut.conversion()
        
        XCTAssertEqual(conversion, 3511.54, accuracy: 0.01)
    }
    
}

//  MARK: - MAKE SUT
extension CurrencyConversionTests {
    func makeSUT(value: Double = 1.0, quoteToCurrencyOf: Double, quoteToCurrencyTo: Double,
                 file: StaticString = #filePath, line: UInt = #line) -> CurrencyConversion {
        
        let sut = CurrencyConversion(value: value, quoteCurrencyOf: quoteToCurrencyOf, quoteCurrencyTo: quoteToCurrencyTo)
        checkMemoryLeak(for: sut)
        return sut
    }
}
