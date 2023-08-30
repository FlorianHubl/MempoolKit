
import Foundation

public struct ChannelTXID: Codable {
    let inputs: Inputs
    let outputs: [String: Output]
    
    struct Inputs: Codable {
    }
    
    struct Output: Codable {
        let id, short_id: String
        let capacity: Int
        let transaction_id: String
        let transaction_vout: Int
        let closing_transaction_id: String?
        let closing_fee: Int
        let closing_reason: Int?
        let closing_date: String?
        let updated_at: String
        let created: String
        let status: Int
        let funding_ratio: Double
        let closed_by: String?
        let single_funded: Bool
        let node_left, node_right: Node
    }
    
    struct Node: Codable {
        let alias, public_key: String
        let base_fee_mtokens, cltv_delta, fee_rate, is_disabled: Int?
        let max_htlc_mtokens, min_htlc_mtokens: Int?
        let updated_at: String?
        let funding_balance, closing_balance: Int
    }
}


public typealias ChannelTXIDs = [ChannelTXID]
