import XCTest
import CoreTesting
import Testing
import Vapor
@testable import App

final class SearchControllerSpec: XCTestDatabasePreparations  {
  
  override func setUp() {
    super.setUp()
    
    prepare(
      Droplet.testable()
    )
  }
  
  func test_should_return_missing_parameters_if_search_query_is_not_set() throws {
    let request = Request(
      method: .get,
      uri: "/search"
    )
    
    try droplet
      .testResponse(to: request)
      .assertResponse(is: .missingParameters)
  }
  
  func test_should_return_missing_parameters_if_search_query_is_empty() throws {
    let request = Request(
      method: .get,
      uri: "/search?query= "
    )
    
    try droplet
      .testResponse(to: request)
      .assertResponse(is: .missingParameters)
  }
  
  func todo_test_should_return_ok_if_game_was_found() throws {
    try givenGame(named: "Mario Galaxy")
    
    let request = Request(
      method: .get,
      uri: "/search?query=mario galaxy"
    )
    
    try droplet
      .testResponse(to: request)
      .assertStatus(is: .ok)
  }
}

// MARK: - Manifest

extension SearchControllerSpec {
  static let allTests = [
    ("test_should_return_missing_parameters_if_search_query_is_not_set", test_should_return_missing_parameters_if_search_query_is_not_set),
    ("test_should_return_missing_parameters_if_search_query_is_empty", test_should_return_missing_parameters_if_search_query_is_empty)
  ]
}
