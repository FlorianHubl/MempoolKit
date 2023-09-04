import Foundation

/// Information about a Bitcoin Mining Pool
public struct MiningPool: Codable {
    public let pool: Pool
    public let blockCount, blockShare: Block
    public let estimatedHashrate: Double
    public let reportedHashrate: String?
    public let avgBlockHealth: Double
    public let totalReward: String
    
    public struct Block: Codable {
        public let all: Double
        
        // ?
        
//        public let 24h: Double?
//        public let 1w: Double?
    }
    
    public struct Pool: Codable {
        public let id: Int
        public let name: String
        public let link: String
        public let addresses, regexes: [String]
        public let slug: String
        public let unique_id: Int
    }
}

