import { WebPlugin } from '@capacitor/core';

import type { AppAttestPlugin } from './definitions';

export class AppAttestWeb extends WebPlugin implements AppAttestPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
