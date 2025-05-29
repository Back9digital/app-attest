import { registerPlugin } from '@capacitor/core';

import type { AppAttestPlugin } from './definitions';

const AppAttest = registerPlugin<AppAttestPlugin>('AppAttest');
export * from './definitions'; // export types
export default AppAttest;