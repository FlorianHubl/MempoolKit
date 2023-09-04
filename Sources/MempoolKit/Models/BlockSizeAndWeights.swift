
import Foundation

public struct BlockSizeAndWeights: Codable {
    public let sizes: [Size]
    public let weights: [Weight]
    
    public struct Size: Codable {
        public let avgHeight, timestamp, avgSize: Int
    }
    
    public struct Weight: Codable {
        public let avgHeight, timestamp, avgWeight: Int
    }
}

