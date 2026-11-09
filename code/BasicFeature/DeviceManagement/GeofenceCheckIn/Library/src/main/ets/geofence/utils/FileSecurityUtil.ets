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

import { fileIo } from '@kit.CoreFileKit';
import { cryptoFramework } from '@kit.CryptoArchitectureKit';
import { BusinessError } from '@kit.BasicServicesKit';
import util from '@ohos.util';
import { Logger } from './Logger';

// Hash algorithm name requested from cryptoFramework for the MD5 digest helper.
const ALG_NAME_MD5: string = 'MD5';
// Hash algorithm name requested from cryptoFramework for the SHA256 digest helper.
const ALG_NAME_SHA256: string = 'SHA256';
// Length in bytes of each single digest or random hex step handled by this class.
const HEX_PAD_LIMIT: number = 2;
// File mode that opens an existing file for read/write, creates it when missing and truncates old content.
const WRITE_MODE: number = fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE | fileIo.OpenMode.TRUNC;
// Marker returned by getFileSizeBytes when the file size cannot be resolved.
const SIZE_UNKNOWN: number = -1;

/**
 * Typed error thrown by FileSecurityUtil operations.
 * ArkTS only allows throwing Error class instances, so system BusinessError values
 * are rewrapped into this Error subclass while keeping the original code and message.
 */
export class FileSecurityError extends Error {
  // System error code carried over from the underlying BusinessError.
  readonly code: number;

  /**
   * Create a FileSecurityError from a system error code and message.
   * @param code the system error code to preserve
   * @param message the human readable failure description
   */
  constructor(code: number, message: string) {
    // Hand the message to the Error base so stack traces keep the original text.
    super(message);
    // Name the error class so logs and catch sites can identify the source.
    this.name = 'FileSecurityError';
    // Store the system code for callers that branch on error numbers.
    this.code = code;
  }
}

/**
 * File and security utility class for the GeofenceCheckIn sample.
 * Wraps sandbox file operations and MD5/SHA256/Base64/UUID/random-hex helpers on top of system kits.
 */
export class FileSecurityUtil {
  /**
   * Check whether a file or directory exists in the application sandbox.
   * @param path the sandbox path to check
   * @returns true when the path exists, false when it is missing or cannot be checked
   */
  public static async fileExists(path: string): Promise<boolean> {
    // Trace the checked path so failed checks can be located quickly.
    Logger.debug('FileSecurityUtil#fileExists: check path ' + path);
    try {
      // Ask the file kit whether the path is present.
      const exists: boolean = await fileIo.access(path);
      return exists;
    } catch (err) {
      const e: BusinessError = err as BusinessError;
      // Log the failure and treat unreadable paths as not existing.
      Logger.error('FileSecurityUtil#fileExists: access failed, code: ' + e.code + ', message: ' + e.message);
      return false;
    }
  }

  /**
   * Read the whole text content of a sandbox file.
   * @param path the sandbox file path to read
   * @returns the file text content, rejects with BusinessError when reading fails
   */
  public static async readTextFile(path: string): Promise<string> {
    // Trace the read target before touching the file system.
    Logger.debug('FileSecurityUtil#readTextFile: read text from ' + path);
    try {
      // Read the file as text in one call.
      const content: string = await fileIo.readText(path);
      // Trace the received size so callers can verify expectations.
      Logger.debug('FileSecurityUtil#readTextFile: read finished, length: ' + content.length);
      return content;
    } catch (err) {
      const e: BusinessError = err as BusinessError;
      // Surface the failure to the caller after logging the error details.
      Logger.error('FileSecurityUtil#readTextFile: read failed, code: ' + e.code + ', message: ' + e.message);
      throw new FileSecurityError(e.code, e.message);
    }
  }

  /**
   * Write text content into a sandbox file, replacing any previous content.
   * @param path the sandbox file path to write, parent directory must already exist
   * @param content the text content to write
   * @returns resolves after the write completes, rejects with BusinessError when writing fails
   */
  public static async writeTextFile(path: string, content: string): Promise<void> {
    // Trace the write target and content size before touching the file system.
    Logger.debug('FileSecurityUtil#writeTextFile: write text to ' + path + ', length: ' + content.length);
    try {
      // Open the file with create and truncate flags so old content is replaced.
      const file: fileIo.File = await fileIo.open(path, WRITE_MODE);
      try {
        // Write the full text through the file descriptor.
        await fileIo.write(file.fd, content);
      } finally {
        // Always close the descriptor so no handle leaks on write failures.
        await fileIo.close(file);
      }
      // Confirm the successful write for later diagnosis.
      Logger.debug('FileSecurityUtil#writeTextFile: write finished');
    } catch (err) {
      const e: BusinessError = err as BusinessError;
      // Surface the failure to the caller after logging the error details.
      Logger.error('FileSecurityUtil#writeTextFile: write failed, code: ' + e.code + ', message: ' + e.message);
      throw new FileSecurityError(e.code, e.message);
    }
  }

