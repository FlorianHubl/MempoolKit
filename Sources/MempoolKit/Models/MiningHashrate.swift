
import Foundation

public struct MiningPoolHashrate: Codable {
    public let timestamp: Int
    public let avgHashrate, share: Double
    public let poolName: String
}

public typealias MiningPoolHashrates = [MiningPoolHashrate]
