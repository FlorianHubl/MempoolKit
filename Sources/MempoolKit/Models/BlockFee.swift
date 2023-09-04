
import Foundation

public struct BlockFee: Codable {
    public let avgHeight, timestamp, avgFees: Int
    public let USD: Double
}

public typealias BlockFees = [BlockFee]

