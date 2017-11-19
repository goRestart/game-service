import Vapor
import CoreService

extension Assembly {
  var client: ClientProtocol {
    return try! EngineClient
      .factory
      .makeClient(
        hostname: "game.restart-api.com",
        port: 80,
        securityLayer: .none,
        proxy: nil
    )
  }
}
