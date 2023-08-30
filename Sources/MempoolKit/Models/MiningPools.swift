import Foundation

/// Information about the Bitcoin Mining Pools
public struct MiningPools: Codable {
    let pools: [Pool]
    let blockCount: Int
    let lastEstimatedHashrate: Double
    
    struct Pool: Codable {
        let poolId: Int
        let name: String
        let link: String
        let blockCount, rank, emptyBlocks: Int
        let slug: String
        let avgMatchRate: Double?
        let avgFeeDelta: String?
        let poolUniqueId: Int
    }
}

