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
 * 页面内事件日志存储：新日志前插、按容量截断，全部为纯函数（返回新数组，不修改入参）。
 * Logger 负责写 hilog + AppStorage，LogPanel 通过 queryLogs 做来源/级别/关键字过滤。
 */

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

export function countBySourceTag(logs: LogItem[], source: string, tag: string): number {
  return logs.filter((item: LogItem) => item.source === source && item.tag === tag).length;
}

export function clearLogs(): LogItem[] {
  return [];
}
