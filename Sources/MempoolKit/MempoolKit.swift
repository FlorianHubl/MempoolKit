import Foundation
import Network

@available(iOS 13.0.0, macOS 12.0.0,  *)
public struct Mempool {
    
    enum Request: String {
        case difficultyAdjustment = "/api/v1/difficulty-adjustment"
        case address = "/api/address"
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
    
    func request<T: Codable>(for req: Request, method: HTTPMethod, type: T.Type, extention: String? = nil) async throws -> T {
        try JSONDecoder().decode(type, from: try await URLSession.shared.data(for: getRequest(for: req, method: .get, urlExtention: extention)).0)
    }
    
    func difficultyAdjustment() async throws -> DifficultyAdjustment {
        try await request(for: .difficultyAdjustment, method: .get, type: DifficultyAdjustment.self)
    }
    
    func address(_ address: String) async throws -> Address {
        try await request(for: .address, method: .get, type: Address.self, extention: address)
    }
    
    func addressTXS(_ address: String) async throws -> Transactions {
        try await request(for: .address, method: .get, type: Transactions.self, extention: "\(address)/txs")
    }
    
    func addressTXSChain(_ address: String) async throws -> Transactions {
        try await request(for: .address, method: .get, type: Transactions.self, extention: "\(address)/txs/chain")
    }
    
}

