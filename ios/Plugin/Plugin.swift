import Capacitor
import DeviceCheck

@objc(AppAttestPlugin)
public class AppAttestPlugin: CAPPlugin {

    @objc func generateKey(_ call: CAPPluginCall) {
        if #available(iOS 14.0, *) {
            DCAppAttestService.shared.generateKey { keyID, error in
                if let error = error {
                    call.reject("Key generation failed: \(error.localizedDescription)")
                    return
                }
                guard let keyID = keyID else {
                    call.reject("Key ID is nil")
                    return
                }
                call.resolve(["keyId": keyID])
            }
        } else {
            call.reject("App Attest requires iOS 14+")
        }
    }

    @objc func getAttestation(_ call: CAPPluginCall) {
        guard #available(iOS 14.0, *) else {
            call.reject("Requires iOS 14+")
            return
        }

        guard let keyID = call.getString("keyId"),
              let clientData = call.getString("clientData"),
              let clientDataHash = clientData.data(using: .utf8)?.sha256() else {
            call.reject("Missing keyId or clientData")
            return
        }

        DCAppAttestService.shared.attestKey(keyID, clientDataHash: clientDataHash) { attestation, error in
            if let error = error {
                call.reject("Attestation failed: \(error.localizedDescription)")
                return
            }
            guard let attestation = attestation else {
                call.reject("No attestation returned")
                return
            }
            call.resolve(["attestation": attestation.base64EncodedString()])
        }
    }
}

// Helper extension
extension Data {
    func sha256() -> Data {
        var hash = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        self.withUnsafeBytes {
            _ = CC_SHA256($0.baseAddress, CC_LONG(self.count), &hash)
        }
        return Data(hash)
    }
}
