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

/**
 * 统一的日志出口：同时写入 hilog 与 AppStorage，页面日志面板通过 LogPanel 读取后者。
 * 输入法接口在身份不符、能力未启用、参数越界时会抛 BusinessError，
 * 示例统一用 Logger.error 记录错误码，保证“页面上看到的现象”与“hilog 里的调用链”一一对应。
 */

import { hilog } from '@kit.PerformanceAnalysisKit';
import { StorageKeys, HILOG_DOMAIN, HILOG_TAG, LOG_STORE_CAPACITY } from '../common/AppConstants';
import { LogItem, LogLevel, appendLog, clearLogs, countByTag, logLevelName } from '../model/LogStore';

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
      const next = appendLog(current, new LogItem(source, tag, detail, level), LOG_STORE_CAPACITY);
      AppStorage.setOrCreate<LogItem[]>(StorageKeys.APP_LOGS, next);
    } catch (err) {
      hilog.warn(HILOG_DOMAIN, HILOG_TAG, '%{public}s', `[Logger] write AppStorage failed: ${err}`);
    }
  }

  /** 统计指定来源 + 指定 tag 的日志条数；source 传空串表示只看 tag、不限来源 */
  static count(source: string, tag: string): number {
    const current: LogItem[] = AppStorage.get<LogItem[]>(StorageKeys.APP_LOGS) ?? [];
    const scoped: LogItem[] = source === '' ? current
      : current.filter((item: LogItem) => item.source === source);
    return countByTag(scoped, tag);
  }

  static clear(): void {
    AppStorage.setOrCreate<LogItem[]>(StorageKeys.APP_LOGS, clearLogs());
  }
}
