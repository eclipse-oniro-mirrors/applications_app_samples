/*
 * Copyright (c) 2024 Hunan OpenValley Digital Industry Development Co., Ltd.
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
// 日期格式枚举
// ========================================

/**
 * 日期格式枚举
 * 定义常用的日期格式化模板
 */
export enum DateFormat {
  /** 标准日期格式：yyyy-MM-dd */
  STANDARD = 'yyyy-MM-dd',
  /** 标准时间格式：HH:mm:ss */
  TIME = 'HH:mm:ss',
  /** 完整日期时间格式：yyyy-MM-dd HH:mm:ss */
  FULL = 'yyyy-MM-dd HH:mm:ss',
  /** 简短日期格式：MM/dd */
  SHORT = 'MM/dd',
  /** 中文日期格式：yyyy年MM月dd日 */
  CHINESE = 'yyyy年MM月dd日',
  /** 月份日期格式：yyyy-MM */
  MONTH = 'yyyy-MM',
}

// ========================================
// 日期工具类
// ========================================

/**
 * 日期工具类
 * 提供丰富的日期时间处理静态方法，包括格式化、解析、日期计算、相对时间显示等
 * 支持中文友好的相对时间描述
 */
export class DateUtils {
  /** 星期名称数组（中文） */
  private static readonly WEEKDAY_NAMES: string[] = [
    '星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'
  ];

  /** 月份名称数组（中文） */
  private static readonly MONTH_NAMES: string[] = [
    '一月', '二月', '三月', '四月', '五月', '六月',
    '七月', '八月', '九月', '十月', '十一月', '十二月'
  ];

  // ========================================
  // 基础时间方法
  // ========================================

  /**
   * 获取当前时间戳（毫秒）
   * @returns 当前时间的毫秒级时间戳
   */
  static now(): number {
    return Date.now();
  }

  /**
   * 获取当前日期对象
   * @returns 当前时间的Date对象
   */
  static currentDate(): Date {
    return new Date();
  }

  // ========================================
  // 日期格式化方法
  // ========================================

  /**
   * 将时间戳格式化为指定格式的字符串
   * 支持的占位符：yyyy(年)、MM(月)、dd(日)、HH(时)、mm(分)、ss(秒)
   * @param timestamp - 毫秒级时间戳
   * @param pattern - 格式化模板，默认为 'yyyy-MM-dd HH:mm:ss'
   * @returns 格式化后的日期字符串
   */
  static format(timestamp: number, pattern: string = 'yyyy-MM-dd HH:mm:ss'): string {
    const date: Date = new Date(timestamp);

    if (isNaN(date.getTime())) {
      hilog.warn(DOMAIN, TAG, `无效的时间戳: ${timestamp}`);
      return '';
    }

    const year: string = date.getFullYear().toString();
    const month: string = (date.getMonth() + 1).toString().padStart(2, '0');
    const day: string = date.getDate().toString().padStart(2, '0');
    const hours: string = date.getHours().toString().padStart(2, '0');
    const minutes: string = date.getMinutes().toString().padStart(2, '0');
    const seconds: string = date.getSeconds().toString().padStart(2, '0');

    let result: string = pattern;
    result = result.replace('yyyy', year);
    result = result.replace('MM', month);
    result = result.replace('dd', day);
    result = result.replace('HH', hours);
    result = result.replace('mm', minutes);
    result = result.replace('ss', seconds);

    return result;
  }

  /**
   * 将时间戳格式化为标准日期格式（yyyy-MM-dd）
   * @param timestamp - 毫秒级时间戳
   * @returns 格式化后的日期字符串
   */
  static formatDate(timestamp: number): string {
    return DateUtils.format(timestamp, DateFormat.STANDARD);
  }

  /**
   * 将时间戳格式化为标准时间格式（HH:mm:ss）
   * @param timestamp - 毫秒级时间戳
   * @returns 格式化后的时间字符串
   */
  static formatTime(timestamp: number): string {
    return DateUtils.format(timestamp, DateFormat.TIME);
  }

  /**
   * 将时间戳格式化为中文日期格式（yyyy年MM月dd日）
   * @param timestamp - 毫秒级时间戳
   * @returns 格式化后的中文日期字符串
   */
  static formatChineseDate(timestamp: number): string {
    return DateUtils.format(timestamp, DateFormat.CHINESE);
  }

  // ========================================
  // 日期解析方法
  // ========================================

  /**
   * 将日期字符串解析为时间戳
   * 支持标准日期格式（yyyy-MM-dd、yyyy-MM-dd HH:mm:ss等）
   * @param dateStr - 日期字符串
   * @returns 解析后的毫秒级时间戳，解析失败返回0
   */
  static parse(dateStr: string): number {
    if (!dateStr || dateStr.trim().length === 0) {
      return 0;
    }

    try {
      const date: Date = new Date(dateStr);
      if (isNaN(date.getTime())) {
        hilog.warn(DOMAIN, TAG, `日期解析失败: ${dateStr}`);
        return 0;
      }
      return date.getTime();
    } catch (error) {
      hilog.error(DOMAIN, TAG, `日期解析异常: ${error}`);
      return 0;
    }
  }

  // ========================================
  // 日期计算方法
  // ========================================

  /**
   * 在指定时间戳基础上增加天数
   * @param timestamp - 基准时间戳（毫秒）
   * @param days - 要增加的天数（可为负数）
   * @returns 计算后的时间戳
   */
  static addDays(timestamp: number, days: number): number {
    return timestamp + days * 86400000;
  }

  /**
   * 在指定时间戳基础上增加小时数
   * @param timestamp - 基准时间戳（毫秒）
   * @param hours - 要增加的小时数（可为负数）
   * @returns 计算后的时间戳
   */
  static addHours(timestamp: number, hours: number): number {
    return timestamp + hours * 3600000;
  }

