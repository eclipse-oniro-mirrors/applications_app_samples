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
import { cryptoFramework } from '@kit.CryptoArchitectureKit';
import { SystemConfigConstants } from '../../constants/SystemConfigConstants';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

/** Base64 standard encoding character table */
const BASE64_CHARS: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
/** Hexadecimal character table */
const HEX_CHARS: string = '0123456789abcdef';
/** Base62 character table used for Nonce */
const NONCE_CHARS: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
/** Byte threshold for unbiased Base62 sampling (62 * 4 = 248, bytes above 248 are discarded and redrawn) */
const NONCE_REJECT_THRESHOLD: number = 248;
/**
 * Encryption and hashing utility class.
 */
export class EncryptionUtils {
  /**
   * Encodes a string into Base64.
   * @returns {string} Base64-encoded string
   */
  static base64Encode(str: string): string {
    hilog.info(DOMAIN, TAG, 'EncryptionUtils base64Encode: encoding, length=%{public}d', str.length);
    const bytes: number[] = EncryptionUtils.stringToBytes(str);
    let result: string = '';
    let i: number = 0;
    while (i < bytes.length) {
      const b0: number = bytes[i] & 0xFF;
      const b1: number = (i + 1 < bytes.length) ? bytes[i + 1] & 0xFF : 0;
      const b2: number = (i + 2 < bytes.length) ? bytes[i + 2] & 0xFF : 0;
      const padCount: number = (i + 1 < bytes.length) ? ((i + 2 < bytes.length) ? 0 : 1) : 2;
      result += BASE64_CHARS.charAt(b0 >> 2);
      result += BASE64_CHARS.charAt(((b0 & 0x03) << 4) | (b1 >> 4));
      result += (padCount < 2) ? BASE64_CHARS.charAt(((b1 & 0x0F) << 2) | (b2 >> 6)) : '=';
      result += (padCount < 1) ? BASE64_CHARS.charAt(b2 & 0x3F) : '=';
      i += 3;
    }
    return result;
  }

  /**
   * Decodes a Base64-encoded string back to the original string.
   * @param {string} str - Base64-encoded string
   * @returns {string} Decoded original string
   */
  static base64Decode(str: string): string {
    hilog.info(DOMAIN, TAG, 'EncryptionUtils base64Decode: decoding, length=%{public}d', str.length);
    const cleanStr: string = str.replace(/[^A-Za-z0-9+/=]/g, '');
    const bytes: number[] = [];
    let i: number = 0;
    while (i < cleanStr.length) {
      const enc0: number = BASE64_CHARS.indexOf(cleanStr.charAt(i));
      const enc1: number = BASE64_CHARS.indexOf(cleanStr.charAt(i + 1));
      const enc2: number = (cleanStr.charAt(i + 2) !== '=') ? BASE64_CHARS.indexOf(cleanStr.charAt(i + 2)) : 0;
      const enc3: number = (cleanStr.charAt(i + 3) !== '=') ? BASE64_CHARS.indexOf(cleanStr.charAt(i + 3)) : 0;
      bytes.push((enc0 << 2) | (enc1 >> 4));
      if (cleanStr.charAt(i + 2) !== '=') {
        bytes.push(((enc1 & 0x0F) << 4) | (enc2 >> 2));
      }
      if (cleanStr.charAt(i + 3) !== '=') {
        bytes.push(((enc2 & 0x03) << 6) | enc3);
      }
      i += 4;
    }
    return EncryptionUtils.bytesToString(bytes);
  }

  /**
   * Computes the MD5 hash of a string (standard MD5, based on cryptoFramework).
   * @param {string} str - String to hash
   * @returns {string} 32-character hexadecimal hash value
   */
  static md5Hash(str: string): string {
    hilog.info(DOMAIN, TAG, 'EncryptionUtils md5Hash: computing, length=%{public}d', str.length);
    return EncryptionUtils.digestHex('MD5', str);
  }

