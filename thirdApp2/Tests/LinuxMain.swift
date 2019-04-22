import XCTest

import thirdAppTests

var tests = [XCTestCaseEntry]()
tests += thirdAppTests.allTests()
XCTMain(tests)