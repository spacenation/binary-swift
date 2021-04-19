import Foundation
import List

public extension List where Element == Bit {
    func extend(to length: UInt, with strategy: BitsExtensionStrategy) -> Self {
        switch strategy {
        case .zeroExtended:
            return self.zeroExtended(to: length)
        case .signExtended:
            return self.signExtended(to: length)
        case .zeroBackfill:
            return self.zeroBackfill(to: length)
        }
    }
    
    func zeroExtended(to length: UInt) -> Self {
        self.paddedLeft(to: length, with: .zero)
    }
    
    func signExtended(to length: UInt) -> Self {
        switch self {
        case .empty:
            return self.paddedLeft(to: length, with: .zero)
        case let .nonEmpty(list):
            return self.paddedLeft(to: length, with: list.head)
        }
    }
    
    func zeroBackfill(to length: UInt) -> Self {
        self.paddedRight(to: length, with: .zero)
    }
}
