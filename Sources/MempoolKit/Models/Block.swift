import Foundation

public struct Block: Codable {
    let id: String
    let height, version, timestamp, tx_count: Int
    let size, weight: Int
    let merkle_root: String
    let previousblockhash: String? // nil at genisis block
    let mediantime, nonce, bits: Int
    let difficulty: Double
    let extras: Extras?
    
    struct Extras: Codable {
        let totalFees: Int
        let medianFee: Int
        let feeRange: [Double]?
        let reward: Int
        let pool: Pool
        let avgFee: Int
        let avgFeeRate: Int
        let coinbaseRaw: String
        let coinbaseAddress: String
        let coinbaseSignature: String
        let coinbaseSignatureAscii: String
        let avgTxSize: Double
        let totalInputs: Int
        let totalOutputs: Int
        let totalOutputAmt: Int
        let medianFeeAmt: Int
        let feePercentiles: [Int]
        let segwitTotalTxs: Int
        let segwitTotalSize: Int
        let segwitTotalWeight: Int
        let header: String
        let utxoSetChange: Int
        let utxoSetSize: Int
        let totalInputAmt: Int
        let virtualSize: Double
        
        // orphans ?
        
        // matchRate ? can be nil
        
        let expectedFees: Int?
        let expectedWeight: Int?
        
    }
    
    struct Pool: Codable {
        let id: Int
        let name: String
        let slug: String
    }
}

public typealias Blocks = [Block]
