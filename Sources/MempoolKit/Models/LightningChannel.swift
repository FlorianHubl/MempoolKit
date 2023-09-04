
import Foundation

public struct LightningChannel: Codable {
    public let id, short_id: String
    public let capacity: Int
    public let transaction_id: String
    public let transaction_vout: Int
    public let closing_transaction_id: String?
    public let closing_fee: Int
    public let closing_reason: String?
    public let closing_date: String?
    public let updated_at, created: String
    public let status: Int
//  fundingRatio, closedBy
    public let singleFunded: Bool?
    public let node_left, node_right: Node
    
    public struct Node: Codable {
        public let alias: String
        public let public_key: String
        public let channels, capacity, base_fee_mtokens, cltv_delta: Int
        public let fee_rate, is_disabled, max_htlc_mtokens, min_htlc_mtokens: Int
        public let updated_at: String
        public let longitude, latitude: Double
        public let funding_balance, closing_balance: Int
    }
}

