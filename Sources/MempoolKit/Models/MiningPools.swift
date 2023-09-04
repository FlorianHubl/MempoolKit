import Foundation

/// Information about the Bitcoin Mining Pools
public struct MiningPools: Codable {
    public let pools: [Pool]
    public let blockCount: Int
    public let lastEstimatedHashrate: Double
    
    public struct Pool: Codable {
        public let poolId: Int
        public let name: String
        public let link: String
        public let blockCount, rank, emptyBlocks: Int
        public let slug: String
        public let avgMatchRate: Double?
        public let avgFeeDelta: String?
        public let poolUniqueId: Int
    }
}

