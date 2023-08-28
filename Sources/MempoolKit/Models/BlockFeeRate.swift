import Foundation

public struct BlockFeeRate: Codable {
    let avgHeight, timestamp, avgFee_0, avgFee_10, avgFee_25, avgFee_50, avgFee_75, avgFee_90, avgFee_100: Int
}

public typealias BlockFeeRates = [BlockFeeRate]
