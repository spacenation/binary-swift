import Foundation

public enum BitsExtensionStrategy: Equatable {
    case fixed
    case signExtended(UInt)
    case zeroExtended(UInt)
    case zeroBackfill(UInt)
}
