
import Foundation

public struct LightningNodesCountry: Codable {
    public let country: Country
    public let nodes: [Node]
}
public struct Node: Codable {
    public let public_key: String
    public let capacity, channels: Int
    public let alias: String
    public let first_seen: Int
    public let updated_at: Int?
    public let city: Country?
    public let country: Country?
    public let iso_code: String
    public let subdivision: Country?
    public let longitude, latitude: Double
    public let as_number: Int?
    public let isp: String?
}

public struct Country: Codable {
    public let de: String?
    public let en: String?
    //        public let es, fr, ja, ptBR: String?
    //        public let ru, zhCN: String?
    //        enum CodingKeys: String, CodingKey {
    //            case de, en, es, fr, ja
    //            case ptBR = "pt-BR"
    //            case ru
    //            case zhCN = "zh-CN"
    //        }
}



