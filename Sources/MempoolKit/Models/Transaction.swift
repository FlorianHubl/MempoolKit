import Foundation

public struct Transaction: Codable {
    
    public let txid: String
    public let version, locktime: Int
    public let vin: [Vin]
    public let vout: [Vout]
    public let size, weight, fee: Int
    public let status: Status
    
    public struct Status: Codable {
        public let confirmed: Bool
        public let block_height: Int?
        public let block_hash: String?
        public let block_time: Int?
    }
    
    public struct Vin: Codable {
        public let txid: String
        public let vout: Int
        public let prevout: Vout?
        public let scriptsig, scriptsig_asm: String
        public let witness: [String]?
        public let is_coinbase: Bool
        public let sequence: Int
        public let inner_redeemscript_asm, inner_witnessscript_asm: String?
    }
    
    public struct Vout: Codable {
        public let scriptpubkey, scriptpubkey_asm: String
        public let scriptpubkey_type: ScriptpubkeyType
        public let scriptpubkey_address: String?
        public let value: Int
    }
    
    public enum ScriptpubkeyType: String, Codable {
        case p2pkh
        case p2sh
        case p2pk
        case v0_p2wpkh
        case v0_p2wsh
        case v1_p2tr
        case op_return
        case multisig
    }
}

public typealias Transactions = [Transaction]
