import Foundation

public struct Transaction: Codable {
    let txid: String
    let version, locktime: Int
    let vin: [Vin]
    let vout: [Vout]
    let size, weight, fee: Int
    let status: Status
    
    struct Status: Codable {
        let confirmed: Bool
        let block_height: Int?
        let block_hash: String?
        let block_time: Int?
    }
    
    struct Vin: Codable {
        let txid: String
        let vout: Int
        let prevout: Vout?
        let scriptsig, scriptsig_asm: String
        let witness: [String]?
        let is_coinbase: Bool
        let sequence: Int
        let inner_redeemscript_asm, inner_witnessscript_asm: String?
    }
    
    struct Vout: Codable {
        let scriptpubkey, scriptpubkey_asm: String
        let scriptpubkey_type: ScriptpubkeyType
        let scriptpubkey_address: String?
        let value: Int
    }
    
    enum ScriptpubkeyType: String, Codable {
        case p2pkh
        case p2sh
        case p2pk
        case v0_p2wpkh
        case v0_p2wsh
        case v1_p2tr
        case op_return
    }
}

public typealias Transactions = [Transaction]
