
import Foundation

public struct Hashrate: Codable {
    let hashrates: [Hashrate]
    let difficulty: [Difficulty]
    let currentHashrate, currentDifficulty: Double
    
    struct Difficulty: Codable {
        let time, height: Int
        let difficulty, adjustment: Double
    }
    
    struct Hashrate: Codable {
        let timestamp: Int
        let avgHashrate: Double
    }
}

