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
      hilog.warn(HILOG_DOMAIN, HILOG_TAG, '%{public}s', `[Logger] 中央日志写入失败: ${err}`);
    }
  }

  static clear(): void {
    try {
      AppStorage.setOrCreate(StorageKeys.APP_LOGS, clearLogs());
    } catch (err) {
      hilog.warn(HILOG_DOMAIN, HILOG_TAG, '%{public}s', `[Logger] 清空日志失败: ${err}`);
    }
  }
}
