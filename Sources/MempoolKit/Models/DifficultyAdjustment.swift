
import Foundation

/// All Details about the difficulty adjustment: progressPercent, difficultyChange, estimatedRetargetDate, remainingBlocks, remainingTime, previousRetarget, nextRetargetHeight, timeAvg, timeOffset
public struct DifficultyAdjustment: Codable {
    public let progressPercent, difficultyChange: Double
    public let estimatedRetargetDate, remainingBlocks, remainingTime: Int
    public let previousRetarget: Double
    public let nextRetargetHeight, timeAvg, timeOffset: Int
}
