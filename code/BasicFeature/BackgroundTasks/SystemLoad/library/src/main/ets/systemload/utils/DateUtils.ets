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

/** 日志域ID */
const DOMAIN: number = 0xFF00;
/** 日志标签 */
const TAG: string = 'DateUtils';

/**
 * 日期工具类
 * 提供日期格式化、解析、计算等常用功能
 * 
 * @remarks
 * 该类为静态工具类，无需实例化
 * 支持多种日期格式和时区处理
 * 
 * @example
 * ```typescript
 * // 格式化当前日期
 * const formatted = DateUtils.format(new Date(), 'yyyy-MM-dd HH:mm:ss');
 * 
 * // 获取相对时间描述
 * const relative = DateUtils.getRelativeTime(pastDate);  // '3小时前'
 * ```
 */
export class DateUtils {
  /** 默认日期格式 */
  static readonly DEFAULT_FORMAT: string = 'yyyy-MM-dd HH:mm:ss';
  /** 日期格式 */
  static readonly DATE_FORMAT: string = 'yyyy-MM-dd';
  /** 时间格式 */
  static readonly TIME_FORMAT: string = 'HH:mm:ss';
  /** 简短日期格式 */
  static readonly SHORT_FORMAT: string = 'yyyyMMdd';

  /** 星期名称映射 */
  private static readonly WEEK_DAYS: Map<number, string> = new Map([
    [0, '星期日'],
    [1, '星期一'],
    [2, '星期二'],
    [3, '星期三'],
    [4, '星期四'],
    [5, '星期五'],
    [6, '星期六']
  ]);

  /** 月份名称映射 */
  private static readonly MONTHS: Map<number, string> = new Map([
    [0, '一月'],
    [1, '二月'],
    [2, '三月'],
    [3, '四月'],
    [4, '五月'],
    [5, '六月'],
    [6, '七月'],
    [7, '八月'],
    [8, '九月'],
    [9, '十月'],
    [10, '十一月'],
    [11, '十二月']
  ]);

