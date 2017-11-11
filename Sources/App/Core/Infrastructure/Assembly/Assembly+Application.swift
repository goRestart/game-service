import CoreService
import Vapor

extension Assembly {
  public var application: Droplet {
    let droplet =  try! Droplet(config)
    try! droplet.collection(gameRouteCollection)
    return droplet
  }
  
  var config: Config {
    let config = try! Config()
    try! config.setup()
    return config
  }
}
