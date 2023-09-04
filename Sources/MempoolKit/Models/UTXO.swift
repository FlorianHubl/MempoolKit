
import Foundation

public struct UTXO: Codable {
    public let txid: String
    public let vout: Int
    public let status: Status
    public let value: Int
    
    public struct Status: Codable {
        public let confirmed: Bool
        public let block_height: Int?
        public let block_hash: String?
        public let block_time: Int?
    }
}

public typealias UTXOs = [UTXO]
