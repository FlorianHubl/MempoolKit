
import Foundation

public struct MercleProof: Codable {
    public let block_height: Int
    public let merkle: [String]
    public let pos: Int
}

