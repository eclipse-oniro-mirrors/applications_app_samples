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
import { HILOG_DOMAIN, HILOG_TAG, LOG_STORE_CAPACITY, StorageKeys } from '../common/AppConstants';
import { LogItem, LogLevel, appendLog, clearLogs, logLevelName } from '../model/LogStore';

export class Logger {
  static debug(source: string, tag: string, detail: string): void {
    Logger.record(LogLevel.DEBUG, source, tag, detail);
  }

  static info(source: string, tag: string, detail: string): void {
    Logger.record(LogLevel.INFO, source, tag, detail);
  }

  static warn(source: string, tag: string, detail: string): void {
    Logger.record(LogLevel.WARN, source, tag, detail);
  }

  static error(source: string, tag: string, detail: string): void {
    Logger.record(LogLevel.ERROR, source, tag, detail);
  }

  static record(level: LogLevel, source: string, tag: string, detail: string): void {
    const message = `[${source}][${logLevelName(level)}] ${tag}: ${detail}`;
    switch (level) {
      case LogLevel.DEBUG:
        hilog.debug(HILOG_DOMAIN, HILOG_TAG, '%{public}s', message);
        break;
      case LogLevel.WARN:
        hilog.warn(HILOG_DOMAIN, HILOG_TAG, '%{public}s', message);
        break;
      case LogLevel.ERROR:
        hilog.error(HILOG_DOMAIN, HILOG_TAG, '%{public}s', message);
        break;
      default:
        hilog.info(HILOG_DOMAIN, HILOG_TAG, '%{public}s', message);
        break;
    }
    try {
      const current: LogItem[] = AppStorage.get<LogItem[]>(StorageKeys.APP_LOGS) ?? [];
      AppStorage.setOrCreate(StorageKeys.APP_LOGS,
        appendLog(current, new LogItem(source, tag, detail, level), LOG_STORE_CAPACITY));
    } catch (err) {
      hilog.warn(HILOG_DOMAIN, HILOG_TAG, '%{public}s', `[Logger] failed to write central log: ${err}`);
    }
  }

  static clear(): void {
    try {
      AppStorage.setOrCreate(StorageKeys.APP_LOGS, clearLogs());
    } catch (err) {
      hilog.warn(HILOG_DOMAIN, HILOG_TAG, '%{public}s', `[Logger] failed to clear logs: ${err}`);
    }
  }
}
