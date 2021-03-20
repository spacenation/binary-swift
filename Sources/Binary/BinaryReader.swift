import Foundation

public struct BinaryReader {
    public let bytes: [UInt8]
    public let cursor: Int
    
    public init(bytes: [UInt8], cursor: Int = 0) {
        self.bytes = bytes
        self.cursor = cursor
    }
}

public extension BinaryReader {
    func readBit() -> Optional<(Bit, BinaryReader)> {
        if let bit = bytes.bit(cursor) {
            return (bit, BinaryReader(bytes: self.bytes, cursor: cursor + 1))
        } else {
            return nil
        }
    }
}


