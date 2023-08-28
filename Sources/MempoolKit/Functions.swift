
// Mempool Methods

import SwiftUI

@available(iOS 13.0.0, *)
public extension Mempool {
    
    // General
    
    /// Information about the difficulty adjustment such as previousRetarget, progressPercent and many more.
    ///
    /// - Returns: All Details about the difficulty adjustment: progressPercent, difficultyChange, estimatedRetargetDate, remainingBlocks, remainingTime, previousRetarget, nextRetargetHeight, timeAvg, timeOffset
    func difficultyAdjustment() async throws -> DifficultyAdjustment {
        try await request(for: .difficultyAdjustment, method: .get, type: DifficultyAdjustment.self)
    }
    
    // Addresses
    
    /// Details about an Bitcoin address.
    /// - Parameter address: Bitcoin Address
    /// - Returns: Details about an address such as tx_count
    func address(address: String) async throws -> Address {
        try await request(for: .address, method: .get, type: Address.self, extention: address)
    }
    
    /// Addresses Transaction History
    /// - Parameter address: Bitcoin Address
    /// - Returns: Transaction history for the specified address, sorted with newest first. Returns up to 50 mempool transactions plus the first 25 confirmed transactions. You can request more confirmed transactions using addressTXSChain
    func addressTXS(address: String) async throws -> Transactions {
        try await request(for: .address, method: .get, type: Transactions.self, extention: "\(address)/txs")
    }
    
    /// Address Transactions Chain
    /// - Parameters:
    ///   - address: Bitcoin Address
    ///   - lastTXID: Last seen Bitcoin Transaction ID
    /// - Returns: Confirmed transaction history for the specified address/scripthash, sorted with newest first. Returns 25 transactions per page. More can be requested by specifying the last txid seen by the previous call
    func addressTXSChain(address: String, lastTXID: String) async throws -> Transactions {
        try await request(for: .address, method: .get, type: Transactions.self, extention: "\(address)/txs/chain/\(lastTXID)")
    }
    
    /// Address Transactions Mempool
    /// - Parameter address: Bitcoin Address
    /// - Returns: Unconfirmed transaction history for the specified address/scripthash. Returns up to 50 transactions (no paging)
    func addressTXSMempool(address: String) async throws -> Transactions {
        try await request(for: .address, method: .get, type: Transactions.self, extention: "\(address)/txs/mempool")
    }
    
    /// Address UTXOs
    /// - Parameter address: Bitcoin Address
    /// - Returns: The list of unspent transaction outputs associated with the address
    func addressUTXOs(address: String) async throws -> UTXOs {
        try await request(for: .address, method: .get, type: UTXOs.self, extention: "\(address)/utxo")
    }
    
    // Blocks
    
    /// Get Block
    /// - Parameter blockHash: The Blocks Hash or ID
    /// - Returns: Returns details about a block
    func block(blockHash: String) async throws -> Block {
        try await request(for: .block, method: .get, type: Block.self, extention: blockHash)
    }
    
    /// Hex Block Header
    /// - Parameter blockHash: The Blocks Hash or ID
    /// - Returns: The hex-encoded block header
    func blockHeader(blockHash: String) async throws -> String {
        try await request(for: .block, method: .get, type: String.self, extention: "\(blockHash)/header")
    }
    
    /// Get Block Height
    /// - Parameter blockHeight: The Height of the Block
    /// - Returns: The hash of the block at the input height
    func blockHeight(blockHeight: Int) async throws -> String {
        try await request(for: .blockheight, method: .get, type: String.self, extention: "\(blockHeight)")
    }
    
    /// Get raw Block
    /// - Parameter blockHash: The Blocks Hash or ID
    /// - Returns: The raw block representation in Swifts Data Type
    func blockRaw(blockHash: String) async throws -> Data {
        try await request(for: .block, method: .get, type: Data.self, extention: "\(blockHash)/raw")
    }
    
    /// Block Status
    /// - Parameter blockHash: The Blocks Hash or ID
    /// - Returns: The confirmation status of a block.
    func blockStatus(blockHash: String) async throws -> BlockStatus {
        try await request(for: .block, method: .get, type: BlockStatus.self, extention: "\(blockHash)/status")
    }
    
