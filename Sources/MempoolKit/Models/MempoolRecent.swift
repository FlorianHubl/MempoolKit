
import Foundation

public struct MempoolRecent: Codable {
    public let txid: String
    public let fee, vsize, value: Int
}

public typealias MempoolRecents = [MempoolRecent]
