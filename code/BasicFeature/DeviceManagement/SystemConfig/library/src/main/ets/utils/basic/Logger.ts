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
import { SystemConfigConstants } from '../../constants/SystemConfigConstants';
import { ResourceHelper } from './ResourceHelper';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

// ========================================
// Log level enum
// ========================================

/**
 * Log level enum
 * Defines the log levels available in the system, from debug to fatal
 */
export enum LogLevel {
  /** Debug level */
  DEBUG = 0,
  /** Info level */
  INFO = 1,
  /** Warn level */
  WARN = 2,
  /** Error level */
  ERROR = 3,
  /** Fatal level */
  FATAL = 4,
}

// ========================================
// Log entry interface
// ========================================

/**
 * Log entry interface
 * Defines the data structure of a single log record
 */
export interface LogEntry {
  /** Log level */
  level: LogLevel;
  /** Log tag */
  tag: string;
  /** Log message content */
  message: string;
  /** Log timestamp (milliseconds) */
  timestamp: number;
}

// ========================================
// Log listener interface
// ========================================

/**
 * Log listener interface
 * Used to observe log events and run custom handling logic
 */
export interface LogListener {
  /**
   * Invoked when a log entry is recorded
   * @param entry - Log entry object
   */
  onLog(entry: LogEntry): void;
}

// ========================================
// Logger utility class
// ========================================

/**
 * Logger utility class
 * Provides unified logging with level control, history storage and a listener mechanism
 * Uses an internal circular buffer to store log entries and avoid unbounded memory growth
 */
export class Logger {
  /** Maximum stored log entry count */
  private static readonly MAX_LOG_ENTRIES: number = 1000;

  /** Circular buffer storing the most recent log entries */
  private static logBuffer: LogEntry[] = [];

  /** Current log level threshold */
  private static currentLevel: LogLevel = LogLevel.DEBUG;

  /** Registered listener list */
  private static listeners: LogListener[] = [];

  /** Buffer write index */
  private static bufferIndex: number = 0;

  /** Whether the buffer is full */
  private static bufferFull: boolean = false;

  // ========================================
  // Log level control
  // ========================================

  /**
   * Sets the current log level threshold
   * Logs below this level will not be recorded
   * @param level - Log level to set
   */
  static setLevel(level: LogLevel): void {
    Logger.currentLevel = level;
    hilog.info(DOMAIN, TAG, 'Logger level set to=%{public}s', LogLevel[level]);
  }

  /**
   * Gets the current log level threshold
   * @returns Current log level
   */
  static getLevel(): LogLevel {
    return Logger.currentLevel;
  }

  // ========================================
  // Core logging methods
  // ========================================

  /**
   * Records a debug level log
   * @param message - Log message content
   * @param tag - Optional custom tag
   */
  static debug(message: string, tag?: string): void {
    Logger.log(LogLevel.DEBUG, message, tag);
  }

  /**
   * Records an info level log
   * @param message - Log message content
   * @param tag - Optional custom tag
   */
  static info(message: string, tag?: string): void {
    Logger.log(LogLevel.INFO, message, tag);
  }

  /**
   * Records a warn level log
   * @param message - Log message content
   * @param tag - Optional custom tag
   */
  static warn(message: string, tag?: string): void {
    Logger.log(LogLevel.WARN, message, tag);
  }

  /**
   * Records an error level log
   * @param message - Log message content
   * @param tag - Optional custom tag
   */
  static error(message: string, tag?: string): void {
    Logger.log(LogLevel.ERROR, message, tag);
  }

  /**
   * Records a fatal level log
   * @param message - Log message content
   * @param tag - Optional custom tag
   */
  static fatal(message: string, tag?: string): void {
    Logger.log(LogLevel.FATAL, message, tag);
  }

  /**
   * Internal logging method
   * Calls the corresponding hilog method by level and stores the entry in the buffer
   * @param level - Log level
   * @param message - Log message content
   * @param customTag - Optional custom tag
   */
  private static log(level: LogLevel, message: string, customTag?: string): void {
    if (level < Logger.currentLevel) {
      return;
    }

    const logTag: string = customTag ?? TAG;
    const timestamp: number = Date.now();

    // Call the corresponding hilog method by log level
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
        hilog.error(DOMAIN, logTag, `[FATAL] ${message}`);
        break;
      default:
        hilog.info(DOMAIN, logTag, message);
        break;
    }

    // Create the log entry and store it in the circular buffer
    const entry: LogEntry = {
      level: level,
      tag: logTag,
      message: message,
      timestamp: timestamp,
    };

