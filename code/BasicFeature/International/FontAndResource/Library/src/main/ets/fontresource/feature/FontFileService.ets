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

// Import the common context type used to resolve sandbox directories.
import { common } from '@kit.AbilityKit';
// Import the business error type used for structured error reporting.
import { BusinessError } from '@kit.BasicServicesKit';
// Import the file I/O module for sandbox file access.
import { fileIo as fs } from '@kit.CoreFileKit';
// Import the font asset model handled by this service.
import { FontAsset } from '../model/FontTypes';
// Import the trace facade used for performance marks around file operations.
import { TraceUtil } from '../utils/TraceUtil';
// Import the logger used for observable operation logs.
import { Logger } from '../utils/Logger';

// The sandbox sub-directory that receives copied font files.
const FONT_DIR: string = '/fonts';
// The file name of the bundled font copied into the sandbox.
const FONT_FILE_NAME: string = '/DroidSerif-Regular.ttf';
// The module tag used for every log line emitted by this service.
const TAG: string = 'FontFile';

// Static service that copies bundled font files into the application sandbox.
export class FontFileService {
  // Resolves the sandbox directory that holds copied font files.
  static sandboxDir(context: common.Context): string {
    // Join the application files directory with the font sub-directory.
    return `${context.filesDir}${FONT_DIR}`;
  }

  // Resolves the full sandbox path of the demo font file.
  static sandboxFilePath(context: common.Context): string {
    // Join the font directory with the demo file name.
    return `${FontFileService.sandboxDir(context)}${FONT_FILE_NAME}`;
  }

  // Returns the byte size of the file, or -1 when it does not exist.
  static fileSize(filePath: string): number {
    // Check the file existence first.
    if (!fs.accessSync(filePath)) {
      // A missing file has the sentinel size.
      return -1;
    }
    // Stat the existing file and read its size.
    return fs.statSync(filePath).size;
  }

  // Returns the asset reflecting the current sandbox state without copying anything.
  static resolveExisting(context: common.Context, asset: FontAsset): FontAsset {
    // Resolve the expected sandbox file path.
    const filePath: string = FontFileService.sandboxFilePath(context);
    // Check whether the font already exists in the sandbox.
    if (fs.accessSync(filePath)) {
      // Return a ready asset pointing at the existing file.
      return new FontAsset(asset.familyName, asset.rawFileName, filePath, true);
    }
    // Return a not-ready asset because the file is missing.
    return new FontAsset(asset.familyName, asset.rawFileName, '', false);
  }

  // Copies the bundled font into the sandbox when it is not there yet.
  static async ensureFontInSandbox(context: common.Context, asset: FontAsset): Promise<FontAsset> {
    // Open a trace section around the whole copy flow.
    const taskId: number = TraceUtil.begin('FontFile.ensureFontInSandbox');
    try {
      // Resolve the target sandbox directory.
      const dirPath: string = FontFileService.sandboxDir(context);
      // Resolve the target sandbox file path.
      const filePath: string = FontFileService.sandboxFilePath(context);
      // Skip the copy when the file already exists.
      if (fs.accessSync(filePath)) {
        // Log the fast path hit for observability.
        Logger.debug(TAG, 'Font already exists in the sandbox');
        // Return the ready asset pointing at the existing file.
        return new FontAsset(asset.familyName, asset.rawFileName, filePath, true);
      }
      // Log the start of the actual copy operation.
      Logger.info(TAG, 'Copying the bundled font into the sandbox');
      // Read the raw bundled font bytes from the resources.
      const rawData: Uint8Array = FontFileService.readRawFile(context, asset.rawFileName);
      // Write the bytes into the sandbox file.
      FontFileService.writeFile(dirPath, filePath, rawData);
      // Log the successful copy with the resulting path.
      Logger.info(TAG, `Font copied to ${filePath}`);
      // Return the ready asset pointing at the new file.
      return new FontAsset(asset.familyName, asset.rawFileName, filePath, true);
    } finally {
      // Close the trace section even when the copy throws.
      TraceUtil.end('FontFile.ensureFontInSandbox', taskId);
    }
  }

  // Reads the bundled raw file bytes, converting failures into a descriptive error.
  private static readRawFile(context: common.Context, rawFileName: string): Uint8Array {
    try {
      // Ask the resource manager for the synchronous raw file content.
      return context.resourceManager.getRawFileContentSync(rawFileName);
    } catch (error) {
      // Normalize the thrown value into a business error.
      const err: BusinessError = error as BusinessError;
      // Log the failure with the error code for diagnosis.
      Logger.error(TAG, `readRawFile failed, code ${err.code}: ${err.message}`);
      // Re-throw a descriptive error so callers see the failed source.
      throw new Error(`Failed to read the bundled font (${err.code}): ${err.message}`);
    }
  }

  // Writes the raw bytes into the sandbox, creating the directory when needed.
  private static writeFile(dirPath: string, filePath: string, rawData: Uint8Array): void {
    try {
      // Create the font directory when it does not exist yet.
      if (!fs.accessSync(dirPath)) {
        // Create every missing directory segment recursively.
        fs.mkdirSync(dirPath, true);
      }
      // Open (or create) the target file with truncation so stale bytes are dropped.
      const file: fs.File = fs.openSync(filePath,
        fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
      try {
        // Write the whole font payload into the file descriptor.
        fs.writeSync(file.fd, rawData.buffer as ArrayBuffer);
      } finally {
        // Always close the handle so descriptors do not leak.
        fs.closeSync(file);
      }
    } catch (error) {
      // Normalize the thrown value into a business error.
      const err: BusinessError = error as BusinessError;
      // Log the failure with the error code for diagnosis.
      Logger.error(TAG, `writeFile failed, code ${err.code}: ${err.message}`);
      // Re-throw a descriptive error so callers see the failed destination.
      throw new Error(`Failed to write the font into the sandbox (${err.code}): ${err.message}`);
    }
  }
}
