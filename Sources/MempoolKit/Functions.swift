
// Mempool Methods

import SwiftUI

@available(iOS 13.0.0, macOS 12.0.0,  *)
extension Mempool: BlockExplorer {
    
    // General
    
    /// Information about the difficulty adjustment such as previousRetarget, progressPercent and many more.
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
    /// - Returns: Unconfirmed transaction history for the specified address/scripthash. Returns up to 50 transactions (no paging)
    public func addressTXSMempool(address: String) async throws -> Transactions {
        try await request(for: .address, method: .get, type: Transactions.self, extention: "\(address)/txs/mempool")
    }
    
    /// Address UTXOs
    /// - Parameter address: Bitcoin Address
    /// - Returns: The list of unspent transaction outputs associated with the address
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
    /// - Returns: A list of all Transaction IDs in the block.
    public func blockTXIDs(blockHash: String) async throws -> [String] {
        try await request(for: .block, method: .get, type: [String].self, extention: "\(blockHash)/txids")
    }
    
    /// Block Transaction
    /// - Parameter blockHash: The Blocks Hash or ID
    /// - Returns: A list of 25 transactions in the block.
    public func blockTXs(blockHash: String) async throws -> Transactions {
        try await request(for: .block, method: .get, type: Transactions.self, extention: "\(blockHash)/txs")
    }
    
    /// Get Blocks
    /// - Parameter blockHeight: The Blocks Hash or ID
    /// - Returns: Details on the past 15 blocks with fee and mining details in extras
    public func blocks(blockHeight: Int) async throws -> Blocks {
        try await request(for: .blocks, method: .get, type: Blocks.self, extention: "\(blockHeight)")
    }
    
    // Disabled
    
    private func blocksBulk(start: Int, end: Int) async throws -> Blocks {
        try await request(for: .blocks, method: .get, type: Blocks.self, extention: "\(start)/\(end)")
    }
    
    // Mining
    
    /// Mining Pools
    /// - Parameter time: The specified time: 1 day, 3 days, 1 week, 1 month, 3 months, 6 months, one year, two years or three years
    /// - Returns: A list of all known mining pools ordered by blocks found over the specified time.
    public func miningPools(time: MempoolTime) async throws -> MiningPools {
        try await request(for: .miningPools, method: .get, type: MiningPools.self, extention: time.rawValue)
    }
    
    /// Mining Pool
    /// - Parameter miningPool: Name of the Mining Pool
    /// - Returns: Details about the mining pool.
    public func miningPool(miningPool: String) async throws -> MiningPool {
        try await request(for: .miningPool, method: .get, type: MiningPool.self, extention: miningPool)
    }
    
    /// Mining Pool Hashrates
    /// - Parameter time: The specified time: 1 day, 3 days, 1 week, 1 month, 3 months, 6 months, one year, two years or three years
    /// - Returns: Average hashrates (and share of total hashrate) of mining pools active in the specified time, in descending order of hashrate.
    public func miningPoolHashrates(time: MempoolTime) async throws -> MiningPoolHashrates {
        try await request(for: .miningPoolHashrate, method: .get, type: MiningPoolHashrates.self, extention: time.rawValue)
    }
    
    /// Mining Pool Hashrate
    /// - Parameter miningPool: Name of the Mining Pool
    /// - Returns: All known hashrate data for the mining pool specified by the name. Hashrate values are weekly averages.
    public func miningPoolHashrate(miningPool: String) async throws -> MiningPoolHashrates {
        try await request(for: .miningPool, method: .get, type: MiningPoolHashrates.self, extention: "\(miningPool)/hashrate")
    }
    
    /// Mining Pool Blocks
    /// - Parameters:
    ///   - miningPool: Name of the Mining Pool
    ///   - blockHeight: Height of the block
    /// - Returns: Past 10 blocks mined by the specified mining pool before the specified blockHeight. If no blockHeight is specified, the mining pool's 10 most recent blocks are returned.
    public func miningPoolBlocks(miningPool: String, blockHeight: Int? = nil) async throws -> Blocks {
        try await request(for: .miningPool, method: .get, type: Blocks.self, extention: "\(miningPool)/blocks/\(blockHeight != nil ? String(blockHeight!) : "")")
    }
    
    /// Hashrate and Difficulty
    /// - Parameter time: The specified time: 1 day, 3 days, 1 week, 1 month, 3 months, 6 months, one year, two years or three years
    /// - Returns: Network-wide hashrate and difficulty figures over the specified time.
    public func miningHashrate(time: MempoolTime) async throws -> Hashrate {
        try await request(for: .hashrate, method: .get, type: Hashrate.self, extention: time.rawValue)
    }
    
