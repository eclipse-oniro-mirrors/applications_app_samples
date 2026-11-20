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
import { Logger } from './Logger';

// Algorithm name accepted by cryptoFramework.createMd for MD5 digests.
const ALG_MD5: string = 'MD5';
// Algorithm name accepted by cryptoFramework.createMd for SHA-256 digests.
const ALG_SHA256: string = 'SHA256';
// Hex digits per byte when rendering a digest as text.
const HEX_RADIX: number = 16;
// Target width of one byte rendered in hex.
const HEX_WIDTH: number = 2;
// Name of the charset used for both text encoding and decoding.
const CHARSET_UTF8: string = 'utf-8';
// Prefix used by MD5 failure messages.
const FAIL_MD5: string = 'MD5 digest failed';
// Prefix used by SHA-256 failure messages.
const FAIL_SHA256: string = 'SHA256 digest failed';
// Published MD5 digest of the empty message (RFC 1321 test vector).
const MD5_EMPTY_DIGEST: string = 'd41d8cd98f00b204e9800998ecf8427e';
// Published SHA-256 digest of the empty message (NIST test vector).
const SHA256_EMPTY_DIGEST: string = 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855';
// Sentinel code logged when a thrown value carries no numeric business code.
const UNKNOWN_CODE: number = -1;

/**
 * Crypto helpers: MD5 and SHA-256 message digests via CryptoArchitectureKit
 * and Base64 encode or decode via the util Base64Helper. Digest methods are
 * asynchronous and return the lowercase hex text, failure results are empty
 * strings and the failure is reported through Logger.error.
 */
export class CryptoUtils {
  /**
   * Compute the MD5 digest of a text.
   * @param text text to digest.
   * @returns the lowercase hex digest, or an empty string on failure.
   */
  static async md5(text: string): Promise<string> {
    const tag: string = '[CryptoUtils#md5]';
    Logger.enter(tag, 'chars: ' + text.length.toString());
    Logger.beginTrace('NetworkSecurity.utils.md5', 1);
    // Delegate to the shared digest routine with the MD5 algorithm name.
    const result: string = await CryptoUtils.digest(ALG_MD5, text, FAIL_MD5);
    Logger.exit(tag, 'result: ' + result);
    Logger.endTrace('NetworkSecurity.utils.md5', 1);
    return result;
  }

  /**
   * Compute the SHA-256 digest of a text.
   * @param text text to digest.
   * @returns the lowercase hex digest, or an empty string on failure.
   */
  static async sha256(text: string): Promise<string> {
    const tag: string = '[CryptoUtils#sha256]';
    Logger.enter(tag, 'chars: ' + text.length.toString());
    Logger.beginTrace('NetworkSecurity.utils.sha256', 1);
    // Delegate to the shared digest routine with the SHA-256 algorithm name.
    const result: string = await CryptoUtils.digest(ALG_SHA256, text, FAIL_SHA256);
    Logger.exit(tag, 'result: ' + result);
    Logger.endTrace('NetworkSecurity.utils.sha256', 1);
    return result;
  }

  /**
   * Render a byte array as lowercase hex text.
   * @param bytes bytes to render.
   * @returns two hex characters per byte, joined in order.
   */
  static bytesToHex(bytes: Uint8Array): string {
    const tag: string = '[CryptoUtils#bytesToHex]';
    Logger.enter(tag, 'bytes: ' + bytes.length.toString());
    Logger.beginTrace('NetworkSecurity.utils.bytesToHex', 1);
    // Map every byte to a zero padded hex pair and join the pieces.
    const parts: string[] = Array.from(bytes).map((byte: number): string =>
      byte.toString(HEX_RADIX).padStart(HEX_WIDTH, '0'));
    const result: string = parts.join('');
    Logger.exit(tag, 'chars: ' + result.length.toString());
    Logger.endTrace('NetworkSecurity.utils.bytesToHex', 1);
    return result;
  }

