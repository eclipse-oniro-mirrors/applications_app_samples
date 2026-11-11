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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';

// Log domain of the sample application, kept identical to the previous implementation.
const DOMAIN: number = 0xF811;
// Public log format so that every argument is visible in the hilog console.
const FORMAT: string = '%{public}s';
// Separator used between the caller tag and the caller message.
const SEPARATOR: string = ' ';

/**
 * Thin hilog wrapper shared by the whole HAR and HAP.
 * Every call site passes its own module tag so that the log stream stays grouped per module.
 * Sensitive content (full uri, absolute path, pixel data) must never be passed to this class.
 */
export class Logger {
  /**
   * Writes a debug level log entry.
   * @param tag Module tag, for example 'PickerScene'.
   * @param message Short, already sanitized message text.
   */
  static debug(tag: string, message: string): void {
    // Emit the debug entry with the sample domain and the caller supplied tag.
    hilog.debug(DOMAIN, tag, FORMAT, message);
  }

  /**
   * Writes an info level log entry.
   * @param tag Module tag, for example 'PickerScene'.
   * @param message Short, already sanitized message text.
   */
  static info(tag: string, message: string): void {
    // Emit the info entry with the sample domain and the caller supplied tag.
    hilog.info(DOMAIN, tag, FORMAT, message);
  }

  /**
   * Writes a warning level log entry.
   * @param tag Module tag, for example 'PickerScene'.
   * @param message Short, already sanitized message text.
   */
  static warn(tag: string, message: string): void {
    // Emit the warning entry with the sample domain and the caller supplied tag.
    hilog.warn(DOMAIN, tag, FORMAT, message);
  }

  /**
   * Writes an error level log entry.
   * @param tag Module tag, for example 'PickerScene'.
   * @param message Short, already sanitized message text.
   */
  static error(tag: string, message: string): void {
    // Emit the error entry with the sample domain and the caller supplied tag.
    hilog.error(DOMAIN, tag, FORMAT, message);
  }

  /**
   * Writes an error level log entry for a failed business action.
   * The numeric code and the system message of the BusinessError are appended to the text.
   * @param tag Module tag, for example 'PickerScene'.
   * @param action Description of the failed action, for example 'open picker'.
   * @param error Business error raised by the kit API.
   */
  static errorWithCode(tag: string, action: string, error: BusinessError): void {
    // Read the numeric error code through a null check to stay safe on exceptions without code.
    const code: number = error !== null && error !== undefined ? error.code : -1;
    // Read the system error message through a null check to stay safe on exceptions without message.
    const detail: string =
      error !== null && error !== undefined && error.message !== undefined ? error.message : 'unknown';
    // Build the final text by concatenation, string templates are not allowed in ArkTS.
    const text: string = action + ' failed, code: ' + String(code) + ', message: ' + detail;
    // Emit the error entry with the sample domain and the caller supplied tag.
    hilog.error(DOMAIN, tag, FORMAT, text);
  }
}

/**
 * Builds a prefixed log message so that the action name always heads the line.
 * Kept for call sites that want to compose a message before handing it to a level method.
 * @param action Name of the running action.
 * @param detail Detail text of the action.
 * @returns Concatenated message text.
 */
export function buildLogMessage(action: string, detail: string): string {
  // Join the action and the detail with a single separator for readability in hilog.
  return action + SEPARATOR + detail;
}
