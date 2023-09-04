
import Foundation

public struct LightningTop100NodesByLiquidity: Codable {
    public let publicKey, alias: String
    public let capacity, channels, firstSeen, updatedAt: Int
    public let city, country: Country?
    public let iso_code, subdivision: String?
}

