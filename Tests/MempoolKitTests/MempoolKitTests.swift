import XCTest
@testable import MempoolKit

final class MempoolKitTests: XCTestCase {
    @available(iOS 13.0.0, *)
    func testExample() async throws {
        let mempool = Mempool()
        let a = try await mempool.blockRaw("000000000000000000039c60fbc8dc80a79d73f104ed5c7b294ccc1e60a8fa97")
        print(a)
    }
}
