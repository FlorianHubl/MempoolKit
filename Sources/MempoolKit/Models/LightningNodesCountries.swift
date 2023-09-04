
import Foundation

public struct LightningNodesSingleCountry: Codable {
    public let name: Name
    public let iso: String
    public let count: Int
    public let share: Double
    public let capacity: String?
    
    public struct Name: Codable {
        public let de, en, es, fr: String
        public let ja, ru: String
        // zhCN and ptBR not supported
    }
}

public typealias LightningNodesCountries = [LightningNodesSingleCountry]

