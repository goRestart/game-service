import Fluent

struct GetGameConsoleListTask {
  
  func execute() throws -> [GameConsoleDiskModel] {
    return try GameConsoleDiskModel.all()
  }
}
