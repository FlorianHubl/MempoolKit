
import Foundation

public struct CPFP: Codable {
//    let descendants: [] ?
    let ancestors: [Ancestor]
    let effectiveFeePerVsize: Double
    
    struct Ancestor: Codable {
        let txid: String
        let weight, fee: Int
    }
}