  /**
   * Delete a single sandbox file.
   * @param path the sandbox file path to delete
   * @returns resolves after deletion succeeds, rejects with BusinessError when deletion fails
   */
  public static async deleteFile(path: string): Promise<void> {
    // Trace the delete target before removing the file.
    Logger.debug('FileSecurityUtil#deleteFile: delete file ' + path);
    try {
      // Remove the file with the unlink API.
      await fileIo.unlink(path);
      // Confirm the successful deletion for later diagnosis.
      Logger.debug('FileSecurityUtil#deleteFile: delete finished');
    } catch (err) {
      const e: BusinessError = err as BusinessError;
      // Surface the failure to the caller after logging the error details.
      Logger.error('FileSecurityUtil#deleteFile: delete failed, code: ' + e.code + ', message: ' + e.message);
      throw new FileSecurityError(e.code, e.message);
    }
  }

  /**
   * Copy one sandbox file to another sandbox path with full overwrite.
   * @param srcPath the source file path
   * @param destPath the destination file path
   * @returns resolves after copying succeeds, rejects with BusinessError when copying fails
   */
  public static async copyFile(srcPath: string, destPath: string): Promise<void> {
    // Trace both ends of the copy operation for later diagnosis.
    Logger.debug('FileSecurityUtil#copyFile: copy from ' + srcPath + ' to ' + destPath);
    try {
      // Copy with overwrite mode so the destination always matches the source.
      await fileIo.copyFile(srcPath, destPath, 0);
      // Confirm the successful copy for later diagnosis.
      Logger.debug('FileSecurityUtil#copyFile: copy finished');
    } catch (err) {
      const e: BusinessError = err as BusinessError;
      // Surface the failure to the caller after logging the error details.
      Logger.error('FileSecurityUtil#copyFile: copy failed, code: ' + e.code + ', message: ' + e.message);
      throw new FileSecurityError(e.code, e.message);
    }
  }

  /**
   * Rename a sandbox file or directory.
   * @param oldPath the current sandbox path
   * @param newPath the target sandbox path
   * @returns resolves after renaming succeeds, rejects with BusinessError when renaming fails
   */
  public static async renameFile(oldPath: string, newPath: string): Promise<void> {
    // Trace both ends of the rename operation for later diagnosis.
    Logger.debug('FileSecurityUtil#renameFile: rename from ' + oldPath + ' to ' + newPath);
    try {
      // Apply the rename inside the same sandbox volume.
      await fileIo.rename(oldPath, newPath);
      // Confirm the successful rename for later diagnosis.
      Logger.debug('FileSecurityUtil#renameFile: rename finished');
    } catch (err) {
      const e: BusinessError = err as BusinessError;
      // Surface the failure to the caller after logging the error details.
      Logger.error('FileSecurityUtil#renameFile: rename failed, code: ' + e.code + ', message: ' + e.message);
      throw new FileSecurityError(e.code, e.message);
    }
  }

  /**
   * Get the size of a sandbox file in bytes.
   * @param path the sandbox file path to inspect
   * @returns the file size in bytes, or -1 when the size cannot be resolved
   */
  public static async getFileSizeBytes(path: string): Promise<number> {
    // Trace the inspected path so missing files can be identified quickly.
    Logger.debug('FileSecurityUtil#getFileSizeBytes: stat file ' + path);
    try {
      // Stat the path and read the byte size.
      const stat: fileIo.Stat = await fileIo.stat(path);
      return stat.size;
    } catch (err) {
      const e: BusinessError = err as BusinessError;
      // Report an explicit unknown size instead of throwing to keep checks simple.
      Logger.error('FileSecurityUtil#getFileSizeBytes: stat failed, code: ' + e.code + ', message: ' + e.message);
      return SIZE_UNKNOWN;
    }
  }

