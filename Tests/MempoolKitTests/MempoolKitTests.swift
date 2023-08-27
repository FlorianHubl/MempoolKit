import XCTest
@testable import MempoolKit

final class MempoolKitTests: XCTestCase {
    @available(iOS 13.0.0, *)
    func testExample() async throws {
        let mempool = Mempool()
        let a = try! await mempool.addressTXSChain("bc1qpajjswk98ete225ayletndpuefj2ws0dvess8x", lastTXID: "0be398ce3603e01ee9b2c1c980c9a8b55cdd187b133b758fd028222787dfcc22")
    }
}
