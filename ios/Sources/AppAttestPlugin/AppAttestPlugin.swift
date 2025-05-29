import Capacitor
import DeviceCheck

@objc(AppAttestPlugin)
public class AppAttestPlugin: CAPPlugin {

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
}
