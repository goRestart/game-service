import XCTest
import CoreTesting
import Testing
import Vapor
@testable import App

final class GameConsoleControllerSpec: XCTestDatabasePreparations  {
  
  override func setUp() {
    super.setUp()
    
    prepare(
      Droplet.testable()
    )
  }
  
  func test_all_game_console_endpoint_returns_ok() throws {
    let request = Request(
      method: .get,
      uri: "/game-console"
    )
    
    try droplet
      .testResponse(to: request)
      .assertStatus(is: .ok)
  }
  
  func test_should_return_missing_parameters_for_game_console_by_id_endpoint_if_uuid_is_wrong() throws {
    let request = Request(
      method: .get,
      uri: "/game-console/123"
    )
    
    try droplet
      .testResponse(to: request)
      .assertResponse(is: .missingParameters)
  }
  
  func test_should_return_not_found_if_game_console_id_was_not_found() throws {
    let request = Request(
      method: .get,
      uri: "/game-console/099EBEC1-93A4-4B9E-B738-938B2D996414"
    )
    
    try droplet
      .testResponse(to: request)
      .assertResponse(is: .invalidGameConsoleId)
  }
  
  func test_should_return_ok_if_game_console_was_found() throws {
    let gameConsoleId = try givenGameConsole()
    
    let request = Request(
      method: .get,
      uri: "/game-console/\(gameConsoleId.value)"
    )
    
    try droplet
      .testResponse(to: request)
      .assertStatus(is: .ok)
  }
}

// MARK: - Manifest

extension GameConsoleControllerSpec {
  static let allTests = [
    ("test_all_game_console_endpoint_returns_ok", test_all_game_console_endpoint_returns_ok),
    ("test_should_return_missing_parameters_for_game_console_by_id_endpoint_if_uuid_is_wrong", test_should_return_missing_parameters_for_game_console_by_id_endpoint_if_uuid_is_wrong),
    ("test_should_return_not_found_if_game_console_id_was_not_found", test_should_return_not_found_if_game_console_id_was_not_found),
    ("test_should_return_ok_if_game_console_was_found", test_should_return_ok_if_game_console_was_found)
  ]
}
