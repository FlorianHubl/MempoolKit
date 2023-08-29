
import Foundation

public struct TransactionOutspend: Codable {
    let spent: Bool
    let txid: String?
    let vin: Int?
    let status: Status?
    
    struct Status: Codable {
        let confirmed: Bool
        let block_height: Int
        let block_hash: String
        let block_time: Int
    }
}

public typealias TransactionOutspends = [TransactionOutspend]


