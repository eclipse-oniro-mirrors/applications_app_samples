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

import { common } from '@kit.AbilityKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import { CacheFile } from './MediaModels';
import { Logger } from '../../utils/Logger';
import { Trace } from '../../utils/Trace';

// Module tag attached to every log line emitted by this helper.
const TAG: string = 'SandboxStore';
// Name of the directory that keeps the edited and exported files.
const OUTPUT_DIR_NAME: string = 'outputs';
// Milliseconds per second; the kit reports the modification time in seconds.
const MILLIS_PER_SECOND: number = 1000;

/**
 * Manages the sandbox directory that stores edited and exported media files.
 * Every file operation is traced; only counts and byte sizes are logged, never a full path.
 */
export class SandboxStore {
  /**
   * Resolves the output directory of the sample and creates it on first use.
   * @param context Context whose files directory hosts the output folder.
   * @returns Absolute path of the output directory.
   */
  static outputDir(context: common.Context): string {
    // Compose the directory path below the private files directory of the application.
    const dir: string = context.filesDir + '/' + OUTPUT_DIR_NAME;
    // The directory only has to be created once, later calls find it already present.
    if (!fs.accessSync(dir)) {
      // Create the directory together with its parents when it is still missing.
      fs.mkdirSync(dir, true);
      // Log the creation event only, the absolute path stays out of the log stream.
      Logger.info(TAG, 'outputDir created ' + OUTPUT_DIR_NAME);
    }
    // Hand the resolved directory back to the caller.
    return dir;
  }

  /**
   * Lists the cached output files, newest first.
   * @param context Context whose files directory hosts the output folder.
   * @returns One entry per file of the output directory.
   */
  static list(context: common.Context): CacheFile[] {
    // Open the trace slice around the whole directory scan.
    Trace.start('SandboxStore.list');
    try {
      // Resolve the directory, which also creates it when missing.
      const dir: string = SandboxStore.outputDir(context);
      // Read the file names of the directory, the scan is synchronous and cheap.
      const names: string[] = fs.listFileSync(dir);
      // Collect the metadata entries in a typed buffer.
      const files: CacheFile[] = [];
      // Walk the names with an index based loop, ArkTS forbids for..in over arrays.
      for (let index = 0; index < names.length; index++) {
        // Compose the absolute path of the current entry.
        const path: string = dir + '/' + names[index];
        // Stat the entry to read its size and modification time.
        const stat: fs.Stat = fs.statSync(path);
        // Convert the kit timestamp from seconds into milliseconds.
        files.push(new CacheFile(names[index], path, stat.size, stat.mtime * MILLIS_PER_SECOND));
      }
      // Sort from the newest entry to the oldest one, the cache list expects that order.
      files.sort((left: CacheFile, right: CacheFile): number => right.modifiedTime - left.modifiedTime);
      // Log the entry count only, file names and paths stay out of the log stream.
      Logger.debug(TAG, 'list found ' + files.length + ' files');
      // Hand the sorted entries back to the caller.
      return files;
    } finally {
      // Always close the trace slice so the trace file stays balanced on both paths.
      Trace.finish('SandboxStore.list');
    }
  }

  /**
   * Sums the size of the given cache entries.
   * @param files Entries returned by list().
   * @returns Total size in bytes.
   */
  static totalSize(files: CacheFile[]): number {
    // Start from the neutral element of the addition.
    let total: number = 0;
    // Walk the entries with an index based loop.
    for (let index = 0; index < files.length; index++) {
      // Accumulate the size of the current entry.
      total += files[index].size;
    }
    // Hand the accumulated total back.
    return total;
  }

  /**
   * Writes a byte buffer into the output directory.
   * @param context Context whose files directory hosts the output folder.
   * @param buffer Bytes to write, usually an encoded JPEG.
   * @param fileName Name of the target file inside the output directory.
   * @returns Absolute path of the written file.
   */
  static saveBuffer(context: common.Context, buffer: ArrayBuffer, fileName: string): string {
    // Open the trace slice around the file write, which is the only IO of this method.
    Trace.start('SandboxStore.saveBuffer');
    try {
      // Compose the target path inside the output directory.
      const path: string = SandboxStore.outputDir(context) + '/' + fileName;
      // Create or truncate the target file and keep its descriptor for the write.
      const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
      try {
        // Write the whole buffer in one synchronous call.
        fs.writeSync(file.fd, buffer);
      } finally {
        // Always close the descriptor, also when the write above throws.
        fs.closeSync(file);
      }
      // Log the written size only, the path stays out of the log stream.
      Logger.info(TAG, 'saveBuffer wrote ' + buffer.byteLength + ' bytes');
      // Hand the target path back to the caller.
      return path;
    } finally {
      // Always close the trace slice so the trace file stays balanced on both paths.
      Trace.finish('SandboxStore.saveBuffer');
    }
  }

  /**
   * Deletes one cached file.
   * @param path Absolute path of the file to delete.
   */
  static remove(path: string): void {
    // Open the trace slice around the single unlink call.
    Trace.start('SandboxStore.remove');
    try {
      // Remove the file from the file system.
      fs.unlinkSync(path);
      // Log the deletion event only, the path stays out of the log stream.
      Logger.debug(TAG, 'remove completed');
    } catch (error) {
      // Log the failure with the raw error text so the caller can keep its own error handling.
      Logger.error(TAG, 'remove failed: ' + String(error));
      // Rethrow the original value when it already is a real Error instance.
      if (error instanceof Error) {
        throw error;
      }
      // Wrap any other value because ArkTS only allows throwing Error instances.
      throw new Error('remove failed: ' + String(error));
    } finally {
      // Always close the trace slice so the trace file stays balanced on both paths.
      Trace.finish('SandboxStore.remove');
    }
  }

  /**
   * Deletes every file of the output directory.
   * @param context Context whose files directory hosts the output folder.
   */
  static clear(context: common.Context): void {
    // Open the trace slice around the whole cleanup loop.
    Trace.start('SandboxStore.clear');
    try {
      // Resolve the directory, which also creates it when missing.
      const dir: string = SandboxStore.outputDir(context);
      // Read the file names that have to be removed.
      const names: string[] = fs.listFileSync(dir);
      // Walk the names with an index based loop and delete every entry.
      for (let index = 0; index < names.length; index++) {
        // Remove the current file from the file system.
        fs.unlinkSync(dir + '/' + names[index]);
      }
      // Log the removed entry count only, file names stay out of the log stream.
      Logger.info(TAG, 'clear removed ' + names.length + ' files');
    } finally {
      // Always close the trace slice so the trace file stays balanced on both paths.
      Trace.finish('SandboxStore.clear');
    }
  }
}
