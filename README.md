# MempoolKit

<img src="https://github.com/FlorianHubl/MempoolKit/blob/main/Wallpaper.gif">

A Swift Package that enables to get Bitcoin data through a Mempool instance.

## Requirements

- iOS 13 or higher
- macOS 12 or higher

## Installation

- Add it using XCode menu **File --> Swift Package --> Add Package Dependency**
- Add **https://github.com/FlorianHubl/MempoolKit** as Swift Package URL
- Click on the package
- Click Add Package and you are done

## DocC Documentation

The Package is fully documented with DocC. Open the documentation window in xCode to read the documentation.
There will also be Tutorials in the documentation in the future which explane how to use the package with SwiftUI.

# Tutorial

There will be a full DocC tutorial how to build a demo App with MempoolKit in the future.

<img src="https://github.com/FlorianHubl/MempoolKit/blob/main/Tutorial.gif" width="173">

# Documentation

### Create a Instance

```swift
let mempool = Mempool()
```

This command connects the instance to the official mempool space server.

### Connecting to own Instance

You can also connect it to your own instance of mempool.

```swift
let mempool = Mempool(server: "https://yourmempoolinstance.local")
```

### Warning

Please note that each method below is async and may throw errors.

### Difficulty Adjustment

```swift
let difficultyAdjustment = try await mempool.difficultyAdjustment()
```

Returns details about difficulty adjustment.

## Addresses

### Address

```swift
let address = try await mempool.address(address: "1wiz18xYmhRX6xStj2b9t1rwWX4GKUgpv")
```

Returns details about an address.

### Address Transactions

```swift
let txs = try await mempool.addressTXS(address: "1wiz18xYmhRX6xStj2b9t1rwWX4GKUgpv")
```

Get transaction history for the specified address/scripthash, sorted with newest first. Returns up to 50 mempool transactions plus the first 25 confirmed transactions. You can request more confirmed transactions using addressTXSChain.

### Address Transactions Chain

```swift
let txs = try await mempool.addressTXSChain(address: "1wiz18xYmhRX6xStj2b9t1rwWX4GKUgpv", lastTXID: "277bbdc3557f163810feea810bf390ed90724ec75de779ab181b865292bb1dc1")
```

Get confirmed transaction history for the specified address/scripthash, sorted with newest first. Returns 25 transactions per page. More can be requested by specifying the last txid seen by the previous call.

### Address Transactions Mempool

Get unconfirmed transaction history for the specified address/scripthash. Returns up to 50 transactions (no paging).

```swift
let txsMempool = try await mempool.addressTXSMempool(address: "1wiz18xYmhRX6xStj2b9t1rwWX4GKUgpv")
```

### Address UTXOs

```swift
let utxos = try await mempool.addressUTXOs(address: "1wiz18xYmhRX6xStj2b9t1rwWX4GKUgpv")
```

Get the list of unspent transaction outputs associated with the address/scripthash.

## Blocks

### Get Block

```swift
let block = try await mempool.block(blockHash: "000000000000000015dc777b3ff2611091336355d3f0ee9766a2cf3be8e4b1ce")
```

Returns details about a block.

### Hex Block Header

```swift
let blockHeader = try await mempool.blockHeader(blockHash: "000000000000000015dc777b3ff2611091336355d3f0ee9766a2cf3be8e4b1ce")
```

Returns the hex-encoded block header.

### Get Block Height

```swift
let blockHash = try await mempool.blockHeight(blockHeight: 800000)
```

Returns the hash of the block at the input height.

### Get raw Block

```swift
let rawBlock = try await mempool.blockRaw(blockHash: "0000000000000000000065bda8f8a88f2e1e00d9a6887a43d640e52a4c7660f2")
```

Returns the raw block representation in Swifts Data Type.

### Block Status

```swift
let blockStatus = try await mempool.blockStatus(blockHash: "0000000000000000000065bda8f8a88f2e1e00d9a6887a43d640e52a4c7660f2")
```

Returns the confirmation status of a block.

### Block Tip Height

```swift
let blockTipHeight = try await mempool.blockTipHeight()
```

Returns the height of the last block.

### Block Tip Hash

```swift
let blockTipHash = try await mempool.blockTipHash()
```

Returns the hash of the last block.

### Block Transaction ID

```swift
let blockTXID = try await mempool.blockTXID(blockHash: "0000000000000000000065bda8f8a88f2e1e00d9a6887a43d640e52a4c7660f2", index: 1)
```

Returns the transaction at index within the specified block.

### Block Transaction IDs

```swift
let blockTXIDs = try await mempool.blockTXIDs(blockHash: "0000000000000000000065bda8f8a88f2e1e00d9a6887a43d640e52a4c7660f2", index: 1)
```

Returns a list of all txids in the block.

### Block Transaction

```swift
let blockTXIDs = try await mempool.blockTXs(blockHash: "0000000000000000000065bda8f8a88f2e1e00d9a6887a43d640e52a4c7660f2")
```

Returns a list of 25 transactions in the block.

### Get Blocks

