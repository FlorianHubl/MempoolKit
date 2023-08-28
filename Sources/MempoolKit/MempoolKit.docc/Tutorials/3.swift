import MempoolKit

let mempool = Mempool()

Task {
    let latestBlockHeight = try await mempool.blockTipHeight()
}