  /**
   * 在指定时间戳基础上增加分钟数
   * @param timestamp - 基准时间戳（毫秒）
   * @param minutes - 要增加的分钟数（可为负数）
   * @returns 计算后的时间戳
   */
  static addMinutes(timestamp: number, minutes: number): number {
    return timestamp + minutes * 60000;
  }

  /**
   * 计算两个时间戳之间的天数差
   * @param timestamp1 - 第一个时间戳
   * @param timestamp2 - 第二个时间戳
   * @returns 两个时间戳之间相差的天数（绝对值）
   */
  static daysBetween(timestamp1: number, timestamp2: number): number {
    const diff: number = Math.abs(timestamp2 - timestamp1);
    return Math.floor(diff / 86400000);
  }

  /**
   * 计算两个时间戳之间的小时差
   * @param timestamp1 - 第一个时间戳
   * @param timestamp2 - 第二个时间戳
   * @returns 两个时间戳之间相差的小时数（绝对值）
   */
  static hoursBetween(timestamp1: number, timestamp2: number): number {
    const diff: number = Math.abs(timestamp2 - timestamp1);
    return Math.floor(diff / 3600000);
  }

  // ========================================
  // 日期判断方法
  // ========================================

  /**
   * 判断指定时间戳是否为今天
   * @param timestamp - 要判断的时间戳
   * @returns 如果时间戳对应的日期是今天返回true
   */
  static isToday(timestamp: number): boolean {
    const date: Date = new Date(timestamp);
    const today: Date = new Date();
    return date.getFullYear() === today.getFullYear() &&
      date.getMonth() === today.getMonth() &&
      date.getDate() === today.getDate();
  }

  /**
   * 判断指定时间戳是否为昨天
   * @param timestamp - 要判断的时间戳
   * @returns 如果时间戳对应的日期是昨天返回true
   */
  static isYesterday(timestamp: number): boolean {
    const yesterday: Date = new Date();
    yesterday.setDate(yesterday.getDate() - 1);
    const date: Date = new Date(timestamp);
    return date.getFullYear() === yesterday.getFullYear() &&
      date.getMonth() === yesterday.getMonth() &&
      date.getDate() === yesterday.getDate();
  }

  /**
   * 判断指定时间戳是否为闰年
   * @param timestamp - 要判断的时间戳
   * @returns 如果时间戳对应的年份是闰年返回true
   */
  static isLeapYear(timestamp: number): boolean {
    const year: number = new Date(timestamp).getFullYear();
    return (year % 4 === 0 && year % 100 !== 0) || (year % 400 === 0);
  }

  /**
   * 判断指定时间戳是否为周末
   * @param timestamp - 要判断的时间戳
   * @returns 如果时间戳对应的日期是周末返回true
   */
  static isWeekend(timestamp: number): boolean {
    const day: number = new Date(timestamp).getDay();
    return day === 0 || day === 6;
  }

  // ========================================
  // 相对时间方法
  // ========================================

  /**
   * 获取中文友好的相对时间描述
   * 根据时间戳与当前时间的差值返回不同的描述文本
   * @param timestamp - 要描述的时间戳
   * @returns 相对时间描述字符串，如"刚刚"、"5分钟前"、"2小时前"等
   */
  static getRelativeTime(timestamp: number): string {
    const now: number = Date.now();
    const diff: number = now - timestamp;

    if (diff < 0) {
      return '即将';
    }

    if (diff < 60000) {
      return '刚刚';
    }

    if (diff < 3600000) {
      const minutes: number = Math.floor(diff / 60000);
      return `${minutes}分钟前`;
    }

    if (diff < 86400000) {
      const hours: number = Math.floor(diff / 3600000);
      return `${hours}小时前`;
    }

    if (diff < 604800000) {
      const days: number = Math.floor(diff / 86400000);
      return `${days}天前`;
    }

    if (diff < 2592000000) {
      const weeks: number = Math.floor(diff / 604800000);
      return `${weeks}周前`;
    }

    if (diff < 31536000000) {
      const months: number = Math.floor(diff / 2592000000);
      return `${months}个月前`;
    }

    const years: number = Math.floor(diff / 31536000000);
    return `${years}年前`;
  }

  // ========================================
  // 辅助方法
  // ========================================

  /**
   * 获取指定时间戳对应日期的星期名称
   * @param timestamp - 时间戳
   * @returns 星期名称字符串（如"星期一"）
   */
  static getWeekdayName(timestamp: number): string {
    const day: number = new Date(timestamp).getDay();
    return DateUtils.WEEKDAY_NAMES[day];
  }

  /**
   * 获取指定时间戳对应日期的月份名称
   * @param timestamp - 时间戳
   * @returns 月份名称字符串（如"一月"）
   */
  static getMonthName(timestamp: number): string {
    const month: number = new Date(timestamp).getMonth();
    return DateUtils.MONTH_NAMES[month];
  }

  /**
   * 获取指定月份的天数
   * @param year - 年份
   * @param month - 月份（0-11）
   * @returns 该月的天数
   */
  static getDaysInMonth(year: number, month: number): number {
    return new Date(year, month + 1, 0).getDate();
  }

  /**
   * 获取今天的起始时间戳（00:00:00.000）
   * @returns 今天零点的毫秒时间戳
   */
  static getTodayStart(): number {
    const today: Date = new Date();
    today.setHours(0, 0, 0, 0);
    return today.getTime();
  }

  /**
   * 获取今天的结束时间戳（23:59:59.999）
   * @returns 今天结束的毫秒时间戳
   */
  static getTodayEnd(): number {
    const today: Date = new Date();
    today.setHours(23, 59, 59, 999);
    return today.getTime();
  }
}
