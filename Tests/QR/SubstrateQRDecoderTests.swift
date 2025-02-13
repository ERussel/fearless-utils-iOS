import XCTest
import FearlessUtils

class SubstrateQRDecoderTests: XCTestCase {
    func testSuccessfullDecodingWithName() throws {
        let data = try Data(hexString: "7375627374726174653a354633794b66354b7651343978356b346e5258624157674a485368516a51544245655a3950754e646d6562614e7837343a3078383432353834306636633337306637663264383239316333653639303436376530613866626238623036343866633964363439356439396463613763376133663a425642")

        let publicKey = try Data(hexString: "0x8425840f6c370f7f2d8291c3e690467e0a8fbb8b0648fc9d6495d99dca7c7a3f")
        let expectedInfo = SubstrateQRInfo(prefix: SubstrateQR.prefix,
                                           address: "5F3yKf5KvQ49x5k4nRXbAWgJHShQjQTBEeZ9PuNdmebaNx74",
                                           rawPublicKey: publicKey,
                                           username: "BVB")

        let decodedInfo = try SubstrateQRDecoder(networkType: .genericSubstrate).decode(data: data)

        XCTAssertEqual(decodedInfo, expectedInfo)
    }

    func testSuccessfullDecodingWithoutName() throws {
        let data = try Data(hexString: "7375627374726174653a354633794b66354b7651343978356b346e5258624157674a485368516a51544245655a3950754e646d6562614e7837343a307838343235383430663663333730663766326438323931633365363930343637653061386662623862303634386663396436343935643939646361376337613366")

        let publicKey = try Data(hexString: "0x8425840f6c370f7f2d8291c3e690467e0a8fbb8b0648fc9d6495d99dca7c7a3f")
        let expectedInfo = SubstrateQRInfo(prefix: SubstrateQR.prefix,
                                           address: "5F3yKf5KvQ49x5k4nRXbAWgJHShQjQTBEeZ9PuNdmebaNx74",
                                           rawPublicKey: publicKey,
                                           username: nil)

        let decodedInfo = try SubstrateQRDecoder(networkType: .genericSubstrate).decode(data: data)

        XCTAssertEqual(decodedInfo, expectedInfo)
    }

    func testUndefinedPrefix() throws {
        let data = try Data(hexString: "73756273747261743a354633794b66354b7651343978356b346e5258624157674a485368516a51544245655a3950754e646d6562614e7837343a307838343235383430663663333730663766326438323931633365363930343637653061386662623862303634386663396436343935643939646361376337613366")

        perforErrorTest(data, expectedError: .undefinedPrefix)
    }

    func testUnexpectedNumberOfFields() throws {
        let data = try Data(hexString: "7375627374726174653a354633794b66354b7651343978356b346e5258624157674a485368516a51544245655a3950754e646d6562614e7837343a3078383432353834306636633337306637663264383239316333653639303436376530613866626238623036343866633964363439356439396463613763376133663a31323a313233")

        perforErrorTest(data, expectedError: .unexpectedNumberOfFields)
    }

    func testAccountIdMismatch() throws {
        let data = try Data(hexString: "7375627374726174653a354633794b66354b7651343978356b346e5258624157674a485368516a51544245655a3950754e646d6562614e7837343a3078383432353834306636633337306637663364383239316333653639303436376530613866626238623036343866633964363439356439396463613763376133663a425642")

        perforErrorTest(data, expectedError: .accountIdMismatch)
    }

    // MARK: Private

    private func perforErrorTest(_ data: Data, expectedError: SubstrateQRDecoderError) {
        do {
            _ = try SubstrateQRDecoder(networkType: .genericSubstrate).decode(data: data)

            XCTFail("Exception expected")
        } catch {
            guard let decodingError = error as? SubstrateQRDecoderError else {
                XCTFail("Decoding error expected")
                return
            }

            XCTAssertEqual(decodingError, expectedError)
        }
    }
}
