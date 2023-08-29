
import Foundation

public struct LightningNodesCountry: Codable {
    let country: Country
    let nodes: [Node]
}
public struct Node: Codable {
    let public_key: String
    let capacity, channels: Int
    let alias: String
    let first_seen, updated_at: Int
    let city: Country?
    let country: Country?
    let iso_code: String
    let subdivision: Country?
    let longitude, latitude: Double
    let as_number: Int?
    let isp: String?
}

public struct Country: Codable {
    let de: String?
    let en: String?
    //        let es, fr, ja, ptBR: String?
    //        let ru, zhCN: String?
    //        enum CodingKeys: String, CodingKey {
    //            case de, en, es, fr, ja
    //            case ptBR = "pt-BR"
    //            case ru
    //            case zhCN = "zh-CN"
    //        }
}



