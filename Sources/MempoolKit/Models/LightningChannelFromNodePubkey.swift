
import Foundation

public struct LightningChannelFromNodePubkey: Codable {
    public let status: Int
    //    public let closingReason, closingDate: ?
    public let capacity: Int
    public let shortID, id: String
    public let feeRate: Int
    public let node: Node
    
    public struct Node: Codable {
        public let alias, publicKey: String
        public let channels: Int
        public let capacity: String
    }
}