  /**
   * List the names of files and directories inside a sandbox directory.
   * @param dirPath the sandbox directory path to list
   * @returns the entry names inside the directory, or an empty array when listing fails
   */
  public static async listDirNames(dirPath: string): Promise<string[]> {
    // Trace the listed directory for later diagnosis.
    Logger.debug('FileSecurityUtil#listDirNames: list directory ' + dirPath);
    try {
      // List the direct children of the directory.
      const names: string[] = await fileIo.listFile(dirPath);
      // Trace the entry count so callers can verify expectations.
      Logger.debug('FileSecurityUtil#listDirNames: listed entries, count: ' + names.length);
      return names;
    } catch (err) {
      const e: BusinessError = err as BusinessError;
      // Return an empty list so callers can keep iterating safely.
      Logger.error('FileSecurityUtil#listDirNames: list failed, code: ' + e.code + ', message: ' + e.message);
      return [];
    }
  }

  /**
   * Create a sandbox directory when it does not exist yet.
   * @param dirPath the sandbox directory path to create
   * @returns resolves after the directory is available, rejects with BusinessError when creation fails
   */
  public static async makeDir(dirPath: string): Promise<void> {
    // Trace the target directory before creating anything.
    Logger.debug('FileSecurityUtil#makeDir: make directory ' + dirPath);
    try {
      // Skip creation when the directory already exists.
      const exists: boolean = await FileSecurityUtil.fileExists(dirPath);
      if (exists) {
        return;
      }
      // Create the missing directory.
      await fileIo.mkdir(dirPath);
      // Confirm the successful creation for later diagnosis.
      Logger.debug('FileSecurityUtil#makeDir: make directory finished');
    } catch (err) {
      const e: BusinessError = err as BusinessError;
      // Surface the failure to the caller after logging the error details.
      Logger.error('FileSecurityUtil#makeDir: make directory failed, code: ' + e.code + ', message: ' + e.message);
      throw new FileSecurityError(e.code, e.message);
    }
  }

  /**
   * Compute the MD5 digest of a text and return it as a lower case hex string.
   * @param input the text to digest
   * @returns the 32 character MD5 hex string, rejects with BusinessError when hashing fails
   */
  public static async computeMd5(input: string): Promise<string> {
    // Trace the digest request with the input size only, never the content itself.
    Logger.debug('FileSecurityUtil#computeMd5: start md5 digest, length: ' + input.length);
    try {
      // Run the shared digest flow with the MD5 algorithm name.
      return await FileSecurityUtil.digestWithMd(input, ALG_NAME_MD5);
    } catch (err) {
      const e: BusinessError = err as BusinessError;
      // Surface the failure to the caller after logging the error details.
      Logger.error('FileSecurityUtil#computeMd5: md5 digest failed, code: ' + e.code + ', message: ' + e.message);
      throw new FileSecurityError(e.code, e.message);
    }
  }

  /**
   * Compute the SHA256 digest of a text and return it as a lower case hex string.
   * @param input the text to digest
   * @returns the 64 character SHA256 hex string, rejects with BusinessError when hashing fails
   */
  public static async computeSha256(input: string): Promise<string> {
    // Trace the digest request with the input size only, never the content itself.
    Logger.debug('FileSecurityUtil#computeSha256: start sha256 digest, length: ' + input.length);
    try {
      // Run the shared digest flow with the SHA256 algorithm name.
      return await FileSecurityUtil.digestWithMd(input, ALG_NAME_SHA256);
    } catch (err) {
      const e: BusinessError = err as BusinessError;
      // Surface the failure to the caller after logging the error details.
      Logger.error('FileSecurityUtil#computeSha256: sha256 digest failed, code: ' + e.code + ', message: ' + e.message);
      throw new FileSecurityError(e.code, e.message);
    }
  }

  /**
   * Encode a text into a standard Base64 string.
   * @param input the text to encode
   * @returns the Base64 encoded text, rejects with BusinessError when encoding fails
   */
  public static base64Encode(input: string): string {
    // Trace the encode request with the input size only, never the content itself.
    Logger.debug('FileSecurityUtil#base64Encode: encode text, length: ' + input.length);
    if (input.length === 0) {
      return '';
    }
    try {
      // Encode through the Base64 helper with the default basic type.
      const helper: util.Base64Helper = new util.Base64Helper();
      return helper.encodeToStringSync(FileSecurityUtil.stringToUtf8Bytes(input));
    } catch (err) {
      const e: BusinessError = err as BusinessError;
      // Surface the failure to the caller after logging the error details.
      Logger.error('FileSecurityUtil#base64Encode: encode failed, code: ' + e.code + ', message: ' + e.message);
      throw new FileSecurityError(e.code, e.message);
    }
  }

