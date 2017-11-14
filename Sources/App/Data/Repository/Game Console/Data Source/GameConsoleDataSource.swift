import CoreService

protocol GameConsoleDataSource {
  func getBy(_ identifier: Identifier<GameConsole>) throws -> GameConsole
  func getAll() throws -> [GameConsole]
}
