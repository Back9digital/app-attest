# app-attest

Capacitor App Attest

## Install

```bash
npm install app-attest
npx cap sync
```

## API

<docgen-index>

* [`generateKey()`](#generatekey)
* [`getAttestation(...)`](#getattestation)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### generateKey()

```typescript
generateKey() => Promise<{ keyId: string; }>
```

**Returns:** <code>Promise&lt;{ keyId: string; }&gt;</code>

--------------------


### getAttestation(...)

```typescript
getAttestation(options: { keyId: string; clientData: string; }) => Promise<{ attestation: string; }>
```

| Param         | Type                                                |
| ------------- | --------------------------------------------------- |
| **`options`** | <code>{ keyId: string; clientData: string; }</code> |

**Returns:** <code>Promise&lt;{ attestation: string; }&gt;</code>

--------------------

</docgen-api>
