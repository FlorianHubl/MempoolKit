
import Foundation

public struct MempoolStatistic: Codable {
    public let count, vsize, total_fee: Int
    public let fee_histogram: [[Double]]
}

