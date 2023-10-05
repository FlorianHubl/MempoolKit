import Foundation

public struct Transaction: Codable {
    
    public let txid: String
    public let version, locktime: Int
    public let vin: [Vin]
    public let vout: [Vout]
    public let size, weight, fee: Int
    public var status: Status
    
    public init(txid: String, version: Int, locktime: Int, vin: [Vin], vout: [Vout], size: Int, weight: Int, fee: Int, status: Status) {
        self.txid = txid
        self.version = version
        self.locktime = locktime
        self.vin = vin
        self.vout = vout
        self.size = size
        self.weight = weight
        self.fee = fee
        self.status = status
    }
    
    public static let demo = Transaction(txid: "txid", version: 1, locktime: 1, vin: [Vin(txid: "txid", vout: 1, prevout: Vout(scriptpubkey: "scriptpubkey", scriptpubkey_asm: "scriptpubkey_asm", scriptpubkey_type: .p2pkh, scriptpubkey_address: "scriptpubkey_address", value: 1), scriptsig: "scriptsig", scriptsig_asm: "scriptsig_asm", witness: ["witness", "witness", "witness"], is_coinbase: false, sequence: 1, inner_redeemscript_asm: "inner_redeemscript_asm", inner_witnessscript_asm: "inner_witnessscript_asm")], vout: [Vout(scriptpubkey: "scriptpubkey", scriptpubkey_asm: "scriptpubkey_asm", scriptpubkey_type: .p2pkh, scriptpubkey_address: "scriptpubkey_address", value: 1)], size: 1, weight: 1, fee: 1, status: .init(confirmed: true, block_height: 21, block_hash: "block_hash", block_time: 21))
    
    public struct Status: Codable {
        public var confirmed: Bool
        public var block_height: Int?
        public var block_hash: String?
        public var block_time: Int?
        
        public init(confirmed: Bool, block_height: Int? = nil, block_hash: String? = nil, block_time: Int? = nil) {
            self.confirmed = confirmed
            self.block_height = block_height
            self.block_hash = block_hash
            self.block_time = block_time
        }
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
        
        public init(txid: String, vout: Int, prevout: Vout?, scriptsig: String, scriptsig_asm: String, witness: [String]?, is_coinbase: Bool, sequence: Int, inner_redeemscript_asm: String?, inner_witnessscript_asm: String?) {
            self.txid = txid
            self.vout = vout
            self.prevout = prevout
            self.scriptsig = scriptsig
            self.scriptsig_asm = scriptsig_asm
            self.witness = witness
            self.is_coinbase = is_coinbase
            self.sequence = sequence
            self.inner_redeemscript_asm = inner_redeemscript_asm
            self.inner_witnessscript_asm = inner_witnessscript_asm
        }
    }
    
    public struct Vout: Codable {
        public let scriptpubkey, scriptpubkey_asm: String
        public let scriptpubkey_type: ScriptpubkeyType
        public let scriptpubkey_address: String?
        public let value: Int
        
        public init(scriptpubkey: String, scriptpubkey_asm: String, scriptpubkey_type: ScriptpubkeyType, scriptpubkey_address: String?, value: Int) {
            self.scriptpubkey = scriptpubkey
            self.scriptpubkey_asm = scriptpubkey_asm
            self.scriptpubkey_type = scriptpubkey_type
            self.scriptpubkey_address = scriptpubkey_address
            self.value = value
        }
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
