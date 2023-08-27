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

'''swift
test
'''




Every method from Mempool is comming to this Package soon.

Work in progress…
