
import Foundation

public struct LightningHistoricalNodeStatistic: Codable {
    let added, capacity, channels: Int
}

public typealias LightningHistoricalNodeStatistics = [LightningHistoricalNodeStatistic]


