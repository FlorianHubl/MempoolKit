
import Foundation

public struct LightningChannelFromNodePubkey: Codable {
    let status: Int
    //    let closingReason, closingDate: ?
    let capacity: Int
    let shortID, id: String
    let feeRate: Int
    let node: Node
    
    struct Node: Codable {
        let alias, publicKey: String
        let channels: Int
        let capacity: String
    }
}


