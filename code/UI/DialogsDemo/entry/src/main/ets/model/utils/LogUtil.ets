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

/** UI 日志回调类型：参数为已格式化的单行日志 */
export type LogSink = (line: string) => void;

/** 日志级别，数值越大级别越高 */
export enum LogLevel {
  DEBUG = 0,
  INFO = 1,
  WARN = 2,
  ERROR = 3
}

export class LogUtil {
  private static uiSink: LogSink | null = null;
  private static minLevel: LogLevel = LogLevel.DEBUG;
  private static readonly DOMAIN = 0x0001;
  private static readonly HILOG_TAG = 'DialogsDemo';

  /** 注入 UI 日志回调（Index 页面 aboutToAppear 调用一次） */
  static init(sink: LogSink, minLevel?: LogLevel): void {
    LogUtil.uiSink = sink;
    if (minLevel !== undefined) {
      LogUtil.minLevel = minLevel;
    }
    LogUtil.hilog(LogLevel.INFO, 'LogUtil 已初始化');
  }

  /** 设置最低输出级别，低于该级别的日志被过滤 */
  static setMinLevel(level: LogLevel): void {
    LogUtil.minLevel = level;
  }

  static debug(tag: string, msg: string): void {
    LogUtil.log(LogLevel.DEBUG, tag, msg);
  }

  static info(tag: string, msg: string): void {
    LogUtil.log(LogLevel.INFO, tag, msg);
  }

  static warn(tag: string, msg: string): void {
    LogUtil.log(LogLevel.WARN, tag, msg);
  }

  static error(tag: string, msg: string): void {
    LogUtil.log(LogLevel.ERROR, tag, msg);
  }

  /** 格式化时间为 HH:mm:ss */
  static formatTime(d: Date): string {
    return `${LogUtil.pad2(d.getHours())}:${LogUtil.pad2(d.getMinutes())}:${LogUtil.pad2(d.getSeconds())}`;
  }

  /** 单字母级别标记 */
  static levelMark(level: LogLevel): string {
    switch (level) {
      case LogLevel.DEBUG:
        return 'D';
      case LogLevel.INFO:
        return 'I';
      case LogLevel.WARN:
        return 'W';
      case LogLevel.ERROR:
        return 'E';
      default:
        return '?';
    }
  }

  private static log(level: LogLevel, tag: string, msg: string): void {
    if (level < LogUtil.minLevel) {
      return;
    }
    const line: string = `[${LogUtil.formatTime(new Date())}][${LogUtil.levelMark(level)}][${tag}] ${msg}`;
    LogUtil.hilog(level, msg);
    if (LogUtil.uiSink !== null) {
      LogUtil.uiSink(line);
    }
  }

  private static hilog(level: LogLevel, msg: string): void {
    switch (level) {
      case LogLevel.DEBUG:
        hilog.debug(LogUtil.DOMAIN, LogUtil.HILOG_TAG, '%{public}s', msg);
        break;
      case LogLevel.INFO:
        hilog.info(LogUtil.DOMAIN, LogUtil.HILOG_TAG, '%{public}s', msg);
        break;
      case LogLevel.WARN:
        hilog.warn(LogUtil.DOMAIN, LogUtil.HILOG_TAG, '%{public}s', msg);
        break;
      case LogLevel.ERROR:
        hilog.error(LogUtil.DOMAIN, LogUtil.HILOG_TAG, '%{public}s', msg);
        break;
      default:
        hilog.info(LogUtil.DOMAIN, LogUtil.HILOG_TAG, '%{public}s', msg);
        break;
    }
  }

  private static pad2(n: number): string {
    return n < 10 ? `0${n}` : `${n}`;
  }
}
