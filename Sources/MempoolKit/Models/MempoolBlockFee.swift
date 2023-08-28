import Foundation

public struct MempoolBlockFee: Codable {
    let blockSize: Int
    let blockVSize: Double
    let nTx, totalFees: Int
    let medianFee: Double
    let feeRange: [Double]
}

public typealias MempoolBlockFees = [MempoolBlockFee]

