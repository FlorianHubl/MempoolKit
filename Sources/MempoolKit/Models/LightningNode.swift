
import Foundation

public struct LightningNodes: Codable {
    let nodes: [Node]
    let channels: [Channel]
    
    struct Channel: Codable {
        let id, short_id: String
        let capacity, status: Int
    }
    
    struct Node: Codable {
        let public_key, alias: String
        let capacity, channels: Int?
        let status: Int
    }
}