  /**
   * Computes the SHA-256 hash of a string (standard SHA-256, based on cryptoFramework).
   * @param {string} str - String to hash
   * @returns {string} 64-character hexadecimal hash value
   */
  static sha256Hash(str: string): string {
    hilog.info(DOMAIN, TAG, 'EncryptionUtils sha256Hash: computing, length=%{public}d', str.length);
    return EncryptionUtils.digestHex('SHA256', str);
  }

  /**
   * Hashes the UTF-8 byte sequence with a cryptoFramework message digest algorithm.
   * @param {string} algName - Digest algorithm name (MD5 / SHA256)
   * @param {string} str - String to hash
   * @returns {string} Hexadecimal hash value
   */
  private static digestHex(algName: string, str: string): string {
    const md: cryptoFramework.Md = cryptoFramework.createMd(algName);
    const bytes: number[] = EncryptionUtils.stringToBytes(str);
    // For empty input, do not call updateSync with an empty DataBlob (some
    // implementations treat it as an invalid argument); calling digestSync
    // directly yields the standard zero-byte digest (MD5("")/SHA256("") vectors)
    if (bytes.length > 0) {
      const input: cryptoFramework.DataBlob = { data: new Uint8Array(bytes) };
      md.updateSync(input);
    }
    const result: cryptoFramework.DataBlob = md.digestSync();
    hilog.debug(DOMAIN, TAG, 'EncryptionUtils digestHex: %{public}s hash computed', algName);
    const hexBytes: number[] = [];
    for (let i: number = 0; i < result.data.length; i++) {
      hexBytes.push(result.data[i]);
    }
    return EncryptionUtils.bytesToHex(hexBytes);
  }

  /**
   * Generates a random Nonce string of the given length (cryptographically secure random + rejection sampling).
   * @param {number} length - Nonce length, must be greater than 0
   * @returns {string} Random Nonce string
   */
  static generateNonce(length: number): string {
    hilog.info(DOMAIN, TAG, 'EncryptionUtils generateNonce: length=%{public}d', length);
    if (length <= 0) {
      return '';
    }
    const random: cryptoFramework.Random = cryptoFramework.createRandom();
    let nonce: string = '';
    while (nonce.length < length) {
      const remain: number = length - nonce.length;
      const blob: cryptoFramework.DataBlob = random.generateRandomSync(remain * 2);
      for (let i: number = 0; i < blob.data.length && nonce.length < length; i++) {
        const byte: number = blob.data[i];
        if (byte < NONCE_REJECT_THRESHOLD) {
          nonce += NONCE_CHARS.charAt(byte % NONCE_CHARS.length);
        }
      }
    }
    return nonce;
  }

  /**
   * Generates a random Token string (64-character hexadecimal, 32 bytes of cryptographically secure random data).
   * @returns {string} 64-character hexadecimal random token
   */
  static generateToken(): string {
    hilog.info(DOMAIN, TAG, 'EncryptionUtils generateToken: generating random token');
    const random: cryptoFramework.Random = cryptoFramework.createRandom();
    const blob: cryptoFramework.DataBlob = random.generateRandomSync(32);
    const tokenBytes: number[] = [];
    for (let i: number = 0; i < blob.data.length; i++) {
      tokenBytes.push(blob.data[i]);
    }
    return EncryptionUtils.bytesToHex(tokenBytes);
  }

  /**
   * Encrypts a string with the Caesar cipher.
   * @param {string} str - String to encrypt
   * @param {number} shift - Shift amount, range 1-25
   * @returns {string} Encrypted string
   */
  static encryptCaesar(str: string, shift: number): string {
    hilog.info(DOMAIN, TAG, 'EncryptionUtils encryptCaesar: shift=%{public}d', shift);
    let result: string = '';
    const normalizedShift: number = ((shift % 26) + 26) % 26;
    for (let i: number = 0; i < str.length; i++) {
      const code: number = str.charCodeAt(i);
      if (code >= 65 && code <= 90) {
        result += String.fromCharCode(((code - 65 + normalizedShift) % 26) + 65);
      } else if (code >= 97 && code <= 122) {
        result += String.fromCharCode(((code - 97 + normalizedShift) % 26) + 97);
      } else {
        result += str.charAt(i);
      }
    }
    return result;
  }

