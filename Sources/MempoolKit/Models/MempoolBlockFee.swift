import Foundation

public struct MempoolBlockFee: Codable {
    public let blockSize: Int
    public let blockVSize: Double
    public let nTx, totalFees: Int
    public let medianFee: Double
    public let feeRange: [Double]
}

public typealias MempoolBlockFees = [MempoolBlockFee]