  /**
   * Base64-encode a text using the util Base64Helper.
   * @param text text to encode.
   * @returns the Base64 text, or an empty string on failure.
   */
  static base64Encode(text: string): string {
    const tag: string = '[CryptoUtils#base64Encode]';
    Logger.enter(tag, 'chars: ' + text.length.toString());
    Logger.beginTrace('NetworkSecurity.utils.base64Encode', 1);
    // Encode text bytes with the UTF-8 charset before Base64 conversion.
    let result: string = '';
    try {
      const encoder: util.TextEncoder = new util.TextEncoder();
      const bytes: Uint8Array = encoder.encodeInto(text);
      // Base64Helper performs the byte-to-text conversion synchronously.
      const helper: util.Base64Helper = new util.Base64Helper();
      result = helper.encodeToStringSync(bytes);
    } catch (error) {
      // The thrown value may be a plain Error without a business code, so guard
      // the read before rendering it; an unguarded read would crash the caller.
      const err: BusinessError = error as BusinessError;
      const code: number = typeof err.code === 'number' ? err.code : UNKNOWN_CODE;
      Logger.error(tag + ' encode failed, code ' + code.toString());
      result = '';
    }
    Logger.exit(tag, 'chars: ' + result.length.toString());
    Logger.endTrace('NetworkSecurity.utils.base64Encode', 1);
    return result;
  }

  /**
   * Decode a Base64 text back to plain text.
   * @param text Base64 text to decode.
   * @returns the decoded text, or an empty string on failure.
   */
  static base64Decode(text: string): string {
    const tag: string = '[CryptoUtils#base64Decode]';
    Logger.enter(tag, 'chars: ' + text.length.toString());
    Logger.beginTrace('NetworkSecurity.utils.base64Decode', 1);
    // Decode to bytes first, then reinterpret them as UTF-8 text.
    let result: string = '';
    try {
      // A lone trailing Base64 digit cannot encode a complete byte.
      if (text.length % 4 === 1) {
        throw new Error('Invalid Base64 length');
      }
      const helper: util.Base64Helper = new util.Base64Helper();
      const bytes: Uint8Array = helper.decodeSync(text);
      // TextDecoder.create is the supported factory for charset decoders.
      const decoder: util.TextDecoder = util.TextDecoder.create(CHARSET_UTF8);
      result = decoder.decodeToString(bytes);
    } catch (error) {
      // The thrown value may be a plain Error without a business code, so guard
      // the read before rendering it; an unguarded read would crash the caller.
      const err: BusinessError = error as BusinessError;
      const code: number = typeof err.code === 'number' ? err.code : UNKNOWN_CODE;
      Logger.error(tag + ' decode failed, code ' + code.toString());
      result = '';
    }
    Logger.exit(tag, 'chars: ' + result.length.toString());
    Logger.endTrace('NetworkSecurity.utils.base64Decode', 1);
    return result;
  }

  /**
   * Shared digest implementation used by md5 and sha256.
   * @param algorithm algorithm name accepted by cryptoFramework.createMd.
   * @param text text to digest.
   * @param failPrefix message prefix used in failure logs.
   * @returns the lowercase hex digest, or an empty string on failure.
   */
  private static async digest(algorithm: string, text: string, failPrefix: string): Promise<string> {
    // Some board images reject a digest call that carries no update data, so an
    // empty message takes its fixed published digest instead of the framework
    // path below; both constants match the algorithm definitions exactly.
    if (text.length === 0) {
      return algorithm === ALG_MD5 ? MD5_EMPTY_DIGEST : SHA256_EMPTY_DIGEST;
    }
    // Start from an empty result so failures fall through to one exit point.
    let result: string = '';
    try {
      // createMd returns a fresh Md instance for the requested algorithm.
      const md: cryptoFramework.Md = cryptoFramework.createMd(algorithm);
      // Text must be converted to bytes before the digest can consume it.
      const encoder: util.TextEncoder = new util.TextEncoder();
      const bytes: Uint8Array = encoder.encodeInto(text);
      // The framework rejects an empty update payload, so an empty text feeds no
      // update at all; digest alone already covers the empty message digest.
      if (bytes.length > 0) {
        const blob: cryptoFramework.DataBlob = { data: bytes };
        await md.update(blob);
      }
      // Digest finalizes the accumulated data and returns the digest bytes.
      const output: cryptoFramework.DataBlob = await md.digest();
      // Render the raw digest bytes as lowercase hex text.
      result = CryptoUtils.bytesToHex(output.data);
    } catch (error) {
      // The thrown value may be a plain Error without a business code, so guard
      // the read before rendering it; an unguarded read would crash the caller.
      const err: BusinessError = error as BusinessError;
      const code: number = typeof err.code === 'number' ? err.code : UNKNOWN_CODE;
      Logger.error('[CryptoUtils#digest] ' + failPrefix + ', code ' + code.toString());
      result = '';
    }
    return result;
  }
}