    /// Mining Reward Stats
    /// - Parameter blockCount: specified block count
    /// - Returns: Block reward and total transactions confirmed for the past specified blocks.
    public func miningRewardStats(blockCount: Int) async throws -> MiningRewardStats {
        try await request(for: .reward, method: .get, type: MiningRewardStats.self, extention: "\(blockCount)")
    }
    
    /// Block Fees
    /// - Parameter time: The specified time: 1 day, 3 days, 1 week, 1 month, 3 months, 6 months, one year, two years or three years
    /// - Returns: Average total fees for blocks in the specified time, ordered oldest to newest.
    public func blockFees(time: MempoolTime) async throws -> BlockFees {
        try await request(for: .blockFees, method: .get, type: BlockFees.self, extention: time.rawValue)
    }
    
    /// Block Rewards
    /// - Parameter time: The specified time: 1 day, 3 days, 1 week, 1 month, 3 months, 6 months, one year, two years or three years
    /// - Returns: Average block rewards for blocks in the specified time, ordered oldest to newest.
    public func blockRewards(time: MempoolTime) async throws -> BlockRewards {
        try await request(for: .blockRewards, method: .get, type: BlockRewards.self, extention: time.rawValue)
    }
    
    /// Block Fee Rats
    /// - Parameter time: The specified time: 1 day, 3 days, 1 week, 1 month, 3 months, 6 months, one year, two years or three years
    /// - Returns: Average feerate percentiles for blocks in the specified time, ordered oldest to newest.
    public func blockFeeRates(time: MempoolTime) async throws -> BlockFeeRates {
        try await request(for: .blockFeeRats, method: .get, type: BlockFeeRates.self, extention: time.rawValue)
    }
    
    /// Block Size And Weights
    /// - Parameter time: The specified time: 1 day, 3 days, 1 week, 1 month, 3 months, 6 months, one year, two years or three years
    /// - Returns: Average size (bytes) and average weight (weight units) for blocks in the specified time, ordered oldest to newest.
    public func blockSizeAndWeights(time: MempoolTime) async throws -> BlockSizeAndWeights {
        try await request(for: .blockSizeAndWeights, method: .get, type: BlockSizeAndWeights.self, extention: time.rawValue)
    }
    
    // Fees
    
    /// Mempool Block Fees
    /// - Returns: Current mempool as projected blocks.
    public func mempoolBlockFees() async throws -> MempoolBlockFees {
        try await request(for: .mempoolBlockFees, method: .get, type: MempoolBlockFees.self)
    }
    
    /// Recommended Fees
    /// - Returns: The currently suggested fees for new transactions.
    public func recommendedFees() async throws -> RecommendedFees {
        try await request(for: .recommendedFees, method: .get, type: RecommendedFees.self)
    }
    
    // Mempool
    
    /// Mempool
    /// - Returns: Current mempool backlog statistics.
    public func mempool() async throws -> MempoolStatistic {
        try await request(for: .mempool, method: .get, type: MempoolStatistic.self)
    }
    
    /// Mempool Transaction IDs
    /// - Returns: The full list of transaction IDs in the mempool as an array. The order of the transaction IDs is arbitrary and does not match bitcoind.
    public func mempoolTXIDs() async throws -> [String] {
        try await request(for: .mempoolTXIDs, method: .get, type: [String].self)
    }
    
    /// Mempool Recent
    /// - Returns: A list of the last 10 transactions to enter the mempool. Each transaction object contains simplified overview data.
    public func mempoolRecent() async throws -> MempoolRecents {
        try await request(for: .mempoolRecent, method: .get, type: MempoolRecents.self)
    }
    
    // Transactions
    
    /// Children Pay For Parrent
    /// - Parameter txid: Transaction ID
    /// - Returns: The ancestors and the best descendant fees for a transaction.
    public func childrenPayForParrent(txid: String) async throws -> CPFP {
        try await request(for: .cpfp, method: .get, type: CPFP.self, extention: txid)
    }
    
    /// Transaction
    /// - Parameter txid: Transaction ID
    /// - Returns: Details about a transaction
    public func transaction(txid: String) async throws -> Transaction {
        try await request(for: .transaction, method: .get, type: Transaction.self, extention: txid)
    }
    
