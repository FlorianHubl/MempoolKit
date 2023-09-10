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
    
    public static let demo = Block(id: "BlockID", height: 21000, version: 1, timestamp: 1, tx_count: 21, size: 1, weight: 1, merkle_root: "merkle_root", previousblockhash: "previousblockhash", mediantime: 1, nonce: 21, bits: 21, difficulty: 21, extras: .demo)
    
    public static let demoGenisis = Block(id: "BlockID", height: 0, version: 1, timestamp: 1, tx_count: 21, size: 1, weight: 1, merkle_root: "merkle_root", previousblockhash: "previousblockhash", mediantime: 1, nonce: 21, bits: 21, difficulty: 21, extras: .demo)
    
    public struct Extras: Codable, Hashable {
        public let totalFees: Int
        public let medianFee: Double
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
        public let medianFeeAmt: Int?
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
        
        public static let demo = Extras(totalFees: 21, medianFee: 21, feeRange: [1, 2, 3], reward: 21, pool: .init(id: 1, name: "Pool", slug: "Pool"), avgFee: 21, avgFeeRate: 21, coinbaseRaw: "coinbaseRaw", coinbaseAddress: "coinbaseAddress", coinbaseSignature: "coinbaseSignature", coinbaseSignatureAscii: "coinbaseSignatureAscii", avgTxSize: 21, totalInputs: 21, totalOutputs: 21, totalOutputAmt: 21, medianFeeAmt: 21, feePercentiles: [1, 2, 3], segwitTotalTxs: 21, segwitTotalSize: 21, segwitTotalWeight: 21, header: "header", utxoSetChange: 21, utxoSetSize: 21, totalInputAmt: 21, virtualSize: 21, expectedFees: 21, expectedWeight: 21)
        
    }
    
    public struct Pool: Codable, Hashable {
        public let id: Int
        public let name: String
        public let slug: String
    }
}

public typealias Blocks = [Block]
