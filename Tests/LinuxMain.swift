#if os(Linux)

import XCTest
@testable import AppTests

XCTMain([
	testCase(GameControllerSpec.allTests),
	testCase(SearchControllerSpec.allTests),
	testCase(GameConsoleControllerSpec.allTests)
])

#endif