    Logger.addToBuffer(entry);
    Logger.notifyListeners(entry);
  }

  // ========================================
  // Circular buffer management
  // ========================================

  /**
   * Adds a log entry to the circular buffer
   * When the buffer is full, new entries overwrite the oldest ones
   * @param entry - Log entry to add
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
   * Gets the log history
   * Returns log entries ordered by time
   * @returns Copy of the log entry array
   */
  static getHistory(): LogEntry[] {
    if (!Logger.bufferFull) {
      return [...Logger.logBuffer];
    }

    // Buffer is full, reorder starting from the current index
    const ordered: LogEntry[] = [];
    for (let i: number = 0; i < Logger.MAX_LOG_ENTRIES; i++) {
      const actualIndex: number = (Logger.bufferIndex + i) % Logger.MAX_LOG_ENTRIES;
      ordered.push(Logger.logBuffer[actualIndex]);
    }
    return ordered;
  }

  /**
   * Gets the log history for a specific level
   * @param level - Log level to filter
   * @returns Log entries matching the specified level
   */
  static getHistoryByLevel(level: LogLevel): LogEntry[] {
    const history: LogEntry[] = Logger.getHistory();
    return history.filter((entry: LogEntry) => entry.level === level);
  }

  /**
   * Gets the total entry count in the log buffer
   * @returns Number of currently stored log entries
   */
  static getBufferSize(): number {
    if (Logger.bufferFull) {
      return Logger.MAX_LOG_ENTRIES;
    }
    return Logger.logBuffer.length;
  }

  /**
   * Clears the log buffer and all listeners
   */
  static clear(): void {
    Logger.logBuffer = [];
    Logger.bufferIndex = 0;
    Logger.bufferFull = false;
    Logger.listeners = [];
    hilog.info(DOMAIN, TAG, 'Logger buffer cleared');
  }

  // ========================================
  // Listener management
  // ========================================

  /**
   * Adds a log listener
   * @param listener - Log listener to add
   */
  static addListener(listener: LogListener): void {
    const existingIndex: number = Logger.listeners.indexOf(listener);
    if (existingIndex === -1) {
      Logger.listeners.push(listener);
      hilog.debug(DOMAIN, TAG, 'Logger listener added');
    }
  }

  /**
   * Removes a log listener
   * @param listener - Log listener to remove
   */
  static removeListener(listener: LogListener): void {
    const index: number = Logger.listeners.indexOf(listener);
    if (index !== -1) {
      Logger.listeners.splice(index, 1);
      hilog.debug(DOMAIN, TAG, 'Logger listener removed');
    }
  }

  /**
   * Notifies all registered listeners
   * @param entry - Newly produced log entry
   */
  private static notifyListeners(entry: LogEntry): void {
    for (let i: number = 0; i < Logger.listeners.length; i++) {
      try {
        Logger.listeners[i].onLog(entry);
      } catch (error) {
        hilog.error(DOMAIN, TAG, 'Logger notify listener error=%{public}s', String(error));
      }
    }
  }

  // ========================================
  // Helper methods
  // ========================================

  /**
   * Gets the text label for a log level
   * @param level - Log level enum value
   * @returns Localized name of the log level
   */
  static getLevelLabel(level: LogLevel): string {
    switch (level) {
      case LogLevel.DEBUG:
        return ResourceHelper.getStringByName('log_level_debug');
      case LogLevel.INFO:
        return ResourceHelper.getStringByName('log_level_info');
      case LogLevel.WARN:
        return ResourceHelper.getStringByName('log_level_warn');
      case LogLevel.ERROR:
        return ResourceHelper.getStringByName('log_level_error');
      case LogLevel.FATAL:
        return ResourceHelper.getStringByName('log_level_fatal');
      default:
        return ResourceHelper.getStringByName('log_level_unknown');
    }
  }

  /**
   * Formats a log entry into a readable string
   * @param entry - Log entry to format
   * @returns Formatted log string
   */
  static formatEntry(entry: LogEntry): string {
    const date: Date = new Date(entry.timestamp);
    const timeStr: string = `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, '0')}-${String(date.getDate()).padStart(2, '0')} ` +
      `${String(date.getHours()).padStart(2, '0')}:${String(date.getMinutes()).padStart(2, '0')}:${String(date.getSeconds()).padStart(2, '0')}`;
    const levelLabel: string = Logger.getLevelLabel(entry.level);
    return `[${timeStr}] [${levelLabel}] [${entry.tag}] ${entry.message}`;
  }
}
