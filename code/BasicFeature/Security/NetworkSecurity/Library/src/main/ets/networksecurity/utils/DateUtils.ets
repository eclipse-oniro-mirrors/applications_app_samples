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

import { Logger } from './Logger';

// Milliseconds in one day, used to shift timestamps by whole days.
const DAY_MS: number = 24 * 60 * 60 * 1000;
// Offset applied to getMonth because months are zero based in Date.
const MONTH_OFFSET: number = 1;

/**
 * Date helpers built on the standard Date type: timestamp formatting with a
 * small pattern language, day/month arithmetic and calendar comparisons.
 * All methods are stateless so callers can invoke them directly on the class.
 */
export class DateUtils {
  /**
   * Return the current wall-clock timestamp in milliseconds.
   * @returns the epoch timestamp of the current moment.
   */
  static now(): number {
    const tag: string = '[DateUtils#now]';
    Logger.enter(tag, '');
    Logger.beginTrace('NetworkSecurity.utils.now', 1);
    // Delegate to Date.now for the epoch milliseconds.
    const result: number = Date.now();
    Logger.exit(tag, 'timestamp: ' + result.toString());
    Logger.endTrace('NetworkSecurity.utils.now', 1);
    return result;
  }

  /**
   * Format a timestamp using a pattern with yyyy, MM, dd, HH, mm and ss
   * tokens; any other characters are copied verbatim.
   * @param timestamp epoch milliseconds to render.
   * @param pattern pattern text containing the supported tokens.
   * @returns the rendered local-time text.
   */
  static format(timestamp: number, pattern: string): string {
    const tag: string = '[DateUtils#format]';
    Logger.enter(tag, 'pattern: ' + pattern);
    Logger.beginTrace('NetworkSecurity.utils.format', 1);
    // Start from the raw pattern and substitute one token at a time.
    let result: string = pattern;
    const moment: Date = new Date(timestamp);
    // Replace each supported token with the matching numeric part.
    result = result.replace('yyyy', moment.getFullYear().toString());
    result = result.replace('MM', DateUtils.padTwo(moment.getMonth() + MONTH_OFFSET));
    result = result.replace('dd', DateUtils.padTwo(moment.getDate()));
    result = result.replace('HH', DateUtils.padTwo(moment.getHours()));
    result = result.replace('mm', DateUtils.padTwo(moment.getMinutes()));
    result = result.replace('ss', DateUtils.padTwo(moment.getSeconds()));
    Logger.exit(tag, 'result: ' + result);
    Logger.endTrace('NetworkSecurity.utils.format', 1);
    return result;
  }

  /**
   * Shift a timestamp forward or backward by whole days.
   * @param timestamp epoch milliseconds to shift.
   * @param days number of days to add; negative values move back in time.
   * @returns the shifted epoch timestamp in milliseconds.
   */
  static addDays(timestamp: number, days: number): number {
    const tag: string = '[DateUtils#addDays]';
    Logger.enter(tag, 'days: ' + days.toString());
    Logger.beginTrace('NetworkSecurity.utils.addDays', 1);
    // Day arithmetic stays exact because epochs are plain milliseconds.
    const result: number = timestamp + days * DAY_MS;
    Logger.exit(tag, 'timestamp: ' + result.toString());
    Logger.endTrace('NetworkSecurity.utils.addDays', 1);
    return result;
  }

  /**
   * Shift a timestamp forward or backward by whole months, keeping the day
   * of month; overflow days are normalized by Date automatically.
   * @param timestamp epoch milliseconds to shift.
   * @param months number of months to add; negative values move back.
   * @returns the shifted epoch timestamp in milliseconds.
   */
  static addMonths(timestamp: number, months: number): number {
    const tag: string = '[DateUtils#addMonths]';
    Logger.enter(tag, 'months: ' + months.toString());
    Logger.beginTrace('NetworkSecurity.utils.addMonths', 1);
    // Date normalizes month overflow, so setting the month is enough.
    const moment: Date = new Date(timestamp);
    moment.setMonth(moment.getMonth() + months);
    const result: number = moment.getTime();
    Logger.exit(tag, 'timestamp: ' + result.toString());
    Logger.endTrace('NetworkSecurity.utils.addMonths', 1);
    return result;
  }

  /**
   * Compute the absolute number of calendar days between two timestamps
   * using the device local timezone for day boundaries.
   * @param first first epoch timestamp in milliseconds.
   * @param second second epoch timestamp in milliseconds.
   * @returns the non-negative day difference.
   */
  static diffDays(first: number, second: number): number {
    const tag: string = '[DateUtils#diffDays]';
    Logger.enter(tag, 'first: ' + first.toString() + ', second: ' + second.toString());
    Logger.beginTrace('NetworkSecurity.utils.diffDays', 1);
    // Reduce both sides to local calendar dates before comparing.
    const firstMoment: Date = new Date(first);
    const secondMoment: Date = new Date(second);
    // Rebuild UTC day stamps from local parts to cancel hour differences.
    const firstDay: number = Date.UTC(firstMoment.getFullYear(), firstMoment.getMonth(), firstMoment.getDate());
    const secondDay: number = Date.UTC(secondMoment.getFullYear(), secondMoment.getMonth(), secondMoment.getDate());
    // Round instead of floor so daylight-saving shifts stay whole days.
    const result: number = Math.round(Math.abs(firstDay - secondDay) / DAY_MS);
    Logger.exit(tag, 'days: ' + result.toString());
    Logger.endTrace('NetworkSecurity.utils.diffDays', 1);
    return result;
  }

  /**
   * Check whether two timestamps fall on the same local calendar day.
   * @param first first epoch timestamp in milliseconds.
   * @param second second epoch timestamp in milliseconds.
   * @returns true when year, month and day of month all match.
   */
  static isSameDay(first: number, second: number): boolean {
    const tag: string = '[DateUtils#isSameDay]';
    Logger.enter(tag, 'first: ' + first.toString() + ', second: ' + second.toString());
    Logger.beginTrace('NetworkSecurity.utils.isSameDay', 1);
    // Compare local year, month and day so boundaries follow the device.
    const firstMoment: Date = new Date(first);
    const secondMoment: Date = new Date(second);
    const result: boolean = firstMoment.getFullYear() === secondMoment.getFullYear()
      && firstMoment.getMonth() === secondMoment.getMonth()
      && firstMoment.getDate() === secondMoment.getDate();
    Logger.exit(tag, 'result: ' + result.toString());
    Logger.endTrace('NetworkSecurity.utils.isSameDay', 1);
    return result;
  }

  /**
   * Render a timestamp as a fixed ISO-8601 UTC string, for example
   * 2026-01-02T03:04:05.678Z.
   * @param timestamp epoch milliseconds to render.
   * @returns the ISO-8601 UTC representation of the timestamp.
   */
  static toUtc(timestamp: number): string {
    const tag: string = '[DateUtils#toUtc]';
    Logger.enter(tag, 'timestamp: ' + timestamp.toString());
    Logger.beginTrace('NetworkSecurity.utils.toUtc', 1);
    // toISOString always renders UTC with millisecond precision.
    const result: string = new Date(timestamp).toISOString();
    Logger.exit(tag, 'result: ' + result);
    Logger.endTrace('NetworkSecurity.utils.toUtc', 1);
    return result;
  }

  /**
   * Pad a number to two digits with a leading zero when needed.
   * @param value non-negative number below one hundred.
   * @returns the two-character text form of the value.
   */
  private static padTwo(value: number): string {
    // Values below ten need one manually prepended zero digit.
    if (value < 10) {
      return '0' + value.toString();
    }
    return value.toString();
  }
}
