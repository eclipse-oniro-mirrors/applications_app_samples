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

import { AppLogger } from '../AppLogger';

/** Default output pattern: 'yyyy-MM-dd HH:mm:ss' in local time. */
const DEFAULT_DATE_PATTERN: string = 'yyyy-MM-dd HH:mm:ss';
/** Milliseconds in one second. */
const MS_PER_SECOND: number = 1000;
/** Seconds in one minute. */
const SECONDS_PER_MINUTE: number = 60;
/** Minutes in one hour. */
const MINUTES_PER_HOUR: number = 60;
/** Width of a two digit padded time field. */
const PAD_WIDTH_TWO: number = 2;
/** Supported pattern tokens ordered from longest to shortest. */
const DATE_TIME_TOKENS: string[] = ['yyyy', 'MM', 'dd', 'HH', 'mm', 'ss'];

/**
 * Utility class for date and time operations based on the built-in Date object.
 * All methods are static and never throw; invalid inputs log a warning.
 */
export class DateUtils {
  /**
   * Returns the current wall clock time in milliseconds since the epoch.
   */
  public static nowMillis(): number {
    return Date.now();
  }

  /**
   * Formats a millisecond timestamp with the default 'yyyy-MM-dd HH:mm:ss' pattern.
   */
  public static formatTimestamp(millis: number): string {
    return DateUtils.formatTimestampWithPattern(millis, DEFAULT_DATE_PATTERN);
  }

  /**
   * Formats a millisecond timestamp with a simple local time pattern.
   * Supported tokens: yyyy, MM, dd, HH, mm, ss.
   */
  public static formatTimestampWithPattern(millis: number, pattern: string): string {
    // Negative or non-finite timestamps cannot be rendered, warn and fail soft.
    if (!Number.isFinite(millis) || millis < 0) {
      AppLogger.warn('DateUtils', `formatTimestampWithPattern called with invalid millis: ${millis}`);
      return '';
    }
    let effectivePattern: string = pattern;
    if (effectivePattern.length === 0) {
      // An empty pattern would erase the whole output, fall back to the default.
      AppLogger.warn('DateUtils', 'formatTimestampWithPattern called with an empty pattern, fallback to default');
      effectivePattern = DEFAULT_DATE_PATTERN;
    }
    const date: Date = new Date(millis);
    // Build token to padded value pairs once, then substitute in order.
    const replacements: Map<string, string> = new Map<string, string>();
    replacements.set('yyyy', `${date.getFullYear()}`);
    // getMonth() is zero based, so one must be added for display.
    replacements.set('MM', DateUtils.pad(date.getMonth() + 1));
    replacements.set('dd', DateUtils.pad(date.getDate()));
    replacements.set('HH', DateUtils.pad(date.getHours()));
    replacements.set('mm', DateUtils.pad(date.getMinutes()));
    replacements.set('ss', DateUtils.pad(date.getSeconds()));
    let result: string = effectivePattern;
    // Replace longer tokens first to avoid partial matches.
    for (const token of DATE_TIME_TOKENS) {
      const value: string | undefined = replacements.get(token);
      if (value !== undefined) {
        result = result.split(token).join(value);
      }
    }
    return result;
  }

  /**
   * Formats a duration as 'HH:mm:ss', the hour part may exceed two digits.
   */
  public static formatDuration(millis: number): string {
    if (!Number.isFinite(millis) || millis < 0) {
      AppLogger.warn('DateUtils', `formatDuration called with invalid millis: ${millis}`);
      return '';
    }
    // Reduce the duration into hours, minutes and seconds.
    const totalSeconds: number = Math.floor(millis / MS_PER_SECOND);
    const seconds: number = totalSeconds % SECONDS_PER_MINUTE;
    const totalMinutes: number = Math.floor(totalSeconds / SECONDS_PER_MINUTE);
    const minutes: number = totalMinutes % MINUTES_PER_HOUR;
    const hours: number = Math.floor(totalMinutes / MINUTES_PER_HOUR);
    return `${DateUtils.pad(hours)}:${DateUtils.pad(minutes)}:${DateUtils.pad(seconds)}`;
  }

  /**
   * Returns the elapsed milliseconds since the given start point.
   * Logs a warning and returns 0 when startMillis is invalid.
   */
  public static elapsedSince(startMillis: number): number {
    if (!Number.isFinite(startMillis) || startMillis < 0) {
      AppLogger.warn('DateUtils', `elapsedSince called with invalid startMillis: ${startMillis}`);
      return 0;
    }
    // Simple difference between now and the given start point.
    return Date.now() - startMillis;
  }

  /**
   * Checks whether both timestamps fall on the same local calendar day.
   */
  public static isSameDay(firstMillis: number, secondMillis: number): boolean {
    // Either timestamp invalid means they cannot be compared, warn and return false.
    if (!Number.isFinite(firstMillis) || !Number.isFinite(secondMillis) ||
      firstMillis < 0 || secondMillis < 0) {
      AppLogger.warn('DateUtils', `isSameDay called with invalid input: ${firstMillis}, ${secondMillis}`);
      return false;
    }
    const first: Date = new Date(firstMillis);
    const second: Date = new Date(secondMillis);
    // Same day requires equal year, month and day-of-month components.
    return first.getFullYear() === second.getFullYear() &&
      first.getMonth() === second.getMonth() &&
      first.getDate() === second.getDate();
  }

  /**
   * Pads a numeric time component to at least two digits.
   */
  private static pad(value: number): string {
    return value.toString().padStart(PAD_WIDTH_TWO, '0');
  }
}