    /// Transaction Hex
    /// - Parameter txid: Transaction ID
    /// - Returns: A transaction serialized as hex.
    public func transactionHex(txid: String) async throws -> String {
        try await request(for: .transaction, method: .get, type: String.self, extention: "\(txid)/hex")
    }
    
    /// Transaction Merkle Block Proof
    /// - Parameter txid: Transaction ID
    /// - Returns: A merkle inclusion proof for the transaction using bitcoind's merkleblock format.
    public func transactionMerkleBlockProof(txid: String) async throws -> String {
        try await request(for: .transaction, method: .get, type: String.self, extention: "\(txid)/merkleblock-proof")
    }
    
    /// Transaction Merkle Proof
    /// - Parameter txid: Transaction ID
    /// - Returns: A merkle inclusion proof for the transaction using Electrum's blockchain.transaction.get_merkle format.
    public func transactionMerkleProof(txid: String) async throws -> MercleProof {
        try await request(for: .transaction, method: .get, type: MercleProof.self, extention: "\(txid)/merkle-proof")
    }
    
    /// Transaction Outspend
    /// - Parameters:
    ///   - txid: Transaction ID
    ///   - vout: The index of the vout.
    /// - Returns: The spending status of a transaction output.
    public func transactionOutspend(txid: String, vout: Int) async throws -> TransactionOutspend {
        try await request(for: .transaction, method: .get, type: TransactionOutspend.self, extention: "\(txid)/outspend/\(vout)")
    }
    
    /// Transaction Outspends
    /// - Parameter txid: Transaction ID
    /// - Returns: The spending status of all transaction outputs.
    public func transactionOutspends(txid: String) async throws -> TransactionOutspends {
        try await request(for: .transaction, method: .get, type: TransactionOutspends.self, extention: "\(txid)/outspends")
    }
    
    /// Transaction Raw
    /// - Parameter txid: Transaction ID
    /// - Returns: A transaction as Data.
    public func transactionRaw(txid: String) async throws -> Data {
        try await request(for: .transaction, method: .get, type: Data.self, extention: "\(txid)/raw")
    }
    
    /// Transaction Status
    /// - Parameter txid: Transaction ID
    /// - Returns: The confirmation status of a transaction.
    public func transactionStatus(txid: String) async throws -> TransactionStatus {
        try await request(for: .transaction, method: .get, type: TransactionStatus.self, extention: "\(txid)/status")
    }
    
    /// Send Transaction
    /// Broadcast a raw Transaction to the Bitcoin network.
    /// - Parameter hex: The raw Hex of the Transaction.
    /// - Returns: Transaction ID will be returned on success.
    public func sendTransaction(hex: String) async throws -> String {
        try await request(for: .transaction, method: .post, type: String.self, payLoad: hex)
    }
    
    // Lightning
    
    /// Lightning Network Statistic
    /// - Parameter time: Time
    /// - Returns: Network-wide stats such as total number of channels and nodes, total capacity, and average/median fee figures.
    public func lightningStatistic(time: MempoolTime) async throws -> LightningStatistics {
        try await request(for: .lightning, method: .get, type: LightningStatistics.self, extention: time.rawValue)
    }
    
    /// Search Lightning Nodes and Lightning Channels
    /// - Parameter node: Lightning Node aliases, node pubkeys, channel IDs, and short channel IDs.
    /// - Returns: Lightning nodes and channels that match the full-text, case-insensitive.
    public func lightningNodes(node: String) async throws -> LightningNodes {
        try await request(for: .channel, method: .get, type: LightningNodes.self, extention: node, extWithSlash: false)
    }
    
    /// Search Lightning Nodes in a Country
    /// - Parameter country: country name in ISO Alpha-2 country code. Not every country is supported.
    /// - Returns: A list of Lightning nodes running on clearnet in the requested country.
    public func lightningNodesInCountry(country: CountryCode) async throws -> LightningNodesCountry {
        try await request(for: .country, method: .get, type: LightningNodesCountry.self, extention: country.rawValue)
    }
    
    /// Statistic about Lightning Nodes per country
    /// - Returns: Aggregate capacity and number of clearnet nodes per country. Capacity figures are in satoshis.
    public func lightningNodesStatisticsPerCountry() async throws -> LightningNodesCountries {
        try await request(for: .countries, method: .get, type: LightningNodesCountries.self)
    }
    
    /// Lightning ISP
    /// - Parameter isp: Index of ISP
    /// - Returns: A list of nodes hosted by a specified isp, where isp is an ISP's ASN.
    public func lightningISP(isp: Int) async throws -> LightningISP {
        try await request(for: .isp, method: .get, type: LightningISP.self, extention: "\(isp)")
    }
    
