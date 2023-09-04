
import Foundation

public struct Hashrate: Codable {
    public let hashrates: [Hashrate]
    public let difficulty: [Difficulty]
    public let currentHashrate, currentDifficulty: Double
    
    public struct Difficulty: Codable {
        public let time, height: Int
        public let difficulty, adjustment: Double
    }
    
    public struct Hashrate: Codable {
        public let timestamp: Int
        public let avgHashrate: Double
    }
}

