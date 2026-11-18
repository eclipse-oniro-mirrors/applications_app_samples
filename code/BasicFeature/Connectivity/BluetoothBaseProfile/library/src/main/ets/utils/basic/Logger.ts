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
import { BluetoothConstants } from '../../constants/BluetoothConstants';

const TAG: string = BluetoothConstants.TAG;
const DOMAIN: number = BluetoothConstants.DOMAIN;

/**
 * log level enum
 * specify meaning available in the system log level, from from debug to fatal
 */
export enum LogLevel {
  /** adjust try level */
  DEBUG = 0,
  /** info info level */
  INFO = 1,
  /** warning notify level */
  WARN = 2,
  /** error level */
  ERROR = 3,
  /** cause life error level */
  FATAL = 4,
}

/**
 * log entry interface
 * specify meaning single item log recording number data result structure
 */
export interface LogEntry {
  /** log level */
  level: LogLevel;
  /** log tag */
  tag: string;
  /** log message content */
  message: string;
  /** day log timestamp (ms) */
  timestamp: number;
}

/**
 * log listener interface
 * used for monitor listen log event and execute row extra handling logic
 */
export interface LogListener {
  /**
   * when a log entry is recorded callback
   * @param entry - log entry object
   */
  onLog(entry: LogEntry): void;
}

/**
 * day log utility class
 * provides unified log recording function, support hold log level control, history storage and listener mechanism
 * internal part use circular buffer store log entry, avoid free internal store none limit increase length
 */
export class Logger {
  /** max log entry store number amount */
  private static readonly MAX_LOG_ENTRIES: number = 1000;
  /** circular buffer, store most near log entry */
  private static logBuffer: LogEntry[] = [];
  /** current log level threshold */
  private static currentLevel: LogLevel = LogLevel.DEBUG;
  /** registered listener list */
  private static listeners: LogListener[] = [];
  /** buffer write position */
  private static bufferIndex: number = 0;
  /** whether the buffer is full */
  private static bufferFull: boolean = false;

  /**
   * set current log level threshold
   * @param level - want set log level
   */
  static setLevel(level: LogLevel): void {
    Logger.currentLevel = level;
    hilog.info(DOMAIN, TAG, 'Log level set to: ' + LogLevel[level]);
  }

  /**
   * get current log level threshold
   * @returns current log level
   */
  static getLevel(): LogLevel {
    return Logger.currentLevel;
  }

  /**
   * log at debug level
   * @param message - log message content
   * @param tag - can select self specify meaning mark tag
   */
  static debug(message: string, tag?: string): void {
    Logger.log(LogLevel.DEBUG, message, tag);
  }

  /**
   * log at info level
   * @param message - log message content
   * @param tag - can select self specify meaning mark tag
   */
  static info(message: string, tag?: string): void {
    Logger.log(LogLevel.INFO, message, tag);
  }

  /**
   * log at warning level
   * @param message - log message content
   * @param tag - can select self specify meaning mark tag
   */
  static warn(message: string, tag?: string): void {
    Logger.log(LogLevel.WARN, message, tag);
  }

  /**
   * log at error level
   * @param message - log message content
   * @param tag - can select self specify meaning mark tag
   */
  static error(message: string, tag?: string): void {
    Logger.log(LogLevel.ERROR, message, tag);
  }

  /**
   * log at fatal level
   * @param message - log message content
   * @param tag - can select self specify meaning mark tag
   */
  static fatal(message: string, tag?: string): void {
    Logger.log(LogLevel.FATAL, message, tag);
  }

  /**
   * internal log recording method
   * @param level - log level
   * @param message - log message content
   * @param customTag - can select self specify meaning mark tag
   */
  private static log(level: LogLevel, message: string, customTag?: string): void {
    if (level < Logger.currentLevel) {
      return;
    }
    const logTag: string = customTag ?? TAG;
    const timestamp: number = Date.now();

    // root data log level invoke against respond hilog method method
    switch (level) {
      case LogLevel.DEBUG:
        hilog.debug(DOMAIN, logTag, message);
        break;
      case LogLevel.INFO:
        hilog.info(DOMAIN, logTag, message);
        break;
      case LogLevel.WARN:
        hilog.warn(DOMAIN, logTag, message);
        break;
      case LogLevel.ERROR:
        hilog.error(DOMAIN, logTag, message);
        break;
      case LogLevel.FATAL:
        hilog.error(DOMAIN, logTag, '[FATAL] ' + message);
        break;
      default:
        hilog.info(DOMAIN, logTag, message);
        break;
    }

    // create log entry and store in circular buffer
    const entry: LogEntry = {
      level: level,
      tag: logTag,
      message: message,
      timestamp: timestamp,
    };
    Logger.addToBuffer(entry);
    Logger.notifyListeners(entry);
  }

