// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 02/03/20.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

/// Class that exists on the Swift/Catalyst side of the bridge, and loads the plugin.

public class SparkleBridgeClient {
    
    public class func load(with bridge: SparkleBridge) -> Result<SparkleBridgePlugin, NSError> {
        let bundle = Bundle(for: SparkleBridgeClient.self)
        if let pluginURL = bundle.url(forResource: "SparkleBridge", withExtension: "bundle"), let bundle = Bundle(url: pluginURL) {
            if let cls = bundle.principalClass as? NSObject.Type {
                if let instance = cls.init() as? SparkleBridgePlugin {
                    do {
                        try instance.setup(with: bridge)
                        return .success(instance)
                    } catch {
                        return .failure(error as NSError)
                    }
                }
            }
        }
        
        return .failure(.pluginNotLoaded)
    }

}

/// SparkleDriver Errors

public extension NSError {
    static let SparkleDriverSuite = "SparkleDriver"
    static let PluginNotLoadedCode = 1000
    
    static var pluginNotLoaded: NSError { return NSError(domain: SparkleDriverSuite, code: PluginNotLoadedCode, userInfo: nil) }
}


