import XCTest
@testable import MempoolKit

final class MempoolKitTests: XCTestCase {
    
    // Difficulty Adjustment
    
    @available(iOS 13.0.0, *)
    func testDifficultyAdjustment() async throws {
        let mempool = Mempool()
        let difficultyAdjustment = try await mempool.difficultyAdjustment()
    }
    
    @available(iOS 13.0, *)
    func delay(sec: Double) async throws {
        try await Task.sleep(nanoseconds: UInt64(sec * 9))
    }
    
    // Blocks
    @available(iOS 13.0.0, *)
    func testBlocks() async throws {
        let mempool = Mempool()
        let blockTipHash = try await mempool.blockTipHash()
        let blockTipHeight = try await mempool.blockTipHeight()
        let randomBlock = Int.random(in: 0...blockTipHeight)
        for i in (randomBlock-100)...randomBlock {
            try await delay(sec: 3)
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
                try await delay(sec: 3)
                try await testTransaction(txid: tx)
            }
        }
    }
    
    @available(iOS 13.0.0, *)
    func testTransaction(txid: String) async throws {
        let mempool = Mempool()
        let txHex = try await mempool.transactionHex(txid: txid)
        let merkleBlockProof = try await mempool.transactionMerkleBlockProof(txid: txid)
        let merkleProof = try await mempool.transactionMerkleProof(txid: txid)
        let outspends = try await mempool.transactionOutspends(txid: txid)
        let rawTX = try await mempool.transactionRaw(txid: txid)
        let txStatus = try await mempool.transactionStatus(txid: txid)
        let tx = try await mempool.transaction(txid: txid)
        for output in tx.vout {
            if let scriptpubkey_address = output.scriptpubkey_address {
                try await address(address: scriptpubkey_address)
            }
        }
    }
    
    @available(iOS 13.0.0, *)
    func address(address: String) async throws {
        let mempool = Mempool()
        let adr = try await mempool.address(address: address)
        let txs = try await mempool.addressTXS(address: address)
        let txs2 = try await mempool.addressTXSChain(address: address, lastTXID: txs.first!.txid)
        let txsMempool = try await mempool.addressTXSMempool(address: address)
        let utxos = try await mempool.addressUTXOs(address: address)
    }
    
    @available(iOS 13.0.0, *)
    func testMining() async throws {
        let mempool = Mempool()
        let miningPools = try await mempool.miningPools(time: .oneYear)
        let miningPool = try await mempool.miningPool(miningPool: "AntPool")
        let miningPoolHashrates = try await mempool.miningPoolHashrates(time: .oneYear)
        let miningPoolHashrate = try await mempool.miningPoolHashrate(miningPool: "AntPool")
        let miningPoolHashrate = try await mempool.miningPoolHashrate(miningPool: "AntPool")
        let miningPoolBlocks = try await mempool.miningPoolBlocks(miningPool: "AntPool", blockHeight: 730000)
        let miningHashrate = try await mempool.miningHashrate(time: .oneYear)
        let miningRewardStats = try await mempool.miningRewardStats(blockCount: 100)
        let blockFees = try await mempool.blockFees(time: .oneYear)
        let blockRewards = try await mempool.blockRewards(time: .oneYear)
        let blockFeeRates = try await mempool.blockFeeRates(time: .oneYear)
        let blockSizeAndWeights = try await mempool.blockSizeAndWeights(time: .oneYear)
    }
}


