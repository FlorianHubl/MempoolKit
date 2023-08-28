
import Foundation

public struct MiningPoolHashrate: Codable {
    let timestamp: Int
    let avgHashrate, share: Double
    let poolName: String
}

public typealias MiningPoolHashrates = [MiningPoolHashrate]
