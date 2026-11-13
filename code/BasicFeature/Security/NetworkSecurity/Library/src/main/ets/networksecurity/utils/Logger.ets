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

import { hilog, hiTraceMeter } from '@kit.PerformanceAnalysisKit';

// Log domain assigned to the NetworkSecurity sample, used for hilog filtering.
const DOMAIN: number = 0xFF00;
// Fixed prefix prepended to every log line for quick logcat filtering.
const PREFIX: string = '[Sample_NetworkSecurity]';
// hilog output format with a single public string parameter.
const FORMAT: string = '%{public}s';

/**
 * Unified logging and performance-trace helper for the whole sample.
 *
 * Log levels:
 * - enter/exit: info, marks public method boundaries.
 * - debug: parameter or branch detail.
 * - warn/error: abnormal or failed paths.
 *
 * Trace convention:
 * - beginTrace/endTrace wrap hiTraceMeter start/finish pairs; the name
 *   follows "NetworkSecurity.<module>.<method>" and must match on both ends.
 */
export class Logger {
  /**
   * Build a formatted log line from a caller-provided tag.
   * @param tag caller tag in the form "[Class#method]".
   * @param message detail text to append after the tag.
   * @returns the concatenated single-line log body.
   */
  private static format(tag: string, message: string): string {
    // Plain "+" concatenation because template literals are forbidden in ArkTS.
    return tag + ' ' + message;
  }

  /**
   * Log a debug-level detail message.
   * @param message detail text such as parameter values or branch decisions.
   */
  static debug(message: string): void {
    hilog.debug(DOMAIN, PREFIX, FORMAT, message);
  }

  /**
   * Log an info-level message.
   * @param message key business step description.
   */
  static info(message: string): void {
    hilog.info(DOMAIN, PREFIX, FORMAT, message);
  }

  /**
   * Log a warning-level message.
   * @param message recoverable abnormal condition description.
   */
  static warn(message: string): void {
    hilog.warn(DOMAIN, PREFIX, FORMAT, message);
  }

  /**
   * Log an error-level message.
   * @param message failure description, ideally with error code.
   */
  static error(message: string): void {
    hilog.error(DOMAIN, PREFIX, FORMAT, message);
  }

  /**
   * Log public-method entry with an optional parameter summary.
   * @param tag caller tag in the form "[Class#method]".
   * @param params short one-line parameter summary, may be omitted.
   */
  static enter(tag: string, params?: string): void {
    // Normalize the optional parameter to an empty string to keep a single branch.
    const detail: string = params === undefined ? '' : params;
    // Info level so method entry is visible by default on device.
    hilog.info(DOMAIN, PREFIX, FORMAT, Logger.format(tag, 'enter ' + detail));
  }

  /**
   * Log public-method exit with an optional result summary.
   * @param tag caller tag in the form "[Class#method]".
   * @param result short one-line result summary, may be omitted.
   */
  static exit(tag: string, result?: string): void {
    // Normalize the optional parameter to an empty string to keep a single branch.
    const detail: string = result === undefined ? '' : result;
    // Info level so method exit is visible by default on device.
    hilog.info(DOMAIN, PREFIX, FORMAT, Logger.format(tag, 'exit ' + detail));
  }

  /**
   * Begin a synchronous performance-trace section.
   * Must be paired with endTrace using the exact same name and task id.
   * @param name trace name in the form "NetworkSecurity.<module>.<method>".
   * @param taskId positive number; use 1 for top-level, 2+ for nested sections.
   */
  static beginTrace(name: string, taskId: number): void {
    // Delegate to hiTraceMeter so DevEco Profiler can render the section.
    hiTraceMeter.startTrace(name, taskId);
  }

  /**
   * Finish a synchronous performance-trace section.
   * @param name trace name identical to the matching beginTrace call.
   * @param taskId task id identical to the matching beginTrace call.
   */
  static endTrace(name: string, taskId: number): void {
    // Delegate to hiTraceMeter to close the section opened by beginTrace.
    hiTraceMeter.finishTrace(name, taskId);
  }

  /**
   * Report a numeric counter to the trace system, for example request counts.
   * @param name counter name shown in the profiler.
   * @param value current numeric value of the counter.
   */
  static traceValue(name: string, value: number): void {
    // Delegate to hiTraceMeter counter rendering.
    hiTraceMeter.traceByValue(name, value);
  }
}
