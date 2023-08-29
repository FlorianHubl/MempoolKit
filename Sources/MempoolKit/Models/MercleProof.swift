
import Foundation

public struct MercleProof: Codable {
    let block_height: Int
    let merkle: [String]
    let pos: Int
}

