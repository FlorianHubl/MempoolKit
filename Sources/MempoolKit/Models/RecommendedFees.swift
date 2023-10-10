
import Foundation

public struct RecommendedFees: Codable {
    public let fastestFee, halfHourFee, hourFee, economyFee, minimumFee: Double
    public let demo = RecommendedFees(fastestFee: 11, halfHourFee: 7, hourFee: 3, economyFee: 2, minimumFee: 1)
    public init(fastestFee: Double, halfHourFee: Double, hourFee: Double, economyFee: Double, minimumFee: Double) {
        self.fastestFee = fastestFee
        self.halfHourFee = halfHourFee
        self.hourFee = hourFee
        self.economyFee = economyFee
        self.minimumFee = minimumFee
    }
}

