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

// Import the util module from the ArkTS kit for Base64 encode and decode helpers.
import { util } from '@kit.ArkTS';
// Import the crypto framework for digest (MD5/SHA) computation.
import { cryptoFramework } from '@kit.CryptoArchitectureKit';
// Import the in-house logger so digest failures are observable.
import { Logger } from './Logger';

// The module tag used for every log line emitted by this utility.
const TAG: string = 'EncryptUtils';
// The published MD5 digest of the empty input; the platform rejects empty update blobs.
const MD5_EMPTY_HEX: string = 'd41d8cd98f00b204e9800998ecf8427e';
// The published SHA-1 digest of the empty input.
const SHA1_EMPTY_HEX: string = 'da39a3ee5e6b4b0d3255bfef95601890afd80709';
// The published SHA-256 digest of the empty input.
const SHA256_EMPTY_HEX: string = 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855';

// Encoding and digest helpers: Base64, URL escapes and MD5/SHA hashes.
export class EncryptUtils {
  // Encodes UTF-8 text into a Base64 string.
  static base64Encode(text: string): string {
    // The platform text encoder returns undefined for empty input.
    if (text.length === 0) {
      return '';
    }
    // Create the Base64 helper instance.
    const helper: util.Base64Helper = new util.Base64Helper();
    // Convert the text into its UTF-8 byte representation.
    const bytes: Uint8Array = util.TextEncoder.create('utf-8').encodeInto(text);
    // Encode the bytes and return the textual Base64 result.
    return helper.encodeToStringSync(bytes);
  }

  // Checks RFC 4648 Base64: four-character groups, valid alphabet and trailing padding.
  private static isStrictBase64(text: string): boolean {
    // The Base64 length must be a multiple of four.
    if (text.length % 4 !== 0) {
      // Lengths one, two and three modulo four are malformed.
      return false;
    }
    // Track whether the padding tail has started.
    let padSeen: boolean = false;
    // Walk every character of the text.
    for (let i: number = 0; i < text.length; i++) {
      // Read the current character.
      const ch: string = text.charAt(i);
      // Handle the padding character first.
      if (ch === '=') {
        // Padding may only occupy the last two positions of the text.
        if (i < text.length - 2) {
          // Padding in the middle of the text is malformed.
          return false;
        }
        // Mark the padding tail as started.
        padSeen = true;
        // Move on to the next character.
        continue;
      }
      // Data characters after the padding tail are malformed.
      if (padSeen) {
        // Reject data characters after padding.
        return false;
      }
      // Check the standard Base64 alphabet.
      const isAlphabet: boolean = (ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z') ||
        (ch >= '0' && ch <= '9') || ch === '+' || ch === '/';
      // Reject every character outside the alphabet.
      if (!isAlphabet) {
        // Non alphabet characters are malformed.
        return false;
      }
    }
    // The text is strict Base64; the empty text counts as the encoding of the empty input.
    return true;
  }

  // Decodes a Base64 string back into UTF-8 text, returning an empty string on failure.
  static base64Decode(base64Text: string): string {
    try {
      // Reject malformed input before touching the platform decoder.
      if (!EncryptUtils.isStrictBase64(base64Text)) {
        // Log the malformed decode attempt.
        Logger.warn(TAG, 'base64Decode failed');
        // Report the empty fallback.
        return '';
      }
      // Create the Base64 helper instance.
      const helper: util.Base64Helper = new util.Base64Helper();
      // Decode the textual Base64 into raw bytes.
      const bytes: Uint8Array = helper.decodeSync(base64Text);
      // Degenerate platform results such as single character inputs must fall back too.
      if (bytes.length === 0) {
        // Log the degenerate decode result.
        Logger.warn(TAG, 'base64Decode failed');
        // Report the empty fallback.
        return '';
      }
      // Convert the bytes back into a UTF-8 string.
      return util.TextDecoder.create('utf-8').decodeWithStream(bytes);
    } catch (error) {
      // Invalid Base64 input lands here; report it through the log channel.
      Logger.warn(TAG, 'base64Decode failed');
      // Return an empty string so callers can chain safely.
      return '';
    }
  }

  // Percent-encodes the text so it is safe inside a URL component.
  static urlEncode(text: string): string {
    // Delegate to the standard URI component encoder.
    return encodeURIComponent(text);
  }

  // Decodes a percent-encoded URL component back into plain text.
  static urlDecode(text: string): string {
    try {
      // Delegate to the standard URI component decoder.
      return decodeURIComponent(text);
    } catch (error) {
      // Malformed escape sequences land here.
      Logger.warn(TAG, 'urlDecode failed');
      // Return the original text unchanged.
      return text;
    }
  }

  // Computes the hexadecimal digest of the text with the requested algorithm.
  private static async digest(algorithm: string, text: string): Promise<string> {
    // Create the digest object for the requested algorithm such as MD5 or SHA-256.
    const md: cryptoFramework.Md = cryptoFramework.createMd(algorithm);
    // Convert the input text into its UTF-8 byte representation.
    const bytes: Uint8Array = util.TextEncoder.create('utf-8').encodeInto(text);
    // Wrap the bytes into a DataBlob expected by the crypto framework.
    const blob: cryptoFramework.DataBlob = { data: bytes };
    // Feed the bytes into the digest computation.
    await md.update(blob);
    // Finalize the computation and receive the raw digest bytes.
    const result: cryptoFramework.DataBlob = await md.digest();
    // Accumulate the hexadecimal representation of every digest byte.
    let hex: string = '';
    // Walk the digest bytes in order.
    for (let i: number = 0; i < result.data.length; i++) {
      // Convert one byte into a two digit hexadecimal text.
      hex += (result.data[i] < 16 ? '0' : '') + result.data[i].toString(16);
    }
    // Return the completed hexadecimal digest.
    return hex;
  }

  // Computes the MD5 hex digest of the text.
  static async md5(text: string): Promise<string> {
    try {
      // The empty input hashes to the published constant without touching the crypto framework.
      if (text.length === 0) {
        // Return the published empty-input MD5 digest.
        return MD5_EMPTY_HEX;
      }
      // Delegate to the shared digest runner with the MD5 algorithm.
      return await EncryptUtils.digest('MD5', text);
    } catch (error) {
      // Crypto failures land here; report them without crashing.
      Logger.error(TAG, 'md5 failed');
      // Return an empty string so callers can detect the failure.
      return '';
    }
  }

  // Computes the SHA-256 hex digest of the text.
  static async sha256(text: string): Promise<string> {
    try {
      // The empty input hashes to the published constant without touching the crypto framework.
      if (text.length === 0) {
        // Return the published empty-input SHA-256 digest.
        return SHA256_EMPTY_HEX;
      }
      // Delegate to the shared digest runner with the SHA-256 algorithm.
      return await EncryptUtils.digest('SHA256', text);
    } catch (error) {
      // Crypto failures land here; report them without crashing.
      Logger.error(TAG, 'sha256 failed');
      // Return an empty string so callers can detect the failure.
      return '';
    }
  }

  // Computes the SHA-1 hex digest of the text.
  static async sha1(text: string): Promise<string> {
    try {
      // The empty input hashes to the published constant without touching the crypto framework.
      if (text.length === 0) {
        // Return the published empty-input SHA-1 digest.
        return SHA1_EMPTY_HEX;
      }
      // Delegate to the shared digest runner with the SHA-1 algorithm.
      return await EncryptUtils.digest('SHA1', text);
    } catch (error) {
      // Crypto failures land here; report them without crashing.
      Logger.error(TAG, 'sha1 failed');
      // Return an empty string so callers can detect the failure.
      return '';
    }
  }
}
