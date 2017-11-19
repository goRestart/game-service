import CoreService
import Vapor
import App
import JSON

struct GameServiceApiClient: GameService {
  
  private let client: ClientProtocol
  private let gameMapper: GameMapper
  private let gameConsoleMapper: GameConsoleMapper

  init(client: ClientProtocol,
       gameMapper: GameMapper,
       gameConsoleMapper: GameConsoleMapper)
  {
    self.client = client
    self.gameMapper = gameMapper
    self.gameConsoleMapper = gameConsoleMapper
  }

  func getGame(by id: CoreService.Identifier<Game>) throws -> GameResponse<Game, Response> {
    let response = try client.get("/\(id.value)")
    
    guard let bytes = response.body.bytes, response.status == .ok else {
      return GameResponse(raw: response)
    }
    
    let game = try gameMapper.map(
      try JSON(bytes: bytes).object
    )
    
    return GameResponse(
      value: game,
      raw: response
    )
  }
  
  func getGameConsole(by id: CoreService.Identifier<GameConsole>) throws -> GameResponse<GameConsole, Response> {
    let response = try client.get("/game-console/\(id.value)")
    
    guard let bytes = response.body.bytes, response.status == .ok else {
      return GameResponse(raw: response)
    }
 
    let gameConsole = try gameConsoleMapper.map(
      try JSON(bytes: bytes).object
    )

    return GameResponse(
      value: gameConsole,
      raw: response
    )
  }
}
