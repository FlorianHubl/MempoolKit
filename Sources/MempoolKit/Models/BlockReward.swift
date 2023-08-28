
import Foundation

public struct BlockReward: Codable {
    let avgHeight, timestamp, avgRewards: Int
    let USD: Double
}

public typealias BlockRewards = [BlockReward]

