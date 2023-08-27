import XCTest
@testable import MempoolKit

final class MempoolKitTests: XCTestCase {
    @available(iOS 13.0.0, *)
    func testExample() async throws {
        let mempool = Mempool()
        let a = try! await mempool.addressUTXOs("1KFHE7w8BhaENAswwryaoccDb6qcT6DbYY")
        print(a.count)
    }
}
