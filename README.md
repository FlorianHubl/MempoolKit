# MempoolKit

<img src="https://github.com/FlorianHubl/MempoolKit/blob/main/Animation.gif">

A Swift Package that enables to get Bitcoin data through a Mempool instance.

## Requirements

- iOS 13 or higher
- macOS 12 or higher

## Installation

- Add it using XCode menu **File --> Swift Package --> Add Package Dependency**
- Add **https://github.com/FlorianHubl/MempoolKit** as Swift Package URL
- Click on the package
- Click Add Package and you are done

## Documentation

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

### Address

```swift
let address = try await mempool.address("1wiz18xYmhRX6xStj2b9t1rwWX4GKUgpv")
```

Returns details about an address.

### Address Transactions

```swift
let txs = try await mempool.addressTXS("1wiz18xYmhRX6xStj2b9t1rwWX4GKUgpv")
```

Get transaction history for the specified address/scripthash, sorted with newest first. Returns up to 50 mempool transactions plus the first 25 confirmed transactions. You can request more confirmed transactions using addressTXSChain.

### Address Transactions Chain

```swift
let txs = try await mempool.addressTXSChain("1wiz18xYmhRX6xStj2b9t1rwWX4GKUgpv", lastTXID: "277bbdc3557f163810feea810bf390ed90724ec75de779ab181b865292bb1dc1")
```

Get confirmed transaction history for the specified address/scripthash, sorted with newest first. Returns 25 transactions per page. More can be requested by specifying the last txid seen by the previous call.

### Address Transactions Mempool

Get unconfirmed transaction history for the specified address/scripthash. Returns up to 50 transactions (no paging).

```swift
let txsMempool = try await mempool.addressTXSMempool("1wiz18xYmhRX6xStj2b9t1rwWX4GKUgpv")
```

### Address UTXOs

```swift
let utxos = try await mempool.addressUTXOs("1wiz18xYmhRX6xStj2b9t1rwWX4GKUgpv")
```

Get the list of unspent transaction outputs associated with the address/scripthash.

### Get Block

```swift
let block = try await mempool.block("000000000000000015dc777b3ff2611091336355d3f0ee9766a2cf3be8e4b1ce")
```

Returns details about a block.

### Hex Block Header

```swift
let blockHeader = try await mempool.blockHeader("000000000000000015dc777b3ff2611091336355d3f0ee9766a2cf3be8e4b1ce")
```

Returns the hex-encoded block header.

### Get Block Height

```swift
let blockHash = try await mempool.blockHeight(800000)
```

Returns the hash of the block at the input height.

### Get raw Block

```swift
let rawBlock = try await mempool.blockRaw("0000000000000000000065bda8f8a88f2e1e00d9a6887a43d640e52a4c7660f2")
```

Returns the raw block representation in Swifts Data Type.

### Block Status

```swift
let blockStatus = try await mempool.blockStatus("0000000000000000000065bda8f8a88f2e1e00d9a6887a43d640e52a4c7660f2")
```

Returns the confirmation status of a block.

### Block Tip Height

```swift
let blockTipHeight = try await mempool.blockTipHeight("0000000000000000000065bda8f8a88f2e1e00d9a6887a43d640e52a4c7660f2")
```

Returns the height of the last block.

### Block Tip Hash

```swift
let blockTipHash = try await mempool.blockTipHash("0000000000000000000065bda8f8a88f2e1e00d9a6887a43d640e52a4c7660f2")
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
let blockTXIDs = try await mempool.blockTXs("0000000000000000000065bda8f8a88f2e1e00d9a6887a43d640e52a4c7660f2")
```

Returns a list of 25 transactions in the block.

### Get Blocks

```swift
let blocks = try await mempool.blocks("0000000000000000000065bda8f8a88f2e1e00d9a6887a43d640e52a4c7660f2")
```

Returns details on the past 15 blocks with fee and mining details in extras.

### Warning

Please also note that this package is still in the early stages of development and is therefore still very buggy.

Also please report bugs to improve the package.

Every method from Mempool is comming to this Package soon.

Work in progress…

