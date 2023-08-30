import XCTest
@testable import MempoolKit

final class MempoolKitTests: XCTestCase {
    
    // Difficulty Adjustment
    
    @available(iOS 13.0.0, *)
    func testDifficultyAdjustment() async throws {
        let mempool = Mempool()
        let difficultyAdjustment = try await mempool.difficultyAdjustment()
    }
    
    // Blocks
    @available(iOS 13.0.0, *)
    func testBlocks() async throws {
        let mempool = Mempool()
        let blockTipHash = try await mempool.blockTipHash()
        let blockTipHeight = try await mempool.blockTipHeight()
        let randomBlock = Int.random(in: 0...blockTipHeight)
        for i in (324776)...324786 {
            try await Task.sleep(nanoseconds: 3_000_000)
            let blockHash = try await mempool.blockHeight(blockHeight: i)
            let block = try await mempool.block(blockHash: blockHash)
            let blocks = try await mempool.blocks(blockHeight: i)
            let blockHeader = try await mempool.blockHeader(blockHash: blockHash)
            let rawBlock = try await mempool.blockRaw(blockHash: blockHash)
            let blockStatus = try await mempool.blockStatus(blockHash: blockHash)
            let blockTXID = try await mempool.blockTXID(blockHash: blockHash, index: 1)
            let blockTXs = try await mempool.blockTXs(blockHash: blockHash)
            let blockTXIDs = try await mempool.blockTXIDs(blockHash: blockHash)
            for tx in blockTXIDs {
                try await testTransaction(txid: tx)
            }
        }
    }
    
    @available(iOS 13.0.0, *)
    func testTransaction(txid: String) async throws {
        let mempool = Mempool()
        let tx = try await mempool.transaction(txid: txid)
        try await Task.sleep(nanoseconds: 1_000_000)
        let txHex = try await mempool.transactionHex(txid: txid)
        try await Task.sleep(nanoseconds: 1_000_000)
        let merkleBlockProof = try await mempool.transactionMerkleBlockProof(txid: txid)
        try await Task.sleep(nanoseconds: 1_000_000)
        let merkleProof = try await mempool.transactionMerkleProof(txid: txid)
        try await Task.sleep(nanoseconds: 1_000_000)
        let outspends = try await mempool.transactionOutspends(txid: txid)
        try await Task.sleep(nanoseconds: 1_000_000)
        let rawTX = try await mempool.transactionRaw(txid: txid)
        try await Task.sleep(nanoseconds: 1_000_000)
        let txStatus = try await mempool.transactionStatus(txid: txid)
    }
}


