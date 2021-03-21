import Foundation

public struct BinaryReader {
    public let bytes: [UInt8]
    public let cursor: Int
    
    public init(bytes: [UInt8], cursor: Int = 0) {
        self.bytes = bytes
        self.cursor = cursor
    }
    
    public func withCursor(offset: Int) -> Self {
        BinaryReader(bytes: self.bytes, cursor: cursor + offset)
    }
}

public extension BinaryReader {
    func readBit() -> Optional<(Bit, BinaryReader)> {
        bytes.bit(cursor).flatMap { ($0, self.withCursor(offset: 1)) }
    }
    
    func read<T>(_ type: T.Type = T.self, size: Array<UInt8>.Size = MemoryLayout<T>.size * .byte) -> Optional<(T, BinaryReader)> {
        if let data = try? bytes.bytes(bitRange: cursor...cursor + size - 1) {
            let typeRead = withUnsafeBytes(of: Data(data).prefix(size / .byte)) {
                $0.baseAddress!.assumingMemoryBound(to: T.self).pointee
            }
            return (typeRead, self.withCursor(offset: cursor + size))
        } else {
            return nil
        }
    }
}


