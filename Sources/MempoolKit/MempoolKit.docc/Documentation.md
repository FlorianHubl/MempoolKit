# MempoolKit

A Swift Package that enables to get Bitcoin data through a Mempool instance.

## Overview

This Swift Package gives you the power to get Data from the Bitcoin Network quick and easy.
You can connect your own instance of mempool or use mempool.space.

![](Wallpaper.gif)

## Tutorial

Write a Demo Mempool App with this tutorial:

<doc:MempolKit>

### Get started

To get started create an Instance of Mempool.

```swift
let mempool = Mempool()
```

This command connects the instance to the official mempool.space server.

You can also connect it to your own instance of mempool.

```swift
let mempool = Mempool(server: "https://yourmempoolinstance.local")
```

Now you can get alost every information from the Bbitcoin Network.
First we get the block height of the lastest block.

```swift
let latestBlockHeight = try await mempool.blockTipHeight()
```

To get the hash of this block use the blockHeight method.

```swift
let latestBlockHash = try await mempool.blockHeight(blockHeight: latestBlockHeight)
```

Lets get a few information from this block using the block method.

```swift
let block = try await mempool.block(blockHash: latestBlockHash)
```

To see every method please read to the ``MempoolKit`` page.
