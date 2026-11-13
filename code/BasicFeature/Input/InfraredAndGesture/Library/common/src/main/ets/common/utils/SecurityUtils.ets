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
import { util } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

import { AppLogger } from '../AppLogger';

/** Text encoding used when converting strings to bytes. */
const TEXT_ENCODING_UTF8: string = 'utf-8';
/** Radix used to render digest bytes as hex text. */
const HEX_RADIX: number = 16;
/** Width of a single padded hex byte representation. */
const HEX_CHAR_WIDTH: number = 2;

/**
 * Digest algorithm names accepted by cryptoFramework.createMd.
 */
export enum DigestAlgorithm {
  /** Message Digest 5, legacy checksum usage only. */
  MD5 = 'MD5',
  /** Secure Hash Algorithm 1, legacy checksum usage only. */
  SHA1 = 'SHA1',
  /** Secure Hash Algorithm 256, recommended default. */
  SHA256 = 'SHA256'
}

/**
 * Utility class for security helpers based on @kit.CryptoArchitectureKit.
 * Provides message digest (hash) computation and Base64 codec helpers.
 * All methods are static, never throw and return safe fallbacks;
 * every failure branch logs a warning through AppLogger.
 */
export class SecurityUtils {
  /**
   * Computes the hex encoded digest of the input text.
   * @param input - text to digest, must not be empty.
   * @param algorithm - digest algorithm to use.
   * @returns lower-case hex digest, or an empty string on failure.
   */
  public static async digestHex(input: string, algorithm: DigestAlgorithm): Promise<string> {
    // An empty input is rejected early because it is almost always a caller mistake.
    if (input.length === 0) {
      AppLogger.warn('SecurityUtils', `digestHex called with empty input for ${algorithm}`);
      return '';
    }
    try {
      // Create the message digest primitive for the requested algorithm.
      const md: cryptoFramework.Md = cryptoFramework.createMd(algorithm);
      // Encode the text as UTF-8 bytes and feed them into the digest.
      const encoder: util.TextEncoder = new util.TextEncoder();
      const bytes: Uint8Array = encoder.encodeInto(input);
      await md.update({ data: bytes });
      const digest: cryptoFramework.DataBlob = await md.digest();
      // Render the digest bytes as a lower-case hex string.
      return SecurityUtils.bytesToHex(digest.data);
    } catch (err) {
      const error: BusinessError = err as BusinessError;
      AppLogger.warn('SecurityUtils', `digestHex failed for ${algorithm}: ${error.message}`);
      return '';
    }
  }

  /**
   * SHA-256 convenience wrapper around {@link SecurityUtils.digestHex}.
   */
  public static async sha256Hex(input: string): Promise<string> {
    return SecurityUtils.digestHex(input, DigestAlgorithm.SHA256);
  }

  /**
   * SHA-1 convenience wrapper around {@link SecurityUtils.digestHex}.
   */
  public static async sha1Hex(input: string): Promise<string> {
    return SecurityUtils.digestHex(input, DigestAlgorithm.SHA1);
  }

  /**
   * MD5 convenience wrapper around {@link SecurityUtils.digestHex}, legacy usage only.
   */
  public static async md5Hex(input: string): Promise<string> {
    return SecurityUtils.digestHex(input, DigestAlgorithm.MD5);
  }

  /**
   * Encodes the input text as standard Base64.
   * An empty input yields an empty output without a warning.
   */
  public static base64Encode(input: string): string {
    try {
      const encoder: util.TextEncoder = new util.TextEncoder();
      const bytes: Uint8Array = encoder.encodeInto(input);
      // encodeToStringSync renders the bytes as standard Base64 text.
      const helper: util.Base64Helper = new util.Base64Helper();
      return helper.encodeToStringSync(bytes);
    } catch (err) {
      const error: BusinessError = err as BusinessError;
      AppLogger.warn('SecurityUtils', `base64Encode failed: ${error.message}`);
      return '';
    }
  }

  /**
   * Encodes raw bytes as standard Base64.
   */
  public static base64EncodeBytes(bytes: Uint8Array): string {
    try {
      const helper: util.Base64Helper = new util.Base64Helper();
      return helper.encodeToStringSync(bytes);
    } catch (err) {
      const error: BusinessError = err as BusinessError;
      AppLogger.warn('SecurityUtils', `base64EncodeBytes failed: ${error.message}`);
      return '';
    }
  }

  /**
   * Decodes a Base64 string back into UTF-8 text.
   * Logs a warning and returns an empty string for invalid Base64 input.
   */
  public static base64Decode(input: string): string {
    // Empty input is rejected early as a caller mistake.
    if (input.length === 0) {
      AppLogger.warn('SecurityUtils', 'base64Decode called with empty input');
      return '';
    }
    try {
      const helper: util.Base64Helper = new util.Base64Helper();
      const bytes: Uint8Array = helper.decodeSync(input);
      // Decode the resulting UTF-8 bytes back into text.
      const decoder: util.TextDecoder = util.TextDecoder.create(TEXT_ENCODING_UTF8);
      return decoder.decodeToString(bytes);
    } catch (err) {
      const error: BusinessError = err as BusinessError;
      AppLogger.warn('SecurityUtils', `base64Decode failed: ${error.message}`);
      return '';
    }
  }

  /**
   * Decodes a Base64 string back into raw bytes.
   */
  public static base64DecodeToBytes(input: string): Uint8Array {
    try {
      const helper: util.Base64Helper = new util.Base64Helper();
      return helper.decodeSync(input);
    } catch (err) {
      const error: BusinessError = err as BusinessError;
      AppLogger.warn('SecurityUtils', `base64DecodeToBytes failed: ${error.message}`);
      return new Uint8Array(0);
    }
  }

  /**
   * Renders the given bytes as a lower-case hex string.
   */
  private static bytesToHex(bytes: Uint8Array): string {
    // Each byte becomes exactly two hex characters.
    let result: string = '';
    for (let i = 0; i < bytes.length; i++) {
      result += `${bytes[i].toString(HEX_RADIX).padStart(HEX_CHAR_WIDTH, '0')}`;
    }
    return result;
  }
}
