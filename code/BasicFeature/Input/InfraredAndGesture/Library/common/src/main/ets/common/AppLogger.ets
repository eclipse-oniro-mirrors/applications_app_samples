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
import { AppConstants } from './AppConstants';

/** Severity labels used when building readable log messages. */
export enum LogLevel {
  DEBUG = 'DEBUG',
  INFO = 'INFO',
  WARN = 'WARN',
  ERROR = 'ERROR'
}

/**
 * Thin wrapper around hilog that prefixes every line with a scope name.
 * Callers pass a stable scope such as the class name so logs stay searchable.
 */
export class AppLogger {
  /** Writes a debug level line, typically for verbose diagnostics. */
  static debug(scope: string, message: string): void {
    hilog.debug(AppConstants.LOG_DOMAIN, AppConstants.LOG_TAG, '%{public}s: %{private}s', scope, message);
  }

  /** Writes an info level line for normal flow milestones. */
  static info(scope: string, message: string): void {
    hilog.info(AppConstants.LOG_DOMAIN, AppConstants.LOG_TAG, '%{public}s: %{private}s', scope, message);
  }

  /** Writes a warn level line for recoverable or unexpected situations. */
  static warn(scope: string, message: string): void {
    hilog.warn(AppConstants.LOG_DOMAIN, AppConstants.LOG_TAG, '%{public}s: %{private}s', scope, message);
  }

  /** Writes an error level line for failures that affect user visible results. */
  static error(scope: string, message: string): void {
    hilog.error(AppConstants.LOG_DOMAIN, AppConstants.LOG_TAG, '%{public}s: %{private}s', scope, message);
  }
}
