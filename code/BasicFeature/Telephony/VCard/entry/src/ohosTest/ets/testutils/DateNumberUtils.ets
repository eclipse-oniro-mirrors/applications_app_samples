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

/**
 * Pure date/number helpers shared by the DATE and DTEX hypium test suites.
 *
 * All methods are static and side-effect free. The JavaScript Date
 * constructor is deliberately NOT used for parsing or shifting calendar
 * dates: month lengths, leap years, day-of-year values and civil day
 * differences are computed with plain integer arithmetic so that every
 * expected value in the test suites can be verified by hand. The only
 * place new Date() is used is formatStamp(), which renders an epoch
 * millisecond value with the same local-time getters and zero padding
 * rules as the production Formatter.time() implementation.
 *
 * Conventions for invalid input, asserted verbatim by the suites:
 * - daysInMonth: month outside 1..12 returns 0.
 * - isValidDate: month outside 1..12 or day outside 1..daysInMonth
 *   returns false.
 * - dayOfYear: invalid combination returns -1.
 * - addDays: invalid input date returns '' and never shifts.
 * - diffDays: any invalid endpoint returns 0.
 * - dayOfWeek: invalid input date returns -1.
 *
 * Worked examples used by the DATE suite:
 * - 2026 is a common year, so dayOfYear(2026, 3, 1) is 60 and
 *   dayOfYear(2026, 12, 31) is 365.
 * - 2024 is a leap year, so dayOfYear(2024, 2, 29) is 60,
 *   dayOfYear(2024, 3, 1) is 61 and dayOfYear(2024, 12, 31) is 366.
 * - addDays(2026, 12, 31, 1) is '2027-01-01' and
 *   addDays(2026, 1, 1, -1) is '2025-12-31'.
 * - diffDays(1900, 1, 1, 2000, 1, 1) is 36524 because the century year
 *   1900 is common, while diffDays(2000, 1, 1, 2100, 1, 1) is 36525
 *   because the century year 2000 is a leap year.
 * - dayOfWeek maps Zeller's h value to 0 = Sunday .. 6 = Saturday, so
 *   the known Monday 2026-11-09 yields 1 and the known Saturday
 *   2000-01-01 yields 6.
 */
export class DateNumberUtils {
  /**
   * Proleptic Gregorian leap-year rule: divisible by 4 and not by 100,
   * or divisible by 400. Examples: 2024 and 2000 are leap years while
   * 2026, 1900 and 2100 are not. The century test runs after the mod-4
   * test so the common centuries (1700, 1800, 1900, 2100) fall through
   * to false and only 400-multiples (1600, 2000, 2400) stay true.
   */
  static isLeapYear(year: number): boolean {
    if (year % 4 !== 0) {
      return false;
    }
    if (year % 100 !== 0) {
      return true;
    }
    return year % 400 === 0;
  }

  /**
   * Whether the month index belongs to the seven 31-day months January,
   * March, May, July, August, October and December. Any value outside
   * 1..12 returns false. Used by daysInMonth to keep the branching
   * readable.
   */
  private static isLongMonth(month: number): boolean {
    return month === 1 || month === 3 || month === 5 || month === 7 ||
      month === 8 || month === 10 || month === 12;
  }

  /**
   * Number of days in a month for the given year. month must be in the
   * 1..12 range, anything else returns 0. February returns 29 for leap
   * years and 28 otherwise, e.g. daysInMonth(2024, 2) is 29 and
   * daysInMonth(1900, 2) is 28 because 1900 is a common century year.
   * The short 30-day months are April, June, September and November.
   */
  static daysInMonth(year: number, month: number): number {
    if (month < 1 || month > 12) {
      return 0;
    }
    if (DateNumberUtils.isLongMonth(month)) {
      return 31;
    }
    if (month === 4 || month === 6 || month === 9 || month === 11) {
      return 30;
    }
    if (DateNumberUtils.isLeapYear(year)) {
      return 29;
    }
    return 28;
  }

  /**
   * Total number of days in the given year: 366 for leap years and 365
   * for common years. The DTEX suite asserts that the twelve monthly
   * lengths sum exactly to this value.
   */
  private static daysInYear(year: number): number {
    if (DateNumberUtils.isLeapYear(year)) {
      return 366;
    }
    return 365;
  }

