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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { BluetoothConstants } from '../../constants/BluetoothConstants';

const TAG: string = BluetoothConstants.TAG;
const DOMAIN: number = BluetoothConstants.DOMAIN;

/**
 * encryption utility class
 * provides common encrypt, encode and decode method method
 */
export class EncryptionUtils {
  /** Base64 character symbol table */
  private static readonly BASE64_CHARS: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';

  /**
   * Base64 encode
   * @param input - want encode string
   * @returns Base64 encoded string
   */
  static base64Encode(input: string): string {
    if (!input) {
      return '';
    }
    let result: string = '';
    let i: number = 0;
    const bytes: number[] = [];
    for (let j: number = 0; j < input.length; j++) {
      bytes.push(input.charCodeAt(j));
    }
    while (i < bytes.length) {
      const b1: number = bytes[i++] || 0;
      const b2: number = bytes[i++] || 0;
      const b3: number = bytes[i++] || 0;
      const triplet: number = (b1 << 16) | (b2 << 8) | b3;
      result += EncryptionUtils.BASE64_CHARS[(triplet >> 18) & 0x3F];
      result += EncryptionUtils.BASE64_CHARS[(triplet >> 12) & 0x3F];
      result += EncryptionUtils.BASE64_CHARS[(triplet >> 6) & 0x3F];
      result += EncryptionUtils.BASE64_CHARS[triplet & 0x3F];
    }
    // add pad
    const padding: number = (3 - (bytes.length % 3)) % 3;
    for (let p: number = 0; p < padding; p++) {
      result = result.substring(0, result.length - 1 - p) + '=' + result.substring(result.length - p);
    }
    return result;
  }

  /**
   * Base64 decode
   * @param input - Base64 encode string
   * @returns decoded string
   */
  static base64Decode(input: string): string {
    if (!input) {
      return '';
    }
    const clean: string = input.replace(/=/g, '');
    let result: string = '';
    const bytes: number[] = [];
    for (let i: number = 0; i < clean.length; i += 4) {
      const c1: number = EncryptionUtils.BASE64_CHARS.indexOf(clean[i]);
      const c2: number = EncryptionUtils.BASE64_CHARS.indexOf(clean[i + 1]);
      const c3: number = EncryptionUtils.BASE64_CHARS.indexOf(clean[i + 2]);
      const c4: number = EncryptionUtils.BASE64_CHARS.indexOf(clean[i + 3]);
      const triplet: number = (c1 << 18) | (c2 << 12) | (c3 << 6) | c4;
      bytes.push((triplet >> 16) & 0xFF);
      if (clean[i + 2] !== undefined) {
        bytes.push((triplet >> 8) & 0xFF);
      }
      if (clean[i + 3] !== undefined) {
        bytes.push(triplet & 0xFF);
      }
    }
    for (const b of bytes) {
      result += String.fromCharCode(b);
    }
    return result;
  }

  /**
   * simple XOR encryption
   * @param input - string to encrypt
   * @param key - encryption key
   * @returns encrypted string
   */
  static xorEncrypt(input: string, key: string): string {
    if (!input || !key) {
      return '';
    }
    let result: string = '';
    for (let i: number = 0; i < input.length; i++) {
      const charCode: number = input.charCodeAt(i) ^ key.charCodeAt(i % key.length);
      result += String.fromCharCode(charCode);
    }
    return result;
  }

  /**
   * simple XOR decryption (same operation as encryption)
   * @param input - encrypted string
   * @param key - decryption key
   * @returns decrypted string
   */
  static xorDecrypt(input: string, key: string): string {
    return EncryptionUtils.xorEncrypt(input, key);
  }

  /**
   * calculate string simple single ha hope value
   * @param input - want ha hope string
   * @returns ha hope value (hex string)
   */
  static simpleHash(input: string): string {
    if (!input) {
      return '00000000';
    }
    let hash: number = 0x811c9dc5;
    for (let i: number = 0; i < input.length; i++) {
      hash ^= input.charCodeAt(i);
      hash = Math.imul(hash, 0x01000193);
    }
    return (hash >>> 0).toString(16).padStart(8, '0');
  }

  /**
   * generate UUID v4
   * @returns UUID string
   */
  static generateUuid(): string {
    const hex: string = '0123456789abcdef';
    let uuid: string = '';
    for (let i: number = 0; i < 36; i++) {
      if (i === 8 || i === 13 || i === 18 || i === 23) {
        uuid += '-';
      } else if (i === 14) {
        uuid += '4';
      } else if (i === 19) {
        uuid += hex[(Math.random() * 4) | 8];
      } else {
        uuid += hex[(Math.random() * 16) | 0];
      }
    }
    return uuid;
  }

  /**
   * will hex string to byte array
   * @param hex - hex string
   * @returns byte array
   */
  static hexToBytes(hex: string): number[] {
    const bytes: number[] = [];
    for (let i: number = 0; i < hex.length; i += 2) {
      bytes.push(parseInt(hex.substring(i, i + 2), 16));
    }
    return bytes;
  }

  /**
   * will byte array to hex string
   * @param bytes - byte array
   * @returns hex string
   */
  static bytesToHex(bytes: number[]): string {
    let hex: string = '';
    for (const b of bytes) {
      hex += b.toString(16).padStart(2, '0');
    }
    return hex;
  }

  /**
   * generate random key
   * @param length - key length (character section)
   * @returns random key string
   */
  static generateKey(length: number = 16): string {
    const chars: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    let key: string = '';
    for (let i: number = 0; i < length; i++) {
      key += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    return key;
  }

  /**
   * mask sensitive info
   * @param input - original string
   * @param visibleChars - number of visible chars to keep
   * @returns masked string
   */
  static maskSensitive(input: string, visibleChars: number = 4): string {
    if (!input || input.length <= visibleChars) {
      return '****';
    }
    const visible: string = input.substring(input.length - visibleChars);
    const masked: string = '*'.repeat(input.length - visibleChars);
    return masked + visible;
  }
}
