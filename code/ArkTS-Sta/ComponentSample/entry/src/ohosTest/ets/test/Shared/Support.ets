'use static';

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

import hilog from '@ohos.hilog';

/**
 * Single logging entry point for the whole ComponentSample suite.
 * Every log line is produced through hilog so that the suite never
 * depends on console output being captured by the host runner.
 */
export function logSuite(name: string, state: string): void {
  hilog.info(0x0000, 'ComponentSampleTest', '%{public}s %{public}s', name, state);
}

export function logStep(name: string, step: string, detail: string): void {
  hilog.debug(0x0000, 'ComponentSampleTest', '%{public}s %{public}s %{public}s', name, step, detail);
}

export const WEEK_LABELS: string[] = ['日', '一', '二', '三', '四', '五', '六'];
export const MONTH_LABELS: string[] = [
  '一月',
  '二月',
  '三月',
  '四月',
  '五月',
  '六月',
  '七月',
  '八月',
  '九月',
  '十月',
  '十一月',
  '十二月',
];

/**
 * Gregorian leap year rule, written from the calendar definition rather than
 * from any production helper. Used by the suite as an independent oracle.
 */
export function isLeapYear(year: int): boolean {
  if (year % 400 === 0) {
    return true;
  }
  if (year % 100 === 0) {
    return false;
  }
  return year % 4 === 0;
}

/**
 * Number of days in a month, valid for month values 1..12. The day counts are
 * an explicit table plus the leap rule, so the value never depends on Date.
 */
export function daysInMonth(month: int, year: int): int {
  if (month === 2) {
    return isLeapYear(year) ? 29 : 28;
  }
  if (month === 4 || month === 6 || month === 9 || month === 11) {
    return 30;
  }
  return 31;
}

/**
 * Day-of-week of the first day of a month using Sakamoto's algorithm with
 * Sunday mapped to 0, matching the calendar week used by the sample pages.
 */
export function firstWeekday(month: int, year: int): int {
  const table: int[] = [0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4];
  let y: int = year;
  let m: int = month;
  if (m < 3) {
    y = y - 1;
  }
  const leapTerm: int = Math.floor(y / 4).toInt() - Math.floor(y / 100).toInt() + Math.floor(y / 400).toInt();
  const raw: int = y + leapTerm + table[m - 1] + 1;
  return raw % 7;
}

/**
 * Normalises a possibly out-of-range month the same way the Gregorian
 * calendar does: month 13 of year Y is month 1 of year Y + 1.
 * Returns [year, month] encoded in a two slot array.
 */
export function normalizeMonth(month: int, year: int): int[] {
  const linear: int = year * 12 + (month - 1);
  const normalizedYear: int = Math.floor(linear / 12).toInt();
  const normalizedMonth: int = linear - normalizedYear * 12 + 1;
  const pair: int[] = [normalizedYear, normalizedMonth];
  return pair;
}

/**
 * Builds the expected 7-column calendar grid: leading placeholders, the days
 * of the month, then trailing placeholders up to the Saturday column.
 */
export function expectedGrid(month: int, year: int): int[] {
  const normalized: int[] = normalizeMonth(month, year);
  const normalizedYear: int = normalized[0];
  const normalizedMonth: int = normalized[1];
  const lead: int = firstWeekday(normalizedMonth, normalizedYear);
  const total: int = daysInMonth(normalizedMonth, normalizedYear);
  const grid: int[] = [];
  for (let index = 0; index < lead; index++) {
    grid.push(0);
  }
  for (let day = 1; day <= total; day++) {
    grid.push(day);
  }
  const lastWeekday: int = (lead + total - 1) % 7;
  const trailing: int = 6 - lastWeekday;
  for (let index = 0; index < trailing; index++) {
    grid.push(0);
  }
  return grid;
}

/** Number of trailing placeholders the oracle expects for a given month. */
export function expectedTrailingZeros(month: int, year: int): int {
  const normalized: int[] = normalizeMonth(month, year);
  const total: int = daysInMonth(normalized[1], normalized[0]);
  const lead: int = firstWeekday(normalized[1], normalized[0]);
  const lastWeekday: int = (lead + total - 1) % 7;
  return 6 - lastWeekday;
}

/** Number of leading placeholders the oracle expects for a given month. */
export function expectedLeadingZeros(month: int, year: int): int {
  const normalized: int[] = normalizeMonth(month, year);
  return firstWeekday(normalized[1], normalized[0]);
}