  /**
   * Sum of the monthly lengths strictly before the given month of the
   * given year, i.e. the ordinal of the last day of the previous month.
   * For a common year daysBeforeMonth(2026, 6) is 151 and for a leap
   * year daysBeforeMonth(2024, 3) is 60 because leap February counts.
   */
  private static daysBeforeMonth(year: number, month: number): number {
    let total: number = 0;
    let m: number = 1;
    while (m < month) {
      total = total + DateNumberUtils.daysInMonth(year, m);
      m = m + 1;
    }
    return total;
  }

  /**
   * Validates a calendar date. The month must be 1..12 and the day must
   * be at least 1 and at most the month length of that year. Examples:
   * (2026, 2, 28) is valid, (2026, 2, 29) is not, (2024, 2, 29) is,
   * (2026, 4, 31) is not because April has 30 days and (2026, 0, 1) is
   * not because month 0 is out of range.
   */
  static isValidDate(year: number, month: number, day: number): boolean {
    if (month < 1 || month > 12) {
      return false;
    }
    if (day < 1) {
      return false;
    }
    return day <= DateNumberUtils.daysInMonth(year, month);
  }

  /**
   * One-based ordinal day within the year, or -1 for an invalid
   * combination. The accumulation walks months 1..month-1 with
   * daysInMonth so leap February shifts every later day by one, e.g.
   * dayOfYear(2026, 3, 1) is 60 while dayOfYear(2024, 3, 1) is 61.
   */
  static dayOfYear(year: number, month: number, day: number): number {
    if (!DateNumberUtils.isValidDate(year, month, day)) {
      return -1;
    }
    return DateNumberUtils.daysBeforeMonth(year, month) + day;
  }

  /**
   * Shifts a calendar date by delta days and renders the result as
   * yyyy-MM-dd with a four-digit year. Month lengths are applied one
   * month at a time with the self-implemented daysInMonth, so rolling
   * over month and year boundaries (including leap February) is exact
   * and never goes through the Date constructor. Negative delta moves
   * backwards across month and year boundaries the same way. An invalid
   * input date returns the empty string. For example addDays(2024, 2,
   * 28, 1) is '2024-02-29', addDays(2024, 2, 29, 1) is '2024-03-01' and
   * addDays(2026, 10, 31, 32) is '2026-12-02'.
   */
  static addDays(year: number, month: number, day: number, delta: number): string {
    if (!DateNumberUtils.isValidDate(year, month, day)) {
      return '';
    }
    let y: number = year;
    let m: number = month;
    let d: number = day + delta;
    while (d > DateNumberUtils.daysInMonth(y, m)) {
      d = d - DateNumberUtils.daysInMonth(y, m);
      m = m + 1;
      if (m > 12) {
        m = 1;
        y = y + 1;
      }
    }
    while (d < 1) {
      m = m - 1;
      if (m < 1) {
        m = 12;
        y = y - 1;
      }
      d = d + DateNumberUtils.daysInMonth(y, m);
    }
    return DateNumberUtils.formatDate(y, m, d);
  }

  /**
   * Signed difference in civil days between two calendar dates computed
   * as to - from. Each date is mapped to a stable epoch day number built
   * from three integer parts: 365 times the zero-based year index, the
   * count of leap years before that year, and the within-year ordinal
   * day. Any invalid endpoint returns 0, e.g. the difference between
   * 1900-01-01 and 2000-01-01 is exactly 36524 because 1900 is common,
   * and the difference across leap 2024 is 366. The mapping is strictly
   * monotonic, so shifting a date by n days always produces a diffDays
   * result of exactly n.
   */
  static diffDays(fromYear: number, fromMonth: number, fromDay: number,
    toYear: number, toMonth: number, toDay: number): number {
    if (!DateNumberUtils.isValidDate(fromYear, fromMonth, fromDay)) {
      return 0;
    }
    if (!DateNumberUtils.isValidDate(toYear, toMonth, toDay)) {
      return 0;
    }
    const fromAbs: number = DateNumberUtils.epochDayNumber(fromYear, fromMonth, fromDay);
    const toAbs: number = DateNumberUtils.epochDayNumber(toYear, toMonth, toDay);
    return toAbs - fromAbs;
  }

