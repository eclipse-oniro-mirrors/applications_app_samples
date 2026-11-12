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

// Milliseconds in one second.
const MS_PER_SECOND: number = 1000;
// Milliseconds in one minute.
const MS_PER_MINUTE: number = 60 * MS_PER_SECOND;
// Milliseconds in one hour.
const MS_PER_HOUR: number = 60 * MS_PER_MINUTE;
// Milliseconds in one day.
const MS_PER_DAY: number = 24 * MS_PER_HOUR;
// Number of days in one week, used by the relative time helper.
const DAYS_PER_WEEK: number = 7;
// Width of the zero padded numeric fields (month, day, hour, minute, second).
const FIELD_WIDTH: number = 2;
// Padding character of the numeric fields.
const FIELD_PAD: string = '0';
// Separator placed between the date and the time part.
const DATE_TIME_GAP: string = ' ';
// Separator placed between the date fields.
const DATE_FIELD_GAP: string = '-';
// Separator placed between the time fields.
const TIME_FIELD_GAP: string = ':';
// Longest unit used by relativeTime.
const UNIT_MONTH: string = 'month';
// Second longest unit used by relativeTime.
const UNIT_DAY: string = 'day';
// Third longest unit used by relativeTime.
const UNIT_HOUR: string = 'hour';
// Shortest unit used by relativeTime.
const UNIT_MINUTE: string = 'minute';
// Text returned for a timestamp in the near future or in the near past.
const TEXT_JUST_NOW: string = 'just now';
// Prefix of every relative description that points to the future.
const TEXT_IN_PREFIX: string = 'in ';
// Plural suffix appended when a unit count is greater than one.
const TEXT_PLURAL: string = 's';
// Suffix appended to every relative description that points to the past.
const TEXT_AGO: string = ' ago';

/** Calendar formatting options used by formatDate. */
export enum DateFormatStyle {
  YEAR_MONTH_DAY = 0,
  YEAR_MONTH_DAY_TIME = 1
}

/**
 * Date helpers built on top of the standard Date object.
 * All inputs and outputs are epoch milliseconds in the device time zone.
 */
export class DateUtils {
  /**
   * Zero pads a numeric field to two digits.
   * @param value Field value.
   * @returns Padded text.
   */
  private static pad(value: number): string {
    // Convert through String so that no template string is needed.
    const text: string = String(Math.floor(value));
    // Pad the value to the display width.
    return text.padStart(FIELD_WIDTH, FIELD_PAD);
  }

  /**
   * Formats a timestamp as 'YYYY-MM-DD'.
   * @param timestamp Epoch milliseconds.
   * @returns Formatted date text.
   */
  static formatDate(timestamp: number): string {
    // Build the calendar object for the given instant.
    const date: Date = new Date(timestamp);
    // Assemble year, month and day with the fixed separator.
    return String(date.getFullYear()) + DATE_FIELD_GAP + DateUtils.pad(date.getMonth() + 1) + DATE_FIELD_GAP +
      DateUtils.pad(date.getDate());
  }

  /**
   * Formats a timestamp as 'HH:mm:ss'.
   * @param timestamp Epoch milliseconds.
   * @returns Formatted time text.
   */
  static formatTime(timestamp: number): string {
    // Build the calendar object for the given instant.
    const date: Date = new Date(timestamp);
    // Assemble hour, minute and second with the fixed separator.
    return DateUtils.pad(date.getHours()) + TIME_FIELD_GAP + DateUtils.pad(date.getMinutes()) + TIME_FIELD_GAP +
      DateUtils.pad(date.getSeconds());
  }

  /**
   * Formats a timestamp as 'YYYY-MM-DD HH:mm:ss'.
   * @param timestamp Epoch milliseconds.
   * @returns Formatted date and time text.
   */
  static formatDateTime(timestamp: number): string {
    // Join the date part and the time part with a single space.
    return DateUtils.formatDate(timestamp) + DATE_TIME_GAP + DateUtils.formatTime(timestamp);
  }

  /**
   * Returns the first millisecond of the day of the given timestamp.
   * @param timestamp Epoch milliseconds.
   * @returns Epoch milliseconds of 00:00:00.000 local time.
   */
  static dayStart(timestamp: number): number {
    // Build the calendar object for the given instant.
    const date: Date = new Date(timestamp);
    // Move to the local midnight of the same day.
    date.setHours(0, 0, 0, 0);
    // Read the normalized instant back.
    return date.getTime();
  }

  /**
   * Returns the last millisecond of the day of the given timestamp.
   * @param timestamp Epoch milliseconds.
   * @returns Epoch milliseconds of 23:59:59.999 local time.
   */
  static dayEnd(timestamp: number): number {
    // Start from the local midnight of the same day.
    const start: number = DateUtils.dayStart(timestamp);
    // Add the full day length and step one millisecond back.
    return start + MS_PER_DAY - 1;
  }

  /**
   * Returns the first millisecond of today.
   * @returns Epoch milliseconds of today at 00:00:00.000.
   */
  static todayStart(): number {
    // The current instant is the anchor of the calculation.
    return DateUtils.dayStart(Date.now());
  }

  /**
   * Adds a number of days to the given instant.
   * @param timestamp Epoch milliseconds.
   * @param days Days to add, negative values move backwards.
   * @returns Shifted epoch milliseconds.
   */
  static addDays(timestamp: number, days: number): number {
    // Shift the instant by the requested day count.
    return timestamp + days * MS_PER_DAY;
  }

