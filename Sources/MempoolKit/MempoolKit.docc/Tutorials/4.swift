
import SwiftUI
import MempoolKit

struct ContentView: View {
    
    let mempool = Mempool()
    
    @State private var blocks = Blocks()
    
    var body: some View {
        NavigationStack {
            Form {
                ForEach(blocks) { block in
                    Button("\(block.height)") {
                        
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

