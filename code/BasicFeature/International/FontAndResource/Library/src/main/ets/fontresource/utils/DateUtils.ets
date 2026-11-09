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

// Pure date and time helpers built on the standard Date object, safe for any thread.
export class DateUtils {
  // Number of milliseconds in one second, used for second based conversions.
  static readonly MS_PER_SECOND: number = 1000;
  // Number of milliseconds in one minute.
  static readonly MS_PER_MINUTE: number = 60 * 1000;
  // Number of milliseconds in one hour.
  static readonly MS_PER_HOUR: number = 60 * 60 * 1000;
  // Number of milliseconds in one day.
  static readonly MS_PER_DAY: number = 24 * 60 * 60 * 1000;

  // Pads a single-digit number with one leading zero.
  private static pad(value: number): string {
    // Prefix small values with one leading zero.
    return value < 10 ? '0' + value.toString() : value.toString();
  }

  // Formats the date as "yyyy-MM-dd".
  static formatDate(date: Date): string {
    // Compose the four digit year with leading zeros for years below one thousand.
    const yearNumber: number = date.getFullYear();
    const year: string = yearNumber < 10 ? '000' + yearNumber.toString() : yearNumber < 100 ?
      '00' + yearNumber.toString() : yearNumber < 1000 ? '0' + yearNumber.toString() : yearNumber.toString();
    // Compose the zero-padded month (Date months are zero based).
    const month: string = DateUtils.pad(date.getMonth() + 1);
    // Compose the zero-padded day of month.
    const day: string = DateUtils.pad(date.getDate());
    // Join the parts with dashes.
    return year + '-' + month + '-' + day;
  }

  // Formats the date as "HH:mm:ss" in 24-hour form.
  static formatTime(date: Date): string {
    // Compose the zero-padded hour.
    const hour: string = DateUtils.pad(date.getHours());
    // Compose the zero-padded minute.
    const minute: string = DateUtils.pad(date.getMinutes());
    // Compose the zero-padded second.
    const second: string = DateUtils.pad(date.getSeconds());
    // Join the parts with colons.
    return hour + ':' + minute + ':' + second;
  }

  // Formats the date as "yyyy-MM-dd HH:mm:ss".
  static formatDateTime(date: Date): string {
    // Append the time portion after the date portion separated by one space.
    return DateUtils.formatDate(date) + ' ' + DateUtils.formatTime(date);
  }

  // Formats the date as "yyyy-MM-dd HH:mm:ss.SSS" including milliseconds.
  static formatFull(date: Date): string {
    // Read the raw millisecond part.
    const ms: number = date.getMilliseconds();
    // Compose the three digit millisecond part with leading zeros.
    const msText: string = ms < 10 ? '00' + ms.toString() : ms < 100 ? '0' + ms.toString() : ms.toString();
    // Append the millisecond part after the seconds with a dot separator.
    return DateUtils.formatDateTime(date) + '.' + msText;
  }

  // Returns "yyyy-MM-dd" for the current instant.
  static todayText(): string {
    // Delegate to formatDate with a fresh Date instance.
    return DateUtils.formatDate(new Date());
  }

  // Returns "HH:mm:ss" for the current instant.
  static nowTimeText(): string {
    // Delegate to formatTime with a fresh Date instance.
    return DateUtils.formatTime(new Date());
  }

  // Returns the current epoch time in milliseconds.
  static nowMs(): number {
    // Read the wall clock once.
    return Date.now();
  }

  // Converts an epoch millisecond value into a "yyyy-MM-dd HH:mm:ss" string.
  static fromEpochMs(epochMs: number): string {
    // Wrap the epoch value into a Date and format it.
    return DateUtils.formatDateTime(new Date(epochMs));
  }

  // Computes the absolute difference in milliseconds between two dates.
  static diffMs(start: Date, end: Date): number {
    // Subtract the epoch values and drop the sign.
    return Math.abs(end.getTime() - start.getTime());
  }

  // Returns a human readable duration text such as "1h 2m 3s" from a millisecond span.
  static durationText(spanMs: number): string {
    // Split the span into whole hours.
    const hours: number = Math.floor(spanMs / DateUtils.MS_PER_HOUR);
    // Split the remainder into whole minutes.
    const minutes: number = Math.floor((spanMs % DateUtils.MS_PER_HOUR) / DateUtils.MS_PER_MINUTE);
    // Split the remainder into whole seconds.
    const seconds: number = Math.floor((spanMs % DateUtils.MS_PER_MINUTE) / DateUtils.MS_PER_SECOND);
    // Show only the seconds when the span is under one minute.
    if (hours === 0 && minutes === 0) {
      // Compose the short form text.
      return seconds.toString() + 's';
    }
    // Show minutes and seconds when the span is under one hour.
    if (hours === 0) {
      // Compose the medium form text.
      return minutes.toString() + 'm ' + seconds.toString() + 's';
    }
    // Compose the full form text including hours.
    return hours.toString() + 'h ' + minutes.toString() + 'm ' + seconds.toString() + 's';
  }

  // Returns true when both dates fall on the same calendar day.
  static isSameDay(a: Date, b: Date): boolean {
    // Compare year, month and day fields one by one.
    return a.getFullYear() === b.getFullYear() && a.getMonth() === b.getMonth() &&
      a.getDate() === b.getDate();
  }

  // Returns a new Date shifted by the requested number of days.
  static addDays(date: Date, days: number): Date {
    // Copy the source date so the original is never mutated.
    const shifted: Date = new Date(date.getTime());
    // Move the copy forward or backward by the day count.
    shifted.setDate(shifted.getDate() + days);
    // Return the shifted copy.
    return shifted;
  }

  // Returns the zero-based weekday number, Monday is 0 and Sunday is 6.
  static weekdayIndex(date: Date): number {
    // Map the JS Sunday-first value into a Monday-first index.
    const jsDay: number = date.getDay();
    // Shift Sunday from 0 to the last slot.
    return jsDay === 0 ? 6 : jsDay - 1;
  }
}
