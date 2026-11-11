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

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

// ========================================
// 日志级别枚举
// ========================================

/**
 * 日志级别枚举
 * 定义了系统中可用的日志级别，从调试到致命错误
 */
export enum LogLevel {
  /** 调试级别 */
  DEBUG = 0,
  /** 信息级别 */
  INFO = 1,
  /** 警告级别 */
  WARN = 2,
  /** 错误级别 */
  ERROR = 3,
  /** 致命错误级别 */
  FATAL = 4,
}

// ========================================
// 日志条目接口
// ========================================

/**
 * 日志条目接口
 * 定义单条日志记录的数据结构
 */
export interface LogEntry {
  /** 日志级别 */
  level: LogLevel;
  /** 日志标签 */
  tag: string;
  /** 日志消息内容 */
  message: string;
  /** 日志时间戳（毫秒） */
  timestamp: number;
}

// ========================================
// 日志监听器接口
// ========================================

/**
 * 日志监听器接口
 * 用于监听日志事件并执行自定义处理逻辑
 */
export interface LogListener {
  /**
   * 当日志条目被记录时回调
   * @param entry - 日志条目对象
   */
  onLog(entry: LogEntry): void;
}

// ========================================
// 日志工具类
// ========================================

/**
 * 日志工具类
 * 提供统一的日志记录功能，支持日志级别控制、历史记录存储和监听器机制
 * 内部使用循环缓冲区存储日志条目，避免内存无限增长
 */
export class Logger {
  /** 最大日志条目存储数量 */
  private static readonly MAX_LOG_ENTRIES: number = 1000;

  /** 循环缓冲区，存储最近的日志条目 */
  private static logBuffer: LogEntry[] = [];

  /** 当前日志级别阈值 */
  private static currentLevel: LogLevel = LogLevel.DEBUG;

  /** 已注册的监听器列表 */
  private static listeners: LogListener[] = [];

  /** 缓冲区写入索引 */
  private static bufferIndex: number = 0;

  /** 缓冲区是否已满 */
  private static bufferFull: boolean = false;

  // ========================================
  // 日志级别控制
  // ========================================

  /**
   * 设置当前日志级别阈值
   * 低于该级别的日志将不会被记录
   * @param level - 要设置的日志级别
   */
  static setLevel(level: LogLevel): void {
    Logger.currentLevel = level;
    hilog.info(DOMAIN, TAG, 'Logger level set to=%{public}s', LogLevel[level]);
  }

  /**
   * 获取当前日志级别阈值
   * @returns 当前的日志级别
   */
  static getLevel(): LogLevel {
    return Logger.currentLevel;
  }

  // ========================================
  // 核心日志记录方法
  // ========================================

  /**
   * 记录调试级别日志
   * @param message - 日志消息内容
   * @param tag - 可选的自定义标签
   */
  static debug(message: string, tag?: string): void {
    Logger.log(LogLevel.DEBUG, message, tag);
  }

  /**
   * 记录信息级别日志
   * @param message - 日志消息内容
   * @param tag - 可选的自定义标签
   */
  static info(message: string, tag?: string): void {
    Logger.log(LogLevel.INFO, message, tag);
  }

  /**
   * 记录警告级别日志
   * @param message - 日志消息内容
   * @param tag - 可选的自定义标签
   */
  static warn(message: string, tag?: string): void {
    Logger.log(LogLevel.WARN, message, tag);
  }

  /**
   * 记录错误级别日志
   * @param message - 日志消息内容
   * @param tag - 可选的自定义标签
   */
  static error(message: string, tag?: string): void {
    Logger.log(LogLevel.ERROR, message, tag);
  }

  /**
   * 记录致命错误级别日志
   * @param message - 日志消息内容
   * @param tag - 可选的自定义标签
   */
  static fatal(message: string, tag?: string): void {
    Logger.log(LogLevel.FATAL, message, tag);
  }

