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
    case tooManyHistoryEntries
    case countryNotFound
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
        case hashrate = "/api/v1/mining/hashrate"
        case reward = "/api/v1/mining/reward-stats"
        case blockFees = "/api/v1/mining/blocks/fees"
        case blockRewards = "/api/v1/mining/blocks/rewards"
        case blockFeeRats = "/api/v1/mining/blocks/fee-rates"
        case blockSizeAndWeights = "/api/v1/mining/blocks/sizes-weights"
        case mempoolBlockFees = "/api/v1/fees/mempool-blocks"
        case recommendedFees = "/api/v1/fees/recommended"
        case mempool = "/api/mempool"
        case mempoolTXIDs = "/api/mempool/txids"
        case mempoolRecent = "/api/mempool/recent"
        case cpfp = "/api/v1/cpfp"
        case transaction = "/api/tx"
        case lightning = "/api/v1/lightning/statistics"
        case channel = "/api/v1/lightning/search?searchText="
        case country = "/api/v1/lightning/nodes/country"
        case countries = "/api/v1/lightning/nodes/countries"
        case isp = "/api/v1/lightning/nodes/isp"
        case ispRanking = "/api/v1/lightning/nodes/isp-ranking"
        case top100Nodes = "/api/v1/lightning/nodes/rankings"
        case top100NodesLiquidity = "/api/v1/lightning/nodes/rankings/liquidity"
        case top100NodesConnectivity = "/api/v1/lightning/nodes/rankings/connectivity"
        case top100NodesAge = "/api/v1/lightning/nodes/rankings/age"
        case lightningNode = "/api/v1/lightning/nodes"
        case lightningChannel = "/api/v1/lightning/channels"
        case lightningChannelGeoStatus = "/api/v1/lightning/channels-geo"
    }

    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
    }
    
    public enum MempoolChannelStatus: String {
        case open
        case active
        case closed
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
    
    private func getRequest(for i: Request, method: HTTPMethod, urlExtention: String? = nil, payLoad: String? = nil, extWithSlash: Bool) -> URLRequest {
        var rqUrl = "\(url)\(i.rawValue)"
        if let ext = urlExtention {
            if extWithSlash {
                rqUrl += "/"
            }
            rqUrl += ext
        }
        
        var request = URLRequest(url: URL(string: rqUrl)!)
        request.httpMethod = method.rawValue
        print(request.url!.absoluteString)
        if let payLoad = payLoad {
            request = addPayload(payload: payLoad, request)
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    func request<T: Codable>(for req: Request, method: HTTPMethod, type: T.Type, extention: String? = nil, payLoad: String? = nil, extWithSlash: Bool? = nil) async throws -> T {
        let a = try await URLSession.shared.data(for: getRequest(for: req, method: method, urlExtention: extention, payLoad: payLoad, extWithSlash: extWithSlash ?? true)).0
        if type is String.Type {
            let b = String(data: a, encoding: .utf8) ?? "unknown error"
            if b.contains("Too Many Requests") {
                throw MempoolError.tooManyRequests
            }else if b.contains("Block not found") {
                throw MempoolError.blockNotFound
            }else if b.contains("error") {
                throw MempoolError.custom(b)
            }else {
                return b as! T
            }
        }else if type is Data.Type {
            return a as! T
        }else {
            do {
                print("Decoding...")
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
                    }else if error.contains("Too many history entries") {
                        throw MempoolError.tooManyHistoryEntries
                    }else if error.contains("This country does not exist or does not host any lightning nodes on clearnet") {
                        throw MempoolError.countryNotFound
                    }
                    print(error)
                    throw MempoolError.custom("Unknown Error")
                }else {
                    throw MempoolError.unknownError
                }
            }
        }
    }
    
    public enum MempoolTime: String {
        case oneDay = "24h"
        case threeDays = "3d"
        case oneWeek = "1w"
        case oneMonth = "1m"
        case threeMonths = "3n"
        case sixMonths = "6m"
        case oneYear = "1y"
        case twoYears = "2y"
        case threeYears = "3y"
    }
}
