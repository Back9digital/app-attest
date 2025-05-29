# app-attest

Capacitor App Attest

## Install

```bash
npm install app-attest
npx cap sync
```

## API

<docgen-index>

* [`isSupported()`](#issupported)
* [`generateKey(...)`](#generatekey)
* [`getAttestation(...)`](#getattestation)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### isSupported()

```typescript
isSupported() => Promise<{ supported: boolean; }>
```

**Returns:** <code>Promise&lt;{ supported: boolean; }&gt;</code>

--------------------


### generateKey(...)

```typescript
generateKey() => Promise<{ keyId: string; }>
```

| Param         | Type                            |
| ------------- | ------------------------------- |
| **`options`** | <code>{ keyId: string; }</code> |

**Returns:** <code>Promise&lt;{ keyId: string; }&gt;</code>

--------------------


### getAttestation(...)

```typescript
getAttestation(options: { keyId: string; challenge: string; }) => Promise<{ attestationObject: string; }>
```

| Param         | Type                                               |
| ------------- | -------------------------------------------------- |
| **`options`** | <code>{ keyId: string; challenge: string; }</code> |

**Returns:** <code>Promise&lt;{ attestationObject: string; }&gt;</code>

--------------------

</docgen-api>
