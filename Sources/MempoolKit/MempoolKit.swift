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
    case miningPoolDoesNotExist
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
        case miningPools = "/api/v1/mining/pools"
        case miningPool = "/api/v1/mining/pool"
        case miningPoolHashrate = "/api/v1/mining/hashrate/pools"
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
        print(request.url!.absoluteString)
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
                    }else if error.contains("This mining pool does not exist") {
                        throw MempoolError.miningPoolDoesNotExist
                    }
                    throw MempoolError.custom(error)
                }else {
                    throw MempoolError.unknownError
                }
            }
        }
    }
    
    public enum MempoolTime: String {
        case oneWeek = "1w"
        case oneMonth = "1m"
        case threeMonths = "3n"
        case sixMonths = "6m"
        case oneYear = "1y"
        case twoYears = "2y"
        case threeYears = "3y"
    }
}
