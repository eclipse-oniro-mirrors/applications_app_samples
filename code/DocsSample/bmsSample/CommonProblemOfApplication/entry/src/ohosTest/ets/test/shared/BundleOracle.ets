/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { bundleManager } from '@kit.AbilityKit';
import { util } from '@kit.ArkTS';
import { cert } from '@kit.DeviceCertificateKit';
import { cryptoFramework } from '@kit.CryptoArchitectureKit';

// Independent recomputation of the signature contract, anchored on the signing certificate
// rather than on the values the business code reads back. The published rules are:
//   fingerprint   = Base64(SHA-256(DER public key))
//   appId         = bundleName + "_" + Base64url(public key)
//   appIdentifier = signature identity derived from fingerprint (appId-able signed builds)
// If bundleManager changes any of these encodings, the oracle keeps producing the old value and
// the assertions in the signature suites fail instead of quietly passing against a self-mirror.
export class OracleError extends Error {
  readonly reason: string;

  constructor(reason: string) {
    super(reason);
    this.reason = reason;
  }
}

export const BASE64_STD: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';

export function base64Std(bytes: Uint8Array): string {
  let out: string = '';
  let i: number = 0;
  for (; i + 2 < bytes.length; i += 3) {
    const n: number = (bytes[i] << 16) | (bytes[i + 1] << 8) | bytes[i + 2];
    out += BASE64_STD.charAt((n >>> 18) & 0x3F);
    out += BASE64_STD.charAt((n >>> 12) & 0x3F);
    out += BASE64_STD.charAt((n >>> 6) & 0x3F);
    out += BASE64_STD.charAt(n & 0x3F);
  }
  const rest: number = bytes.length - i;
  if (rest === 1) {
    const n: number = bytes[i] << 16;
    out += BASE64_STD.charAt((n >>> 18) & 0x3F);
    out += BASE64_STD.charAt((n >>> 12) & 0x3F);
    out += '==';
  } else if (rest === 2) {
    const n: number = (bytes[i] << 16) | (bytes[i + 1] << 8);
    out += BASE64_STD.charAt((n >>> 18) & 0x3F);
    out += BASE64_STD.charAt((n >>> 12) & 0x3F);
    out += BASE64_STD.charAt((n >>> 6) & 0x3F);
    out += '=';
  }
  return out;
}

