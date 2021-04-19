import XCTest
import Binary
import List

final class ExtendBitsTests: XCTestCase {
    func testZeroExtended() {
        XCTAssertEqual(
            List<Bit>([.one, .zero, .zero, .zero]).zeroExtended(to: 8),
            List<Bit>([.zero, .zero, .zero, .zero, .one, .zero, .zero, .zero])
        )
    }
    
    func testSignExtendedPositive() {
        XCTAssertEqual(
            List<Bit>([.zero, .one, .one, .one]).signExtended(to: 8),
            List<Bit>([.zero, .zero, .zero, .zero, .zero, .one, .one, .one])
        )
    }
    
    func testSignExtendedNegative() {
        XCTAssertEqual(
            List<Bit>([.one, .zero, .one, .one]).signExtended(to: 8),
            List<Bit>([.one, .one, .one, .one, .one, .zero, .one, .one])
        )
    }
    
    func testZeroBackfill() {
        XCTAssertEqual(
            List<Bit>([.one, .zero, .one, .one]).zeroBackfill(to: 8),
            List<Bit>([.one, .zero, .one, .one, .zero, .zero, .zero, .zero])
        )
    }

    static var allTests = [
        ("testZeroExtended", testZeroExtended),
        ("testSignExtendedPositive", testSignExtendedPositive),
        ("testSignExtendedNegative", testSignExtendedNegative),
        ("testZeroBackfill", testZeroBackfill),
    ]
}
