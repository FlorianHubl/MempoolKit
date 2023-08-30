
import Foundation

public struct LightningNodesSingleCountry: Codable {
    let name: Name
    let iso: String
    let count: Int
    let share: Double
    let capacity: String?
    
    struct Name: Codable {
        let de, en, es, fr: String
        let ja, ru: String
        // zhCN and ptBR not supported
    }
}

public typealias LightningNodesCountries = [LightningNodesSingleCountry]