  /**
   * Weekday of a calendar date computed with Zeller's congruence on the
   * proleptic Gregorian calendar. January and February are treated as
   * months 13 and 14 of the preceding year. The result is normalized to
   * 0 = Sunday through 6 = Saturday. An invalid input date
   * returns -1. For example 2026-11-09 is a Monday (1), 2026-01-01 is a
   * Thursday (4) and 2000-01-01 is a Saturday (6).
   */
  static dayOfWeek(year: number, month: number, day: number): number {
    if (!DateNumberUtils.isValidDate(year, month, day)) {
      return -1;
    }
    let m: number = month;
    let y: number = year;
    if (m < 3) {
      m = m + 12;
      y = y - 1;
    }
    const q: number = day;
    const k: number = y % 100;
    const j: number = Math.floor(y / 100);
    const h: number = (q + Math.floor((13 * (m + 1)) / 5) + k +
      Math.floor(k / 4) + Math.floor(j / 4) + 5 * j) % 7;
    return (h + 6) % 7;
  }

  /**
   * Renders an epoch millisecond timestamp as yyyy-MM-dd HH:mm:ss using
   * the local-time getters of new Date(ms), with every component padded
   * to two digits. This mirrors the production Formatter.time() output
   * character for character, e.g. the timestamp of new Date(2026, 0, 5,
   * 7, 8, 9) renders as '2026-01-05 07:08:09'. The rendered text is
   * always 19 characters with fixed separators: dashes at index 4 and 7,
   * a space at index 10 and colons at index 13 and 16.
   */
  static formatStamp(ms: number): string {
    const date: Date = new Date(ms);
    return DateNumberUtils.padYear(date.getFullYear()) + '-' + DateNumberUtils.pad2(date.getMonth() + 1) +
      '-' + DateNumberUtils.pad2(date.getDate()) + ' ' + DateNumberUtils.pad2(date.getHours()) +
      ':' + DateNumberUtils.pad2(date.getMinutes()) + ':' + DateNumberUtils.pad2(date.getSeconds());
  }

  /**
   * Number of leap years in the closed range 1..year-1 computed with the
   * inclusion-exclusion formula floor(n/4) - floor(n/100) + floor(n/400)
   * applied to the last counted year. Years of 1 or below contribute no
   * counted leap year. For example leapsBefore(2026) is 491 and
   * leapsBefore(2000) is 484 because the range 1..1999 contains 499
   * quarter multiples, 19 century multiples and 4 quadricentennial
   * multiples. Used by epochDayNumber only.
   */
  private static leapsBefore(year: number): number {
    if (year <= 1) {
      return 0;
    }
    const last: number = year - 1;
    return Math.floor(last / 4) - Math.floor(last / 100) + Math.floor(last / 400);
  }

  /**
   * Absolute civil day number of a date: 365 times the zero-based year
   * index plus the leap-year correction plus the within-year ordinal
   * day. The mapping is strictly monotonic, so differences of two such
   * numbers are exact day counts. For example epochDayNumber(2026, 11,
   * 9) is 739929 and epochDayNumber(2024, 2, 29) is 738945, whose
   * difference 984 is exactly the day count between the two dates.
   */
  private static epochDayNumber(year: number, month: number, day: number): number {
    const base: number = 365 * (year - 1) + DateNumberUtils.leapsBefore(year);
    return base + DateNumberUtils.dayOfYear(year, month, day);
  }

  /**
   * Zero-pads a component to two characters, e.g. 7 becomes '07' and 23
   * stays '23'. Values of 100 or above fall through unchanged because
   * every caller feeds it month, day, hour, minute or second getters.
   */
  private static pad2(value: number): string {
    if (value < 10) {
      return '0' + value;
    }
    return '' + value;
  }

  /**
   * Left-pads a year with zeros to at least four characters so years
   * below 1000 still render as fixed-width fields. Modern four-digit
   * years pass through unchanged.
   */
  private static padYear(year: number): string {
    let text: string = '' + year;
    while (text.length < 4) {
      text = '0' + text;
    }
    return text;
  }

  /**
   * Joins year, month and day into the canonical yyyy-MM-dd rendering
   * with two-digit month and day fields, e.g. formatDate(2026, 5, 15)
   * is '2026-05-15'. The output is always 10 characters for four-digit
   * years.
   */
  private static formatDate(year: number, month: number, day: number): string {
    return DateNumberUtils.padYear(year) + '-' + DateNumberUtils.pad2(month) +
      '-' + DateNumberUtils.pad2(day);
  }
}
