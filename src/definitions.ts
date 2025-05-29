export interface AppAttestPlugin {
  isSupported(): Promise<{ supported: boolean }>;
  generateKey(): Promise<{ keyId: string }>;
  getAttestation(options: { keyId: string, challenge: string }): Promise<{ attestationObject: string }>;
}