import App
import CoreService
import HTTP

public protocol GameService {
  func getGame(by id: Identifier<Game>) throws -> GameResponse<Game, Response>
  func getGameConsole(by id: Identifier<GameConsole>) throws -> GameResponse<GameConsole, Response>
}
