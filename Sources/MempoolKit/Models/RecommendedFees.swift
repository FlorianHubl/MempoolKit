
import Foundation

public struct RecommendedFees: Codable {
    public let fastestFee, halfHourFee, hourFee, economyFee, minimumFee: Double
    public init(fastestFee: Double, halfHourFee: Double, hourFee: Double, economyFee: Double, minimumFee: Double) {
        self.fastestFee = fastestFee
        self.halfHourFee = halfHourFee
        self.hourFee = hourFee
        self.economyFee = economyFee
        self.minimumFee = minimumFee
    }
}

