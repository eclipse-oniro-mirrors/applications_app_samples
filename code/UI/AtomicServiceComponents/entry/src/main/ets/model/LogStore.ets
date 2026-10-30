import { LOG_STORE_CAPACITY } from '../common/AppConstants';
import { formatTime } from '../utils/FormatUtil';

export enum LogLevel {
  DEBUG = 0,
  INFO = 1,
  WARN = 2,
  ERROR = 3
}

export class LogItem {
  private static nextId: number = 0;
  id: number;
  time: string;
  source: string;
  tag: string;
  detail: string;
  level: LogLevel;

  constructor(source: string, tag: string, detail: string,
              level: LogLevel = LogLevel.INFO, date: Date = new Date()) {
    LogItem.nextId++;
    this.id = LogItem.nextId;
    this.time = formatTime(date);
    this.source = source;
    this.tag = tag;
    this.detail = detail;
    this.level = level;
  }
}

export function logLevelName(level: LogLevel): string {
  switch (level) {
    case LogLevel.DEBUG:
      return 'DEBUG';
    case LogLevel.WARN:
      return 'WARN';
    case LogLevel.ERROR:
      return 'ERROR';
    default:
      return 'INFO';
  }
}

export function appendLog(logs: LogItem[], item: LogItem, capacity: number = LOG_STORE_CAPACITY): LogItem[] {
  const limit = capacity > 0 ? capacity : LOG_STORE_CAPACITY;
  const next: LogItem[] = [item, ...logs];
  return next.length > limit ? next.slice(0, limit) : next;
}

export function queryLogs(logs: LogItem[], source: string, minLevel: LogLevel = LogLevel.DEBUG,
                          keyword: string = '', limit: number = 20): LogItem[] {
  const normalized = keyword.trim().toLowerCase();
  const filtered = logs.filter((item: LogItem) => {
    const sourceMatched = source === '' || item.source === source;
    const levelMatched = item.level >= minLevel;
    const keywordMatched = normalized === '' ||
      item.detail.toLowerCase().includes(normalized) ||
      item.tag.toLowerCase().includes(normalized);
    return sourceMatched && levelMatched && keywordMatched;
  });
  return limit > 0 ? filtered.slice(0, limit) : filtered;
}

export function countByTag(logs: LogItem[], tag: string): number {
  return logs.filter((item: LogItem) => item.tag === tag).length;
}

export function clearLogs(): LogItem[] {
  return [];
}
