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
import { util } from '@kit.ArkTS';

// Path separator of the sandbox file system, exposed for callers that build paths manually.
const PATH_SEPARATOR: string = '/';
// Flag that opens a file in append mode so every write lands at the end of the file.
const APPEND_MODE: number = fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE | fileIo.OpenMode.APPEND;
// Maximum number of levels walked upward by ensureDir to avoid an endless loop on a broken path.
const MAX_ENSURE_DEPTH: number = 64;

/**
 * Sandbox file helpers that operate on plain string paths only.
 * Every method accepts a path that the caller has already resolved, so this class never touches
 * the UIAbility context and never logs the absolute path of a file.
 * All methods are defensive: they return a neutral value instead of throwing.
 */
export class FileUtils {
  /**
   * Checks whether the given path exists in the sandbox.
   * @param path Absolute or sandbox relative path to inspect.
   * @returns True when the path exists.
   */
  static exists(path: string): boolean {
    // Guard against an empty path because fileIo would throw on it.
    if (path.length === 0) {
      // Nothing to check, report a missing path.
      return false;
    }
    // Ask the file system and keep the boolean answer.
    const result: boolean = fileIo.accessSync(path);
    // Return the probe result to the caller.
    return result;
  }

  /**
   * Checks whether the given path exists and is a directory.
   * @param path Path to inspect.
   * @returns True when the path exists and its stat mode reports a directory.
   */
  static isDirectory(path: string): boolean {
    // A missing path can never be a directory.
    if (!FileUtils.exists(path)) {
      // Short circuit with a negative answer.
      return false;
    }
    // Read the stat of the path and compare the mode bit.
    const stat: fileIo.Stat = fileIo.statSync(path);
    // Convert the mode to a boolean directory flag.
    const flag: boolean = stat.isDirectory();
    // Return the resolved flag.
    return flag;
  }

  /**
   * Creates a single level directory.
   * @param path Directory path to create.
   * @returns True when the directory exists afterwards.
   */
  static createDir(path: string): boolean {
    // Reject an empty path early.
    if (path.length === 0) {
      // No directory can be created without a path.
      return false;
    }
    // Skip the system call when the directory is already there.
    if (FileUtils.isDirectory(path)) {
      // Report the existing directory as success.
      return true;
    }
    // Create exactly one level, the parent has to exist already.
    fileIo.mkdirSync(path);
    // Re-probe the path so the caller gets a reliable answer.
    return FileUtils.isDirectory(path);
  }

  /**
   * Deletes a single file.
   * @param path File path to remove.
   * @returns True when the file is gone afterwards.
   */
  static deleteFile(path: string): boolean {
    // A missing file is treated as already deleted.
    if (!FileUtils.exists(path)) {
      // Nothing to do, report success.
      return true;
    }
    // Remove the file from the sandbox.
    fileIo.unlinkSync(path);
    // Confirm the file is no longer reachable.
    return !FileUtils.exists(path);
  }

  /**
   * Deletes a directory tree in a best effort way.
   * @param path Directory path to remove.
   * @returns True when the directory is gone afterwards.
   */
  static deleteDir(path: string): boolean {
    // A missing directory is treated as already deleted.
    if (!FileUtils.exists(path)) {
      // Nothing to do, report success.
      return true;
    }
    // Remove the directory with all of its children in one call.
    fileIo.rmdirSync(path);
    // Confirm the directory is no longer reachable.
    return !FileUtils.exists(path);
  }

  /**
   * Reads the whole file as UTF-8 text.
   * @param path File path to read.
   * @returns File content or an empty string when the file can not be read.
   */
  static readText(path: string): string {
    // A missing file yields empty content instead of an exception.
    if (!FileUtils.exists(path)) {
      // Return the neutral value.
      return '';
    }
    // Open the file in read only mode to obtain a descriptor.
    const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
    // Read the whole content starting from the first byte.
    const buffer: ArrayBuffer = new ArrayBuffer(FileUtils.getFileSize(path));
    // Track how many bytes were actually read.
    const readLength: number = fileIo.readSync(file.fd, buffer);
    // Close the descriptor before any further work so the handle never leaks.
    fileIo.closeSync(file);
    // Decode the read bytes with the UTF-8 decoder of the ArkTS util kit.
    const decoder: util.TextDecoder = util.TextDecoder.create('utf-8');
    // Slice the buffer down to the number of bytes that were actually read.
    const slice: ArrayBuffer = buffer.slice(0, readLength);
    // Decode the sliced bytes into a readable string.
    const content: string = decoder.decodeToString(new Uint8Array(slice));
    // Hand the decoded text back to the caller.
    return content;
  }

