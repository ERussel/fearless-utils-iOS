import Foundation

public struct U8Node: Node {
    public var typeName: String { "u8" }

    public init() {}

    public func accept(encoder: DynamicScaleEncoding, value: JSON) throws {
        try encoder.appendU8(json: value)
    }
}

public struct U16Node: Node {
    public var typeName: String { "u16" }

    public init() {}

    public func accept(encoder: DynamicScaleEncoding, value: JSON) throws {
        try encoder.appendU16(json: value)
    }
}

public struct U32Node: Node {
    public var typeName: String { "u32" }

    public init() {}

    public func accept(encoder: DynamicScaleEncoding, value: JSON) throws {
        try encoder.appendU32(json: value)
    }
}

public struct U64Node: Node {
    public var typeName: String { "u64" }

    public init() {}

    public func accept(encoder: DynamicScaleEncoding, value: JSON) throws {
        try encoder.appendU64(json: value)
    }
}

public struct U128Node: Node {
    public var typeName: String { "u128" }

    public init() {}

    public func accept(encoder: DynamicScaleEncoding, value: JSON) throws {
        try encoder.appendU128(json: value)
    }
}

public struct U256Node: Node {
    public var typeName: String { "u256" }

    public init() {}

    public func accept(encoder: DynamicScaleEncoding, value: JSON) throws {
        try encoder.appendU256(json: value)
    }
}

public struct BoolNode: Node {
    public var typeName: String { "bool" }

    public init() {}

    public func accept(encoder: DynamicScaleEncoding, value: JSON) throws {
        try encoder.appendBool(json: value)
    }
}

public struct StringNode: Node {
    public var typeName: String { "string" }

    public init() {}

    public func accept(encoder: DynamicScaleEncoding, value: JSON) throws {
        try encoder.appendString(json: value)
    }
}
