
import Foundation

public struct TransactionStatus: Codable {
    public let confirmed: Bool
    public let block_height: Int?
    public let block_hash: String?
    public let block_time: Int?
}

