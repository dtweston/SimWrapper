import Foundation
import SwiftUI

public struct ModelData {
    static func load<T>(name: String, extension ext: String = "json") -> T where T: Decodable {
        guard let url = Bundle.main.url(forResource: name, withExtension: ext) else {
            fatalError("Unable to find \(name).\(ext) resource in main bundle")
        }
        
        let data: Data
        do {
            data = try Data(contentsOf: url)
        } catch {
            fatalError("Unable to read \(name).\(ext) from main bundle\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            let typeSafeData = try decoder.decode([String: T].self, from: data)
            return typeSafeData[name]!
        } catch {
            fatalError("Unable to parse \(name).\(ext) as \(T.self)\n\(error)")
        }
    }
    
    public static var runtimes: [Runtime] = load(name: "runtimes")
}

public struct DeviceType {
    let name: String
    let bundlePath: String
    let identifier: String
}

public struct Runtime: Codable, Identifiable {
    public var id: ID {
        get { return identifier }
        set { identifier = newValue }
    }
    
    public typealias ID = String
    
    let version: String
    let bundlePath: String
    let isAvailable: Bool
    let name: String
    var identifier: String
    let buildversion: String
}

public struct Device {
    let state: String
    let isAvailable: Bool
    let name: String
    let udid: String
}
