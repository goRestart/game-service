import Foundation
import CoreService

public struct GameSearchResult: Codable {
  public let id: Identifier<Game>
  public let value: String
  public let query: String
}
