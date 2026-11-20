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
 * Single logging entry point for every suite. All messages stay in English and
 * never print user supplied payloads, so the suite never leaks draft bodies.
 */
export function logSuite(name: string, state: string): void {
  hilog.info(0x0000, 'NestedSlideTest', '%{public}s %{public}s', name, state);
}

/**
 * Counts non overlapping occurrences of needle inside value. Written as a
 * manual scan so the helper itself is independent from String.split.
 */
export function occurrences(value: string, needle: string): number {
  if (needle.length === 0) {
    return 0;
  }
  let count: number = 0;
  let from: int = 0;
  while (from <= value.length - needle.length) {
    const found: int = value.indexOf(needle, from);
    if (found < 0) {
      break;
    }
    count++;
    from = found + needle.length;
  }
  return count;
}

/**
 * Splits value on a one character separator without relying on RegExp.
 */
export function splitParts(value: string, separator: string): Array<string> {
  return value.split(separator);
}

/**
 * Counts ASCII digits inside value. Used by the timestamp format oracle.
 */
export function digitCount(value: string): number {
  let count: number = 0;
  for (let index = 0; index < value.length; index++) {
    const code: number = value.charCodeAt(index);
    if (code >= 48 && code <= 57) {
      count++;
    }
  }
  return count;
}

/**
 * Returns true when every character of value is an ASCII digit.
 */
export function allDigits(value: string): boolean {
  if (value.length === 0) {
    return false;
  }
  for (let index = 0; index < value.length; index++) {
    const code: number = value.charCodeAt(index);
    if (code < 48 || code > 57) {
      return false;
    }
  }
  return true;
}

/**
 * Counts Unicode code points, folding surrogate pairs into one unit.
 */
export function codePointCount(value: string): number {
  let count: number = 0;
  for (let index = 0; index < value.length; index++) {
    const code: number = value.charCodeAt(index);
    if (code >= 0xD800 && code <= 0xDBFF && index + 1 < value.length) {
      const next: number = value.charCodeAt(index + 1);
      if (next >= 0xDC00 && next <= 0xDFFF) {
        index++;
      }
    }
    count++;
  }
  return count;
}

/**
 * True when value contains at least one UTF-16 surrogate pair.
 */
export function hasSurrogatePair(value: string): boolean {
  for (let index = 0; index < value.length - 1; index++) {
    const high: number = value.charCodeAt(index);
    const low: number = value.charCodeAt(index + 1);
    if (high >= 0xD800 && high <= 0xDBFF && low >= 0xDC00 && low <= 0xDFFF) {
      return true;
    }
  }
  return false;
}

/**
 * True when a string only contains whitespace characters (space, tab, CR, LF).
 */
export function isBlank(value: string): boolean {
  if (value.length === 0) {
    return true;
  }
  for (let index = 0; index < value.length; index++) {
    const code: number = value.charCodeAt(index);
    const isSpace: boolean = code === 32 || code === 9 || code === 10 || code === 13;
    if (!isSpace) {
      return false;
    }
  }
  return true;
}
