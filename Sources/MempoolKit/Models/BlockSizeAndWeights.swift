
import Foundation

public struct BlockSizeAndWeights: Codable {
    let sizes: [Size]
    let weights: [Weight]
    
    struct Size: Codable {
        let avgHeight, timestamp, avgSize: Int
    }
    
    struct Weight: Codable {
        let avgHeight, timestamp, avgWeight: Int
    }
}

