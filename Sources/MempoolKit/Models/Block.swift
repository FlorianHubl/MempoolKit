import Foundation

public struct Block: Codable, Identifiable, Hashable {
    public let id: String
    public let height, version, timestamp, tx_count: Int
    public let size, weight: Int
    public let merkle_root: String
    public let previousblockhash: String? // nil at genisis block
    public let mediantime, nonce, bits: Int
    public let difficulty: Double
    public let extras: Extras?
    
    public struct Extras: Codable, Hashable {
        public let totalFees: Int
        public let medianFee: Int
        public let feeRange: [Double]?
        public let reward: Int
        public let pool: Pool
        public let avgFee: Int
        public let avgFeeRate: Int
        public let coinbaseRaw: String
        public let coinbaseAddress: String?
        public let coinbaseSignature: String
        public let coinbaseSignatureAscii: String
        public let avgTxSize: Double
        public let totalInputs: Int
        public let totalOutputs: Int
        public let totalOutputAmt: Int
        public let medianFeeAmt: Int
        public let feePercentiles: [Int]?
        public let segwitTotalTxs: Int
        public let segwitTotalSize: Int
        public let segwitTotalWeight: Int
        public let header: String
        public let utxoSetChange: Int
        public let utxoSetSize: Int?
        public let totalInputAmt: Int?
        public let virtualSize: Double
        
        // orphans ?
        
        // matchRate ? can be nil
        
        public let expectedFees: Int?
        public let expectedWeight: Int?
        
    }
    
    public struct Pool: Codable, Hashable {
        public let id: Int
        public let name: String
        public let slug: String
    }
}

public typealias Blocks = [Block]
