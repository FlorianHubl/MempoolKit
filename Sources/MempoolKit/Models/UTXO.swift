
import Foundation

public struct UTXO: Codable {
    public let txid: String
    public let vout: Int
    public let status: Status
    public let value: Int
    
    public static let demo = UTXO(txid: "txid", vout: 21, status: Status(confirmed: true, block_height: 800000, block_hash: "block_hash", block_time: 800000), value: 21)
    
    public struct Status: Codable {
        public let confirmed: Bool
        public let block_height: Int?
        public let block_hash: String?
        public let block_time: Int?
    }
}

public typealias UTXOs = [UTXO]
