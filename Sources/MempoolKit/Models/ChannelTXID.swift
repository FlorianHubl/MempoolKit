
import Foundation

public struct ChannelTXID: Codable {
    public let inputs: Inputs
    public let outputs: [String: Output]
    
    public struct Inputs: Codable {
    }
    
    public struct Output: Codable {
        public let id, short_id: String
        public let capacity: Int
        public let transaction_id: String
        public let transaction_vout: Int
        public let closing_transaction_id: String?
        public let closing_fee: Int
        public let closing_reason: Int?
        public let closing_date: String?
        public let updated_at: String
        public let created: String
        public let status: Int
        public let funding_ratio: Double
        public let closed_by: String?
        public let single_funded: Bool
        public let node_left, node_right: Node
    }
    
    public struct Node: Codable {
        public let alias, public_key: String
        public let base_fee_mtokens, cltv_delta, fee_rate, is_disabled: Int?
        public let max_htlc_mtokens, min_htlc_mtokens: Int?
        public let updated_at: String?
        public let funding_balance, closing_balance: Int
    }
}


public typealias ChannelTXIDs = [ChannelTXID]
