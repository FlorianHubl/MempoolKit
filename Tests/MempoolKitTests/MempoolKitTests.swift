import XCTest
@testable import MempoolKit

final class MempoolKitTests: XCTestCase {
    @available(iOS 13.0.0, *)
    func testExample() async throws {
        let mempool = Mempool()
        print("Hello")
        print( try! await mempool.addressTXS("bc1qtluzywsh3y0zxce5rh2j9wm6njz844tz66mg5g"))
        print("Done")
    }
}
