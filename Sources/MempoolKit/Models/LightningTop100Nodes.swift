
import Foundation

public struct LightningTop100Nodes: Codable {
    let topByCapacity: [TopByCapacity]
    let topByChannels: [TopByChannel]
    
    struct TopByCapacity: Codable {
        let publicKey, alias: String
        let capacity: Int
    }
    
    struct TopByChannel: Codable {
        let publicKey, alias: String
        let channels: Int
        let city: Country?
        let country: Country
        let iso_code: String
        let subdivision: String?
    }
}
