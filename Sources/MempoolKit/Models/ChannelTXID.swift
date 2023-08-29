
import Foundation

public struct ChannelTXID: Codable {
    let inputs: Inputs
    let outputs: Outputs
    
    struct Inputs: Codable {
    }
    
    struct Outputs: Codable {
        let the1: The1
    }
    
    struct The1: Codable {
        let id, short_id: String
        let capacity: Int
        let transaction_id: String
        let transaction_vout: Int
        let closing_transaction_id: String
        let closing_fee, closing_reason: Int
        let closing_date, updated_at, created: String
        let status: Int
        let funding_ratio: Double
//        let closedBy: ?
        let single_funded: Bool
        let node_left, node_right: Node
    }
    
    struct Node: Codable {
        let alias, public_key: String
        let base_fee_mtokens, cltv_delta, fee_rate, is_disabled: Int
        let max_htlc_mtokens, min_htlc_mtokens: Int
        let updated_at: String
        let funding_balance, closing_balance: Int
    }
}

public typealias ChannelTXIDs = [ChannelTXID]