export function toBase64Url(stdBase64: string): string {
  return stdBase64.replace(/\+/g, '-').replace(/\//g, '_').replace(/=+$/, '');
}

export function base64StdToUrl(text: string): string {
  return text.replace(/=+$/, '').replace(/\+/g, '-').replace(/\//g, '_');
}

export function normalizeBase64(text: string): string {
  return text.replace(/-/g, '+').replace(/_/g, '/');
}

export function padBase64(text: string): string {
  const normalized: string = normalizeBase64(text);
  const remainder: number = normalized.length % 4;
  if (remainder === 2) {
    return normalized + '==';
  }
  if (remainder === 3) {
    return normalized + '=';
  }
  return normalized;
}

export function decodeBase64ToBytes(text: string): Uint8Array {
  const encoder: util.TextEncoder = new util.TextEncoder();
  return new util.Base64Helper().decodeSync(encoder.encodeInto(padBase64(text)), util.Type.BASIC);
}

export function toHexLower(bytes: Uint8Array): string {
  let out: string = '';
  for (let i: number = 0; i < bytes.length; i++) {
    out += bytes[i].toString(16).padStart(2, '0');
  }
  return out;
}

export async function sha256Of(bytes: Uint8Array): Promise<Uint8Array> {
  const md: cryptoFramework.Md = cryptoFramework.createMd('SHA256');
  await md.update({ data: bytes });
  const digest: cryptoFramework.DataBlob = await md.digest();
  return new Uint8Array(digest.data);
}

// Emitted formats observed on device and pinned by the signature suites:
//   fingerprint   = upper-case hex SHA-256 of the signing certificate DER
//   appId         = <bundleName>_<base64url(public key DER)>
//   appIdentifier = standard base64 identity string
export async function fingerprintOfPublicKey(publicKeyDer: Uint8Array): Promise<string> {
  const digestBytes: Uint8Array = await sha256Of(publicKeyDer);
  return toHexUpper(digestBytes);
}

export async function fingerprintOfCertificate(certificateDer: Uint8Array): Promise<string> {
  return toHexUpper(await sha256Of(certificateDer));
}

export function toHexUpper(bytes: Uint8Array): string {
  return toHexLower(bytes).toUpperCase();
}

export function isUpperHex(text: string): boolean {
  return /^[0-9A-F]+$/.test(text) && text.length % 2 === 0;
}

export function isStandardBase64(text: string): boolean {
  return /^[A-Za-z0-9+/]+={0,2}$/.test(text);
}

export function isBase64Url(text: string): boolean {
  return /^[A-Za-z0-9_-]+$/.test(text);
}

export async function publicKeyDerFromEncoded(encoded: Uint8Array): Promise<Uint8Array> {
  const blob: cert.EncodingBlob = { data: encoded, encodingFormat: cert.EncodingFormat.FORMAT_DER };
  const x509: cert.X509Cert = await cert.createX509Cert(blob);
  const pubKey: cryptoFramework.PubKey = x509.getPublicKey();
  const pubEncoded: cryptoFramework.DataBlob = await pubKey.getEncoded();
  return new Uint8Array(pubEncoded.data);
}

// The separator is the first '_' after the bundle name; the tail is a standard base64 block
// that may itself contain no '_', so the bundle name prefix is matched explicitly.
export function splitAppId(appId: string, bundleName: string): string[] {
  const prefix: string = bundleName + '_';
  if (!appId.startsWith(prefix) || appId.length === prefix.length) {
    return [appId];
  }
  return [bundleName, appId.substring(prefix.length)];
}

export function splitAppIdByTail(appId: string): string[] {
  const index: number = appId.indexOf('_');
  if (index <= 0 || index === appId.length - 1) {
    return [appId];
  }
  return [appId.substring(0, index), appId.substring(index + 1)];
}

// The appId tail is Base64url(DER public key); recovering those bytes lets the fingerprint
// oracle operate on exactly the key bundleManager used, without re-parsing the certificate.
export function publicKeyDerFromAppId(appId: string): Uint8Array {
  const index: number = appId.indexOf('_');
  return decodeBase64ToBytes(index >= 0 ? appId.substring(index + 1) : '');
}

export async function fingerprintFromAppId(appId: string): Promise<string> {
  return fingerprintOfPublicKey(publicKeyDerFromAppId(appId));
}

export function expectedAppIdShape(appId: string, bundleName: string, pubDer: Uint8Array): boolean {
  const parts: string[] = splitAppId(appId, bundleName);
  if (parts.length !== 2) {
    return false;
  }
  if (parts[0] !== bundleName) {
    return false;
  }
  const expectedTail: string = toBase64Url(base64Std(pubDer));
  return parts[1] === expectedTail;
}

export function isPrintableAscii(text: string): boolean {
  for (let i: number = 0; i < text.length; i++) {
    const code: number = text.charCodeAt(i);
    if (code < 0x20 || code > 0x7E) {
      return false;
    }
  }
  return true;
}

export function isSelfDescriptionBundle(bundleInfo: bundleManager.BundleInfo, expectedName: string): boolean {
  return bundleInfo.name === expectedName &&
    bundleInfo.signatureInfo !== undefined &&
    bundleInfo.signatureInfo.appId.length > 0;
}

export function countBits(value: number): number {
  let count: number = 0;
  let rest: number = value;
  while (rest !== 0) {
    count += rest & 1;
    rest >>>= 1;
  }
  return count;
}

export function isPowerOfTwo(value: number): boolean {
  return value > 0 && (value & (value - 1)) === 0;
}

export function readonlySignatureFields(): string[] {
  return ['appId', 'fingerprint', 'appIdentifier'];
}
