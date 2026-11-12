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

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const DAY_IN_MS: number = 86400000;
const HOUR_IN_MS: number = 3600000;
const MINUTE_IN_MS: number = 60000;
const SECOND_IN_MS: number = 1000;
const MONTHS_PER_YEAR: number = 12;
const PAD_LENGTH: number = 2;
const PAD_CHAR: string = '0';

/**
 * UTC timestamp helpers backing the ohosTest utility suites.
 *
 * Every member converts through UTC getters so that the results stay stable on
 * devices configured with a non UTC time zone.
 */
export class DateUtils {
  /**
   * Formats the timestamp as YYYY-MM-DD.
   */
  static formatDate(timestamp: number): string {
    hilog.info(DOMAIN, TAG, 'DateUtils.formatDate timestamp=%{public}d', timestamp);
    const value: Date = new Date(timestamp);
    const year: string = DateUtils.padNumber(value.getUTCFullYear(), 4);
    const month: string = DateUtils.padNumber(value.getUTCMonth() + 1, PAD_LENGTH);
    const day: string = DateUtils.padNumber(value.getUTCDate(), PAD_LENGTH);
    return year + '-' + month + '-' + day;
  }

  /**
   * Formats the timestamp as HH:mm:ss.
   */
  static formatTime(timestamp: number): string {
    hilog.info(DOMAIN, TAG, 'DateUtils.formatTime timestamp=%{public}d', timestamp);
    const value: Date = new Date(timestamp);
    const hour: string = DateUtils.padNumber(value.getUTCHours(), PAD_LENGTH);
    const minute: string = DateUtils.padNumber(value.getUTCMinutes(), PAD_LENGTH);
    const second: string = DateUtils.padNumber(value.getUTCSeconds(), PAD_LENGTH);
    return hour + ':' + minute + ':' + second;
  }

  /**
   * Extracts the UTC year of the timestamp.
   */
  static yearOf(timestamp: number): number {
    hilog.info(DOMAIN, TAG, 'DateUtils.yearOf timestamp=%{public}d', timestamp);
    return new Date(timestamp).getUTCFullYear();
  }

  /**
   * Extracts the one based UTC month of the timestamp.
   */
  static monthOf(timestamp: number): number {
    hilog.info(DOMAIN, TAG, 'DateUtils.monthOf timestamp=%{public}d', timestamp);
    return new Date(timestamp).getUTCMonth() + 1;
  }

  /**
   * Extracts the UTC day of the month.
   */
  static dayOf(timestamp: number): number {
    hilog.info(DOMAIN, TAG, 'DateUtils.dayOf timestamp=%{public}d', timestamp);
    return new Date(timestamp).getUTCDate();
  }

  /**
   * Extracts the UTC hour of the day.
   */
  static hourOf(timestamp: number): number {
    hilog.info(DOMAIN, TAG, 'DateUtils.hourOf timestamp=%{public}d', timestamp);
    return new Date(timestamp).getUTCHours();
  }

  /**
   * Extracts the UTC minute of the hour.
   */
  static minuteOf(timestamp: number): number {
    hilog.info(DOMAIN, TAG, 'DateUtils.minuteOf timestamp=%{public}d', timestamp);
    return new Date(timestamp).getUTCMinutes();
  }

  /**
   * Extracts the UTC day of the week, zero based from Sunday.
   */
  static weekdayOf(timestamp: number): number {
    hilog.info(DOMAIN, TAG, 'DateUtils.weekdayOf timestamp=%{public}d', timestamp);
    return new Date(timestamp).getUTCDay();
  }

  /**
   * Reports whether the year of the timestamp is a leap year.
   */
  static isLeapYearOf(timestamp: number): boolean {
    hilog.info(DOMAIN, TAG, 'DateUtils.isLeapYearOf timestamp=%{public}d', timestamp);
    const year: number = new Date(timestamp).getUTCFullYear();
    if (year % 400 === 0) {
      return true;
    }
    if (year % 100 === 0) {
      return false;
    }
    return year % 4 === 0;
  }

  /**
   * Returns the number of days in the UTC month of the timestamp.
   */
  static daysInMonthOf(timestamp: number): number {
    hilog.info(DOMAIN, TAG, 'DateUtils.daysInMonthOf timestamp=%{public}d', timestamp);
    const value: Date = new Date(timestamp);
    const year: number = value.getUTCFullYear();
    const month: number = value.getUTCMonth();
    const nextMonth: Date = new Date(Date.UTC(year, month + 1, 1));
    const previousMonth: Date = new Date(nextMonth.getTime() - DAY_IN_MS);
    return previousMonth.getUTCDate();
  }

  /**
   * Shifts the timestamp by a whole number of days.
   */
  static addDays(timestamp: number, days: number): number {
    hilog.info(DOMAIN, TAG, 'DateUtils.addDays days=%{public}d', days);
    return timestamp + days * DAY_IN_MS;
  }

  /**
   * Returns the whole day distance from the first to the second timestamp.
   */
  static diffDays(from: number, to: number): number {
    hilog.info(DOMAIN, TAG, 'DateUtils.diffDays from=%{public}d', from);
    return Math.floor((to - from) / DAY_IN_MS);
  }

  /**
   * Floors the timestamp down to the UTC midnight of its day.
   */
  static startOfDay(timestamp: number): number {
    hilog.info(DOMAIN, TAG, 'DateUtils.startOfDay timestamp=%{public}d', timestamp);
    return Math.floor(timestamp / DAY_IN_MS) * DAY_IN_MS;
  }

  /**
   * Reports whether the value is a usable non negative timestamp.
   */
  static isValidTimestamp(timestamp: number): boolean {
    hilog.info(DOMAIN, TAG, 'DateUtils.isValidTimestamp timestamp=%{public}d', timestamp);
    return Number.isFinite(timestamp) && timestamp >= 0;
  }

  /**
   * Left pads the value with zeros up to the requested width.
   */
  private static padNumber(value: number, width: number): string {
    let text: string = value.toString();
    while (text.length < width) {
      text = PAD_CHAR + text;
    }
    return text;
  }
}
