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

const BYTES_PER_KB: number = 1024;
const BYTES_PER_MB: number = 1024 * 1024;

export class Formatter {
  static bytes(size: number): string {
    if (size >= BYTES_PER_MB) {
      return `${(size / BYTES_PER_MB).toFixed(2)} MB`;
    }
    if (size >= BYTES_PER_KB) {
      return `${(size / BYTES_PER_KB).toFixed(1)} KB`;
    }
    return `${size} B`;
  }

  static time(timestamp: number): string {
    const date: Date = new Date(timestamp);
    return `${date.getFullYear()}-${Formatter.pad(date.getMonth() + 1)}-${Formatter.pad(date.getDate())} ` +
      `${Formatter.pad(date.getHours())}:${Formatter.pad(date.getMinutes())}:${Formatter.pad(date.getSeconds())}`;
  }

  static fileStamp(timestamp: number): string {
    const date: Date = new Date(timestamp);
    return `${date.getFullYear()}${Formatter.pad(date.getMonth() + 1)}${Formatter.pad(date.getDate())}` +
      `_${Formatter.pad(date.getHours())}${Formatter.pad(date.getMinutes())}${Formatter.pad(date.getSeconds())}`;
  }

  static initial(fullName: string): string {
    const trimmed: string = fullName.trim();
    if (trimmed.length === 0) {
      return '#';
    }
    const first: string = trimmed.substring(0, 1).toUpperCase();
    const code: number = first.charCodeAt(0);
    const isUpper: boolean = code >= 65 && code <= 90;
    return isUpper ? first : '#';
  }

  private static pad(value: number): string {
    return value < 10 ? `0${value}` : `${value}`;
  }
}
