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

public extension UInt8 {
    var bits: [Bit] {
        Array((0...7)).reversed().map { self.bit(at: $0) }
    }
}

public extension UInt8 {
    func bit(at index: Int) -> Bit {
        let bits = (0...7).map { UInt8(1) << $0 }
        return (self & bits[index] != 0) ? Bit.one : Bit.zero
    }
}

public extension Collection where Element == UInt8 {
    var bits: [Bit] {
        self.flatMap { $0.bits }
    }
}
