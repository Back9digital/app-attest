export interface AppAttestPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
