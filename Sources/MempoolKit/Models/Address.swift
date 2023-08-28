
import Foundation

public struct Address: Codable {
    let address: String
    let chain_stats, mempool_stats: Stats
    
    struct Stats: Codable {
        let funded_txo_count, funded_txo_sum, spent_txo_count, spent_txo_sum: Int
        let tx_count: Int
    }
}

