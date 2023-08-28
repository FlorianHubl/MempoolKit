import Foundation

/// Information about a Bitcoin Mining Pool
public struct MiningPool: Codable {
    let pool: Pool
    let blockCount, blockShare: Block
    let estimatedHashrate: Double
    let reportedHashrate: String?
    let avgBlockHealth: Double
    let totalReward: String
    
    struct Block: Codable {
        let all: Double
        
        // ?
        
//        let 24h: Double?
//        let 1w: Double?
    }
    
    struct Pool: Codable {
        let id: Int
        let name: String
        let link: String
        let addresses, regexes: [String]
        let slug: String
        let unique_id: Int
    }
}

