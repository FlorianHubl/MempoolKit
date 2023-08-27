
import Foundation

struct DifficultyAdjustment: Codable {
    let progressPercent, difficultyChange: Double
    let estimatedRetargetDate, remainingBlocks, remainingTime: Int
    let previousRetarget: Double
    let nextRetargetHeight, timeAvg, timeOffset: Int
}
