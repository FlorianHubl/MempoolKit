
import Foundation

/// All Details about the difficulty adjustment: progressPercent, difficultyChange, estimatedRetargetDate, remainingBlocks, remainingTime, previousRetarget, nextRetargetHeight, timeAvg, timeOffset
public struct DifficultyAdjustment: Codable {
    let progressPercent, difficultyChange: Double
    let estimatedRetargetDate, remainingBlocks, remainingTime: Int
    let previousRetarget: Double
    let nextRetargetHeight, timeAvg, timeOffset: Int
}
