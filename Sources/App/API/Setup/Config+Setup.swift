import FluentProvider
import PostgreSQLProvider

extension Config {
  public func setup() throws {
    Node.fuzzy = [Row.self, JSON.self, Node.self]

    try setupProviders()
    try setupPreparations()
  }
  
  // MARK: - Providers
  
  private func setupProviders() throws {
    try addProvider(FluentProvider.Provider.self)
    try addProvider(PostgreSQLProvider.Provider.self)
  }
  
  // MARK: - Preparations
  
  private func setupPreparations() throws {
    preparations = [
      ManufacturerDiskModel.self,
      GameConsoleDiskModel.self,
      GenreDiskModel.self,
      AlternativeNameDiskModel.self,
      GameDiskModel.self,
      
      /* Relations - Pivots */
      
      Pivot<GameDiskModel, AlternativeNameDiskModel>.self,
      Pivot<GameDiskModel, GameConsoleDiskModel>.self,
      Pivot<GameDiskModel, GenreDiskModel>.self
    ]
  }
}