  /**
   * 内部日志记录方法
   * 根据日志级别调用对应的hilog方法，并将日志条目存入缓冲区
   * @param level - 日志级别
   * @param message - 日志消息内容
   * @param customTag - 可选的自定义标签
   */
  private static log(level: LogLevel, message: string, customTag?: string): void {
    if (level < Logger.currentLevel) {
      return;
    }

    const logTag: string = customTag ?? TAG;
    const timestamp: number = Date.now();

    // 根据日志级别调用对应的hilog方法
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

    // 创建日志条目并存入循环缓冲区
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
  // 循环缓冲区管理
  // ========================================

  /**
   * 将日志条目添加到循环缓冲区
   * 当缓冲区满时，新条目会覆盖最旧的条目
   * @param entry - 要添加的日志条目
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
   * 获取日志历史记录
   * 返回按时间顺序排列的日志条目数组
   * @returns 日志条目数组的副本
   */
  static getHistory(): LogEntry[] {
    if (!Logger.bufferFull) {
      return [...Logger.logBuffer];
    }

    // 缓冲区已满，需要从当前索引开始重新排列
    const ordered: LogEntry[] = [];
    for (let i: number = 0; i < Logger.MAX_LOG_ENTRIES; i++) {
      const actualIndex: number = (Logger.bufferIndex + i) % Logger.MAX_LOG_ENTRIES;
      ordered.push(Logger.logBuffer[actualIndex]);
    }
    return ordered;
  }

  /**
   * 获取指定级别的日志历史记录
   * @param level - 要筛选的日志级别
   * @returns 符合指定级别的日志条目数组
   */
  static getHistoryByLevel(level: LogLevel): LogEntry[] {
    const history: LogEntry[] = Logger.getHistory();
    return history.filter((entry: LogEntry) => entry.level === level);
  }

  /**
   * 获取日志缓冲区中的条目总数
   * @returns 当前存储的日志条目数量
   */
  static getBufferSize(): number {
    if (Logger.bufferFull) {
      return Logger.MAX_LOG_ENTRIES;
    }
    return Logger.logBuffer.length;
  }

  /**
   * 清空日志缓冲区和所有监听器
   */
  static clear(): void {
    Logger.logBuffer = [];
    Logger.bufferIndex = 0;
    Logger.bufferFull = false;
    Logger.listeners = [];
    hilog.info(DOMAIN, TAG, 'Logger buffer cleared');
  }

  // ========================================
  // 监听器管理
  // ========================================

  /**
   * 添加日志监听器
   * @param listener - 要添加的日志监听器
   */
  static addListener(listener: LogListener): void {
    const existingIndex: number = Logger.listeners.indexOf(listener);
    if (existingIndex === -1) {
      Logger.listeners.push(listener);
      hilog.debug(DOMAIN, TAG, 'Logger listener added');
    }
  }

  /**
   * 移除日志监听器
   * @param listener - 要移除的日志监听器
   */
  static removeListener(listener: LogListener): void {
    const index: number = Logger.listeners.indexOf(listener);
    if (index !== -1) {
      Logger.listeners.splice(index, 1);
      hilog.debug(DOMAIN, TAG, 'Logger listener removed');
    }
  }

  /**
   * 通知所有已注册的监听器
   * @param entry - 新产生的日志条目
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
  // 辅助方法
  // ========================================

  /**
   * 获取日志级别对应的文本标签
   * @param level - 日志级别枚举值
   * @returns 日志级别的中文名称
   */
  static getLevelLabel(level: LogLevel): string {
    switch (level) {
      case LogLevel.DEBUG:
        return '调试';
      case LogLevel.INFO:
        return '信息';
      case LogLevel.WARN:
        return '警告';
      case LogLevel.ERROR:
        return '错误';
      case LogLevel.FATAL:
        return '致命';
      default:
        return '未知';
    }
  }

  /**
   * 格式化日志条目为可读字符串
   * @param entry - 要格式化的日志条目
   * @returns 格式化后的日志字符串
   */
  static formatEntry(entry: LogEntry): string {
    const date: Date = new Date(entry.timestamp);
    const timeStr: string = `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, '0')}-${String(date.getDate()).padStart(2, '0')} ` +
      `${String(date.getHours()).padStart(2, '0')}:${String(date.getMinutes()).padStart(2, '0')}:${String(date.getSeconds()).padStart(2, '0')}`;
    const levelLabel: string = Logger.getLevelLabel(entry.level);
    return `[${timeStr}] [${levelLabel}] [${entry.tag}] ${entry.message}`;
  }
}
