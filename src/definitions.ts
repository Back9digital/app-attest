export interface AppAttestPlugin {
  generateKey(): Promise<{ keyId: string }>;
  getAttestation(options: { keyId: string; clientData: string }): Promise<{ attestation: string }>;
}
