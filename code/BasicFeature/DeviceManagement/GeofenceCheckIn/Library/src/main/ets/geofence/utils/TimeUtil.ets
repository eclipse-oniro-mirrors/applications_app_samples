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

// Placeholder shown when a timestamp is missing or invalid.
const EMPTY_TIME: string = '--';
// Values below this limit are padded with a leading zero.
const PAD_LIMIT: number = 10;
// Milliseconds in one second, used for the duration conversion.
const MS_PER_SECOND: number = 1000;
// Seconds in one minute, used for the duration conversion.
const SECONDS_PER_MINUTE: number = 60;
// Seconds in one hour, used for the duration conversion.
const SECONDS_PER_HOUR: number = 3600;

/**
 * Pad a number to two characters with a leading zero when needed.
 * @param value the number to format
 * @returns the number as a two character string
 */
export function padTwo(value: number): string {
  // Single digit values get a leading zero.
  if (value < PAD_LIMIT) {
    return '0' + value.toString();
  }
  // Values of two digits and above are used as they are.
  return value.toString();
}

/**
 * Format a timestamp as a local date and time string.
 * @param timestamp the time to format in milliseconds since epoch
 * @returns the formatted "yyyy-MM-dd HH:mm:ss" text, or a placeholder
 */
export function formatDateTime(timestamp: number): string {
  const date: Date = new Date(timestamp);
  if (timestamp <= 0 || Number.isNaN(date.getTime())) {
    return EMPTY_TIME;
  }
  // Compose the date part with padded month and day values.
  const datePart: string = date.getFullYear().toString() + '-' + padTwo(date.getMonth() + 1) + '-' +
    padTwo(date.getDate());
  // Compose the time part with padded hour, minute and second values.
  const timePart: string = padTwo(date.getHours()) + ':' + padTwo(date.getMinutes()) + ':' +
    padTwo(date.getSeconds());
  // Join both parts with one space as the final display text.
  return datePart + ' ' + timePart;
}

/**
 * Format a timestamp as a local time only string.
 * @param timestamp the time to format in milliseconds since epoch
 * @returns the formatted "HH:mm:ss" text, or a placeholder
 */
export function formatTime(timestamp: number): string {
  const date: Date = new Date(timestamp);
  if (timestamp <= 0 || Number.isNaN(date.getTime())) {
    return EMPTY_TIME;
  }
  // Compose the time part with padded hour, minute and second values.
  return padTwo(date.getHours()) + ':' + padTwo(date.getMinutes()) + ':' + padTwo(date.getSeconds());
}

/**
 * Format a duration as an "HH:mm:ss" text.
 * @param durationMs the duration to format in milliseconds
 * @returns the formatted duration text, or a zero duration for invalid values
 */
export function formatDuration(durationMs: number): string {
  // Negative and missing durations render as a zero duration.
  if (durationMs <= 0) {
    return '00:00:00';
  }
  // Convert the duration into whole seconds.
  const totalSeconds: number = Math.floor(durationMs / MS_PER_SECOND);
  // Extract the full hours from the seconds total.
  const hours: number = Math.floor(totalSeconds / SECONDS_PER_HOUR);
  // Extract the remaining minutes after the full hours.
  const minutes: number = Math.floor((totalSeconds % SECONDS_PER_HOUR) / SECONDS_PER_MINUTE);
  // Extract the remaining seconds after the full minutes.
  const seconds: number = totalSeconds % SECONDS_PER_MINUTE;
  // Join the padded parts into the final duration text.
  return padTwo(hours) + ':' + padTwo(minutes) + ':' + padTwo(seconds);
}

/**
 * Compute the start of the local day for a timestamp.
 * @param timestamp any time inside the requested day in milliseconds
 * @returns the day start time in milliseconds since epoch
 */
export function getDayStart(timestamp: number): number {
  // Build the date object for the requested timestamp.
  const date: Date = new Date(timestamp);
  // Reset the local time fields to the first millisecond of the day.
  date.setHours(0, 0, 0, 0);
  // Return the normalized day start as a timestamp.
  return date.getTime();
}
