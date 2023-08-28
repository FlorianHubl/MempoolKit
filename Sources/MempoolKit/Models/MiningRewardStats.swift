import Foundation

public struct MiningRewardStats: Codable {
    let startBlock, endBlock: Int
    let totalReward, totalFee, totalTx: String
}
