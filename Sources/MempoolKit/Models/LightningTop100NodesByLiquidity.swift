
import Foundation

public struct LightningTop100NodesByLiquidity: Codable {
    let publicKey, alias: String
    let capacity, channels, firstSeen, updatedAt: Int
    let city, country: Country?
    let iso_code, subdivision: String?
}

