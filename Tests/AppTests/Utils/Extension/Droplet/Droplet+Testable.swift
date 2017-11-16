import Vapor
import CoreService
@testable import App

public extension Droplet {
  public static func testable() -> Droplet {
    let config = try! Config(arguments: ["vapor", "--env=test"])
    try! config.setup()
    return resolver.makeApplication(with: config)
  }
}
