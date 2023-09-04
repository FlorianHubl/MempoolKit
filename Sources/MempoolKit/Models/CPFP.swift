
import Foundation

public struct CPFP: Codable {
//    public let descendants: [] ?
    public let ancestors: [Ancestor]
    public let effectiveFeePerVsize: Double
    
    public struct Ancestor: Codable {
        public let txid: String
        public let weight, fee: Int
    }
}

