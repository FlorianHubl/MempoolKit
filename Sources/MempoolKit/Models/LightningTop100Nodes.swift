
import Foundation

public struct LightningTop100Nodes: Codable {
    public let topByCapacity: [TopByCapacity]
    public let topByChannels: [TopByChannel]
    
    public struct TopByCapacity: Codable {
        public let publicKey, alias: String
        public let capacity: Int
    }
    
    public struct TopByChannel: Codable {
        public let publicKey, alias: String
        public let channels: Int
        public let city: Country?
        public let country: Country
        public let iso_code: String
        public let subdivision: String?
    }
}
