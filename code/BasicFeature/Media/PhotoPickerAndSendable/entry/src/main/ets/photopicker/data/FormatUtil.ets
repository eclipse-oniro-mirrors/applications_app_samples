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

// Number of bytes inside one kilobyte, kept as a constant so the ladder below stays readable.
const BYTES_PER_KB: number = 1024;
// Number of bytes inside one megabyte, derived from the kilobyte step to avoid magic numbers.
const BYTES_PER_MB: number = BYTES_PER_KB * 1024;
// Number of bytes inside one gigabyte, derived from the megabyte step for the same reason.
const BYTES_PER_GB: number = BYTES_PER_MB * 1024;
// Percentage base used by the percent helper, expressed once so rounding stays consistent.
const ONE_HUNDRED: number = 100;

/**
 * Pure formatting helpers shared by the picker pages.
 * Every method is side-effect free, therefore no logging or tracing is attached here:
 * the callers already trace the user-visible operation that consumes these values.
 */
export class FormatUtil {
  /**
   * Converts a raw byte count into a short human readable size string.
   * @param size Size in bytes; values below one kilobyte stay in bytes.
   * @returns A string such as "820 B", "12.3 KB", "4.56 MB" or "1.23 GB".
   */
  static bytes(size: number): string {
    // Sub-kilobyte values read better as plain bytes with no decimal part.
    if (size < BYTES_PER_KB) {
      return `${size} B`;
    }
    // Kilobyte range keeps one decimal so file sizes still look precise.
    if (size < BYTES_PER_MB) {
      return `${(size / BYTES_PER_KB).toFixed(1)} KB`;
    }
    // Megabyte range uses two decimals, which is the common gallery convention.
    if (size < BYTES_PER_GB) {
      return `${(size / BYTES_PER_MB).toFixed(2)} MB`;
    }
    // Anything larger falls back to gigabytes, the largest unit this sample needs.
    return `${(size / BYTES_PER_GB).toFixed(2)} GB`;
  }

  /**
   * Formats a timestamp as "yyyy-MM-dd HH:mm" using the device local time zone.
   * @param millis Milliseconds since the Unix epoch.
   * @returns A local-time date and minute string.
   */
  static time(millis: number): string {
    // Wrap the raw millisecond value so the built-in local time conversion can be used.
    const date: Date = new Date(millis);
    // Date part is assembled from zero padded local fields to keep the width stable.
    const day: string = `${date.getFullYear()}-${FormatUtil.pad(date.getMonth() + 1)}-${FormatUtil.pad(date.getDate())}`;
    // Clock part drops seconds because the picker only shows minute precision.
    const clock: string = `${FormatUtil.pad(date.getHours())}:${FormatUtil.pad(date.getMinutes())}`;
    // Join both halves with a single space to keep one canonical layout.
    return `${day} ${clock}`;
  }

  /**
   * Computes an integer percentage of part over total.
   * @param part Numerator, usually the processed item count.
   * @param total Denominator, usually the whole item count.
   * @returns A rounded integer in [0, 100]; a non-positive total yields 0 to avoid NaN.
   */
  static percent(part: number, total: number): number {
    // Guard the division so callers never see Infinity or NaN in the UI.
    if (total <= 0) {
      return 0;
    }
    // Round once at the end so the displayed value never carries decimals.
    return Math.round(part * ONE_HUNDRED / total);
  }

  /**
   * Zero pads a value below ten so date and time fields keep a fixed width.
   * @param value Number to pad; negative values are passed through unchanged.
   * @returns A two character string for 0-9 values, otherwise the plain number.
   */
  private static pad(value: number): string {
    // Only single digit values need the leading zero.
    return value < 10 ? `0${value}` : `${value}`;
  }
}
