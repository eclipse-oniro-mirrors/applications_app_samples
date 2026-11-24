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

// Independent helpers used by the colour suites. They deliberately re-implement
// the arithmetic instead of calling into the UI layer, so expectations do not
// come from the code under test.
export function hexChannel(hex: string, index: number): number {
  const start: int = (1 + index * 2).toInt();
  return parseInt(hex.substring(start, start + 2), 16);
}

export function channelSum(hex: string): number {
  return hexChannel(hex, 0) + hexChannel(hex, 1) + hexChannel(hex, 2);
}

export function channelSpread(hex: string): number {
  const r: number = hexChannel(hex, 0);
  const g: number = hexChannel(hex, 1);
  const b: number = hexChannel(hex, 2);
  const max: number = Math.max(r, Math.max(g, b));
  const min: number = Math.min(r, Math.min(g, b));
  return max - min;
}

export function brightChannel(hex: string, index: number): number {
  return hexChannel(hex, index);
}

export function relativeLuminance(hex: string): number {
  const values: number[] = [hexChannel(hex, 0), hexChannel(hex, 1), hexChannel(hex, 2)];
  const linear: number[] = [];
  for (let index = 0; index < values.length; index++) {
    const scaled: number = values[index] / 255;
    if (scaled <= 0.03928) {
      linear.push(scaled / 12.92);
    } else {
      linear.push(Math.pow((scaled + 0.055) / 1.055, 2.4));
    }
  }
  return 0.2126 * linear[0] + 0.7152 * linear[1] + 0.0722 * linear[2];
}

export function contrastRatio(first: string, second: string): number {
  const a: number = relativeLuminance(first);
  const b: number = relativeLuminance(second);
  const lighter: number = Math.max(a, b);
  const darker: number = Math.min(a, b);
  return (lighter + 0.05) / (darker + 0.05);
}

export function round4(value: number): number {
  return Math.round(value * 10000) / 10000;
}

export function toHex(value: number): string {
  const upper: string = Math.max(0, Math.min(255, Math.round(value))).toString(16).toUpperCase();
  return upper.length === 1 ? '0' + upper : upper;
}

export function channelDistance(first: string, second: string, index: number): number {
  return Math.abs(hexChannel(first, index) - hexChannel(second, index));
}

export function hexDistance(first: string, second: string): number {
  return channelDistance(first, second, 0) + channelDistance(first, second, 1) + channelDistance(first, second, 2);
}

export function hexByteDistance(first: string, second: string): number {
  const dr: number = channelDistance(first, second, 0);
  const dg: number = channelDistance(first, second, 1);
  const db: number = channelDistance(first, second, 2);
  return Math.round(Math.sqrt(dr * dr + dg * dg + db * db));
}

export function dominantChannel(hex: string): string {
  const r: number = hexChannel(hex, 0);
  const g: number = hexChannel(hex, 1);
  const b: number = hexChannel(hex, 2);
  if (r >= g && r >= b) {
    return 'r';
  }
  if (g >= b) {
    return 'g';
  }
  return 'b';
}

export function isUppercaseHex(hex: string): boolean {
  if (hex.length !== 7 || hex.substring(0, 1) !== '#') {
    return false;
  }
  for (let index = 1; index < hex.length; index++) {
    const code: number = hex.charCodeAt(index);
    const digit: boolean = code >= 48 && code <= 57;
    const upper: boolean = code >= 65 && code <= 70;
    if (!digit && !upper) {
      return false;
    }
  }
  return true;
}

export function hasSurrogatePair(value: string): boolean {
  for (let index = 0; index < value.length - 1; index++) {
    const code: number = value.charCodeAt(index);
    if (code >= 0xD800 && code <= 0xDBFF) {
      return true;
    }
  }
  return false;
}

export function countSurrogateHigh(value: string): number {
  let count: number = 0;
  for (let index = 0; index < value.length; index++) {
    const code: number = value.charCodeAt(index);
    if (code >= 0xD800 && code <= 0xDBFF) {
      count++;
    }
  }
  return count;
}

export function codePointLength(value: string): number {
  return value.length - countSurrogateHigh(value);
}

export function utf8Length(value: string): number {
  let bytes: number = 0;
  for (let index = 0; index < value.length; index++) {
    const code: number = value.charCodeAt(index);
    if (code < 0x80) {
      bytes += 1;
    } else if (code < 0x800) {
      bytes += 2;
    } else if (code >= 0xD800 && code <= 0xDBFF) {
      bytes += 4;
      index++;
    } else {
      bytes += 3;
    }
  }
  return bytes;
}

export function countOf(value: string, needle: string): number {
  let count: number = 0;
  let from: int = 0;
  while (true) {
    const found: int = value.indexOf(needle, from);
    if (found < 0) {
      break;
    }
    count++;
    from = found + needle.length;
  }
  return count;
}
