/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

const SIZE_UNITS: string[] = ['B', 'KB', 'MB', 'GB', 'TB'];
const ILLEGAL_NAME_CHARS: string = '/\\:*?"<>|';
const RESERVED_NAMES: string[] = ['con', 'prn', 'aux', 'nul', 'com1', 'com2', 'lpt1', 'lpt2'];
const MAX_NAME_LENGTH: number = 255;

export function padLeft(value: number, width: number): string {
  let text: string = value.toString();
  while (text.length < width) {
    text = '0' + text;
  }
  return text;
}

function trimTrailingZeros(text: string): string {
  if (text.indexOf('.') < 0) {
    return text;
  }
  let result: string = text;
  while (result.length > 1 && result.endsWith('0')) {
    result = result.substring(0, result.length - 1);
  }
  if (result.endsWith('.')) {
    result = result.substring(0, result.length - 1);
  }
  return result;
}

function isFiniteNumber(value: number): boolean {
  return Number.isFinite(value);
}

export function formatSize(bytes: number, decimals: number): string {
  if (!isFiniteNumber(bytes)) {
    return '0 B';
  }
  const sign: string = bytes < 0 ? '-' : '';
  let value: number = Math.abs(bytes);
  if (value < 1) {
    value = 0;
  }
  let unitIndex: number = 0;
  while (value >= 1024 && unitIndex < SIZE_UNITS.length - 1) {
    value = value / 1024;
    unitIndex += 1;
  }
  if (unitIndex === 0) {
    return sign + Math.round(value).toString() + ' B';
  }
  let fracDigits: number = decimals;
  if (fracDigits < 0) {
    fracDigits = 0;
  }
  if (fracDigits > 3) {
    fracDigits = 3;
  }
  const fixed: string = value.toFixed(fracDigits);
  return sign + trimTrailingZeros(fixed) + ' ' + SIZE_UNITS[unitIndex];
}

export function parseSize(text: string): number {
  const trimmed: string = text.trim();
  if (trimmed.length === 0) {
    return -1;
  }
  let index: number = 0;
  let digits: string = '';
  let dots: number = 0;
  while (index < trimmed.length) {
    const ch: string = trimmed.charAt(index);
    if (ch >= '0' && ch <= '9') {
      digits += ch;
      index += 1;
      continue;
    }
    if (ch === '.' && dots === 0) {
      digits += ch;
      dots += 1;
      index += 1;
      continue;
    }
    break;
  }
  if (digits.length === 0 || digits === '.') {
    return -1;
  }
  let unit: string = trimmed.substring(index).trim().toUpperCase();
  let multiplier: number = 1;
  if (unit === '' || unit === 'B') {
    multiplier = 1;
  } else if (unit === 'K' || unit === 'KB') {
    multiplier = 1024;
  } else if (unit === 'M' || unit === 'MB') {
    multiplier = 1024 * 1024;
  } else if (unit === 'G' || unit === 'GB') {
    multiplier = 1024 * 1024 * 1024;
  } else if (unit === 'T' || unit === 'TB') {
    multiplier = 1024 * 1024 * 1024 * 1024;
  } else {
    return -1;
  }
  const number: number = Number.parseFloat(digits);
  if (!isFiniteNumber(number) || number < 0) {
    return -1;
  }
  return Math.round(number * multiplier);
}

export function formatTimestamp(sec: number, useUtc: boolean): string {
  if (!isFiniteNumber(sec) || sec < 0) {
    return '';
  }
  const date: Date = new Date(Math.floor(sec) * 1000);
  if (!isFiniteNumber(date.getTime())) {
    return '';
  }
  const year: number = useUtc ? date.getUTCFullYear() : date.getFullYear();
  const month: number = (useUtc ? date.getUTCMonth() : date.getMonth()) + 1;
  const day: number = useUtc ? date.getUTCDate() : date.getDate();
  const hours: number = useUtc ? date.getUTCHours() : date.getHours();
  const minutes: number = useUtc ? date.getUTCMinutes() : date.getMinutes();
  const seconds: number = useUtc ? date.getUTCSeconds() : date.getSeconds();
  return padLeft(year, 4) + '/' + padLeft(month, 2) + '/' + padLeft(day, 2) + ' ' + padLeft(hours, 2) + ':' +
    padLeft(minutes, 2) + ':' + padLeft(seconds, 2);
}

export function formatDateOnly(sec: number, useUtc: boolean): string {
  const full: string = formatTimestamp(sec, useUtc);
  if (full.length === 0) {
    return '';
  }
  return full.substring(0, 10);
}

