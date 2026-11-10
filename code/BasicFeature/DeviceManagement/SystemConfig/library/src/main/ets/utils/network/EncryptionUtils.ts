/*
 * Copyright (c) 2024 Hunan OpenValley Digital Industry Development Co., Ltd.
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
import { SystemConfigConstants } from '../../constants/SystemConfigConstants';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

/** Base64 标准编码字符表 */
const BASE64_CHARS: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
/** 十六进制字符表 */
const HEX_CHARS: string = '0123456789abcdef';
/**
 * 加密与哈希工具类。
 */
export class EncryptionUtils {
  /**
   * 将字符串进行 Base64 编码。
   * @returns {string} Base64 编码后的字符串
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
   * 将 Base64 编码的字符串解码为原始字符串。
   * @param {string} str - Base64 编码的字符串
   * @returns {string} 解码后的原始字符串
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
   * 计算字符串的 MD5 哈希值（简化模拟）。
   * @param {string} str - 待哈希的字符串
   * @returns {string} 32 位十六进制哈希值
   */
  static md5Hash(str: string): string {
    hilog.info(DOMAIN, TAG, 'EncryptionUtils md5Hash: computing, length=%{public}d', str.length);
    let h0: number = 0x67452301;
    let h1: number = 0xEFCDAB89;
    let h2: number = 0x98BADCFE;
    let h3: number = 0x10325476;
    for (let i: number = 0; i < str.length; i++) {
      const ch: number = str.charCodeAt(i);
      h0 = (h0 ^ ((ch * 0x1B873593) >>> 0)) >>> 0;
      h1 = (h1 + ((h0 ^ (h0 >>> 16)) * 0x85EBCA6B) >>> 0) >>> 0;
      h2 = (h2 ^ ((h1 + (h1 >>> 13)) * 0xC2B2AE35) >>> 0) >>> 0;
      h3 = (h3 + ((h2 ^ (h2 >>> 16)) * 0x27D4EB2F) >>> 0) >>> 0;
      h0 = (h0 + ((h3 ^ (h3 >>> 15)) * 0x1B873593) >>> 0) >>> 0;
    }
    const result: string = EncryptionUtils.padHex(h0 ^ (h0 >>> 16)) +
      EncryptionUtils.padHex(h1 ^ (h1 >>> 16)) +
      EncryptionUtils.padHex(h2 ^ (h2 >>> 16)) +
      EncryptionUtils.padHex(h3 ^ (h3 >>> 16));
    hilog.debug(DOMAIN, TAG, 'EncryptionUtils md5Hash: hash computed');
    return result;
  }

  /**
   * 计算字符串的 SHA-256 哈希值（简化模拟）。
   * @param {string} str - 待哈希的字符串
   * @returns {string} 64 位十六进制哈希值
   */
  static sha256Hash(str: string): string {
    hilog.info(DOMAIN, TAG, 'EncryptionUtils sha256Hash: computing, length=%{public}d', str.length);
    const state: number[] = [
      0x6A09E667, 0xBB67AE85, 0x3C6EF372, 0xA54FF53A,
      0x510E527F, 0x9B05688C, 0x1F83D9AB, 0x5BE0CD19
    ];
    for (let round: number = 0; round < 4; round++) {
      for (let i: number = 0; i < str.length; i++) {
        const ch: number = str.charCodeAt(i) + round * 37;
        state[0] = (state[0] ^ ((ch * 0x85EBCA6B) >>> 0)) >>> 0;
        state[1] = (state[1] + ((state[0] ^ (state[0] >>> 16)) * 0xC2B2AE35) >>> 0) >>> 0;
        state[2] = (state[2] ^ ((state[1] + (state[1] >>> 13)) * 0x27D4EB2F) >>> 0) >>> 0;
        state[3] = (state[3] + ((state[2] ^ (state[2] >>> 16)) * 0x1B873593) >>> 0) >>> 0;
        state[4] = (state[4] ^ ((state[3] + (state[3] >>> 15)) >>> 0)) >>> 0;
        state[5] = (state[5] + ((state[4] ^ (state[4] >>> 13)) * 0x85EBCA6B) >>> 0) >>> 0;
        state[6] = (state[6] ^ ((state[5] + (state[5] >>> 16)) * 0xC2B2AE35) >>> 0) >>> 0;
        state[7] = (state[7] + ((state[6] ^ (state[6] >>> 13)) * 0x27D4EB2F) >>> 0) >>> 0;
      }
    }
    let result: string = '';
    for (let i: number = 0; i < state.length; i++) {
      result += EncryptionUtils.padHex(state[i]);
    }
    hilog.debug(DOMAIN, TAG, 'EncryptionUtils sha256Hash: hash computed');
    return result;
  }

  /**
   * 生成指定长度的随机 Nonce 字符串。
   * @param {number} length - Nonce 长度，必须大于 0
   * @returns {string} 随机 Nonce 字符串
   */
  static generateNonce(length: number): string {
    hilog.info(DOMAIN, TAG, 'EncryptionUtils generateNonce: length=%{public}d', length);
    const chars: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    let nonce: string = '';
    for (let i: number = 0; i < length; i++) {
      nonce += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    return nonce;
  }

  /**
   * 生成随机 Token 字符串（64 位十六进制）。
   * @returns {string} 64 位十六进制随机令牌
   */
  static generateToken(): string {
    hilog.info(DOMAIN, TAG, 'EncryptionUtils generateToken: generating random token');
    let token: string = '';
    for (let i: number = 0; i < 64; i++) {
      token += HEX_CHARS.charAt(Math.floor(Math.random() * 16));
    }
    return token;
  }

  /**
   * 使用凯撒密码对字符串进行加密。
   * @param {string} str - 待加密的字符串
   * @param {number} shift - 移位量，范围 1-25
   * @returns {string} 加密后的字符串
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
   * 使用凯撒密码对字符串进行解密。
   * @param {string} str - 待解密的字符串
   * @param {number} shift - 加密时使用的移位量
   * @returns {string} 解密后的原始字符串
   */
  static decryptCaesar(str: string, shift: number): string {
    hilog.info(DOMAIN, TAG, 'EncryptionUtils decryptCaesar: shift=%{public}d', shift);
    return EncryptionUtils.encryptCaesar(str, -shift);
  }

  /**
   * 将十六进制字符串转换为字节数组。
   * @param {string} hex - 十六进制字符串
   * @returns {number[]} 字节数组
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
   * 将字节数组转换为十六进制字符串。
   * @param {number[]} bytes - 字节数组
   * @returns {string} 十六进制字符串
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
   * 将字符串转换为 UTF-8 字节数组。
   * @param {string} str - 输入字符串
   * @returns {number[]} UTF-8 字节数组
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
   * 将 UTF-8 字节数组转换为字符串。
   * @param {number[]} bytes - UTF-8 字节数组
   * @returns {string} 解码后的字符串
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

  /**
   * 将数字格式化为 8 位十六进制字符串。
   * @param {number} num - 待格式化的无符号整数
   * @returns {string} 8 位十六进制字符串
   */
  private static padHex(num: number): string {
    let hex: string = (num >>> 0).toString(16);
    while (hex.length < 8) {
      hex = '0' + hex;
    }
    return hex;
  }
}
