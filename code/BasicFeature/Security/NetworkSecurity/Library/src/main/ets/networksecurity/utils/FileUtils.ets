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
import { BusinessError } from '@kit.BasicServicesKit';
import { Logger } from './Logger';

// Sentinel size reported when a file cannot be inspected.
const UNKNOWN_SIZE: number = -1;

/**
 * File helpers built on Core File Kit: existence checks, text reading and
 * writing, size inspection, deletion and directory listing. Every method
 * catches its own failures and reports them through Logger.error, so
 * callers receive plain values instead of exceptions.
 */
export class FileUtils {
  /**
   * Check whether a file or directory exists at the given sandbox path.
   * @param path application sandbox path to inspect.
   * @returns true when the path exists and is accessible.
   */
  static exists(path: string): boolean {
    const tag: string = '[FileUtils#exists]';
    Logger.enter(tag, 'path: ' + path);
    Logger.beginTrace('NetworkSecurity.utils.exists', 1);
    // accessSync throws on missing paths, so treat every failure as absent.
    let result: boolean = false;
    try {
      result = fileIo.accessSync(path);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(tag + ' access failed, code ' + err.code.toString());
      result = false;
    }
    Logger.exit(tag, 'result: ' + result.toString());
    Logger.endTrace('NetworkSecurity.utils.exists', 1);
    return result;
  }

  /**
   * Read the whole file as UTF-8 text.
   * @param path application sandbox path of the file to read.
   * @returns the file content, or an empty string when reading fails.
   */
  static readText(path: string): string {
    const tag: string = '[FileUtils#readText]';
    Logger.enter(tag, 'path: ' + path);
    Logger.beginTrace('NetworkSecurity.utils.readText', 1);
    // Start from an empty text so failures fall through to one exit point.
    let result: string = '';
    try {
      // readTextSync loads the entire file with the default UTF-8 encoding.
      result = fileIo.readTextSync(path);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(tag + ' read failed, code ' + err.code.toString());
      result = '';
    }
    Logger.exit(tag, 'chars: ' + result.length.toString());
    Logger.endTrace('NetworkSecurity.utils.readText', 1);
    return result;
  }

  /**
   * Write UTF-8 text to a file, creating or truncating the target.
   * @param path application sandbox path of the file to write.
   * @param content text to store in the file.
   * @returns true when the write completed successfully.
   */
  static writeText(path: string, content: string): boolean {
    const tag: string = '[FileUtils#writeText]';
    Logger.enter(tag, 'path: ' + path + ', chars: ' + content.length.toString());
    Logger.beginTrace('NetworkSecurity.utils.writeText', 1);
    // openSync with READ_WRITE|CREATE|TRUNC creates or fully replaces the target.
    let result: boolean = false;
    let file: fileIo.File | null = null;
    try {
      file = fileIo.openSync(path, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE | fileIo.OpenMode.TRUNC);
      // writeSync accepts the fd and stores the UTF-8 text in one call.
      fileIo.writeSync(file.fd, content);
      result = true;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(tag + ' write failed, code ' + err.code.toString());
      result = false;
    }
    // Close outside the try so the fd is released on both success and failure.
    if (file !== null) {
      try {
        fileIo.closeSync(file);
      } catch (closeError) {
        // closeSync rarely fails; log it without touching the write result.
        Logger.error(tag + ' close failed');
      }
    }
    Logger.exit(tag, 'result: ' + result.toString());
    Logger.endTrace('NetworkSecurity.utils.writeText', 1);
    return result;
  }

  /**
   * Return the size of a file in bytes.
   * @param path application sandbox path of the file to measure.
   * @returns the file size in bytes, or -1 when the file cannot be inspected.
   */
  static getFileSize(path: string): number {
    const tag: string = '[FileUtils#getFileSize]';
    Logger.enter(tag, 'path: ' + path);
    Logger.beginTrace('NetworkSecurity.utils.getFileSize', 1);
    // statSync exposes the byte size through the size member.
    let result: number = UNKNOWN_SIZE;
    try {
      const stat: fileIo.Stat = fileIo.statSync(path);
      result = stat.size;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(tag + ' stat failed, code ' + err.code.toString());
      result = UNKNOWN_SIZE;
    }
    Logger.exit(tag, 'size: ' + result.toString());
    Logger.endTrace('NetworkSecurity.utils.getFileSize', 1);
    return result;
  }

  /**
   * Delete the file at the given sandbox path.
   * @param path application sandbox path of the file to delete.
   * @returns true when the file was removed successfully.
   */
  static deleteFile(path: string): boolean {
    const tag: string = '[FileUtils#deleteFile]';
    Logger.enter(tag, 'path: ' + path);
    Logger.beginTrace('NetworkSecurity.utils.deleteFile', 1);
    // unlinkSync removes regular files; directories need rmdir instead.
    let result: boolean = false;
    try {
      fileIo.unlinkSync(path);
      result = true;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(tag + ' unlink failed, code ' + err.code.toString());
      result = false;
    }
    Logger.exit(tag, 'result: ' + result.toString());
    Logger.endTrace('NetworkSecurity.utils.deleteFile', 1);
    return result;
  }

  /**
   * List the entry names of a directory.
   * @param path application sandbox path of the directory to list.
   * @returns the entry names, or an empty array when listing fails.
   */
  static async listDir(path: string): Promise<string[]> {
    const tag: string = '[FileUtils#listDir]';
    Logger.enter(tag, 'path: ' + path);
    Logger.beginTrace('NetworkSecurity.utils.listDir', 1);
    // listFileSync is synchronous, so the failure path must also end the trace.
    let result: string[] = [];
    try {
      // listFileSync returns plain entry names without directory prefixes.
      result = fileIo.listFileSync(path);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(tag + ' list failed, code ' + err.code.toString());
      result = [];
    }
    Logger.exit(tag, 'entries: ' + result.length.toString());
    Logger.endTrace('NetworkSecurity.utils.listDir', 1);
    return result;
  }
}