```swift
let blocks = try await mempool.blocks(blockHash: "0000000000000000000065bda8f8a88f2e1e00d9a6887a43d640e52a4c7660f2")
```

Returns details on the past 15 blocks with fee and mining details in extras.

## Mining

### Mining Pools

```swift
let miningPools = try await mempool.miningPools(time. .oneYear)
```

Returns a list of all known mining pools ordered by blocks found over the specified time.

### Mining Pool

```swift
let miningPool = try await mempool.miningPool(miningPool: "AntPool")
```

Returns Details about the mining pool.

### Mining Pool Hashrates

```swift
let miningPoolHashrates = try await mempool.miningPoolHashrates(time: .oneYear)
```

Returns the Average hashrates (and share of total hashrate) of mining pools active in the specified time, in descending order of hashrate.

### Mining Pool Hashrate

```swift
let miningPoolHashrate = try await mempool.miningPoolHashrate(miningPool: "AntPool")
```

Returns all known hashrate data for the mining pool specified by the name. Hashrate values are weekly averages.

### Mining Pool Hashrate

```swift
let miningPoolHashrate = try await mempool.miningPoolHashrate(miningPool: "AntPool")
```

Returns all known hashrate data for the mining pool specified by the name. Hashrate values are weekly averages.

### Mining Pool Blocks

```swift
let miningPoolBlocks = try await mempool.miningPoolBlocks(miningPool: "AntPool", blockHeight: 730000)
```

Returns past 10 blocks mined by the specified mining pool before the specified blockHeight. If no blockHeight is specified, the mining pool's 10 most recent blocks are returned.

### Mining Hashrate

```swift
let miningHashrate = try await mempool.miningHashrate(time: .oneYear)
```

Returns Network-wide hashrate and difficulty figures over the specified time.

### Mining Reward Statistic

```swift
let miningRewardStats = try await mempool.miningRewardStats(blockcount: 100)
```

Returns Block reward and total transactions confirmed for the past specified blocks.

### Mining Block Fees

```swift
let blockFees = try await mempool.blockFees(time: .oneYear)
```

Returns Average total fees for blocks in the specified time, ordered oldest to newest.

### Mining Block Rewards

```swift
let blockRewards = try await mempool.blockRewards(time: .oneYear)
```

Returns Average block rewards for blocks in the specified time, ordered oldest to newest.

### Mining Block Fee Rats

```swift
let blockFeeRates = try await mempool.blockFeeRates(time: .oneYear)
```

Returns Average feerate percentiles for blocks in the specified time, ordered oldest to newest.

### Mining Block Size And Weights

```swift
let blockSizeAndWeights = try await mempool.blockSizeAndWeights(time: .oneYear)
```

Returns average size (bytes) and average weight (weight units) for blocks in the specified time, ordered oldest to newest.

## Fees

### Mempool Block Fees

```swift
let mempoolBlockFees = try await mempool.mempoolBlockFees()
```

Returns the current mempool as projected blocks.

### Recommended Fees

```swift
let recommendedFees = try await mempool.recommendedFees()
```

Returns the currently suggested fees for new transactions.

## Mempool

### Mempool

```swift
let mempool = try await mempool.mempool()
```

Returns the current mempool backlog statistics.

### Mempool Transaction IDs

```swift
let mempoolTXIDs = try await mempool.mempoolTXIDs()
```

Returns the full list of transaction IDs in the mempool as an array. The order of the transaction IDs is arbitrary and does not match bitcoind.

### Mempool Recent

```swift
let mempoolRecent = try await mempool.mempoolRecent()
```

Returns a list of the last 10 transactions to enter the mempool. Each transaction object contains simplified overview data.

## Transactions

### Children Pay For Parrent

```swift
let cpfp = try await mempool.childrenPayForParrent(txid: "f8325d8f7fa5d658ea143629288d0530d2710dc9193ddc067439de803c37066e")
```

Returns the ancestors and the best descendant fees for a transaction.

Note that this transaction is not a cpfp transaction.

### Transaction

```swift
let tx = try await mempool.transaction(txid: "f8325d8f7fa5d658ea143629288d0530d2710dc9193ddc067439de803c37066e")
```

Returns details about a transaction

### Transaction Hex

```swift
let txHex = try await mempool.transactionHex(txid: "f8325d8f7fa5d658ea143629288d0530d2710dc9193ddc067439de803c37066e")
```

Returns a transaction serialized as hex.

### Transaction Merkle Block Proof

```swift
let tx = try await mempool.transactionMerkleBlockProof(txid: "f8325d8f7fa5d658ea143629288d0530d2710dc9193ddc067439de803c37066e")
```

Returns a merkle inclusion proof for the transaction using bitcoind's merkleblock format.

### Transaction Merkle Proof

```swift
let tx = try await mempool.transactionMerkleProof(txid: "f8325d8f7fa5d658ea143629288d0530d2710dc9193ddc067439de803c37066e")
```

Returns A merkle inclusion proof for the transaction using Electrum's blockchain.transaction.get_merkle format.

### Transaction Outspend

```swift
let outspend = try await mempool.transactionOutspend(txid: "f8325d8f7fa5d658ea143629288d0530d2710dc9193ddc067439de803c37066e", vout: 1)
```