  /**
   * Adds a number of hours to the given instant.
   * @param timestamp Epoch milliseconds.
   * @param hours Hours to add, negative values move backwards.
   * @returns Shifted epoch milliseconds.
   */
  static addHours(timestamp: number, hours: number): number {
    // Shift the instant by the requested hour count.
    return timestamp + hours * MS_PER_HOUR;
  }

  /**
   * Computes the signed distance between two instants.
   * @param start Earlier instant in epoch milliseconds.
   * @param end Later instant in epoch milliseconds.
   * @returns End minus start in milliseconds.
   */
  static diffMs(start: number, end: number): number {
    // A plain subtraction gives the signed distance.
    return end - start;
  }

  /**
   * Computes the signed distance in whole days.
   * @param start Earlier instant in epoch milliseconds.
   * @param end Later instant in epoch milliseconds.
   * @returns Truncated day count, negative when end is before start.
   */
  static diffDays(start: number, end: number): number {
    // Compute the raw distance first.
    const distance: number = end - start;
    // Truncate toward zero so the sign is preserved.
    return distance < 0 ? -Math.floor(-distance / MS_PER_DAY) : Math.floor(distance / MS_PER_DAY);
  }

  /**
   * Describes how far the timestamp lies behind the current instant.
   * @param timestamp Epoch milliseconds of the moment to describe.
   * @returns Text such as '3 minutes ago', 'just now' or 'in 2 hours'.
   */
  static relativeTime(timestamp: number): string {
    // Compare against the current instant to obtain a signed distance.
    const distance: number = Date.now() - timestamp;
    // The absolute distance decides which unit fits best.
    const magnitude: number = distance < 0 ? -distance : distance;
    // A timestamp less than one minute away is reported without a unit.
    if (magnitude < MS_PER_MINUTE) {
      return TEXT_JUST_NOW;
    }
    // Pick the unit that fits the magnitude best.
    const unit: string = DateUtils.pickUnit(magnitude);
    // Convert the magnitude into the chosen unit.
    const count: number = DateUtils.countInUnit(magnitude, unit);
    // Future timestamps are prefixed, past timestamps get a suffix.
    const direction: string = distance < 0 ? TEXT_IN_PREFIX : '';
    // Relative descriptions of the past carry the ' ago' suffix.
    const suffix: string = distance < 0 ? '' : TEXT_AGO;
    // Compose the final text from the direction, the value and the suffix.
    return direction + DateUtils.describeUnit(count, unit) + suffix;
  }

  /**
   * Chooses the display unit that fits the given magnitude best.
   * @param magnitude Positive distance in milliseconds.
   * @returns Unit name accepted by countInUnit.
   */
  private static pickUnit(magnitude: number): string {
    // Minutes cover the range below one hour.
    if (magnitude < MS_PER_HOUR) {
      return UNIT_MINUTE;
    }
    // Hours cover the range below one day.
    if (magnitude < MS_PER_DAY) {
      return UNIT_HOUR;
    }
    // Days cover the range below one week.
    if (magnitude < MS_PER_DAY * DAYS_PER_WEEK) {
      return UNIT_DAY;
    }
    // Everything beyond a week is expressed in months.
    return UNIT_MONTH;
  }

  /**
   * Converts a magnitude in milliseconds into the given unit.
   * @param magnitude Positive distance in milliseconds.
   * @param unit Unit name returned by pickUnit.
   * @returns Truncated unit count.
   */
  private static countInUnit(magnitude: number, unit: string): number {
    // Minutes are the smallest supported unit.
    if (unit === UNIT_MINUTE) {
      return Math.floor(magnitude / MS_PER_MINUTE);
    }
    // Hours follow the minute branch.
    if (unit === UNIT_HOUR) {
      return Math.floor(magnitude / MS_PER_HOUR);
    }
    // Days follow the hour branch.
    if (unit === UNIT_DAY) {
      return Math.floor(magnitude / MS_PER_DAY);
    }
    // A month is approximated by four weeks, precise enough for a relative label.
    return Math.floor(magnitude / (MS_PER_DAY * DAYS_PER_WEEK * 4));
  }

  /**
   * Builds a '<count> <unit>' text with the correct plural suffix.
   * @param count Positive unit count.
   * @param unit Unit name.
   * @returns Composed unit text.
   */
  private static describeUnit(count: number, unit: string): string {
    // Plural suffix only applies when the count exceeds one.
    const suffix: string = count > 1 ? TEXT_PLURAL : '';
    // Join count, unit and suffix by concatenation.
    return String(count) + ' ' + unit + suffix;
  }

  /**
   * Checks whether two instants belong to the same local day.
   * @param first First instant in epoch milliseconds.
   * @param second Second instant in epoch milliseconds.
   * @returns True when both share the same local date.
   */
  static isSameDay(first: number, second: number): boolean {
    // Comparing the two midnights is enough because both use the same time zone.
    return DateUtils.dayStart(first) === DateUtils.dayStart(second);
  }

  /**
   * Returns the current instant in epoch milliseconds.
   * A dedicated wrapper keeps every caller consistent and easy to stub.
   * @returns Current epoch milliseconds.
   */
  static nowMs(): number {
    // Delegate to the platform clock.
    return Date.now();
  }
}
