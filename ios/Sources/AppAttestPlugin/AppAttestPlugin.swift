import Capacitor
import DeviceCheck

@objc(AppAttestPlugin)
public class AppAttestPlugin: CAPPlugin {
    private let service = DCAppAttestService.shared

    @objc func isSupported(_ call: CAPPluginCall) {
        call.resolve([
            "supported": service.isSupported
        ])
    }

    @objc func generateKey(_ call: CAPPluginCall) {
        service.generateKey { keyId, error in
            if let error = error {
                call.reject("Failed to generate key: \(error.localizedDescription)")
                return
            }

            guard let keyId = keyId else {
                call.reject("No keyId returned")
                return
            }

            call.resolve(["keyId": keyId])
        }
    }

    @objc func getAttestation(_ call: CAPPluginCall) {
        guard let keyId = call.getString("keyId"),
              let challenge = call.getString("challenge"),
              let challengeData = Data(base64Encoded: challenge) else {
            call.reject("Invalid parameters")
            return
        }

        service.attestKey(keyId, clientDataHash: challengeData) { attestationData, error in
            if let error = error {
                call.reject("Attestation failed: \(error.localizedDescription)")
                return
            }

            guard let attestationData = attestationData else {
                call.reject("No attestation data returned")
                return
            }

            call.resolve(["attestationObject": attestationData.base64EncodedString()])
        }
    }
}