Return the spending status of a transaction output.

### Transaction Outspends

```swift
let outspends = try await mempool.transactionOutspends(txid: "f8325d8f7fa5d658ea143629288d0530d2710dc9193ddc067439de803c37066e", vout: 1)
```

Return the spending status of a transaction output.

### Transaction Raw

```swift
let rawTX = try await mempool.transactionRaw(txid: "f8325d8f7fa5d658ea143629288d0530d2710dc9193ddc067439de803c37066e")
```

Return the confirmation status of a transaction.

### Transaction Status

```swift
let txStatus = try await mempool.transactionStatus(txid: "f8325d8f7fa5d658ea143629288d0530d2710dc9193ddc067439de803c37066e")
```

Return the confirmation status of a transaction.

### Send Transaction

```swift
try await mempool.sendTransaction(hex: "01000000010000000000000000000000000000000000000000000000000000000000000000ffffffff0704ffff001d013bffffffff0100f2052a010000004341046cc86ddcd0860b7cef16cbaad7fe31fda1bf073c25cb833fa9e409e7f51e296f39b653a9c8040a2f967319ff37cf14b0991b86173462a2d5907cb6c5648b5b76ac00000000")
```

Broadcast a transaction to the Bitcoin Network. The Transaction is in the hex format.

## Lightning

### Transaction Network Statistic

```swift
let lnStats = try await mempool.lightningStatistic(time: .oneYear)
```

Return the network-wide stats such as total number of channels and nodes, total capacity, and average/median fee figures.

### Search Lightning Nodes and Lightning Channels

```swift
let lnNode = try await mempool.lightningNodes(node: "ACINQ")
```

Lightning Node aliases, node pubkeys, channel IDs, and short channel IDs. Returns Lightning nodes and channels that match the full-text, case-insensitive.

### Search Lightning Nodes in a Country

```swift
let lnNode = try await mempool.lightningNodesInCountry(country: .us)
```

Returns a list of Lightning nodes running on clearnet in the requested country.

### Statistic about Lightning Nodes per country

```swift
let lnStats = try await mempool.lightningNodesStatisticsPerCountry()
```

Returns aggregate capacity and number of clearnet nodes per country. Capacity figures are in satoshis.

### Lightning ISP

```swift
let lnIsp = try await mempool.lightningISP(isp: 16509)
```

Returns a list of nodes hosted by a specified isp, where isp is an ISP's ASN.

### Lightning Node Statistic Per ISP

```swift
let lnIsp = try await mempool.lightningNodeStatisticPerISP()
```

Returns aggregate capacity, number of nodes, and number of channels per ISP. Capacity figures are in satoshis.

### Lightning Top 100 Nodes

```swift
let top100Nodes = try await mempool.lightningTop100Nodes()
```

Returns two lists of the top 100 nodes: one ordered by liquidity (aggregate channel capacity) and the other ordered by connectivity (number of open channels).

### Lightning Top 100 Nodes sorted by Liquidity

```swift
let top100Nodes = try await mempool.lightningTop100NodesByLiquidity()
```

Returns a list of the top 100 nodes by liquidity (aggregate channel capacity).

### Lightning Top 100 Nodes sorted by Connectivity

```swift
let top100Nodes = try await mempool.lightningTop100NodesByConnectivity()
```

Returns a list of the top 100 nodes by connectivity (number of open channels).

### Lightning Top 100 Nodes sorted by Age

```swift
let top100Nodes = try await mempool.lightningTop100OldestNodes()
```

Returns a list of the top 100 oldest nodes.

### Lightning Node Statistics

```swift
let node = try await mempool.lightningNodeStatistic(pubKey: "03864ef025fde8fb587d989186ce6a4a186895ee44a926bfc370e2c366597a3f8f")
```

Returns Details about a node with the given public Key.

### Lightning Historical Node Statistics

```swift
let node = try await mempool.lightningHistoricalNodeStatistics(pubKey: "03864ef025fde8fb587d989186ce6a4a186895ee44a926bfc370e2c366597a3f8f")
```

Returns Historical stats for a node with the given public Key.

### Lightning Channel

```swift
let channel = try await mempool.lightningChannel(channelID: "855515703977115663")
```

Returns Info about a Lightning channel with the given channelID.

### Lightning Channel from Transaction ID

```swift
let channel = try await mempool.lightningChannelTXID(txid: "f95aea73705256e0d31ca722bda3e350f411590cd2e5222fb3be23912834495a")
```

Returns Channels that correspond to the given transaction ID.

### Lightning Channel From Node Pubkey

```swift
let channel = try await mempool.lightningChannelFromNodePubkey(pubkey: "855515703977115663", channelStatus: .open)
```

Returns a list of a node's channels given its public Key.

### Missing Methods:

Blocks Bulk:

This API Method is disabled by mempool.space.

Lightning Channel Geodata:

Its return JSON does not conform to a swift type.

### Warning

Please also note that this package is still in the early stages of development and is therefore still very buggy.

Also please report bugs to improve the package.

Work in progress…
