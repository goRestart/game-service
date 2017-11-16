#if os(Linux)

import XCTest
@testable import AppTests

XCTMain([
	testCase(GameConsoleControllerSpec.allTests)
])

#endif
