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
import { BluetoothConstants } from '../../constants/BluetoothConstants';

const TAG: string = BluetoothConstants.TAG;
const DOMAIN: number = BluetoothConstants.DOMAIN;

/**
 * 日期工具类
 * 提供日期格式化、解析、计算等实用方法
 */
export class DateUtils {
  /** 月份名称数组 */
  private static readonly MONTH_NAMES: string[] = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  /** 星期名称数组 */
  private static readonly DAY_NAMES: string[] = [
    'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'
  ];

  /**
   * 格式化时间戳为日期字符串
   * @param timestamp - 时间戳（毫秒）
   * @param format - 格式字符串
   * @returns 格式化后的日期字符串
   */
  static formatTimestamp(timestamp: number, format: string = 'yyyy-MM-dd HH:mm:ss'): string {
    const date: Date = new Date(timestamp);
    const year: string = date.getFullYear().toString();
    const month: string = String(date.getMonth() + 1).padStart(2, '0');
    const day: string = String(date.getDate()).padStart(2, '0');
    const hours: string = String(date.getHours()).padStart(2, '0');
    const minutes: string = String(date.getMinutes()).padStart(2, '0');
    const seconds: string = String(date.getSeconds()).padStart(2, '0');

    let result: string = format;
    result = result.replace('yyyy', year);
    result = result.replace('MM', month);
    result = result.replace('dd', day);
    result = result.replace('HH', hours);
    result = result.replace('mm', minutes);
    result = result.replace('ss', seconds);
    return result;
  }

  /**
   * 获取当前时间戳
   * @returns 当前时间戳（毫秒）
   */
  static now(): number {
    return Date.now();
  }

  /**
   * 计算两个时间戳之间的差值（毫秒）
   * @param start - 开始时间戳
   * @param end - 结束时间戳
   * @returns 时间差（毫秒）
   */
  static diff(start: number, end: number): number {
    return Math.abs(end - start);
  }

  /**
   * 将毫秒数转换为可读的时间格式
   * @param ms - 毫秒数
   * @returns 格式化后的时间字符串
   */
  static formatDuration(ms: number): string {
    if (ms < 0) {
      return '0s';
    }
    const seconds: number = Math.floor(ms / 1000);
    const minutes: number = Math.floor(seconds / 60);
    const hours: number = Math.floor(minutes / 60);
    const days: number = Math.floor(hours / 24);

    if (days > 0) {
      return days + 'd ' + (hours % 24) + 'h ' + (minutes % 60) + 'm';
    } else if (hours > 0) {
      return hours + 'h ' + (minutes % 60) + 'm ' + (seconds % 60) + 's';
    } else if (minutes > 0) {
      return minutes + 'm ' + (seconds % 60) + 's';
    }
    return seconds + 's';
  }

  /**
   * 获取月份名称
   * @param month - 月份索引（0-11）
   * @returns 月份名称
   */
  static getMonthName(month: number): string {
    if (month < 0 || month > 11) {
      return 'Unknown';
    }
    return DateUtils.MONTH_NAMES[month];
  }

  /**
   * 获取星期名称
   * @param day - 星期索引（0-6，0为周日）
   * @returns 星期名称
   */
  static getDayName(day: number): string {
    if (day < 0 || day > 6) {
      return 'Unknown';
    }
    return DateUtils.DAY_NAMES[day];
  }

  /**
   * 检查时间戳是否为今天
   * @param timestamp - 要检查的时间戳
   * @returns 是否为今天
   */
  static isToday(timestamp: number): boolean {
    const today: Date = new Date();
    const date: Date = new Date(timestamp);
    return today.getFullYear() === date.getFullYear() &&
      today.getMonth() === date.getMonth() &&
      today.getDate() === date.getDate();
  }

  /**
   * 检查时间戳是否为昨天
   * @param timestamp - 要检查的时间戳
   * @returns 是否为昨天
   */
  static isYesterday(timestamp: number): boolean {
    const yesterday: Date = new Date();
    yesterday.setDate(yesterday.getDate() - 1);
    const date: Date = new Date(timestamp);
    return yesterday.getFullYear() === date.getFullYear() &&
      yesterday.getMonth() === date.getMonth() &&
      yesterday.getDate() === date.getDate();
  }

  /**
   * 获取相对时间描述
   * @param timestamp - 时间戳
   * @returns 相对时间描述字符串
   */
  static getRelativeTime(timestamp: number): string {
    const now: number = Date.now();
    const diff: number = now - timestamp;
    if (diff < 60000) {
      return 'just now';
    } else if (diff < 3600000) {
      return Math.floor(diff / 60000) + ' minutes ago';
    } else if (diff < 86400000) {
      return Math.floor(diff / 3600000) + ' hours ago';
    } else if (diff < 604800000) {
      return Math.floor(diff / 86400000) + ' days ago';
    }
    return DateUtils.formatTimestamp(timestamp, 'yyyy-MM-dd');
  }

  /**
   * 检查是否为闰年
   * @param year - 年份
   * @returns 是否为闰年
   */
  static isLeapYear(year: number): boolean {
    return (year % 4 === 0 && year % 100 !== 0) || (year % 400 === 0);
  }

  /**
   * 获取指定月份的天数
   * @param year - 年份
   * @param month - 月份（0-11）
   * @returns 天数
   */
  static getDaysInMonth(year: number, month: number): number {
    const daysInMonth: number[] = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    if (month === 1 && DateUtils.isLeapYear(year)) {
      return 29;
    }
    return daysInMonth[month];
  }

  /**
   * 添加天数到日期
   * @param date - 原始日期
   * @param days - 要添加的天数
   * @returns 新的日期
   */
  static addDays(date: Date, days: number): Date {
    const result: Date = new Date(date.getTime());
    result.setDate(result.getDate() + days);
    return result;
  }

  /**
   * 添加小时到日期
   * @param date - 原始日期
   * @param hours - 要添加的小时数
   * @returns 新的日期
   */
  static addHours(date: Date, hours: number): Date {
    const result: Date = new Date(date.getTime());
    result.setHours(result.getHours() + hours);
    return result;
  }

  /**
   * 添加分钟到日期
   * @param date - 原始日期
   * @param minutes - 要添加的分钟数
   * @returns 新的日期
   */
  static addMinutes(date: Date, minutes: number): Date {
    const result: Date = new Date(date.getTime());
    result.setMinutes(result.getMinutes() + minutes);
    return result;
  }

  /**
   * 获取一天的开始时间
   * @param date - 日期
   * @returns 当天0点的时间戳
   */
  static getStartOfDay(date: Date): number {
    const result: Date = new Date(date);
    result.setHours(0, 0, 0, 0);
    return result.getTime();
  }

  /**
   * 获取一天的结束时间
   * @param date - 日期
   * @returns 当天23:59:59的时间戳
   */
  static getEndOfDay(date: Date): number {
    const result: Date = new Date(date);
    result.setHours(23, 59, 59, 999);
    return result.getTime();
  }
}
