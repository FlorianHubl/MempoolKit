
import Foundation

public struct MempoolStatistic: Codable {
    let count, vsize, total_fee: Int
    let fee_histogram: [[Double]]
}

