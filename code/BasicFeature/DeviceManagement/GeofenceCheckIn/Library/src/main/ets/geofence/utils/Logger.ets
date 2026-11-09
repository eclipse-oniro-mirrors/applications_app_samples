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

// Log domain for this sample, keeps all logs grouped under one hilog domain.
const DOMAIN: number = 0xFF00;
// Unified log tag so every line printed by this sample can be filtered with one keyword.
const TAG: string = '[Sample_GeofenceCheckIn]';
// hilog format string that prints the message as public (non-private) text.
const FORMAT: string = '%{public}s';

/**
 * Unified log utility for the GeofenceCheckIn sample.
 * All business code logs through this class so domain, tag and format stay consistent.
 */
export class Logger {
  /**
   * Log a debug level message for verbose development tracing.
   * @param message the text to log
   * @returns void
   */
  static debug(message: string): void {
    // Forward the message to the hilog debug channel with the unified domain, tag and format.
    hilog.debug(DOMAIN, TAG, FORMAT, message);
  }

  /**
   * Log an info level message for normal business flow tracing.
   * @param message the text to log
   * @returns void
   */
  static info(message: string): void {
    // Forward the message to the hilog info channel with the unified domain, tag and format.
    hilog.info(DOMAIN, TAG, FORMAT, message);
  }

  /**
   * Log a warn level message for recoverable abnormal situations.
   * @param message the text to log
   * @returns void
   */
  static warn(message: string): void {
    // Forward the message to the hilog warn channel with the unified domain, tag and format.
    hilog.warn(DOMAIN, TAG, FORMAT, message);
  }

  /**
   * Log an error level message for failures that need attention.
   * @param message the text to log
   * @returns void
   */
  static error(message: string): void {
    // Forward the message to the hilog error channel with the unified domain, tag and format.
    hilog.error(DOMAIN, TAG, FORMAT, message);
  }
}
