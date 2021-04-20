import Foundation

public enum HexSymbol: Equatable {
    case zero
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case a
    case b
    case c
    case d
    case e
    case f
}

public extension HexSymbol {
    init?(_ character: Character) {
        switch character {
        case "0":
            self = .zero
        case "1":
            self = .one
        case "2":
            self = .two
        case "3":
            self = .three
        case "4":
            self = .four
        case "5":
            self = .five
        case "6":
            self = .six
        case "7":
            self = .seven
        case "8":
            self = .eight
        case "9":
            self = .nine
        case "a", "A":
            self = .a
        case "b", "B":
            self = .b
        case "c", "C":
            self = .c
        case "d", "D":
            self = .d
        case "e", "E":
            self = .e
        case "f", "F":
            self = .f
        default:
            return nil
        }
    }
}


public extension HexSymbol {
    var bits: List<Bit> {
        switch self {
        case .zero:
            return [.zero, .zero, .zero, .zero]
        case .one:
            return [.zero, .zero, .zero, .one]
        case .two:
            return [.zero, .zero, .one, .zero]
        case .three:
            return [.zero, .zero, .one, .one]
        case .four:
            return [.zero, .one, .zero, .zero]
        case .five:
            return [.zero, .one, .zero, .one]
        case .six:
            return [.zero, .one, .one, .zero]
        case .seven:
            return [.zero, .one, .one, .one]
        case .eight:
            return [.one, .zero, .zero, .zero]
        case .nine:
            return [.one, .zero, .zero, .one]
        case .a:
            return [.one, .zero, .one, .zero]
        case .b:
            return [.one, .zero, .one, .one]
        case .c:
            return [.one, .one, .zero, .zero]
        case .d:
            return [.one, .one, .zero, .one]
        case .e:
            return [.one, .one, .one, .zero]
        case .f:
            return [.one, .one, .one, .one]
        }
    }
}
