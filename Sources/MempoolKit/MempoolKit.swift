import Foundation
import Network

extension Data {
    func print() {
        Swift.print(String(data: self, encoding: .utf8)!)
    }
}

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

    public init() {
        self.url = "https://mempool.space"
    }
    
    public init(server: String) {
        self.url = server
    }
    
    private func addPayload(payload: String, _ urlr: URLRequest) -> URLRequest {
        var url = urlr
        print(payload)
        url.httpBody = payload.data(using: .utf8)
        return url
    }
    
    private func getRequest(for i: Request, method: HTTPMethod, urlExtention: String? = nil, payLoad: String? = nil) -> URLRequest {
        var request = URLRequest(url: URL(string: "\(url)\(i.rawValue)\(urlExtention != nil ? "/" : "")\(urlExtention ?? "")")!)
        request.httpMethod = method.rawValue
        print(request.url!.absoluteString)
        if let payLoad = payLoad {
            request = addPayload(payload: payLoad, request)
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    struct MempoolError: Error {
        let description: String
    }
    
    func request<T: Codable>(for req: Request, method: HTTPMethod, type: T.Type, extention: String? = nil) async throws -> T {
        let a = try await URLSession.shared.data(for: getRequest(for: req, method: method, urlExtention: extention)).0
        if type is String.Type {
            return String(data: a, encoding: .utf8) as! T
        }else if type is Data.Type {
            return a as! T
        }else {
            do {
                let a = try JSONDecoder().decode(T.self, from: a)
                return a
            }catch {
                throw MempoolError(description: String(data: a, encoding: .utf8) ?? "Unknown Error")
            }
        }
    }
    
    // General
    
    func difficultyAdjustment() async throws -> DifficultyAdjustment {
        try await request(for: .difficultyAdjustment, method: .get, type: DifficultyAdjustment.self)
    }
    
    // Addresses
    
    func address(_ address: String) async throws -> Address {
        try await request(for: .address, method: .get, type: Address.self, extention: address)
    }
    
    func addressTXS(_ address: String) async throws -> Transactions {
        try await request(for: .address, method: .get, type: Transactions.self, extention: "\(address)/txs")
    }
    
    func addressTXSChain(_ address: String, lastTXID: String) async throws -> Transactions {
        try await request(for: .address, method: .get, type: Transactions.self, extention: "\(address)/txs/chain/\(lastTXID)")
    }
    
    func addressTXSMempool(_ address: String) async throws -> Transactions {
        try await request(for: .address, method: .get, type: Transactions.self, extention: "\(address)/txs/mempool")
    }
    
    func addressUTXOs(_ address: String) async throws -> UTXOs {
        try await request(for: .address, method: .get, type: UTXOs.self, extention: "\(address)/utxo")
    }
    
    // Blocks
    
    func block(_ id: String) async throws -> Block {
        try await request(for: .block, method: .get, type: Block.self, extention: id)
    }
    
    func blockHeader(_ id: String) async throws -> String {
        try await request(for: .block, method: .get, type: String.self, extention: "\(id)/header")
    }
    
    func blockHeight(_ height: Int) async throws -> String {
        try await request(for: .blockheight, method: .get, type: String.self, extention: "\(height)")
    }
    
    func blockRaw(_ hash: String) async throws -> Data {
        try await request(for: .block, method: .get, type: Data.self, extention: "\(hash)/raw")
    }
    
    func blockStatus(_ hash: String) async throws -> BlockStatus {
        try await request(for: .block, method: .get, type: BlockStatus.self, extention: "\(hash)/status")
    }
    
    func blockTipHeight() async throws -> Int {
        try await request(for: .blockTipHeight, method: .get, type: Int.self)
    }
    
    func blockTipHash() async throws -> String {
        try await request(for: .blockTipHash, method: .get, type: String.self)
    }
    
    func blockTXID(blockHash: String, index: Int) async throws -> String {
        try await request(for: .block, method: .get, type: String.self, extention: "\(blockHash)/txid/\(index)")
    }
    
    func blockTXIDs(blockHash: String) async throws -> [String] {
        try await request(for: .block, method: .get, type: [String].self, extention: "\(blockHash)/txids")
    }
    
    func blockTXs(_ blockHash: String) async throws -> Transactions {
        try await request(for: .block, method: .get, type: Transactions.self, extention: "\(blockHash)/txs")
    }
    
    func blocks(_ height: Int) async throws -> String {
        try await request(for: .blocks, method: .get, type: String.self, extention: "\(height)")
    }
    
    // Disabled
    
    private func blocksBulk(start: Int, end: Int) async throws -> Blocks {
        try await request(for: .blocks, method: .get, type: Blocks.self, extention: "\(start)/\(end)")
    }
    
}