    /// Block Tip Height
    /// - Returns: The height of the last block.
    func blockTipHeight() async throws -> Int {
        try await request(for: .blockTipHeight, method: .get, type: Int.self)
    }
    
    /// Block Tip Hash
    /// - Returns: The hash of the last block.
    func blockTipHash() async throws -> String {
        try await request(for: .blockTipHash, method: .get, type: String.self)
    }
    
    /// Block Transaction ID
    /// - Parameters:
    ///   - blockHash: The Blocks Hash or ID
    ///   - index: The index of the transaction in the block.
    /// - Returns: The transaction at index within the specified block.
    func blockTXID(blockHash: String, index: Int) async throws -> String {
        try await request(for: .block, method: .get, type: String.self, extention: "\(blockHash)/txid/\(index)")
    }
    
    /// Block Transaction IDs
    /// - Parameter blockHash: The Blocks Hash or ID
    /// - Returns: A list of all Transaction IDs in the block.
    func blockTXIDs(blockHash: String) async throws -> [String] {
        try await request(for: .block, method: .get, type: [String].self, extention: "\(blockHash)/txids")
    }
    
    /// Block Transaction
    /// - Parameter blockHash: The Blocks Hash or ID
    /// - Returns: A list of 25 transactions in the block.
    func blockTXs(blockHash: String) async throws -> Transactions {
        try await request(for: .block, method: .get, type: Transactions.self, extention: "\(blockHash)/txs")
    }
    
    /// Get Blocks
    /// - Parameter blockHeight: The Blocks Hash or ID
    /// - Returns: Details on the past 15 blocks with fee and mining details in extras
    func blocks(blockHeight: Int) async throws -> String {
        try await request(for: .blocks, method: .get, type: String.self, extention: "\(blockHeight)")
    }
    
    // Disabled
    
    private func blocksBulk(start: Int, end: Int) async throws -> Blocks {
        try await request(for: .blocks, method: .get, type: Blocks.self, extention: "\(start)/\(end)")
    }
    
    // Mining
    
    /// Mining Pools
    /// - Parameter time: The specified time: 1 day, 3 days, 1 week, 1 month, 3 months, 6 months, one year, two years or three years
    /// - Returns: A list of all known mining pools ordered by blocks found over the specified time.
    func miningPools(time: MempoolTime) async throws -> MiningPools {
        try await request(for: .miningPools, method: .get, type: MiningPools.self, extention: time.rawValue)
    }
    
    /// Mining Pool
    /// - Parameter miningPool: Name of the Mining Pool
    /// - Returns: Details about the mining pool.
    func miningPool(miningPool: String) async throws -> MiningPool {
        try await request(for: .miningPool, method: .get, type: MiningPool.self, extention: miningPool)
    }
    
    /// Mining Pool Hashrates
    /// - Parameter time: The specified time: 1 day, 3 days, 1 week, 1 month, 3 months, 6 months, one year, two years or three years
    /// - Returns: Average hashrates (and share of total hashrate) of mining pools active in the specified time, in descending order of hashrate.
    func miningPoolHashrates(time: MempoolTime) async throws -> MiningPoolHashrates {
        try await request(for: .miningPoolHashrate, method: .get, type: MiningPoolHashrates.self, extention: time.rawValue)
    }
    
    /// Mining Pool Hashrate
    /// - Parameter miningPool: Name of the Mining Pool
    /// - Returns: All known hashrate data for the mining pool specified by the name. Hashrate values are weekly averages.
    func miningPoolHashrate(miningPool: String) async throws -> MiningPoolHashrates {
        try await request(for: .miningPool, method: .get, type: MiningPoolHashrates.self, extention: "\(miningPool)/hashrate")
    }
    
    /// Mining Pool Blocks
    /// - Parameters:
    ///   - miningPool: Name of the Mining Pool
    ///   - blockHeight: Height of the block
    /// - Returns: Past 10 blocks mined by the specified mining pool before the specified blockHeight. If no blockHeight is specified, the mining pool's 10 most recent blocks are returned.
    func miningPoolBlocks(miningPool: String, blockHeight: Int? = nil) async throws -> Blocks {
        try await request(for: .miningPool, method: .get, type: Blocks.self, extention: "\(miningPool)/blocks/\(blockHeight != nil ? String(blockHeight!) : "")")
    }
    
