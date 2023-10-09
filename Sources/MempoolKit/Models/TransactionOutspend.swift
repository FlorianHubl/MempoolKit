
import Foundation

public struct TransactionOutspend: Codable {
    public let spent: Bool
    public let txid: String?
    public let vin: Int?
    public let status: Status?
    
    init(spent: Bool, txid: String?, vin: Int?, status: Status?) {
        self.spent = spent
        self.txid = txid
        self.vin = vin
        self.status = status
    }
    
    public struct Status: Codable {
        public let confirmed: Bool
        public let block_height: Int
        public let block_hash: String
        public let block_time: Int
        
        init(confirmed: Bool, block_height: Int, block_hash: String, block_time: Int) {
            self.confirmed = confirmed
            self.block_height = block_height
            self.block_hash = block_hash
            self.block_time = block_time
        }
    }
}

public typealias TransactionOutspends = [TransactionOutspend]


