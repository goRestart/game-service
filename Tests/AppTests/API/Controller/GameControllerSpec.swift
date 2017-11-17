import XCTest
import CoreTesting
import Testing
import Vapor
@testable import App

final class GameControllerSpec: XCTestDatabasePreparations  {
  
  override func setUp() {
    super.setUp()
    
    prepare(
      Droplet.testable()
    )
  }
  
  func test_should_return_missing_parameters_for_game_by_id_endpoint_if_uuid_is_wrong() throws {
    let request = Request(
      method: .get,
      uri: "/123"
    )
    
    try droplet
      .testResponse(to: request)
      .assertResponse(is: .missingParameters)
  }
  
  func test_should_not_found_if_game_was_not_found() throws {
    let request = Request(
      method: .get,
      uri: "/099EBEC1-93A4-4B9E-B738-938B2D996414"
    )
    
    try droplet
      .testResponse(to: request)
      .assertResponse(is: .invalidGameConsoleId)
  }
}

// MARK: - Manifest

extension GameControllerSpec {
  static let allTests = [
    ("test_should_return_missing_parameters_for_game_by_id_endpoint_if_uuid_is_wrong", test_should_return_missing_parameters_for_game_by_id_endpoint_if_uuid_is_wrong),
    ("test_should_not_found_if_game_was_not_found", test_should_not_found_if_game_was_not_found)
  ]
}
