
import Foundation

public struct LightningStatistic: Codable {
    public let added, channel_count, total_capacity, tor_nodes, clearnet_nodes, unannounced_nodes, clearnet_tor_nodes: Int
}

public typealias LightningStatistics = [LightningStatistic]
