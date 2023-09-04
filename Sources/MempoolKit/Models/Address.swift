
import Foundation

/// Information about a Bitcoin Address
public struct Address: Codable {
    public let address: String
    public let chain_stats, mempool_stats: Stats
    
    public static let demo = Address(address: "address", chain_stats: Stats(funded_txo_count: 21, funded_txo_sum: 21, spent_txo_count: 21, spent_txo_sum: 21, tx_count: 21), mempool_stats: Stats(funded_txo_count: 21, funded_txo_sum: 21, spent_txo_count: 21, spent_txo_sum: 21, tx_count: 21))
    
    public struct Stats: Codable {
        public let funded_txo_count, funded_txo_sum, spent_txo_count, spent_txo_sum: Int
        public let tx_count: Int
    }
}

