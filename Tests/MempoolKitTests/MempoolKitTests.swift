import XCTest
@testable import MempoolKit

final class MempoolKitTests: XCTestCase {
    @available(iOS 13.0.0, *)
    func testExample() async throws {
        let mempool = Mempool()
        do {
            let b = try await mempool.blockHeight(10000000)
            print(b)
        }catch MempoolError.custom(let b) {
            print("Error: \(b)")
        }catch MempoolError.blockNotFound {
            print("Invalid Number")
        }
        print("Done")
    }
}



