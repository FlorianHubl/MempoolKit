
import Foundation

public struct LightningNodeStatisticPerISP: Codable {
    let clearnetCapacity, torCapacity, unknownCapacity: Int
    let ispRanking: [[ISPRanking]]
    
    enum ISPRanking: Codable {
        case integer(Int)
        case string(String)
        
        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let x = try? container.decode(Int.self) {
                self = .integer(x)
                return
            }
            if let x = try? container.decode(String.self) {
                self = .string(x)
                return
            }
            throw DecodingError.typeMismatch(ISPRanking.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for ISPRanking"))
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .integer(let x):
                try container.encode(x)
            case .string(let x):
                try container.encode(x)
            }
        }
    }
}