  /**
   * 格式化日期
   * 将Date对象格式化为指定格式的字符串
   * 
   * @param date - 待格式化的日期对象
   * @param format - 日期格式模板，默认为'yyyy-MM-dd HH:mm:ss'
   * @returns string 格式化后的日期字符串
   */
  static format(date: Date, format: string = DateUtils.DEFAULT_FORMAT): string {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `format() called with format: ${format}`);
    // 检查日期对象有效性
    if (!date || isNaN(date.getTime())) {
      hilog.warn(DOMAIN, TAG, 'format() received invalid date');
      return '';
    }
    // 获取日期各部分值
    const year = date.getFullYear().toString();
    const month = (date.getMonth() + 1).toString().padStart(2, '0');
    const day = date.getDate().toString().padStart(2, '0');
    const hours = date.getHours().toString().padStart(2, '0');
    const minutes = date.getMinutes().toString().padStart(2, '0');
    const seconds = date.getSeconds().toString().padStart(2, '0');
    const milliseconds = date.getMilliseconds().toString().padStart(3, '0');
    // 替换格式模板中的占位符
    let result = format;
    result = result.replace('yyyy', year);
    result = result.replace('MM', month);
    result = result.replace('dd', day);
    result = result.replace('HH', hours);
    result = result.replace('mm', minutes);
    result = result.replace('ss', seconds);
    result = result.replace('SSS', milliseconds);
    return result;
  }

  /**
   * 解析日期字符串
   * 将日期字符串解析为Date对象
   * 
   * @param dateStr - 日期字符串
   * @param format - 日期格式，默认为'yyyy-MM-dd HH:mm:ss'
   * @returns Date 解析后的Date对象，解析失败返回null
   */
  static parse(dateStr: string, format: string = DateUtils.DEFAULT_FORMAT): Date | null {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `parse() called with format: ${format}`);
    // 检查字符串有效性
    if (!dateStr || dateStr.length === 0) {
      hilog.warn(DOMAIN, TAG, 'parse() received empty string');
      return null;
    }
    try {
      // 根据格式解析日期
      const yearMatch = dateStr.match(/\d{4}/);
      const monthMatch = dateStr.match(/-(\d{2})-/);
      const dayMatch = dateStr.match(/-(\d{2})[T\s]/);
      const hourMatch = dateStr.match(/(\d{2}):/);
      const minuteMatch = dateStr.match(/:(\d{2}):/);
      const secondMatch = dateStr.match(/:(\d{2})/);
      // 提取日期各部分
      const year = yearMatch ? parseInt(yearMatch[0]) : new Date().getFullYear();
      const month = monthMatch ? parseInt(monthMatch[1]) - 1 : 0;
      const day = dayMatch ? parseInt(dayMatch[1]) : 1;
      const hour = hourMatch ? parseInt(hourMatch[1]) : 0;
      const minute = minuteMatch ? parseInt(minuteMatch[1]) : 0;
      const second = secondMatch ? parseInt(secondMatch[1]) : 0;
      // 创建并返回Date对象
      return new Date(year, month, day, hour, minute, second);
    } catch (error) {
      // 记录解析错误
      hilog.error(DOMAIN, TAG, `parse() failed: ${(error as Error).message}`);
      return null;
    }
  }

  /**
   * 获取相对时间描述
   * 返回类似'刚刚'、'5分钟前'、'3小时前'等相对时间描述
   * 
   * @param date - 待比较的日期
   * @param baseDate - 基准日期，默认为当前时间
   * @returns string 相对时间描述字符串
   */
  static getRelativeTime(date: Date, baseDate: Date = new Date()): string {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'getRelativeTime() called');
    // 检查日期有效性
    if (!date || isNaN(date.getTime())) {
      return '';
    }
    // 计算时间差（毫秒）
    const diff = baseDate.getTime() - date.getTime();
    const absDiff = Math.abs(diff);
    // 定义时间单位常量
    const SECOND = 1000;
    const MINUTE = 60 * SECOND;
    const HOUR = 60 * MINUTE;
    const DAY = 24 * HOUR;
    const WEEK = 7 * DAY;
    const MONTH = 30 * DAY;
    const YEAR = 365 * DAY;
    // 根据时间差返回相对描述
    if (absDiff < MINUTE) {
      return '刚刚';
    } else if (absDiff < HOUR) {
      const minutes = Math.floor(absDiff / MINUTE);
      return diff > 0 ? `${minutes}分钟前` : `${minutes}分钟后`;
    } else if (absDiff < DAY) {
      const hours = Math.floor(absDiff / HOUR);
      return diff > 0 ? `${hours}小时前` : `${hours}小时后`;
    } else if (absDiff < WEEK) {
      const days = Math.floor(absDiff / DAY);
      return diff > 0 ? `${days}天前` : `${days}天后`;
    } else if (absDiff < MONTH) {
      const weeks = Math.floor(absDiff / WEEK);
      return diff > 0 ? `${weeks}周前` : `${weeks}周后`;
    } else if (absDiff < YEAR) {
      const months = Math.floor(absDiff / MONTH);
      return diff > 0 ? `${months}个月前` : `${months}个月后`;
    } else {
      const years = Math.floor(absDiff / YEAR);
      return diff > 0 ? `${years}年前` : `${years}年后`;
    }
  }

  /**
   * 判断是否为今天
   * 检查指定日期是否为今天
   * 
   * @param date - 待检查的日期
   * @returns boolean 是今天返回true，否则返回false
   */
  static isToday(date: Date): boolean {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'isToday() called');
    // 检查日期有效性
    if (!date || isNaN(date.getTime())) {
      return false;
    }
    // 获取今天的日期
    const today = new Date();
    // 比较年月日
    return date.getFullYear() === today.getFullYear() &&
      date.getMonth() === today.getMonth() &&
      date.getDate() === today.getDate();
  }

  /**
   * 判断是否为同一天
   * 检查两个日期是否为同一天
   * 
   * @param date1 - 第一个日期
   * @param date2 - 第二个日期
   * @returns boolean 是同一天返回true，否则返回false
   */
  static isSameDay(date1: Date, date2: Date): boolean {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'isSameDay() called');
    // 检查日期有效性
    if (!date1 || !date2 || isNaN(date1.getTime()) || isNaN(date2.getTime())) {
      return false;
    }
    // 比较年月日
    return date1.getFullYear() === date2.getFullYear() &&
      date1.getMonth() === date2.getMonth() &&
      date1.getDate() === date2.getDate();
  }

  /**
   * 获取星期名称
   * 返回指定日期的星期名称（如：星期一）
   * 
   * @param date - 日期对象
   * @returns string 星期名称
   */
  static getWeekDay(date: Date): string {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'getWeekDay() called');
    // 检查日期有效性
    if (!date || isNaN(date.getTime())) {
      return '';
    }
    // 返回星期名称
    return DateUtils.WEEK_DAYS.get(date.getDay()) || '';
  }

  /**
   * 获取月份名称
   * 返回指定日期的月份名称（如：一月）
   * 
   * @param date - 日期对象
   * @returns string 月份名称
   */
  static getMonthName(date: Date): string {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'getMonthName() called');
    // 检查日期有效性
    if (!date || isNaN(date.getTime())) {
      return '';
    }
    // 返回月份名称
    return DateUtils.MONTHS.get(date.getMonth()) || '';
  }

  /**
   * 增加天数
   * 在指定日期基础上增加或减少天数
   * 
   * @param date - 基准日期
   * @param days - 要增加的天数（负数表示减少）
   * @returns Date 计算后的新日期
   */
  static addDays(date: Date, days: number): Date {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `addDays() called with days: ${days}`);
    // 创建新日期对象避免修改原对象
    const result = new Date(date.getTime());
    // 增加天数
    result.setDate(result.getDate() + days);
    return result;
  }

  /**
   * 增加月数
   * 在指定日期基础上增加或减少月数
   * 
   * @param date - 基准日期
   * @param months - 要增加的月数（负数表示减少）
   * @returns Date 计算后的新日期
   */
  static addMonths(date: Date, months: number): Date {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `addMonths() called with months: ${months}`);
    // 创建新日期对象避免修改原对象
    const result = new Date(date.getTime());
    // 增加月数
    result.setMonth(result.getMonth() + months);
    return result;
  }

  /**
   * 增加年数
   * 在指定日期基础上增加或减少年数
   * 
   * @param date - 基准日期
   * @param years - 要增加的年数（负数表示减少）
   * @returns Date 计算后的新日期
   */
  static addYears(date: Date, years: number): Date {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `addYears() called with years: ${years}`);
    // 创建新日期对象避免修改原对象
    const result = new Date(date.getTime());
    // 增加年数
    result.setFullYear(result.getFullYear() + years);
    return result;
  }

  /**
   * 获取当月第一天
   * 返回指定日期所在月份的第一天
   * 
   * @param date - 日期对象
   * @returns Date 当月第一天的日期
   */
  static getFirstDayOfMonth(date: Date): Date {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'getFirstDayOfMonth() called');
    // 检查日期有效性
    if (!date || isNaN(date.getTime())) {
      return new Date();
    }
    // 返回当月第一天
    return new Date(date.getFullYear(), date.getMonth(), 1);
  }

  /**
   * 获取当月最后一天
   * 返回指定日期所在月份的最后一天
   * 
   * @param date - 日期对象
   * @returns Date 当月最后一天的日期
   */
  static getLastDayOfMonth(date: Date): Date {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'getLastDayOfMonth() called');
    // 检查日期有效性
    if (!date || isNaN(date.getTime())) {
      return new Date();
    }
    // 返回当月最后一天（下个月第0天即为当月最后一天）
    return new Date(date.getFullYear(), date.getMonth() + 1, 0);
  }

  /**
   * 获取两个日期之间的天数差
   * 计算两个日期相差的天数
   * 
   * @param date1 - 第一个日期
   * @param date2 - 第二个日期
   * @returns number 天数差（绝对值）
   */
  static getDaysBetween(date1: Date, date2: Date): number {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'getDaysBetween() called');
    // 检查日期有效性
    if (!date1 || !date2 || isNaN(date1.getTime()) || isNaN(date2.getTime())) {
      return 0;
    }
    // 计算天数差
    const diffTime = Math.abs(date2.getTime() - date1.getTime());
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
    return diffDays;
  }

  /**
   * 判断是否为闰年
   * 检查指定年份是否为闰年
   * 
   * @param year - 年份
   * @returns boolean 是闰年返回true，否则返回false
   */
  static isLeapYear(year: number): boolean {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `isLeapYear() called with year: ${year}`);
    // 闰年判断规则
    return (year % 4 === 0 && year % 100 !== 0) || (year % 400 === 0);
  }

  /**
   * 获取时间戳
   * 返回指定日期的时间戳（毫秒）
   * 
   * @param date - 日期对象，默认为当前时间
   * @returns number 时间戳
   */
  static getTimestamp(date: Date = new Date()): number {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'getTimestamp() called');
    // 返回时间戳
    return date.getTime();
  }

  /**
   * 从时间戳创建日期
   * 根据时间戳创建Date对象
   * 
   * @param timestamp - 时间戳（毫秒）
   * @returns Date 对应的日期对象
   */
  static fromTimestamp(timestamp: number): Date {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `fromTimestamp() called with timestamp: ${timestamp}`);
    // 创建并返回Date对象
    return new Date(timestamp);
  }
}
