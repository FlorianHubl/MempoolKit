# MempoolKit

<img src="https://github.com/FlorianHubl/MempoolKit/blob/main/MempoolKit%20Logo.png" width="173" height="173">

A Swift Package that enables to get Bitcoin data through a mempool instance.

## Requirements

- iOS 13 or higher
- macOS 12 or higher

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
let difficultyAdjustment = try await mempool.address("1wiz18xYmhRX6xStj2b9t1rwWX4GKUgpv")
```

Returns details about an address.

### Address Transactions

```swift
let difficultyAdjustment = try await mempool.addressTXS("1wiz18xYmhRX6xStj2b9t1rwWX4GKUgpv")
```

Get transaction history for the specified address/scripthash, sorted with newest first. Returns up to 50 mempool transactions plus the first 25 confirmed transactions. You can request more confirmed transactions using addressTXSChain.

### Address Transactions Chain

```swift
let difficultyAdjustment = try await mempool.addressTXSChain("1wiz18xYmhRX6xStj2b9t1rwWX4GKUgpv", lastTXID: "277bbdc3557f163810feea810bf390ed90724ec75de779ab181b865292bb1dc1")
```

Get confirmed transaction history for the specified address/scripthash, sorted with newest first. Returns 25 transactions per page. More can be requested by specifying the last txid seen by the previous call.

### Warning

Please also note that this package is still in the early stages of development and is therefore still very buggy.

Every method from Mempool is comming to this Package soon.

Work in progress…
