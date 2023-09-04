
import Foundation

public struct TransactionOutspend: Codable {
    public let spent: Bool
    public let txid: String?
    public let vin: Int?
    public let status: Status?
    
    public struct Status: Codable {
        public let confirmed: Bool
        public let block_height: Int
        public let block_hash: String
        public let block_time: Int
    }
}

public typealias TransactionOutspends = [TransactionOutspend]


