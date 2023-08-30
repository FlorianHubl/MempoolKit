
import SwiftUI
import MempoolKit

struct ContentView: View {
    
    let mempool = Mempool()
    
    @State private var blocks = Blocks()
    
    var body: some View {
        NavigationStack {
            Form {
                ForEach(blocks) { block in
                    NavigationLink("\(block.height)", value: block)
                }
            }
            .navigationTitle("MempoolKit Tutorial")
            .navigationDestination(for: Block.self) { block in
                Form {
                    LabeledContent("Hash", value: block.id)
                    LabeledContent("Difficulty", value: "\(block.difficulty)")
                    LabeledContent("Nonce", value: "\(block.nonce)")
                    LabeledContent("Transactions", value: "\(block.tx_count)")
                }
                .navigationTitle("Block \(block.height)")
            }
            .task {
                await refresh()
            }
            .refreshable {
                await refresh()
            }
        }
    }
    
    func refresh() async {
        let currentBlockHeight = try! await mempool.blockTipHeight()
        let newBlocks = try! await mempool.blocks(blockHeight: currentBlockHeight)
        blocks = newBlocks
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




