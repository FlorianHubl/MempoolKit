
import Foundation

public struct BlockReward: Codable {
    public let avgHeight, timestamp, avgRewards: Int
    public let USD: Double
}

public typealias BlockRewards = [BlockReward]