  /**
   * Decrypts a string with the Caesar cipher.
   * @param {string} str - String to decrypt
   * @param {number} shift - Shift amount used during encryption
   * @returns {string} Decrypted original string
   */
  static decryptCaesar(str: string, shift: number): string {
    hilog.info(DOMAIN, TAG, 'EncryptionUtils decryptCaesar: shift=%{public}d', shift);
    return EncryptionUtils.encryptCaesar(str, -shift);
  }

  /**
   * Converts a hexadecimal string to a byte array.
   * @param {string} hex - Hexadecimal string
   * @returns {number[]} Byte array
   */
  static hexToBytes(hex: string): number[] {
    hilog.info(DOMAIN, TAG, 'EncryptionUtils hexToBytes: hex length=%{public}d', hex.length);
    const bytes: number[] = [];
    const cleanHex: string = hex.replace(/[^0-9a-fA-F]/g, '');
    for (let i: number = 0; i < cleanHex.length; i += 2) {
      const high: number = HEX_CHARS.indexOf(cleanHex.charAt(i).toLowerCase());
      const low: number = HEX_CHARS.indexOf(cleanHex.charAt(i + 1).toLowerCase());
      if (high >= 0 && low >= 0) {
        bytes.push((high << 4) | low);
      }
    }
    return bytes;
  }

  /**
   * Converts a byte array to a hexadecimal string.
   * @param {number[]} bytes - Byte array
   * @returns {string} Hexadecimal string
   */
  static bytesToHex(bytes: number[]): string {
    hilog.info(DOMAIN, TAG, 'EncryptionUtils bytesToHex: byte count=%{public}d', bytes.length);
    let result: string = '';
    for (let i: number = 0; i < bytes.length; i++) {
      const b: number = bytes[i] & 0xFF;
      result += HEX_CHARS.charAt(b >> 4);
      result += HEX_CHARS.charAt(b & 0x0F);
    }
    return result;
  }

  /**
   * Converts a string to a UTF-8 byte array.
   * @param {string} str - Input string
   * @returns {number[]} UTF-8 byte array
   */
  private static stringToBytes(str: string): number[] {
    const bytes: number[] = [];
    for (let i: number = 0; i < str.length; i++) {
      let code: number = str.charCodeAt(i);
      if (code < 0x80) {
        bytes.push(code);
      } else if (code < 0x800) {
        bytes.push(0xC0 | (code >> 6), 0x80 | (code & 0x3F));
      } else if (code < 0x10000) {
        bytes.push(0xE0 | (code >> 12), 0x80 | ((code >> 6) & 0x3F), 0x80 | (code & 0x3F));
      } else {
        bytes.push(0xF0 | (code >> 18), 0x80 | ((code >> 12) & 0x3F),
          0x80 | ((code >> 6) & 0x3F), 0x80 | (code & 0x3F));
      }
    }
    return bytes;
  }

  /**
   * Converts a UTF-8 byte array to a string.
   * @param {number[]} bytes - UTF-8 byte array
   * @returns {string} Decoded string
   */
  private static bytesToString(bytes: number[]): string {
    let result: string = '';
    let i: number = 0;
    while (i < bytes.length) {
      const b: number = bytes[i] & 0xFF;
      if (b < 0x80) {
        result += String.fromCharCode(b);
        i += 1;
      } else if ((b & 0xE0) === 0xC0) {
        result += String.fromCharCode(((b & 0x1F) << 6) | (bytes[i + 1] & 0x3F));
        i += 2;
      } else if ((b & 0xF0) === 0xE0) {
        result += String.fromCharCode(((b & 0x0F) << 12) |
          ((bytes[i + 1] & 0x3F) << 6) | (bytes[i + 2] & 0x3F));
        i += 3;
      } else {
        result += String.fromCharCode(((b & 0x07) << 18) | ((bytes[i + 1] & 0x3F) << 12) |
          ((bytes[i + 2] & 0x3F) << 6) | (bytes[i + 3] & 0x3F));
        i += 4;
      }
    }
    return result;
  }
}