  /**
   * will log entry add to circular buffer
   * @param entry - want add log entry
   */
  private static addToBuffer(entry: LogEntry): void {
    if (!Logger.bufferFull && Logger.logBuffer.length < Logger.MAX_LOG_ENTRIES) {
      Logger.logBuffer.push(entry);
      Logger.bufferIndex++;
      if (Logger.logBuffer.length >= Logger.MAX_LOG_ENTRIES) {
        Logger.bufferFull = true;
        Logger.bufferIndex = 0;
      }
    } else {
      Logger.logBuffer[Logger.bufferIndex] = entry;
      Logger.bufferIndex = (Logger.bufferIndex + 1) % Logger.MAX_LOG_ENTRIES;
    }
  }

  /**
   * get log history record
   * @returns log entry array copy
   */
  static getHistory(): LogEntry[] {
    if (!Logger.bufferFull) {
      return [...Logger.logBuffer];
    }
    const ordered: LogEntry[] = [];
    for (let i: number = 0; i < Logger.MAX_LOG_ENTRIES; i++) {
      const actualIndex: number = (Logger.bufferIndex + i) % Logger.MAX_LOG_ENTRIES;
      ordered.push(Logger.logBuffer[actualIndex]);
    }
    return ordered;
  }

  /**
   * get specified level log history record
   * @param level - want screen select log level
   * @returns symbol combine specified level log entry array
   */
  static getHistoryByLevel(level: LogLevel): LogEntry[] {
    const history: LogEntry[] = Logger.getHistory();
    return history.filter((entry: LogEntry) => entry.level === level);
  }

  /**
   * get log buffer in entry total number
   * @returns currently stored log entry number amount
   */
  static getBufferSize(): number {
    if (Logger.bufferFull) {
      return Logger.MAX_LOG_ENTRIES;
    }
    return Logger.logBuffer.length;
  }

  /**
   * clear log buffer and all listener
   */
  static clear(): void {
    Logger.logBuffer = [];
    Logger.bufferIndex = 0;
    Logger.bufferFull = false;
    Logger.listeners = [];
    hilog.info(DOMAIN, TAG, 'Log buffer cleared');
  }

  /**
   * add log listener
   * @param listener - want add log listener
   */
  static addListener(listener: LogListener): void {
    const existingIndex: number = Logger.listeners.indexOf(listener);
    if (existingIndex === -1) {
      Logger.listeners.push(listener);
    }
  }

  /**
   * remove log listener
   * @param listener - want remove log listener
   */
  static removeListener(listener: LogListener): void {
    const index: number = Logger.listeners.indexOf(listener);
    if (index !== -1) {
      Logger.listeners.splice(index, 1);
    }
  }

  /**
   * notify all registered listeners
   * @param entry - new product generate log entry
   */
  private static notifyListeners(entry: LogEntry): void {
    for (let i: number = 0; i < Logger.listeners.length; i++) {
      try {
        Logger.listeners[i].onLog(entry);
      } catch (error) {
        hilog.error(DOMAIN, TAG, 'Error notifying log listener: ' + error);
      }
    }
  }

  /**
   * get log level corresponding text label
   * @param level - log level enum value
   * @returns log level name
   */
  static getLevelLabel(level: LogLevel): string {
    switch (level) {
      case LogLevel.DEBUG: return 'DEBUG';
      case LogLevel.INFO: return 'INFO';
      case LogLevel.WARN: return 'WARN';
      case LogLevel.ERROR: return 'ERROR';
      case LogLevel.FATAL: return 'FATAL';
      default: return 'UNKNOWN';
    }
  }

  /**
   * format log entry for readable string
   * @param entry - want format log entry
   * @returns formatted log string
   */
  static formatEntry(entry: LogEntry): string {
    const date: Date = new Date(entry.timestamp);
    const timeStr: string = date.getFullYear() + '-' +
      String(date.getMonth() + 1).padStart(2, '0') + '-' +
      String(date.getDate()).padStart(2, '0') + ' ' +
      String(date.getHours()).padStart(2, '0') + ':' +
      String(date.getMinutes()).padStart(2, '0') + ':' +
      String(date.getSeconds()).padStart(2, '0');
    const levelLabel: string = Logger.getLevelLabel(entry.level);
    return '[' + timeStr + '] [' + levelLabel + '] [' + entry.tag + '] ' + entry.message;
  }

  /**
   * start performance tracing
   * @param traceName - trace name name
   * @param instanceId - instance ID
   */
  static startTrace(traceName: string, instanceId: number = 0): void {
    hiTraceMeter.startTrace(traceName, instanceId);
  }

  /**
   * end performance tracing
   * @param traceName - trace name name
   * @param instanceId - instance ID
   */
  static finishTrace(traceName: string, instanceId: number = 0): void {
    hiTraceMeter.finishTrace(traceName, instanceId);
  }
}
