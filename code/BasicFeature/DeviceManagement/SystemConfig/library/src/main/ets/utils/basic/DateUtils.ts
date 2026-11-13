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
// Date format enum
// ========================================

/**
 * Date format enum
 * Defines commonly used date formatting templates
 */
export enum DateFormat {
  /** Standard date format: yyyy-MM-dd */
  STANDARD = 'yyyy-MM-dd',
  /** Standard time format: HH:mm:ss */
  TIME = 'HH:mm:ss',
  /** Full date-time format: yyyy-MM-dd HH:mm:ss */
  FULL = 'yyyy-MM-dd HH:mm:ss',
  /** Short date format: MM/dd */
  SHORT = 'MM/dd',
  /** Month date format: yyyy-MM */
  MONTH = 'yyyy-MM',
}

// ========================================
// Date utility class
// ========================================

/**
 * Date utility class
 * Provides rich static date-time methods including formatting, parsing, date arithmetic
 * and relative time display
 * Relative time and weekday/month names come from string.json resources (date_*)
 */
export class DateUtils {
  /** Weekday name resource keys (texts in string.json date_week_*) */
  private static readonly WEEKDAY_NAMES: string[] = [
    'date_week_sun', 'date_week_mon', 'date_week_tue', 'date_week_wed', 'date_week_thu', 'date_week_fri', 'date_week_sat'
  ];

  /** Month name resource keys (texts in string.json date_month_*) */
  private static readonly MONTH_NAMES: string[] = [
    'date_month_jan', 'date_month_feb', 'date_month_mar', 'date_month_apr', 'date_month_may', 'date_month_jun',
    'date_month_jul', 'date_month_aug', 'date_month_sep', 'date_month_oct', 'date_month_nov', 'date_month_dec'
  ];

  // ========================================
  // Basic time methods
  // ========================================

  /**
   * Gets the current timestamp (milliseconds)
   * @returns Current time in millisecond timestamp
   */
  static now(): number {
    return Date.now();
  }

  /**
   * Gets the current date object
   * @returns Date object for the current time
   */
  static currentDate(): Date {
    return new Date();
  }

  // ========================================
  // Date formatting methods
  // ========================================