    /// Hashrate and Difficulty
    /// - Parameter time: The specified time: 1 day, 3 days, 1 week, 1 month, 3 months, 6 months, one year, two years or three years
    /// - Returns: Network-wide hashrate and difficulty figures over the specified time.
    func miningHashrate(time: MempoolTime) async throws -> Hashrate {
        try await request(for: .hashrate, method: .get, type: Hashrate.self, extention: time.rawValue)
    }
    
    /// Mining Reward Stats
    /// - Parameter blockCount: specified block count
    /// - Returns: Block reward and total transactions confirmed for the past specified blocks.
    func miningRewardStats(blockCount: Int) async throws -> MiningRewardStats {
        try await request(for: .reward, method: .get, type: MiningRewardStats.self, extention: "\(blockCount)")
    }
    
    /// Block Fees
    /// - Parameter time: The specified time: 1 day, 3 days, 1 week, 1 month, 3 months, 6 months, one year, two years or three years
    /// - Returns: Average total fees for blocks in the specified time, ordered oldest to newest.
    func blockFees(time: MempoolTime) async throws -> BlockFees {
        try await request(for: .blockFees, method: .get, type: BlockFees.self, extention: time.rawValue)
    }
    
    /// Block Rewards
    /// - Parameter time: The specified time: 1 day, 3 days, 1 week, 1 month, 3 months, 6 months, one year, two years or three years
    /// - Returns: Average block rewards for blocks in the specified time, ordered oldest to newest.
    func blockRewards(time: MempoolTime) async throws -> BlockRewards {
        try await request(for: .blockRewards, method: .get, type: BlockRewards.self, extention: time.rawValue)
    }
    
    /// Block Fee Rats
    /// - Parameter time: The specified time: 1 day, 3 days, 1 week, 1 month, 3 months, 6 months, one year, two years or three years
    /// - Returns: Average feerate percentiles for blocks in the specified time, ordered oldest to newest.
    func blockFeeRates(time: MempoolTime) async throws -> BlockFeeRates {
        try await request(for: .blockFeeRats, method: .get, type: BlockFeeRates.self, extention: time.rawValue)
    }
    
    /// Block Size And Weights
    /// - Parameter time: The specified time: 1 day, 3 days, 1 week, 1 month, 3 months, 6 months, one year, two years or three years
    /// - Returns: Average size (bytes) and average weight (weight units) for blocks in the specified time, ordered oldest to newest.
    func blockSizeAndWeights(time: MempoolTime) async throws -> BlockSizeAndWeights {
        try await request(for: .blockSizeAndWeights, method: .get, type: BlockSizeAndWeights.self, extention: time.rawValue)
    }
    
    // Fees
    
    /// Mempool Block Fees
    /// - Returns: Current mempool as projected blocks.
    func mempoolBlockFees() async throws -> MempoolBlockFees {
        try await request(for: .mempoolBlockFees, method: .get, type: MempoolBlockFees.self)
    }
    
    /// Recommended Fees
    /// - Returns: The currently suggested fees for new transactions.
    func recommendedFees() async throws -> RecommendedFees {
        try await request(for: .recommendedFees, method: .get, type: RecommendedFees.self)
    }
    
    // Mempool
    
    /// Mempool
    /// - Returns: Current mempool backlog statistics.
    func mempool() async throws -> MempoolStatistic {
        try await request(for: .mempool, method: .get, type: MempoolStatistic.self)
    }
    
    /// Mempool Transaction IDs
    /// - Returns: The full list of transaction IDs in the mempool as an array. The order of the transaction IDs is arbitrary and does not match bitcoind.
    func mempoolTXIDs() async throws -> [String] {
        try await request(for: .mempoolTXIDs, method: .get, type: [String].self)
    }
    
    /// Mempool Recent
    /// - Returns: A list of the last 10 transactions to enter the mempool. Each transaction object contains simplified overview data.
    func mempoolRecent() async throws -> MempoolRecents {
        try await request(for: .mempoolRecent, method: .get, type: MempoolRecents.self)
    }
    
}