  /**
   * Decode a standard Base64 string back to its original bytes.
   * @param encoded the Base64 text to decode
   * @returns the decoded byte array, rejects with BusinessError when decoding fails
   */
  public static base64Decode(encoded: string): Uint8Array {
    // Trace the decode request with the encoded size only.
    Logger.debug('FileSecurityUtil#base64Decode: decode text, length: ' + encoded.length);
    if (encoded.length === 0) {
      return new Uint8Array(0);
    }
    try {
      // Decode through the Base64 helper with the default basic type.
      const helper: util.Base64Helper = new util.Base64Helper();
      return helper.decodeSync(encoded);
    } catch (err) {
      const e: BusinessError = err as BusinessError;
      // Surface the failure to the caller after logging the error details.
      Logger.error('FileSecurityUtil#base64Decode: decode failed, code: ' + e.code + ', message: ' + e.message);
      throw new FileSecurityError(e.code, e.message);
    }
  }

  /**
   * Generate a random RFC 4122 version 4 UUID string.
   * @returns a fresh UUID string
   */
  public static generateUuid(): string {
    // Trace each generation so duplicate ids can be traced back.
    Logger.debug('FileSecurityUtil#generateUuid: generate random uuid');
    // Use the cached mode for better performance as recommended by the util kit.
    return util.generateRandomUUID(true);
  }

  /**
   * Generate a random hex string from cryptographically secure random bytes.
   * @param byteLength the number of random bytes to generate
   * @returns the lower case hex string with two characters per byte, rejects on failure
   */
  public static generateRandomHex(byteLength: number): string {
    // Trace the requested byte count for later diagnosis.
    Logger.debug('FileSecurityUtil#generateRandomHex: generate ' + byteLength + ' random bytes');
    if (byteLength === 0) {
      return '';
    }
    try {
      // Ask the crypto framework for secure random bytes.
      const random: cryptoFramework.Random = cryptoFramework.createRandom();
      const data: cryptoFramework.DataBlob = random.generateRandomSync(byteLength);
      // Convert the raw bytes into a readable hex string.
      return FileSecurityUtil.bytesToHex(data.data);
    } catch (err) {
      const e: BusinessError = err as BusinessError;
      // Surface the failure to the caller after logging the error details.
      Logger.error('FileSecurityUtil#generateRandomHex: generate failed, code: ' + e.code + ', message: ' + e.message);
      throw new FileSecurityError(e.code, e.message);
    }
  }

  /**
   * Run the shared message digest flow with the requested MD algorithm.
   * @param input the text to digest
   * @param algName the MD algorithm name such as MD5 or SHA256
   * @returns the lower case hex digest of the input text
   */
  private static async digestWithMd(input: string, algName: string): Promise<string> {
    // Create the digest instance for the requested algorithm.
    const md: cryptoFramework.Md = cryptoFramework.createMd(algName);
    // Feed the UTF-8 bytes of the text into the digest context; the framework
    // rejects zero-length update blobs, so empty input goes straight to digest.
    const bytes: Uint8Array = FileSecurityUtil.stringToUtf8Bytes(input);
    if (bytes.length > 0) {
      const blob: cryptoFramework.DataBlob = { data: bytes };
      await md.update(blob);
    }
    // Compute and return the final digest as a hex string.
    const digest: cryptoFramework.DataBlob = await md.digest();
    return FileSecurityUtil.bytesToHex(digest.data);
  }

  /**
   * Convert a text into its UTF-8 byte representation.
   * @param input the text to encode
   * @returns the UTF-8 bytes of the text, or an empty array for empty input
   */
  private static stringToUtf8Bytes(input: string): Uint8Array {
    // The encoder returns undefined for empty input, so hand out an empty array directly.
    if (input === '') {
      return new Uint8Array(0);
    }
    // Encode the text with the recommended non-deprecated encoder API.
    const encoder: util.TextEncoder = new util.TextEncoder();
    return encoder.encodeInto(input);
  }

  /**
   * Convert a byte array into a lower case hex string.
   * @param bytes the bytes to convert
   * @returns the hex string with two characters per byte
   */
  private static bytesToHex(bytes: Uint8Array): string {
    // Append each byte as a two digit hex value to the result.
    let hex: string = '';
    for (let i = 0; i < bytes.length; i++) {
      const part: string = bytes[i].toString(16);
      // Pad the high nibble so every byte always yields two characters.
      if (part.length < HEX_PAD_LIMIT) {
        hex = hex + '0';
      }
      hex = hex + part;
    }
    return hex;
  }
}