  /**
   * Formats a timestamp into a string of the specified pattern
   * Supported placeholders: yyyy(year), MM(month), dd(day), HH(hour), mm(minute), ss(second)
   * @param timestamp - Millisecond timestamp
   * @param pattern - Formatting template, default 'yyyy-MM-dd HH:mm:ss'
   * @returns Formatted date string
   */
  static format(timestamp: number, pattern: string = 'yyyy-MM-dd HH:mm:ss'): string {
    const date: Date = new Date(timestamp);

    if (isNaN(date.getTime())) {
      hilog.warn(DOMAIN, TAG, 'DateUtils invalid timestamp=%{public}d', timestamp);
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
   * Formats a timestamp into the standard date format (yyyy-MM-dd)
   * @param timestamp - Millisecond timestamp
   * @returns Formatted date string
   */
  static formatDate(timestamp: number): string {
    return DateUtils.format(timestamp, DateFormat.STANDARD);
  }

  /**
   * Formats a timestamp into the standard time format (HH:mm:ss)
   * @param timestamp - Millisecond timestamp
   * @returns Formatted time string
   */
  static formatTime(timestamp: number): string {
    return DateUtils.format(timestamp, DateFormat.TIME);
  }

  /**
   * Formats a timestamp using the localized date pattern (date_format_locale in string.json)
   * @param timestamp - Millisecond timestamp
   * @returns Formatted localized date string
   */
  static formatLocaleDate(timestamp: number): string {
    return DateUtils.format(timestamp, ResourceHelper.getStringByName('date_format_locale'));
  }

  // ========================================
  // Date parsing methods
  // ========================================

  /**
   * Parses a date string into a timestamp
   * Supports standard date formats (yyyy-MM-dd, yyyy-MM-dd HH:mm:ss, etc.)
   * @param dateStr - Date string
   * @returns Parsed millisecond timestamp, or 0 on failure
   */
  static parse(dateStr: string): number {
    if (!dateStr || dateStr.trim().length === 0) {
      return 0;
    }

    try {
      const date: Date = new Date(dateStr);
      if (isNaN(date.getTime())) {
        hilog.warn(DOMAIN, TAG, 'DateUtils parseDate failed, dateStr=%{public}s', dateStr);
        return 0;
      }
      return date.getTime();
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'DateUtils parseDate error=%{public}s', String(error));
      return 0;
    }
  }

  // ========================================
  // Date calculation methods
  // ========================================

  /**
   * Adds days to a timestamp
   * @param timestamp - Base timestamp (milliseconds)
   * @param days - Days to add (may be negative)
   * @returns Resulting timestamp
   */
  static addDays(timestamp: number, days: number): number {
    return timestamp + days * 86400000;
  }

  /**
   * Adds hours to a timestamp
   * @param timestamp - Base timestamp (milliseconds)
   * @param hours - Hours to add (may be negative)
   * @returns Resulting timestamp
   */
  static addHours(timestamp: number, hours: number): number {
    return timestamp + hours * 3600000;
  }

  /**
   * Adds minutes to a timestamp
   * @param timestamp - Base timestamp (milliseconds)
   * @param minutes - Minutes to add (may be negative)
   * @returns Resulting timestamp
   */
  static addMinutes(timestamp: number, minutes: number): number {
    return timestamp + minutes * 60000;
  }

  /**
   * Calculates the day difference between two timestamps
   * @param timestamp1 - First timestamp
   * @param timestamp2 - Second timestamp
   * @returns Absolute day difference between the timestamps
   */
  static daysBetween(timestamp1: number, timestamp2: number): number {
    const diff: number = Math.abs(timestamp2 - timestamp1);
    return Math.floor(diff / 86400000);
  }

  /**
   * Calculates the hour difference between two timestamps
   * @param timestamp1 - First timestamp
   * @param timestamp2 - Second timestamp
   * @returns Absolute hour difference between the timestamps
   */
  static hoursBetween(timestamp1: number, timestamp2: number): number {
    const diff: number = Math.abs(timestamp2 - timestamp1);
    return Math.floor(diff / 3600000);
  }

  // ========================================
  // Date checking methods
  // ========================================

  /**
   * Checks whether a timestamp falls on today
   * @param timestamp - Timestamp to check
   * @returns true if the timestamp corresponds to today
   */
  static isToday(timestamp: number): boolean {
    const date: Date = new Date(timestamp);
    const today: Date = new Date();
    return date.getFullYear() === today.getFullYear() &&
      date.getMonth() === today.getMonth() &&
      date.getDate() === today.getDate();
  }

  /**
   * Checks whether a timestamp falls on yesterday
   * @param timestamp - Timestamp to check
   * @returns true if the timestamp corresponds to yesterday
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
   * Checks whether the year of a timestamp is a leap year
   * @param timestamp - Timestamp to check
   * @returns true if the timestamp corresponds to a leap year
   */
  static isLeapYear(timestamp: number): boolean {
    const year: number = new Date(timestamp).getFullYear();
    return (year % 4 === 0 && year % 100 !== 0) || (year % 400 === 0);
  }

  /**
   * Checks whether a timestamp falls on a weekend
   * @param timestamp - Timestamp to check
   * @returns true if the timestamp corresponds to a weekend
   */
  static isWeekend(timestamp: number): boolean {
    const day: number = new Date(timestamp).getDay();
    return day === 0 || day === 6;
  }

  // ========================================
  // Relative time methods
  // ========================================

  /**
   * Gets a localized relative time description
   * Returns different texts based on the difference between the timestamp and now
   * @param timestamp - Timestamp to describe
   * @returns Relative time string (texts in string.json date_* resources)
   */
  static getRelativeTime(timestamp: number): string {
    const now: number = Date.now();
    const diff: number = now - timestamp;

    if (diff < 0) {
      return ResourceHelper.getStringByName('date_upcoming');
    }

    if (diff < 60000) {
      return ResourceHelper.getStringByName('date_just_now');
    }

    if (diff < 3600000) {
      const minutes: number = Math.floor(diff / 60000);
      return ResourceHelper.getStringByName('date_minutes_ago', minutes);
    }

    if (diff < 86400000) {
      const hours: number = Math.floor(diff / 3600000);
      return ResourceHelper.getStringByName('date_hours_ago', hours);
    }

    if (diff < 604800000) {
      const days: number = Math.floor(diff / 86400000);
      return ResourceHelper.getStringByName('date_days_ago', days);
    }

    if (diff < 2592000000) {
      const weeks: number = Math.floor(diff / 604800000);
      return ResourceHelper.getStringByName('date_weeks_ago', weeks);
    }

    if (diff < 31536000000) {
      const months: number = Math.floor(diff / 2592000000);
      return ResourceHelper.getStringByName('date_months_ago', months);
    }

    const years: number = Math.floor(diff / 31536000000);
    return ResourceHelper.getStringByName('date_years_ago', years);
  }

  // ========================================
  // Helper methods
  // ========================================

  /**
   * Gets the weekday name for a timestamp
   * @param timestamp - Timestamp
   * @returns Weekday name string
   */
  static getWeekdayName(timestamp: number): string {
    const day: number = new Date(timestamp).getDay();
    return ResourceHelper.getStringByName(DateUtils.WEEKDAY_NAMES[day]);
  }

  /**
   * Gets the month name for a timestamp
   * @param timestamp - Timestamp
   * @returns Month name string
   */
  static getMonthName(timestamp: number): string {
    const month: number = new Date(timestamp).getMonth();
    return ResourceHelper.getStringByName(DateUtils.MONTH_NAMES[month]);
  }

  /**
   * Gets the number of days in a specific month
   * @param year - Year
   * @param month - Month (0-11)
   * @returns Days in the month
   */
  static getDaysInMonth(year: number, month: number): number {
    return new Date(year, month + 1, 0).getDate();
  }

  /**
   * Gets today's start timestamp (00:00:00.000)
   * @returns Millisecond timestamp of today's midnight
   */
  static getTodayStart(): number {
    const today: Date = new Date();
    today.setHours(0, 0, 0, 0);
    return today.getTime();
  }

  /**
   * Gets today's end timestamp (23:59:59.999)
   * @returns Millisecond timestamp at the end of today
   */
  static getTodayEnd(): number {
    const today: Date = new Date();
    today.setHours(23, 59, 59, 999);
    return today.getTime();
  }
}