/** Number of real day entries the oracle expects for a given month. */
export function expectedDayCount(month: int, year: int): int {
  const normalized: int[] = normalizeMonth(month, year);
  return daysInMonth(normalized[1], normalized[0]);
}

export function countValue(values: int[], target: int): int {
  let count: int = 0;
  for (let index = 0; index < values.length; index++) {
    if (values[index] === target) {
      count = count + 1;
    }
  }
  return count;
}

export function sumValues(values: int[]): int {
  let total: int = 0;
  for (let index = 0; index < values.length; index++) {
    total = total + values[index];
  }
  return total;
}

export function firstNonZero(values: int[]): int {
  for (let index = 0; index < values.length; index++) {
    if (values[index] !== 0) {
      return index;
    }
  }
  return -1;
}

export function lastNonZero(values: int[]): int {
  for (let index = values.length - 1; index >= 0; index--) {
    if (values[index] !== 0) {
      return index;
    }
  }
  return -1;
}

export function joined(values: int[]): string {
  let text: string = '';
  for (let index = 0; index < values.length; index++) {
    if (index > 0) {
      text = text + ',';
    }
    text = text + values[index].toString();
  }
  return text;
}

/** True when two integer arrays carry exactly the same values in order. */
export function sameIntArray(left: int[], right: int[]): boolean {
  if (left.length !== right.length) {
    return false;
  }
  for (let index = 0; index < left.length; index++) {
    if (left[index] !== right[index]) {
      return false;
    }
  }
  return true;
}

/** Index of the first difference between two integer arrays, or -1. */
export function firstDifference(left: int[], right: int[]): int {
  const shorter: int = left.length < right.length ? left.length : right.length;
  for (let index = 0; index < shorter; index++) {
    if (left[index] !== right[index]) {
      return index;
    }
  }
  if (left.length === right.length) {
    return -1;
  }
  return shorter;
}

/** Column of a grid slot, 0 for Sunday through 6 for Saturday. */
export function columnOf(slot: int): int {
  return slot % 7;
}

/** Row of a grid slot inside the month panel. */
export function rowOf(slot: int): int {
  return Math.floor(slot / 7).toInt();
}

/** True when the slot holds a real day number rather than a filler zero. */
export function isRealDay(values: int[], slot: int): boolean {
  if (slot < 0 || slot >= values.length) {
    return false;
  }
  return values[slot] > 0;
}

/** Sequence of real day numbers contained in a grid, placeholders removed. */
export function realDays(values: int[]): int[] {
  const result: int[] = [];
  for (let index = 0; index < values.length; index++) {
    if (values[index] > 0) {
      result.push(values[index]);
    }
  }
  return result;
}

/** Checks that the real day numbers form the run 1, 2, ... total. */
export function isContiguousFromOne(values: int[]): boolean {
  const days: int[] = realDays(values);
  for (let index = 0; index < days.length; index++) {
    if (days[index] !== index + 1) {
      return false;
    }
  }
  return days.length > 0;
}

/** Clamps an integer into the inclusive range. */
export function clamp(value: int, low: int, high: int): int {
  if (value < low) {
    return low;
  }
  if (value > high) {
    return high;
  }
  return value;
}

/** Two digit zero padded rendering used by month labels. */
export function pad2(value: int): string {
  return value < 10 ? '0' + value.toString() : value.toString();
}

/** Sample page month label, for example "2024年 3月". */
export function monthLabel(month: int, year: int): string {
  return year.toString() + '年 ' + month.toString() + '月';
}

/** FNV style rolling hash over integers, kept inside safe integer range. */
export function fingerprint(values: int[]): int {
  let hash: number = 216613;
  for (let index = 0; index < values.length; index++) {
    hash = (hash * 31 + values[index]) % 1000003;
  }
  return hash.toInt();
}

/** Rolling hash over a string, used to compare event traces. */
export function textFingerprint(text: string): int {
  let hash: number = 216613;
  for (let index = 0; index < text.length; index++) {
    hash = (hash * 31 + text.charCodeAt(index)) % 1000003;
  }
  return hash.toInt();
}

/** Reverses a copy of the supplied integers without touching the input. */
export function reversed(values: int[]): int[] {
  const result: int[] = [];
  for (let index = values.length - 1; index >= 0; index--) {
    result.push(values[index]);
  }
  return result;
}

/** Number of full weeks represented by a calendar grid length. */
export function weekRows(length: int): int {
  return Math.floor(length / 7).toInt();
}