  /**
   * Writes text to a file and truncates the previous content.
   * @param path File path to write.
   * @param content Text to store.
   * @returns True when the write finished without an exception.
   */
  static writeText(path: string, content: string): boolean {
    // Reject empty paths so the caller gets a deterministic answer.
    if (path.length === 0) {
      // Nothing can be written without a path.
      return false;
    }
    // Open the file for writing and create it when missing.
    const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE |
      fileIo.OpenMode.TRUNC);
    // Write the text directly; the kit encodes the string as UTF-8 on its own.
    fileIo.writeSync(file.fd, content);
    // Flush and release the descriptor.
    fileIo.closeSync(file);
    // Report success to the caller.
    return true;
  }

  /**
   * Appends text to a file, creating it when missing.
   * @param path File path to append to.
   * @param content Text to append.
   * @returns True when the append finished without an exception.
   */
  static appendText(path: string, content: string): boolean {
    // Reject empty paths because there is nothing to append to.
    if (path.length === 0) {
      // Report a failed append.
      return false;
    }
    // Open the file without truncation so existing content survives.
    const file: fileIo.File = fileIo.openSync(path, APPEND_MODE);
    // Write the text directly; the append open flag already placed the offset at the end.
    fileIo.writeSync(file.fd, content);
    // Release the descriptor.
    fileIo.closeSync(file);
    // Report success to the caller.
    return true;
  }

  /**
   * Copies a file to a new location and overwrites the destination.
   * @param srcPath Source file path.
   * @param destPath Destination file path.
   * @returns True when the destination exists afterwards.
   */
  static copyFile(srcPath: string, destPath: string): boolean {
    // The copy is meaningless when the source is missing.
    if (!FileUtils.exists(srcPath)) {
      // Report a failed copy.
      return false;
    }
    // Copy the content and replace any previous destination file.
    fileIo.copyFileSync(srcPath, destPath);
    // Confirm the destination now exists.
    return FileUtils.exists(destPath);
  }

  /**
   * Moves a file, which on this platform is a rename that keeps the destination replaced.
   * @param srcPath Source file path.
   * @param destPath Destination file path.
   * @returns True when the destination exists afterwards.
   */
  static moveFile(srcPath: string, destPath: string): boolean {
    // The move is meaningless when the source is missing.
    if (!FileUtils.exists(srcPath)) {
      // Report a failed move.
      return false;
    }
    // Rename performs the move inside the same sandbox file system.
    fileIo.renameSync(srcPath, destPath);
    // Confirm the destination now exists.
    return FileUtils.exists(destPath);
  }

  /**
   * Renames a file inside its own directory.
   * @param path Current file path.
   * @param newName New file name without any directory part.
   * @returns True when the renamed file exists afterwards.
   */
  static renameFile(path: string, newName: string): boolean {
    // A missing source file can not be renamed.
    if (!FileUtils.exists(path)) {
      // Report a failed rename.
      return false;
    }
    // Keep the original directory so only the name changes.
    const parent: string = FileUtils.getParentPath(path);
    // Build the target path from the parent directory and the new name.
    const target: string = FileUtils.joinPath(parent, newName);
    // Rename the file in place.
    fileIo.renameSync(path, target);
    // Confirm the renamed file exists.
    return FileUtils.exists(target);
  }

  /**
   * Lists the names of the direct children of a directory.
   * @param dirPath Directory path to scan.
   * @returns File names, empty array when the directory can not be read.
   */
  static listFiles(dirPath: string): string[] {
    // Scanning a missing directory yields an empty list.
    if (!FileUtils.isDirectory(dirPath)) {
      // Return the neutral value.
      return [];
    }
    // Ask the file system for the child names.
    const names: string[] = fileIo.listFileSync(dirPath);
    // Return the collected names as a fresh array.
    return names.slice(0);
  }

  /**
   * Extracts the file name of a path, extension included.
   * @param path Full path or bare name.
   * @returns File name or an empty string when there is none.
   */
  static getFileName(path: string): string {
    // Locate the last separator to separate the name from the directory part.
    const index: number = path.lastIndexOf(PATH_SEPARATOR);
    // A path without separator is already a bare file name.
    if (index < 0) {
      // Return the whole input.
      return path;
    }
    // Return the suffix after the last separator.
    return path.substring(index + 1);
  }

  /**
   * Extracts the lowercase extension of a path without the leading dot.
   * @param path Full path or bare name.
   * @returns Extension like "jpg" or an empty string when there is none.
   */
  static getExtension(path: string): string {
    // Work on the bare name so directory dots are ignored.
    const name: string = FileUtils.getFileName(path);
    // Find the last dot inside the name.
    const index: number = name.lastIndexOf('.');
    // A leading or missing dot means there is no usable extension.
    if (index <= 0 || index === name.length - 1) {
      // Return the neutral value.
      return '';
    }
    // Return the lowercase suffix without the dot.
    return name.substring(index + 1).toLowerCase();
  }

  /**
   * Reads the byte size of a file.
   * @param path File path to inspect.
   * @returns Size in bytes or 0 when the file can not be inspected.
   */
  static getFileSize(path: string): number {
    // A missing file has no size for the caller.
    if (!FileUtils.exists(path)) {
      // Return the neutral value.
      return 0;
    }
    // Read the stat structure of the file.
    const stat: fileIo.Stat = fileIo.statSync(path);
    // Return the byte size reported by the file system.
    return stat.size;
  }

  /**
   * Joins two path segments with exactly one separator.
   * @param left Left segment.
   * @param right Right segment.
   * @returns Joined path.
   */
  static joinPath(left: string, right: string): string {
    // An empty left segment makes the right segment the whole path.
    if (left.length === 0) {
      // Return the right segment untouched.
      return right;
    }
    // Check whether the left segment already ends with a separator.
    const endsWithSeparator: boolean = left.charAt(left.length - 1) === PATH_SEPARATOR;
    // Check whether the right segment starts with a separator.
    const startsWithSeparator: boolean = right.length > 0 && right.charAt(0) === PATH_SEPARATOR;
    // Two separators in the middle would create an invalid path.
    if (endsWithSeparator && startsWithSeparator) {
      // Drop the duplicate separator by keeping the left segment as is.
      return left + right.substring(1);
    }
    // A missing separator on both sides has to be added.
    if (!endsWithSeparator && !startsWithSeparator) {
      // Insert the separator between the two segments.
      return left + PATH_SEPARATOR + right;
    }
    // Exactly one separator is already present.
    return left + right;
  }

  /**
   * Makes sure a directory chain exists, creating every missing level.
   * @param dirPath Directory path that has to exist afterwards.
   * @returns True when the directory exists afterwards.
   */
  static ensureDir(dirPath: string): boolean {
    // An empty path can never be ensured.
    if (dirPath.length === 0) {
      // Report the failure.
      return false;
    }
    // An existing directory is the fastest successful exit.
    if (FileUtils.isDirectory(dirPath)) {
      // Report the directory as ready.
      return true;
    }
    // Collect the ancestors that still have to be created, deepest first.
    const pending: string[] = [];
    // Walk upward from the requested directory to the first existing ancestor.
    let current: string = dirPath;
    // Count the walked levels so a broken path can not loop forever.
    let depth: number = 0;
    // Stop as soon as an existing directory is found or the safety limit is hit.
    while (current.length > 0 && !FileUtils.isDirectory(current) && depth < MAX_ENSURE_DEPTH) {
      // Remember the level that still has to be created.
      pending.unshift(current);
      // Move one level up.
      current = FileUtils.getParentPath(current);
      // Count this step.
      depth = depth + 1;
    }
    // Create every collected level from the shallowest to the deepest.
    for (let index: number = 0; index < pending.length; index++) {
      // Create a single level, its parent exists by now.
      FileUtils.createDir(pending[index]);
    }
    // Return the final state of the requested directory.
    return FileUtils.isDirectory(dirPath);
  }

  /**
   * Returns the parent directory of a path.
   * @param path Full path.
   * @returns Parent path or an empty string when there is no parent.
   */
  private static getParentPath(path: string): string {
    // Locate the last separator of the path.
    const index: number = path.lastIndexOf(PATH_SEPARATOR);
    // A relative name without separator has no parent.
    if (index < 0) {
      // Return the neutral value.
      return '';
    }
    // A separator at index zero means the parent is the file system root.
    if (index === 0) {
      // Return the root separator.
      return PATH_SEPARATOR;
    }
    // Return everything before the last separator.
    return path.substring(0, index);
  }
}
