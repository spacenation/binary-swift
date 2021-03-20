import Foundation

public enum Bit {
    case zero
    case one
}

public extension Bit {
    init(_ int: UInt8) {
        self = int == 0 ? .zero : .one
    }
}

public extension Bool {
    init(bit: Bit) {
        switch bit {
        case .zero:
            self = false
        case .one:
            self = true
        }
    }
}
