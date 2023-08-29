import XCTest
@testable import MempoolKit

final class MempoolKitTests: XCTestCase {
    @available(iOS 13.0.0, *)
    func test() async throws {
//        try await mainTest()
        let mempool = Mempool()
    }
    
    @available(iOS 13.0.0, *)
    func mainTest() async throws {
        
        let mempool = Mempool()
        
        // Testing from Block 700000 Block to Block 700100 with counting UTXOs from the first Address.
        
        for i in 700025...700100 {
            do {
                let blockHash = try await mempool.blockHeight(blockHeight: i)
                let txs = try await mempool.blockTXs(blockHash: blockHash)
                if let firstOut = txs.first?.vout.first?.scriptpubkey_address {
                    let address = try await mempool.addressUTXOs(address: firstOut)
                    print("Address: \(firstOut) UTXOs: \(address.count)")
                }
            }catch {
                print("Error")
            }
        }
    }
}


