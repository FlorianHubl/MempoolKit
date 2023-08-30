
import Foundation

public struct LightningNodeStatistic: Codable {
    let public_key, alias: String
    let first_seen, updated_at: Int
    let color, sockets: String
    let city_id: Int?
    let as_number, country_id: Int
    let subdivision_id: Int?
    let longitude, latitude: Double
    let iso_code, as_organization: String
    let city: Country?
    let country: Country
    let subdivision: Subdivision?
    let features: [Feature]
    let featuresBits: String
    let active_channel_count: Int
    let capacity: String
    let opened_channel_count, closed_channel_count: Int
    let custom_records: CustomRecords
    
    struct CustomRecords: Codable {
    }
    
    struct Feature: Codable {
        let bit: Int
        let name: String
        let is_required, is_known: Bool
    }
    
    struct Subdivision: Codable {
        let de, en, es, fr: String
        let ru: String
    }
}
