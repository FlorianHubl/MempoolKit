
import Foundation

public struct LightningHistoricalNodeStatistic: Codable {
    public let added, capacity, channels: Int
}

public typealias LightningHistoricalNodeStatistics = [LightningHistoricalNodeStatistic]


