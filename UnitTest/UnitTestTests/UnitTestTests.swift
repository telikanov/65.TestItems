//
//  UnitTestTests.swift
//  UnitTestTests
//
//  Created by Алексей Теликанов on 19/04/2019.
//  Copyright © 2019 Алексей Теликанов. All rights reserved.
//

import XCTest
@testable import UnitTest

class UnitTestTests: XCTestCase {

    func testChekZeroLenght() {
        let login = Login()
        XCTAssert(login.isValidEmail(login: ""), "не прошел по длине")
    }
    
    func testCheckOneCharacterLength() {
        let login = Login()
        XCTAssert(login.isValidEmail(login: "e"), "не прошел по длине")
    }
    
    func testCheckMinimumAllowableLength() {
        let login = Login()
        XCTAssert(login.isValidEmail(login: "33e"), "прошел по длине")
    }
    
    func testCheckExceedingMaximumLength() {
        let login = Login()
        XCTAssert(login.isValidEmail(login: "33eekdjdjdjdksiwjdjjjjjjjjdjdjjdjskdjlkjhjfhaewflewfbeahfbaehfeawfewfb"), " не прошел по длине")
    }
    
    func testChekAllowedLength() {
        let login = Login()
        XCTAssert(login.isValidEmail(login: "33eekdjdjdjdksiwjdjjjjjjjjdjdjjd"), "прошел по длине")
    }
    
    func testChekNotAllowedLength() {
        let login = Login()
        XCTAssert(login.isValidEmail(login: "33eekdjdjdjdksiwjdjjjjjjjjdjdjjd1"), "не прошел по длине")
    }
    
    func testCheckNotLatinLetters() {
        let login = Login()
        XCTAssert(login.isValidEmail(login: "логин"), "не прошел по кирилице")
    }
    
    func testCheckLatinLetters() {
        let login = Login()
        XCTAssert(login.isValidEmail(login: "login"), "прошел по кирилице")
    }
    
    func testCheckEmail() {
        let login = Login()
        XCTAssert(login.isValidEmail(login: "login@gmail.com"), "прошел по email")
    }
    
    func testCheckNotEmail() {
        let login = Login()
        XCTAssert(login.isValidEmail(login: "login@gmail.comedede"), "прошел по email")
    }
    
    func testCheckNoValidEmail() {
        let login = Login()
        XCTAssert(login.isValidEmail(login: "@mai.ry"), "не прошел. Не валидная почта") 
    }
    
    func testCheckUnacceptableSymbols() {
        let login = Login()
        XCTAssert(login.isValidEmail(login: "login$"), "не прошел cимволам")
    }
    
    func testcheckValidCharacters() {
        let login = Login()
        XCTAssert(login.isValidEmail(login: "login.-12"), "прошел cимволам")
    }
    
    func testCheckStartLoginPoint() {
        let login = Login()
        XCTAssert(login.isValidEmail(login: ".-12"), "не прошел. Начало на точку")
    }
    
    func testCheckStartLoginMinus() {
        let login = Login()
        XCTAssert(login.isValidEmail(login: "-12."), "не прошел. Начало на минус")
    }
    
    func testCheckStartLoginNumeral() {
        let login = Login()
        XCTAssert(login.isValidEmail(login: "3.-12"), "не прошел. Начало на цифру")
    }
}
