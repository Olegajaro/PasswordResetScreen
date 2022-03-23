//
//  PasswordCriteriaTests.swift
//  PasswordResetScreenTests
//
//  Created by Олег Федоров on 23.03.2022.
//

import XCTest

@testable import PasswordResetScreen

class PasswordLengthCriteriaTests: XCTestCase {
    
    // Boundary conditions 8-32
    
    func testShort() throws { // < 8 symbols
        XCTAssertFalse(PasswordCriteria.lengthCriteriaMet("1234567"))
    }
    
    func testLong() throws { // > 32 symbols
        XCTAssertFalse(PasswordCriteria.lengthCriteriaMet(
            "VeryLongPasswordIsNotSuitableForOurApplication"
        ))
    }
    
    func testValidShort() throws { // 8 symbols
        XCTAssertTrue(PasswordCriteria.lengthCriteriaMet("12345678"))
    }
    
    func testValidLong() throws { //  32 symbols
        XCTAssertTrue(PasswordCriteria.lengthCriteriaMet(
            "PasswordCanHaveMaxOf32characters"
        ))
    }
}

class PasswordOtherCriteriaTests: XCTestCase {
    func testSpaceMet() throws {
        XCTAssertTrue(PasswordCriteria.noSpaceCriteriaMet("foo"))
    }
    
    func testSpaceNotMet() throws {
        XCTAssertFalse(PasswordCriteria.noSpaceCriteriaMet("foo bazz"))
    }
    
    func testLengthAndNoSpaceMet() throws {
        XCTAssertTrue(PasswordCriteria.lengthAndNoSpaceMet("12345678"))
    }
    
    func testLengthAndNoSpaceNotMet() throws {
        XCTAssertFalse(PasswordCriteria.lengthAndNoSpaceMet("1234567 8"))
    }
    
    func testUppercaseMet() throws {
        XCTAssertTrue(PasswordCriteria.uppercaseMet("Foo"))
    }
    
    func testUppercaseNotMet() throws {
        XCTAssertFalse(PasswordCriteria.uppercaseMet("foo"))
    }
    
    func testLowercaseMet() throws {
        XCTAssertTrue(PasswordCriteria.lowercaseMet("foo"))
    }
    
    func testLowercaseNotMet() throws {
        XCTAssertFalse(PasswordCriteria.lowercaseMet("FOO"))
    }
    
    func testDigitMet() throws {
        XCTAssertTrue(PasswordCriteria.digitMet("123"))
    }
    
    func testDigitNotMet() throws {
        XCTAssertFalse(PasswordCriteria.digitMet("OneTwoThree"))
    }
    
    func testSpecialCharacterMet() throws {
        XCTAssertTrue(PasswordCriteria.specialCharacterMet("Foo$"))
    }
    
    func testSpecialCharacterNotMet() throws {
        XCTAssertFalse(PasswordCriteria.specialCharacterMet("Foo&"))
    }
}
 