    /// Lightning Node Statistic Per ISP
    /// - Returns: Aggregate capacity, number of nodes, and number of channels per ISP. Capacity figures are in satoshis.
    public func lightningNodeStatisticPerISP() async throws -> LightningNodeStatisticPerISP {
        try await request(for: .ispRanking, method: .get, type: LightningNodeStatisticPerISP.self)
    }
    
    /// Lightning Top 100 Nodes
    /// - Returns: Two lists of the top 100 nodes: one ordered by liquidity (aggregate channel capacity) and the other ordered by connectivity (number of open channels).
    public func lightningTop100Nodes() async throws -> LightningTop100Nodes {
        try await request(for: .top100Nodes, method: .get, type: LightningTop100Nodes.self)
    }
    
    /// Lightning Top 100 Nodes sorted by Liquidity
    /// - Returns: A list of the top 100 nodes by liquidity (aggregate channel capacity).
    public func lightningTop100NodesByLiquidity() async throws -> [LightningTop100NodesByLiquidity] {
        try await request(for: .top100NodesLiquidity, method: .get, type: [LightningTop100NodesByLiquidity].self)
    }
    
    /// Lightning Top 100 Nodes sorted by Connectivity
    /// - Returns: A list of the top 100 nodes by connectivity (number of open channels).
    public func lightningTop100NodesByConnectivity() async throws -> [LightningTop100NodesByLiquidity] {
        try await request(for: .top100NodesConnectivity, method: .get, type: [LightningTop100NodesByLiquidity].self)
    }
    
    /// Lightning Top 100 Nodes sorted by Age
    /// - Returns: A list of the top 100 oldest nodes.
    public func lightningTop100OldestNodes() async throws -> [LightningTop100NodesByLiquidity] {
        try await request(for: .top100NodesAge, method: .get, type: [LightningTop100NodesByLiquidity].self)
    }
    
    /// Lightning Node Statistics
    /// - Parameter pubKey: Lightning Node public Key
    /// - Returns: Details about a node with the given public Key
    public func lightningNodeStatistic(pubKey: String) async throws -> LightningNodeStatistic {
        try await request(for: .lightningNode, method: .get, type: LightningNodeStatistic.self, extention: pubKey)
    }
    
    /// Lightning Historical Node Statistics
    /// - Parameter pubKey: Lightning Node public Key
    /// - Returns: Historical stats for a node with the given public Key
    public func lightningHistoricalNodeStatistics(pubKey: String) async throws -> LightningHistoricalNodeStatistics {
        try await request(for: .lightningNode, method: .get, type: LightningHistoricalNodeStatistics.self, extention: "\(pubKey)/statistics")
    }
    
    /// Lightning Channel
    /// - Parameter channelID: ID of the Lightning Channel
    /// - Returns: Info about a Lightning channel with the given channelID.
    public func lightningChannel(channelID: String) async throws -> LightningChannel {
        try await request(for: .lightningChannel, method: .get, type: LightningChannel.self, extention: channelID)
    }
    
    /// Lightning Channel from Transaction ID
    /// - Parameter txid: Transaction ID
    /// - Returns: Channels that correspond to the given transaction ID.
    public func lightningChannelTXID(txid: String) async throws -> ChannelTXIDs { // Doesnt support multiple txids jet
        try await request(for: .lightningChannel, method: .get, type: ChannelTXIDs.self, extention: "txids?txId[]=\(txid)")
    }
    
    /// Lightning Channel From Node Pubkey
    /// - Parameters:
    ///   - pubkey: Public Key of the Lightning Node
    ///   - channelStatus: Status of the Lightning Channels
    /// - Returns: A list of a node's channels given its public Key.
    public func lightningChannelFromNodePubkey(pubkey: String, channelStatus: MempoolChannelStatus) async throws -> [LightningChannelFromNodePubkey] {
        try await request(for: .lightningChannel, method: .get, type: [LightningChannelFromNodePubkey].self, extention: "?public_key=\(pubkey)&status=\(channelStatus.rawValue)", extWithSlash: false)
    }
    
    /// Lightning Channel Geodata
    /// - Returns: A list of channels with corresponding node geodata.
//    public func lightningChannelGeodata() async throws -> [[]] {
//        try await request(for: .lightningChannelGeoStatus, method: .get, type: [[]].self)
//    }
}
