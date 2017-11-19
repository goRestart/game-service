import CoreService

public struct GameServiceFactory {
  
  public init() {}
  
  public func make() -> GameService {
    return GameServiceApiClient(
      client: resolver.client,
      gameMapper: resolver.gameMapper,
      gameConsoleMapper: resolver.gameConsoleMapper
    )
  }
}
