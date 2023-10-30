
import Foundation

public struct LightningNodes: Codable {
    public let nodes: [Node]
    public let channels: [Channel]
    
    public struct Channel: Codable {
        public let id, short_id: String
        public let capacity, status: Int
    }
    
    public struct Node: Codable {
        public let public_key, alias: String
        public let capacity, channels: Int?
        public let status: Int
        public let color, sockets: String
    }
}

