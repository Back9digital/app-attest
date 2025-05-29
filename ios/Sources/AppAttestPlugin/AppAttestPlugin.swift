import Capacitor
import DeviceCheck

@objc(AppAttest)
public class AppAttest: CAPPlugin {

    @objc func generateKey(_ call: CAPPluginCall) {
        let keyID = UUID().uuidString

        if #available(iOS 14.0, *) {
            DCAppAttestService.shared.generateKey { attestationKeyID, error in
                if let error = error {
                    call.reject("Failed to generate key: \(error.localizedDescription)")
                    return
                }

                if let keyID = attestationKeyID {
                    call.resolve(["keyId": keyID])
                } else {
                    call.reject("Key ID is nil")
                }
            }
        } else {
            call.reject("App Attest requires iOS 14.0 or newer")
        }
    }

    @objc func generateAssertion(_ call: CAPPluginCall) {
        guard let keyID = call.getString("keyID"),
              let clientDataHashBase64 = call.getString("clientDataHash") else {
            call.reject("Missing 'keyID' or 'clientDataHash' parameters")
            return
        }
        
        guard let clientDataHash = Data(base64Encoded: clientDataHashBase64) else {
            call.reject("Invalid base64 'clientDataHash'")
            return
        }
        
        appAttestService.generateAssertion(forKeyId: keyID, clientDataHash: clientDataHash) { assertion, error in
            if let error = error {
                call.reject("Failed to generate assertion: \(error.localizedDescription)")
                return
            }
            guard let assertion = assertion else {
                call.reject("No assertion returned")
                return
            }
            call.resolve([
                "assertion": assertion.base64EncodedString()
            ])
        }
    }
}
