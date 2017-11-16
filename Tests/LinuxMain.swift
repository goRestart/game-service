#if os(Linux)

import XCTest
@testable import AppTests

XCTMain([
	testCase(SearchControllerSpec.allTests),
	testCase(GameConsoleControllerSpec.allTests)
])

#endif
