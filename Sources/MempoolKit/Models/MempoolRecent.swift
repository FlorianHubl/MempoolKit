
import Foundation

public struct MempoolRecent: Codable {
    let txid: String
    let fee, vsize, value: Int
}

public typealias MempoolRecents = [MempoolRecent]
