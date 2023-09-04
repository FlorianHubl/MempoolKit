import Foundation

public struct MiningRewardStats: Codable {
    public let startBlock, endBlock: Int
    public let totalReward, totalFee, totalTx: String
}
