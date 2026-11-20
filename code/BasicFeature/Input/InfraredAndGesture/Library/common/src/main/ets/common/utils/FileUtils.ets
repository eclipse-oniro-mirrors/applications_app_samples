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

import { fileIo as fs } from '@kit.CoreFileKit';
import { util } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

import { AppLogger } from '../AppLogger';

/** Text encoding used for all text based file operations. */
const TEXT_ENCODING_UTF8: string = 'utf-8';
/** Path separator used when building absolute file paths. */
const PATH_SEPARATOR: string = '/';
/** Sentinel returned by {@link FileUtils.getFileSize} when the size is unknown. */
const FILE_SIZE_UNKNOWN: number = -1;

/**
 * Utility class for file and directory operations based on @kit.CoreFileKit.
 * All methods are static, never throw and return safe fallbacks;
 * every failure branch logs a warning through AppLogger.
 */
export class FileUtils {
  /**
   * Checks whether a file or directory exists at the given path.
   */
  public static async exists(path: string): Promise<boolean> {
    try {
      // accessSync returns true when the path is reachable.
      return fs.accessSync(path);
    } catch (err) {
      const error: BusinessError = err as BusinessError;
      AppLogger.warn('FileUtils', `exists failed for path ${path}: ${error.message}`);
      return false;
    }
  }

  /**
   * Reads the whole file content as UTF-8 text.
   * Returns an empty string and logs a warning when reading fails.
   */
  public static async readText(path: string): Promise<string> {
    let file: fs.File | null = null;
    try {
      // Open in read-only mode and stat the file to learn its byte size.
      file = fs.openSync(path, fs.OpenMode.READ_ONLY);
      const stat: fs.Stat = fs.statSync(path);
      // Load the full content into a single buffer sized by the stat result.
      const bytes: Uint8Array = new Uint8Array(new ArrayBuffer(stat.size));
      fs.readSync(file.fd, bytes);
      // Decode the raw bytes as UTF-8 text.
      const decoder: util.TextDecoder = util.TextDecoder.create(TEXT_ENCODING_UTF8);
      return decoder.decodeToString(bytes);
    } catch (err) {
      const error: BusinessError = err as BusinessError;
      AppLogger.warn('FileUtils', `readText failed for path ${path}: ${error.message}`);
      return '';
    } finally {
      // Always release the file descriptor to avoid handle leaks.
      if (file !== null) {
        try {
          fs.closeSync(file);
        } catch (err) {
          // A failed close must not mask the original operation result.
          const closeError: BusinessError = err as BusinessError;
          AppLogger.warn('FileUtils', `close failed for path ${path}: ${closeError.message}`);
        }
      }
    }
  }

  /**
   * Writes text content to a file in UTF-8 encoding.
   * @param path - absolute target file path.
   * @param content - text to write.
   * @param append - when true the content is appended instead of overwriting.
   * @returns true on success, false on failure.
   */
  public static async writeText(path: string, content: string, append: boolean = false): Promise<boolean> {
    let file: fs.File | null = null;
    try {
      // Choose the open mode from the append flag: truncate for rewrite, append to extend.
      const mode: number = append
        ? fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.APPEND
        : fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC;
      file = fs.openSync(path, mode);
      fs.writeSync(file.fd, content);
      return true;
    } catch (err) {
      const error: BusinessError = err as BusinessError;
      AppLogger.warn('FileUtils', `writeText failed for path ${path}: ${error.message}`);
      return false;
    } finally {
      // Always release the file descriptor to avoid handle leaks.
      if (file !== null) {
        try {
          fs.closeSync(file);
        } catch (err) {
          const closeError: BusinessError = err as BusinessError;
          AppLogger.warn('FileUtils', `close failed for path ${path}: ${closeError.message}`);
        }
      }
    }
  }

  /**
   * Creates the directory and all missing parents when needed.
   * @returns true when the directory exists or was created.
   */
  public static async ensureDir(dirPath: string): Promise<boolean> {
    try {
      // Skip creation when the directory already exists.
      if (fs.accessSync(dirPath)) {
        return true;
      }
      // Recursive mkdir creates every missing parent segment.
      fs.mkdirSync(dirPath, true);
      return true;
    } catch (err) {
      const error: BusinessError = err as BusinessError;
      AppLogger.warn('FileUtils', `ensureDir failed for path ${dirPath}: ${error.message}`);
      return false;
    }
  }

  /**
   * Deletes the file at the given path.
   * Missing paths are reported as a warning and return false.
   */
  public static async deleteFile(path: string): Promise<boolean> {
    try {
      if (!fs.accessSync(path)) {
        AppLogger.warn('FileUtils', `deleteFile skipped, path not found: ${path}`);
        return false;
      }
      // unlinkSync removes the file entry from the file system.
      fs.unlinkSync(path);
      return true;
    } catch (err) {
      const error: BusinessError = err as BusinessError;
      AppLogger.warn('FileUtils', `deleteFile failed for path ${path}: ${error.message}`);
      return false;
    }
  }

  /**
   * Returns the file size in bytes or {@link FILE_SIZE_UNKNOWN} on failure.
   */
  public static async getFileSize(path: string): Promise<number> {
    try {
      return fs.statSync(path).size;
    } catch (err) {
      const error: BusinessError = err as BusinessError;
      AppLogger.warn('FileUtils', `getFileSize failed for path ${path}: ${error.message}`);
      return FILE_SIZE_UNKNOWN;
    }
  }

  /**
   * Lists absolute paths of all entries inside the directory.
   * Returns an empty array and logs a warning on failure.
   */
  public static async listFiles(dirPath: string): Promise<string[]> {
    try {
      // listFileSync returns the child entry names of the directory.
      const names: string[] = fs.listFileSync(dirPath);
      const result: string[] = [];
      for (const name of names) {
        // Join each child name to produce an absolute path.
        result.push(`${dirPath}${PATH_SEPARATOR}${name}`);
      }
      return result;
    } catch (err) {
      const error: BusinessError = err as BusinessError;
      AppLogger.warn('FileUtils', `listFiles failed for path ${dirPath}: ${error.message}`);
      return [];
    }
  }

  /**
   * Copies a file, creating or overwriting the destination.
   * @returns true on success, false on failure.
   */
  public static async copyFile(srcPath: string, destPath: string): Promise<boolean> {
    try {
      // copyFileSync overwrites the destination when it already exists.
      fs.copyFileSync(srcPath, destPath);
      return true;
    } catch (err) {
      const error: BusinessError = err as BusinessError;
      AppLogger.warn('FileUtils', `copyFile failed from ${srcPath} to ${destPath}: ${error.message}`);
      return false;
    }
  }

  /**
   * Joins the given path segments with the path separator,
   * skipping empty segments.
   */
  public static joinPath(segments: string[]): string {
    // Filter empty segments first, then join with the path separator.
    const parts: string[] = [];
    for (const segment of segments) {
      if (segment.length > 0) {
        parts.push(segment);
      }
    }
    return parts.join(PATH_SEPARATOR);
  }
}
