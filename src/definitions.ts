export interface AppAttestPlugin {
  isSupported(): Promise<{ supported: boolean }>;
  generateKey(options: { keyId: string }): Promise<{ keyId: string }>;
  getAttestation(options: { keyId: string, challenge: string }): Promise<{ attestationObject: string }>;
}