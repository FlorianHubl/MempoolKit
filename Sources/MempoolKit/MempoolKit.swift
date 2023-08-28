import Foundation
import Network

extension Data {
    func print() {
        Swift.print(String(data: self, encoding: .utf8)!)
    }
}

public enum MempoolError: Error {
    case tooManyRequests
    case invalidBitcoinAddress
    case unknownError
    case invalidHexString
    case invalidnumber
    case blockNotFound
    case custom(String)
}

/// The Main Struct of MempoolKit.
///
/// Get data easy and quick from the Bitcoin Network through your own instance of Mempool or the official mempool.space api.
///
/// Official mempool.space api:
/// ```swift
/// let mempool = Mempool()
/// ```
///
/// Your own instance of Mempool:
///
/// ```swift
/// let mempool = Mempool(server: "https://mymempoolserver.local")
/// ```

@available(iOS 13.0.0, macOS 12.0.0,  *)
public struct Mempool {
    
    enum Request: String {
        case difficultyAdjustment = "/api/v1/difficulty-adjustment"
        case address = "/api/address"
        case block = "/api/block"
        case blockheight = "/api/block-height"
        case blockTipHeight = "/api/blocks/tip/height"
        case blockTipHash = "/api/blocks/tip/hash"
        case blocks = "/api/v1/blocks"
        case blocksBulk = "/api/v1/blocks-bulk"
    }

    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
    }
    
    let url: String

    /// The initialiser for the official mempool.space api.
    public init() {
        self.url = "https://mempool.space"
    }
    
    /// The initialiser for a self hosted instance of mempool.
    public init(server: String) {
        self.url = server
    }
    
    private func addPayload(payload: String, _ urlr: URLRequest) -> URLRequest {
        var url = urlr
//        print(payload)
        url.httpBody = payload.data(using: .utf8)
        return url
    }
    
    private func getRequest(for i: Request, method: HTTPMethod, urlExtention: String? = nil, payLoad: String? = nil) -> URLRequest {
        var request = URLRequest(url: URL(string: "\(url)\(i.rawValue)\(urlExtention != nil ? "/" : "")\(urlExtention ?? "")")!)
        request.httpMethod = method.rawValue
//        print(request.url!.absoluteString)
        if let payLoad = payLoad {
            request = addPayload(payload: payLoad, request)
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    func request<T: Codable>(for req: Request, method: HTTPMethod, type: T.Type, extention: String? = nil) async throws -> T {
        let a = try await URLSession.shared.data(for: getRequest(for: req, method: method, urlExtention: extention)).0
        if type is String.Type {
            let b = String(data: a, encoding: .utf8) ?? "Error"
            if b.contains("Too Many Requests") {
                throw MempoolError.tooManyRequests
            }else if b.contains("Block not found") {
                throw MempoolError.blockNotFound
            }else {
                return b as! T
            }
        }else if type is Data.Type {
            return a as! T
        }else {
            do {
                let a = try JSONDecoder().decode(T.self, from: a)
                return a
            }catch {
                let error = String(data: a, encoding: .utf8)
                if let error = error {
                    if error.contains("Too Many Requests") {
                        throw MempoolError.tooManyRequests
                    }else if error.contains("Invalid Bitcoin address") {
                        throw MempoolError.invalidBitcoinAddress
                    }else if error.contains("Invalid hex string") {
                        throw MempoolError.invalidHexString
                    }else if error.contains("Invalid Number") {
                        throw MempoolError.invalidnumber
                    }else if error.contains("Block not found") {
                        throw MempoolError.blockNotFound
                    }
                    throw MempoolError.custom(error)
                }else {
                    throw MempoolError.unknownError
                }
            }
        }
    }
    
    // General
    
    /// Information about the difficulty adjustment such as previousRetarget, progressPercent and many more.
    ///
    /// - Returns: All Details about the difficulty adjustment: progressPercent, difficultyChange, estimatedRetargetDate, remainingBlocks, remainingTime, previousRetarget, nextRetargetHeight, timeAvg, timeOffset
    public func difficultyAdjustment() async throws -> DifficultyAdjustment {
        try await request(for: .difficultyAdjustment, method: .get, type: DifficultyAdjustment.self)
    }
    
    // Addresses
    
    /// Details about an Bitcoin address.
    /// - Parameter address: Bitcoin Address
    /// - Returns: Details about an address such as tx_count
    public func address(address: String) async throws -> Address {
        try await request(for: .address, method: .get, type: Address.self, extention: address)
    }
    
    /// Addresses Transaction History
    /// - Parameter address: Bitcoin Address
    /// - Returns: Transaction history for the specified address, sorted with newest first. Returns up to 50 mempool transactions plus the first 25 confirmed transactions. You can request more confirmed transactions using addressTXSChain
    public func addressTXS(address: String) async throws -> Transactions {
        try await request(for: .address, method: .get, type: Transactions.self, extention: "\(address)/txs")
    }
    
    /// Address Transactions Chain
    /// - Parameters:
    ///   - address: Bitcoin Address
    ///   - lastTXID: Last seen Bitcoin Transaction ID
    /// - Returns: Confirmed transaction history for the specified address/scripthash, sorted with newest first. Returns 25 transactions per page. More can be requested by specifying the last txid seen by the previous call
    public func addressTXSChain(address: String, lastTXID: String) async throws -> Transactions {
        try await request(for: .address, method: .get, type: Transactions.self, extention: "\(address)/txs/chain/\(lastTXID)")
    }
    
    /// Address Transactions Mempool
    /// - Parameter address: Bitcoin Address
    /// - Returns: Get unconfirmed transaction history for the specified address/scripthash. Returns up to 50 transactions (no paging)
    public func addressTXSMempool(address: String) async throws -> Transactions {
        try await request(for: .address, method: .get, type: Transactions.self, extention: "\(address)/txs/mempool")
    }
    
    /// Address UTXOs
    /// - Parameter address: Bitcoin Address
    /// - Returns: Get the list of unspent transaction outputs associated with the address
    public func addressUTXOs(address: String) async throws -> UTXOs {
        try await request(for: .address, method: .get, type: UTXOs.self, extention: "\(address)/utxo")
    }
    
    // Blocks
    
    /// Get Block
    /// - Parameter blockHash: The Blocks Hash or ID
    /// - Returns: Returns details about a block
    public func block(blockHash: String) async throws -> Block {
        try await request(for: .block, method: .get, type: Block.self, extention: blockHash)
    }
    
    /// Hex Block Header
    /// - Parameter blockHash: The Blocks Hash or ID
    /// - Returns: The hex-encoded block header
    public func blockHeader(blockHash: String) async throws -> String {
        try await request(for: .block, method: .get, type: String.self, extention: "\(blockHash)/header")
    }
    
    /// Get Block Height
    /// - Parameter blockHeight: The Height of the Block
    /// - Returns: The hash of the block at the input height
    public func blockHeight(blockHeight: Int) async throws -> String {
        try await request(for: .blockheight, method: .get, type: String.self, extention: "\(blockHeight)")
    }
    
    /// Get raw Block
    /// - Parameter blockHash: The Blocks Hash or ID
    /// - Returns: The raw block representation in Swifts Data Type
    public func blockRaw(blockHash: String) async throws -> Data {
        try await request(for: .block, method: .get, type: Data.self, extention: "\(blockHash)/raw")
    }
    
    /// Block Status
    /// - Parameter blockHash: The Blocks Hash or ID
    /// - Returns: The confirmation status of a block.
    public func blockStatus(blockHash: String) async throws -> BlockStatus {
        try await request(for: .block, method: .get, type: BlockStatus.self, extention: "\(blockHash)/status")
    }
    
    /// Block Tip Height
    /// - Returns: The height of the last block.
    public func blockTipHeight() async throws -> Int {
        try await request(for: .blockTipHeight, method: .get, type: Int.self)
    }
    
    /// Block Tip Hash
    /// - Returns: The hash of the last block.
    public func blockTipHash() async throws -> String {
        try await request(for: .blockTipHash, method: .get, type: String.self)
    }
    
    /// Block Transaction ID
    /// - Parameters:
    ///   - blockHash: The Blocks Hash or ID
    ///   - index: The index of the transaction in the block.
    /// - Returns: The transaction at index within the specified block.
    public func blockTXID(blockHash: String, index: Int) async throws -> String {
        try await request(for: .block, method: .get, type: String.self, extention: "\(blockHash)/txid/\(index)")
    }
    
    /// Block Transaction IDs
    /// - Parameter blockHash: The Blocks Hash or ID
    /// - Returns: Returns a list of all Transaction IDs in the block.
    public func blockTXIDs(blockHash: String) async throws -> [String] {
        try await request(for: .block, method: .get, type: [String].self, extention: "\(blockHash)/txids")
    }
    
    /// Block Transaction
    /// - Parameter blockHash: The Blocks Hash or ID
    /// - Returns: Returns a list of 25 transactions in the block.
    public func blockTXs(blockHash: String) async throws -> Transactions {
        try await request(for: .block, method: .get, type: Transactions.self, extention: "\(blockHash)/txs")
    }
    
    /// Get Blocks
    /// - Parameter blockHeight: The Blocks Hash or ID
    /// - Returns: Returns details on the past 15 blocks with fee and mining details in extras
    public func blocks(blockHeight: Int) async throws -> String {
        try await request(for: .blocks, method: .get, type: String.self, extention: "\(blockHeight)")
    }
    
    // Disabled
    
    private func blocksBulk(start: Int, end: Int) async throws -> Blocks {
        try await request(for: .blocks, method: .get, type: Blocks.self, extention: "\(start)/\(end)")
    }
    
    // Mining
    
    public enum MemPoolTime: String {
        
    }
    
    public func miningPools(blockHeight: Int) async throws -> String {
        try await request(for: .blocks, method: .get, type: String.self, extention: "\(blockHeight)")
    }
}

