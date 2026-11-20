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
 * date utility class
 * provides date format, decode parse, calculate equal actual use method method
 */
export class DateUtils {
  /** month name array */
  private static readonly MONTH_NAMES: string[] = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  /** weekday name array */
  private static readonly DAY_NAMES: string[] = [
    'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'
  ];

  /**
   * format timestamp to date string
   * @param timestamp - timestamp (ms)
   * @param format - format style string
   * @returns formatted date string
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
   * get current time stamp
   * @returns current time stamp (ms)
   */
  static now(): number {
    return Date.now();
  }

  /**
   * calculate difference between two timestamps (ms)
   * @param start - start time stamp
   * @param end - end time stamp
   * @returns time difference (ms)
   */
  static diff(start: number, end: number): number {
    return Math.abs(end - start);
  }

  /**
   * convert milliseconds to readable time format
   * @param ms - milliseconds
   * @returns formatted time string
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
   * get month copy name name
   * @param month - month copy index quote (0-11)
   * @returns month copy name name
   */
  static getMonthName(month: number): string {
    if (month < 0 || month > 11) {
      return 'Unknown';
    }
    return DateUtils.MONTH_NAMES[month];
  }

  /**
   * get star period name name
   * @param day - star period index quote (0-6, 0 for week day)
   * @returns star period name name
   */
  static getDayName(day: number): string {
    if (day < 0 || day > 6) {
      return 'Unknown';
    }
    return DateUtils.DAY_NAMES[day];
  }

  /**
   * check timestamp whether for today
   * @param timestamp - want check timestamp
   * @returns whether for today
   */
  static isToday(timestamp: number): boolean {
    const today: Date = new Date();
    const date: Date = new Date(timestamp);
    return today.getFullYear() === date.getFullYear() &&
      today.getMonth() === date.getMonth() &&
      today.getDate() === date.getDate();
  }

  /**
   * check timestamp whether for yesterday
   * @param timestamp - want check timestamp
   * @returns whether for yesterday
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
   * get relative time describe describe
   * @param timestamp - timestamp
   * @returns relative time description string
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
   * check whether for leap year
   * @param year - year copy
   * @returns whether for leap year
   */
  static isLeapYear(year: number): boolean {
    return (year % 4 === 0 && year % 100 !== 0) || (year % 400 === 0);
  }

  /**
   * get specified month copy day number
   * @param year - year copy
   * @param month - month copy (0-11)
   * @returns day number
   */
  static getDaysInMonth(year: number, month: number): number {
    const daysInMonth: number[] = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    if (month === 1 && DateUtils.isLeapYear(year)) {
      return 29;
    }
    return daysInMonth[month];
  }

  /**
   * add day number to day period
   * @param date - original day period
   * @param days - want add day number
   * @returns new day period
   */
  static addDays(date: Date, days: number): Date {
    const result: Date = new Date(date.getTime());
    result.setDate(result.getDate() + days);
    return result;
  }

  /**
   * add small time to day period
   * @param date - original day period
   * @param hours - want add small time number
   * @returns new day period
   */
  static addHours(date: Date, hours: number): Date {
    const result: Date = new Date(date.getTime());
    result.setHours(result.getHours() + hours);
    return result;
  }

  /**
   * add divide clock to day period
   * @param date - original day period
   * @param minutes - want add divide clock number
   * @returns new day period
   */
  static addMinutes(date: Date, minutes: number): Date {
    const result: Date = new Date(date.getTime());
    result.setMinutes(result.getMinutes() + minutes);
    return result;
  }

  /**
   * get one day start time
   * @param date - day period
   * @returns the same day 0 point timestamp
   */
  static getStartOfDay(date: Date): number {
    const result: Date = new Date(date);
    result.setHours(0, 0, 0, 0);
    return result.getTime();
  }

  /**
   * get one day end time
   * @param date - day period
   * @returns the same day 23:59:59 timestamp
   */
  static getEndOfDay(date: Date): number {
    const result: Date = new Date(date);
    result.setHours(23, 59, 59, 999);
    return result.getTime();
  }
}
