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

// Divisor for the kilobyte range.
const KILO_UNIT: number = 1024;
// Divisor for the megabyte range.
const MEGA_UNIT: number = 1024 * 1024;
// Divisor for the gigabyte range.
const GIGA_UNIT: number = 1024 * 1024 * 1024;
// Number of fraction digits kept when scaling into a larger unit.
const DECIMAL_BASE: number = 2;
// Placeholder returned for negative or empty inputs.
const PLACEHOLDER: string = '-';

/**
 * Render a byte count using the largest fitting binary unit.
 * @param bytes byte count to render; negative values yield a placeholder.
 * @returns text like "1.50 MB", or "-" for negative inputs.
 */
export function formatBytes(bytes: number): string {
  const tag: string = '[Format#formatBytes]';
  Logger.enter(tag, 'bytes: ' + bytes.toString());
  Logger.beginTrace('NetworkSecurity.utils.formatBytes', 1);
  // Pick the largest unit first so one scale-in branch runs at most once.
  let text: string = PLACEHOLDER;
  if (bytes < 0) {
    text = PLACEHOLDER;
  } else if (bytes >= GIGA_UNIT) {
    // Scale to GB and keep two fraction digits.
    text = (bytes / GIGA_UNIT).toFixed(DECIMAL_BASE) + ' GB';
  } else if (bytes >= MEGA_UNIT) {
    // Scale to MB and keep two fraction digits.
    text = (bytes / MEGA_UNIT).toFixed(DECIMAL_BASE) + ' MB';
  } else if (bytes >= KILO_UNIT) {
    // Scale to KB and keep two fraction digits.
    text = (bytes / KILO_UNIT).toFixed(DECIMAL_BASE) + ' KB';
  } else {
    // Small values stay in plain bytes without scaling.
    text = bytes + ' B';
  }
  Logger.exit(tag, 'text: ' + text);
  Logger.endTrace('NetworkSecurity.utils.formatBytes', 1);
  return text;
}

/**
 * Join a numeric array into one comma separated line of text.
 * @param values numbers to join; an empty array yields a placeholder.
 * @returns text like "1, 2, 3", or "-" when the array is empty.
 */
export function joinNumbers(values: number[]): string {
  const tag: string = '[Format#joinNumbers]';
  Logger.enter(tag, 'count: ' + values.length.toString());
  Logger.beginTrace('NetworkSecurity.utils.joinNumbers', 1);
  // Empty input has no join result, so fall back to the placeholder.
  let text: string = PLACEHOLDER;
  if (values.length === 0) {
    text = PLACEHOLDER;
  } else {
    // Append each number, prepending the comma separator after the first.
    for (let index = 0; index < values.length; index++) {
      text = index === 0 ? values[index].toString() : text + ', ' + values[index].toString();
    }
  }
  Logger.exit(tag, 'text: ' + text);
  Logger.endTrace('NetworkSecurity.utils.joinNumbers', 1);
  return text;
}

/**
 * Compute the milliseconds elapsed since the given start timestamp.
 * @param startedAt start point captured from Date.now().
 * @returns the non-negative elapsed duration in milliseconds.
 */
export function elapsedMilliseconds(startedAt: number): number {
  const tag: string = '[Format#elapsedMilliseconds]';
  Logger.enter(tag, 'startedAt: ' + startedAt.toString());
  Logger.beginTrace('NetworkSecurity.utils.elapsedMilliseconds', 1);
  // The difference between now and the captured start is the duration.
  const result: number = Date.now() - startedAt;
  Logger.exit(tag, 'result: ' + result.toString());
  Logger.endTrace('NetworkSecurity.utils.elapsedMilliseconds', 1);
  return result;
}
