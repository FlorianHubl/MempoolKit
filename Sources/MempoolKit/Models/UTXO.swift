
import Foundation

public struct UTXO: Codable {
    let txid: String
    let vout: Int
    let status: Status
    let value: Int
    
    struct Status: Codable {
        let confirmed: Bool
        let block_height: Int?
        let block_hash: String?
        let block_time: Int?
    }
}

public typealias UTXOs = [UTXO]
