
import SwiftUI
import MempoolKit

struct ContentView: View {
    
    let mempool = Mempool()
    
    var body: some View {
        NavigationStack {
            Form {
                
            }
            .navigationTitle("MempoolKit Tutorial")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

