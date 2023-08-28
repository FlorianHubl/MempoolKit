import XCTest
@testable import MempoolKit

final class MempoolKitTests: XCTestCase {
    @available(iOS 13.0.0, *)
    func test() async throws {
        let mempool = Mempool()
        let a = try await mempool.mempoolRecent()
    }
    
    @available(iOS 13.0.0, *)
    func mainTest() async throws {
        
        let mempool = Mempool()
        
        // Testing from genisis Block to Block 1000 with counting UTXOs from Coinbase Address.
        
        for i in 0...1000 {
            let blockHash = try await mempool.blockHeight(blockHeight: i)
            let block = try await mempool.block(blockHash: blockHash)
            print("Block: \(i): \(blockHash)")
            if let extras = block.extras {
                let coinbaseAddress = extras.coinbaseAddress
                let address = try await mempool.addressUTXOs(address: coinbaseAddress)
                print("Coinbase Address: \(coinbaseAddress) UTXOs: \(address.count)")
            }
            try await Task.sleep(nanoseconds: 1_000_000_000)
        }
    }
}


