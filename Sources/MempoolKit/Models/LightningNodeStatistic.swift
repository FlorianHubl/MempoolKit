
import Foundation

public struct LightningNodeStatistic: Codable {
    public let public_key, alias: String
    public let first_seen, updated_at: Int
    public let color, sockets: String
    public let city_id: Int?
    public let as_number, country_id: Int
    public let subdivision_id: Int?
    public let longitude, latitude: Double
    public let iso_code, as_organization: String
    public let city: Country?
    public let country: Country
    public let subdivision: Subdivision?
    public let features: [Feature]
    public let featuresBits: String
    public let active_channel_count: Int
    public let capacity: String
    public let opened_channel_count, closed_channel_count: Int
    public let custom_records: CustomRecords
    
    public struct CustomRecords: Codable {
    }
    
    public struct Feature: Codable {
        public let bit: Int
        public let name: String
        public let is_required, is_known: Bool
    }
    
    public struct Subdivision: Codable {
        public let de, en, es, fr: String?
        public let ru: String?
    }
}
