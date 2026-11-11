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

import { cryptoFramework } from '@kit.CryptoArchitectureKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { util } from '@kit.ArkTS';

/** 日志域ID */
const DOMAIN: number = 0xF811;
/** 日志标签 */
const TAG: string = 'CryptoUtils';

/**
 * 加密算法枚举
 */
export enum CryptoAlgorithm {
  MD5 = 'md5',
  SHA1 = 'sha1',
  SHA256 = 'sha256',
  SHA512 = 'sha512',
  HMAC_SHA256 = 'hmac-sha256'
}

/**
 * 加密结果结构体
 */
export class CryptoResult {
  public success: boolean = false;
  public data: string = '';
  public error: string = '';
}

/**
 * 加密工具类
 * 提供常用的加密、摘要、编码等功能
 */
export class CryptoUtils {
  /** Base64字符表 */
  private static readonly BASE64_CHARS: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';

  /**
   * 字符串转ArrayBuffer
   */
  static stringToArrayBuffer(str: string): ArrayBuffer {
    hilog.debug(DOMAIN, TAG, 'stringToArrayBuffer() called');
    const encoder: util.TextEncoder = new util.TextEncoder();
    const uint8Array: Uint8Array = encoder.encodeInto(str);
    return uint8Array.buffer as ArrayBuffer;
  }

  /**
   * ArrayBuffer转字符串
   */
  static arrayBufferToString(buffer: ArrayBuffer): string {
    hilog.debug(DOMAIN, TAG, 'arrayBufferToString() called');
    const decoder: util.TextDecoder = util.TextDecoder.create('utf-8');
    const uint8Array: Uint8Array = new Uint8Array(buffer);
    return decoder.decodeWithStream(uint8Array);
  }

  /**
   * 字节数组转十六进制字符串
   */
  static bytesToHex(bytes: Uint8Array): string {
    hilog.debug(DOMAIN, TAG, 'bytesToHex() called');
    let hex: string = '';
    for (let i = 0; i < bytes.length; i++) {
      const byteStr: string = bytes[i].toString(16);
      hex += byteStr.length < 2 ? '0' + byteStr : byteStr;
    }
    return hex;
  }

  /**
   * 十六进制字符串转字节数组
   */
  static hexToBytes(hex: string): Uint8Array {
    hilog.debug(DOMAIN, TAG, 'hexToBytes() called');
    const bytes: Uint8Array = new Uint8Array(hex.length / 2);
    for (let i = 0; i < hex.length; i += 2) {
      bytes[i / 2] = parseInt(hex.substr(i, 2), 16);
    }
    return bytes;
  }

  /**
   * 计算MD5摘要
   */
  static async md5(data: string | ArrayBuffer): Promise<string> {
    hilog.debug(DOMAIN, TAG, 'md5() called');
    try {
      const md: cryptoFramework.Md = cryptoFramework.createMd('MD5');
      const inputBuffer: ArrayBuffer = typeof data === 'string'
        ? CryptoUtils.stringToArrayBuffer(data)
        : data;
      // 使用DataBlob接口构造输入数据
      const inputData: cryptoFramework.DataBlob = { data: new Uint8Array(inputBuffer) };
      await md.update(inputData);
      const output = await md.digest();
      const result: string = CryptoUtils.bytesToHex(output.data);
      hilog.info(DOMAIN, TAG, `md5() result: ${result}`);
      return result;
    } catch (error) {
      hilog.error(DOMAIN, TAG, `md5() failed: ${(error as Error).message}`);
      return '';
    }
  }

  /**
   * 计算SHA1摘要
   */
  static async sha1(data: string | ArrayBuffer): Promise<string> {
    hilog.debug(DOMAIN, TAG, 'sha1() called');
    try {
      const md: cryptoFramework.Md = cryptoFramework.createMd('SHA1');
      const inputBuffer: ArrayBuffer = typeof data === 'string'
        ? CryptoUtils.stringToArrayBuffer(data)
        : data;
      const inputData: cryptoFramework.DataBlob = { data: new Uint8Array(inputBuffer) };
      await md.update(inputData);
      const output = await md.digest();
      const result: string = CryptoUtils.bytesToHex(output.data);
      hilog.info(DOMAIN, TAG, `sha1() result: ${result}`);
      return result;
    } catch (error) {
      hilog.error(DOMAIN, TAG, `sha1() failed: ${(error as Error).message}`);
      return '';
    }
  }

  /**
   * 计算SHA256摘要
   */
  static async sha256(data: string | ArrayBuffer): Promise<string> {
    hilog.debug(DOMAIN, TAG, 'sha256() called');
    try {
      const md: cryptoFramework.Md = cryptoFramework.createMd('SHA256');
      const inputBuffer: ArrayBuffer = typeof data === 'string'
        ? CryptoUtils.stringToArrayBuffer(data)
        : data;
      const inputData: cryptoFramework.DataBlob = { data: new Uint8Array(inputBuffer) };
      await md.update(inputData);
      const output = await md.digest();
      const result: string = CryptoUtils.bytesToHex(output.data);
      hilog.info(DOMAIN, TAG, `sha256() result: ${result}`);
      return result;
    } catch (error) {
      hilog.error(DOMAIN, TAG, `sha256() failed: ${(error as Error).message}`);
      return '';
    }
  }

