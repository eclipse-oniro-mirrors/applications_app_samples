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

// Import the file I/O module (aliased as fs) for sandbox file operations.
import { fileIo as fs } from '@kit.CoreFileKit';
// Import the context type so helpers can resolve sandbox directories from a caller context.
import { common } from '@kit.AbilityKit';
// Import the in-house logger so every failure is observable without crashing callers.
import { Logger } from './Logger';

// The module tag used for every log line emitted by this utility.
const TAG: string = 'FileUtils';
// The number of bytes copied per chunk used by the manual copy fallback.
const COPY_CHUNK_SIZE: number = 64 * 1024;

// Synchronous sandbox file helpers built on CoreFileKit with defensive logging.
export class FileUtils {
  // Returns true when the path exists, regardless of it being a file or a directory.
  static exists(path: string): boolean {
    try {
      // Ask the file system whether the path is accessible.
      return fs.accessSync(path);
    } catch (error) {
      // Log the failure but treat it as "does not exist".
      Logger.warn(TAG, 'exists check failed for ' + path);
      // Missing permissions or invalid paths behave as non-existent.
      return false;
    }
  }

  // Creates the directory (and all missing parents) when it does not exist yet.
  static ensureDir(dirPath: string): boolean {
    try {
      // Skip creation when the directory already exists.
      if (FileUtils.exists(dirPath)) {
        // The directory is already present.
        return true;
      }
      // Create every missing path segment recursively.
      fs.mkdirSync(dirPath, true);
      // Report the successful creation.
      return true;
    } catch (error) {
      // Log the failure reason so the caller can diagnose sandbox issues.
      Logger.error(TAG, 'ensureDir failed for ' + dirPath);
      // Report the failure to the caller.
      return false;
    }
  }

  // Returns the byte size of the file, or -1 when the path does not exist.
  static fileSize(path: string): number {
    // A missing file has no meaningful size.
    if (!FileUtils.exists(path)) {
      // Report the sentinel size.
      return -1;
    }
    try {
      // Stat the file and read its size field.
      return fs.statSync(path).size;
    } catch (error) {
      // Log the stat failure for diagnosis.
      Logger.warn(TAG, 'fileSize failed for ' + path);
      // Report the sentinel size on failure.
      return -1;
    }
  }

  // Reads the whole file as a UTF-8 string, returning an empty string on failure.
  static readText(path: string): string {
    try {
      // Read the entire file content synchronously as text.
      return fs.readTextSync(path);
    } catch (error) {
      // Log the read failure with the offending path.
      Logger.error(TAG, 'readText failed for ' + path);
      // Return an empty string so callers can chain safely.
      return '';
    }
  }

  // Writes the text content into the file, replacing any previous content.
  static writeText(path: string, content: string): boolean {
    try {
      // Open (or create) the target file with truncation so old content is dropped.
      const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE |
        fs.OpenMode.TRUNC);
      try {
        // Write the full text into the file descriptor.
        fs.writeSync(file.fd, content);
      } finally {
        // Always close the handle even when writing throws.
        fs.closeSync(file);
      }
      // Report the successful write.
      return true;
    } catch (error) {
      // Log the write failure with the offending path.
      Logger.error(TAG, 'writeText failed for ' + path);
      // Report the failure to the caller.
      return false;
    }
  }

  // Appends one line of text at the end of the file.
  static appendLine(path: string, line: string): boolean {
    try {
      // Open (or create) the target file in append mode so existing content is preserved.
      const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE |
        fs.OpenMode.APPEND);
      try {
        // Write the line followed by a newline separator.
        fs.writeSync(file.fd, line + '\n');
      } finally {
        // Always close the handle even when writing throws.
        fs.closeSync(file);
      }
      // Report the successful append.
      return true;
    } catch (error) {
      // Log the append failure with the offending path.
      Logger.error(TAG, 'appendLine failed for ' + path);
      // Report the failure to the caller.
      return false;
    }
  }

  // Copies a file from the source path to the target path, replacing the target.
  static copyFile(srcPath: string, destPath: string): boolean {
    try {
      // Delegate to the platform copy which handles the whole content at once.
      fs.copyFileSync(srcPath, destPath);
      // Report the successful copy.
      return true;
    } catch (error) {
      // Log the copy failure with both paths involved.
      Logger.error(TAG, 'copyFile failed from ' + srcPath + ' to ' + destPath);
      // Report the failure to the caller.
      return false;
    }
  }

  // Deletes the file when it exists and reports whether the path is now gone.
  static deleteFile(path: string): boolean {
    // Nothing to delete when the path is missing.
    if (!FileUtils.exists(path)) {
      // Treat a missing file as success.
      return true;
    }
    try {
      // Remove the file entry from the file system.
      fs.unlinkSync(path);
      // Report the successful deletion.
      return true;
    } catch (error) {
      // Log the deletion failure with the offending path.
      Logger.error(TAG, 'deleteFile failed for ' + path);
      // Report the failure to the caller.
      return false;
    }
  }

  // Deletes a directory and everything inside it.
  static deleteDir(dirPath: string): boolean {
    // Nothing to delete when the directory is missing.
    if (!FileUtils.exists(dirPath)) {
      // Treat a missing directory as success.
      return true;
    }
    try {
      // Remove the whole subtree recursively.
      fs.rmdirSync(dirPath);
      // Report the successful deletion.
      return true;
    } catch (error) {
      // Log the deletion failure with the offending path.
      Logger.error(TAG, 'deleteDir failed for ' + dirPath);
      // Report the failure to the caller.
      return false;
    }
  }

  // Lists the direct child file names of a directory, sorted by the platform.
  static listFiles(dirPath: string): string[] {
    // Return an empty list when the directory does not exist.
    if (!FileUtils.exists(dirPath)) {
      // Missing directories have no children.
      return [];
    }
    try {
      // List the direct children synchronously without recursion.
      return fs.listFileSync(dirPath);
    } catch (error) {
      // Log the listing failure for diagnosis.
      Logger.warn(TAG, 'listFiles failed for ' + dirPath);
      // Return an empty list so callers can chain safely.
      return [];
    }
  }

  // Resolves the standard application files directory from a context.
  static filesDirOf(context: common.Context): string {
    // Read the sandbox files directory straight from the context.
    return context.filesDir;
  }

  // Builds a sandbox path by joining the files directory with the given segments.
  static sandboxPath(context: common.Context, segments: string[]): string {
    // Start from the application files directory.
    let path: string = context.filesDir;
    // Append every segment with a forward slash separator.
    for (let i: number = 0; i < segments.length; i++) {
      // Append one segment after a slash.
      path += '/' + segments[i];
    }
    // Return the joined sandbox path.
    return path;
  }
}