export function formatRelative(sec: number, nowSec: number, useUtc: boolean): string {
  if (!isFiniteNumber(sec) || !isFiniteNumber(nowSec) || sec < 0 || nowSec < 0) {
    return '';
  }
  const diff: number = Math.floor(nowSec) - Math.floor(sec);
  if (diff < 0) {
    return '未来';
  }
  if (diff < 60) {
    return '刚刚';
  }
  if (diff < 3600) {
    return Math.floor(diff / 60).toString() + '分钟前';
  }
  if (diff < 86400) {
    return Math.floor(diff / 3600).toString() + '小时前';
  }
  if (diff < 172800) {
    return '昨天';
  }
  if (diff < 604800) {
    return Math.floor(diff / 86400).toString() + '天前';
  }
  return formatDateOnly(sec, useUtc);
}

export function formatDuration(totalSec: number): string {
  if (!isFiniteNumber(totalSec) || totalSec < 0) {
    return '--:--';
  }
  const total: number = Math.floor(totalSec);
  const hours: number = Math.floor(total / 3600);
  const minutes: number = Math.floor((total % 3600) / 60);
  const seconds: number = total % 60;
  if (hours > 0) {
    return hours.toString() + ':' + padLeft(minutes, 2) + ':' + padLeft(seconds, 2);
  }
  return minutes.toString() + ':' + padLeft(seconds, 2);
}

export function formatPercent(value: number, total: number, decimals: number): string {
  if (!isFiniteNumber(value) || !isFiniteNumber(total) || total <= 0) {
    return '0%';
  }
  let fracDigits: number = decimals;
  if (fracDigits < 0) {
    fracDigits = 0;
  }
  if (fracDigits > 2) {
    fracDigits = 2;
  }
  const percent: number = value / total * 100;
  return trimTrailingZeros(percent.toFixed(fracDigits)) + '%';
}

export function truncateEnd(text: string, maxWidth: number, marker: string): string {
  if (maxWidth <= 0) {
    return '';
  }
  if (text.length <= maxWidth) {
    return text;
  }
  if (maxWidth <= marker.length) {
    return text.substring(0, maxWidth);
  }
  return text.substring(0, maxWidth - marker.length) + marker;
}

export function truncateMiddle(text: string, maxWidth: number, marker: string): string {
  if (maxWidth <= 0) {
    return '';
  }
  if (text.length <= maxWidth) {
    return text;
  }
  if (maxWidth <= marker.length) {
    return text.substring(0, maxWidth);
  }
  const remaining: number = maxWidth - marker.length;
  const head: number = Math.floor(remaining / 2);
  const tail: number = remaining - head;
  return text.substring(0, head) + marker + text.substring(text.length - tail);
}

export function sanitizeFileName(name: string): string {
  const chunks: string[] = [];
  for (let index = 0; index < name.length; index++) {
    const ch: string = name.charAt(index);
    const code: number = name.charCodeAt(index);
    if (code < 0x20 || code === 0x7F) {
      continue;
    }
    if (ILLEGAL_NAME_CHARS.indexOf(ch) >= 0) {
      continue;
    }
    chunks.push(ch);
  }
  let result: string = chunks.join('');
  while (result.startsWith(' ') || result.startsWith('.')) {
    result = result.substring(1);
  }
  while (result.endsWith(' ') || result.endsWith('.')) {
    result = result.substring(0, result.length - 1);
  }
  if (result.length === 0) {
    return 'unnamed';
  }
  if (result.length > MAX_NAME_LENGTH) {
    result = result.substring(0, MAX_NAME_LENGTH);
  }
  for (let index = 0; index < RESERVED_NAMES.length; index++) {
    if (result.toLowerCase() === RESERVED_NAMES[index]) {
      return '_' + result;
    }
  }
  return result;
}

export function ensureExtension(name: string, extension: string): string {
  if (extension.length === 0) {
    return name;
  }
  let suffix: string = extension;
  if (!suffix.startsWith('.')) {
    suffix = '.' + suffix;
  }
  if (name.toLowerCase().endsWith(suffix.toLowerCase())) {
    return name;
  }
  return name + suffix;
}

export function uniqueName(name: string, index: number): string {
  if (index <= 0) {
    return name;
  }
  const dotIndex: number = name.lastIndexOf('.');
  const suffix: string = '(' + index.toString() + ')';
  if (dotIndex <= 0) {
    return name + suffix;
  }
  return name.substring(0, dotIndex) + suffix + name.substring(dotIndex);
}

export function maskAccount(accountId: string): string {
  if (accountId.length === 0) {
    return '';
  }
  if (accountId.length <= 2) {
    return '**';
  }
  if (accountId.length <= 4) {
    return accountId.charAt(0) + '**' + accountId.charAt(accountId.length - 1);
  }
  return accountId.substring(0, 2) + '***' + accountId.substring(accountId.length - 2);
}

export function formatExpiry(expiredAtSec: number, useUtc: boolean): string {
  if (!isFiniteNumber(expiredAtSec) || expiredAtSec <= 0) {
    return '永久';
  }
  return formatDateOnly(expiredAtSec, useUtc);
}