  /**
   * 计算SHA512摘要
   */
  static async sha512(data: string | ArrayBuffer): Promise<string> {
    hilog.debug(DOMAIN, TAG, 'sha512() called');
    try {
      const md: cryptoFramework.Md = cryptoFramework.createMd('SHA512');
      const inputBuffer: ArrayBuffer = typeof data === 'string'
        ? CryptoUtils.stringToArrayBuffer(data)
        : data;
      const inputData: cryptoFramework.DataBlob = { data: new Uint8Array(inputBuffer) };
      await md.update(inputData);
      const output = await md.digest();
      const result: string = CryptoUtils.bytesToHex(output.data);
      hilog.info(DOMAIN, TAG, `sha512() result length: ${result.length}`);
      return result;
    } catch (error) {
      hilog.error(DOMAIN, TAG, `sha512() failed: ${(error as Error).message}`);
      return '';
    }
  }

  /**
   * Base64编码
   */
  static base64Encode(data: string | ArrayBuffer): string {
    hilog.debug(DOMAIN, TAG, 'base64Encode() called');
    try {
      let bytes: Uint8Array;
      if (typeof data === 'string') {
        bytes = new Uint8Array(CryptoUtils.stringToArrayBuffer(data));
      } else {
        bytes = new Uint8Array(data);
      }
      let result: string = '';
      for (let i = 0; i < bytes.length; i += 3) {
        const b1: number = bytes[i];
        const b2: number = i + 1 < bytes.length ? bytes[i + 1] : 0;
        const b3: number = i + 2 < bytes.length ? bytes[i + 2] : 0;
        result += CryptoUtils.BASE64_CHARS.charAt(b1 >> 2);
        result += CryptoUtils.BASE64_CHARS.charAt(((b1 & 3) << 4) | (b2 >> 4));
        result += (i + 1 < bytes.length) ? CryptoUtils.BASE64_CHARS.charAt(((b2 & 15) << 2) | (b3 >> 6)) : '=';
        result += (i + 2 < bytes.length) ? CryptoUtils.BASE64_CHARS.charAt(b3 & 63) : '=';
      }
      hilog.info(DOMAIN, TAG, `base64Encode() result length: ${result.length}`);
      return result;
    } catch (error) {
      hilog.error(DOMAIN, TAG, `base64Encode() failed: ${(error as Error).message}`);
      return '';
    }
  }

  /**
   * Base64解码
   */
  static base64Decode(base64: string): string {
    hilog.debug(DOMAIN, TAG, 'base64Decode() called');
    try {
      const cleanBase64: string = base64.replace(/=/g, '');
      const bytes: number[] = [];
      for (let i = 0; i < cleanBase64.length; i += 4) {
        const c1: number = CryptoUtils.BASE64_CHARS.indexOf(cleanBase64[i]);
        const c2: number = i + 1 < cleanBase64.length ? CryptoUtils.BASE64_CHARS.indexOf(cleanBase64[i + 1]) : -1;
        const c3: number = i + 2 < cleanBase64.length ? CryptoUtils.BASE64_CHARS.indexOf(cleanBase64[i + 2]) : -1;
        const c4: number = i + 3 < cleanBase64.length ? CryptoUtils.BASE64_CHARS.indexOf(cleanBase64[i + 3]) : -1;
        bytes.push((c1 << 2) | (c2 >> 4));
        if (c3 !== -1) {
          bytes.push(((c2 & 15) << 4) | (c3 >> 2));
        }
        if (c4 !== -1) {
          bytes.push(((c3 & 3) << 6) | c4);
        }
      }
      const result: string = CryptoUtils.arrayBufferToString(new Uint8Array(bytes).buffer as ArrayBuffer);
      hilog.info(DOMAIN, TAG, `base64Decode() result length: ${result.length}`);
      return result;
    } catch (error) {
      hilog.error(DOMAIN, TAG, `base64Decode() failed: ${(error as Error).message}`);
      return '';
    }
  }

  /**
   * 生成随机字节数组
   */
  static generateRandomBytes(length: number): Uint8Array {
    hilog.debug(DOMAIN, TAG, `generateRandomBytes() called with length: ${length}`);
    const bytes: Uint8Array = new Uint8Array(length);
    for (let i = 0; i < length; i++) {
      bytes[i] = Math.floor(Math.random() * 256);
    }
    hilog.info(DOMAIN, TAG, `generateRandomBytes() generated ${length} bytes`);
    return bytes;
  }

  /**
   * 生成随机十六进制字符串
   */
  static generateRandomHex(length: number): string {
    hilog.debug(DOMAIN, TAG, `generateRandomHex() called with length: ${length}`);
    const bytes: Uint8Array = CryptoUtils.generateRandomBytes(Math.ceil(length / 2));
    const hex: string = CryptoUtils.bytesToHex(bytes);
    const result: string = hex.substring(0, length);
    hilog.info(DOMAIN, TAG, `generateRandomHex() result: ${result}`);
    return result;
  }

  /**
   * 生成UUID
   */
  static generateUUID(): string {
    hilog.debug(DOMAIN, TAG, 'generateUUID() called');
    const hex: string = CryptoUtils.generateRandomHex(32);
    const part1: string = hex.substr(0, 8);
    const part2: string = hex.substr(8, 4);
    const part3: string = '4' + hex.substr(13, 3);
    const part4: string = (8 + parseInt(hex.substr(16, 1), 16) % 4).toString(16) + hex.substr(17, 3);
    const part5: string = hex.substr(20, 12);
    const result: string = `${part1}-${part2}-${part3}-${part4}-${part5}`;
    hilog.info(DOMAIN, TAG, `generateUUID() result: ${result}`);
    return result;
  }
}
