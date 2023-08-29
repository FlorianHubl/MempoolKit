// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

public struct LightningNodeStatistic: Codable {
    let public_key, alias: String
    let first_seen, updated_at: Int
    let color, sockets: String
    let as_number, city_id, country_id, subdivision_id: Int
    let longitude, latitude: Double
    let isoCode, as_organization: String
    let city, country: Country
    let subdivision: Subdivision
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
