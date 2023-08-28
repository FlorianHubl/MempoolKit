
import Foundation

public struct BlockFee: Codable {
    let avgHeight, timestamp, avgFees: Int
    let USD: Double
}

public typealias BlockFees = [BlockFee]

