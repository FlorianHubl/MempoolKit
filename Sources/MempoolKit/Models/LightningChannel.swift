
import Foundation

public struct LightningChannel: Codable {
    let id, short_id: String
    let capacity: Int
    let transaction_id: String
    let transaction_vout: Int
    let closing_transaction_id: String
    let closing_fee, closing_reason: Int
    let closing_date, updated_at, created: String
    let status: Int
//    let fundingRatio, closedBy: JSONNull?
    let singleFunded: Bool
    let node_left, node_right: Node
    
    struct Node: Codable {
        let alias, public_key: String
        let channels, capacity, base_fee_mtokens, cltv_delta: Int
        let fee_rate, is_disabled, max_htlc_mtokens, min_htlc_mtokens: Int
        let updated_at: String
        let longitude, latitude: Double
        let funding_balance, closing_balance: Int
    }
}
