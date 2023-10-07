
import Foundation

public struct UTXO: Codable {
    public let txid: String
    public let vout: Int
    public let status: Status
    public let value: Int
    
    public init(txid: String, vout: Int, status: Status, value: Int) {
        self.txid = txid
        self.vout = vout
        self.status = status
        self.value = value
    }
    
    public static let demo = UTXO(txid: "txid", vout: 21, status: Status(confirmed: true, block_height: 800000, block_hash: "block_hash", block_time: 800000), value: 21)
    
    public struct Status: Codable {
        public let confirmed: Bool
        public let block_height: Int?
        public let block_hash: String?
        public let block_time: Int?
        
        public init(confirmed: Bool, block_height: Int?, block_hash: String?, block_time: Int?) {
            self.confirmed = confirmed
            self.block_height = block_height
            self.block_hash = block_hash
            self.block_time = block_time
        }
    }
}

public typealias UTXOs = [UTXO]
