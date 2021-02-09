import Foundation

public struct GenericBlockNode: Node {
    public var typeName: String { "GenericBlock" }

    public init() {}

    public func accept(encoder: DynamicScaleEncoding, value: JSON) throws {
        throw DynamicScaleCoderError.unresolverType(name: typeName)
    }

    public func accept(decoder: DynamicScaleDecoding) throws -> JSON {
        throw DynamicScaleCoderError.unresolverType(name: typeName)
    }
}