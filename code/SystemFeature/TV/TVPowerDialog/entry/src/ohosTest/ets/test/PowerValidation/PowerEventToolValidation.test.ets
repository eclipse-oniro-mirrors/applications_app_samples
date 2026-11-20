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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import {
  getDriver,
  KEY_BACK,
  pressAndWait,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../Shared/SharedDriver';

// 电源工具类：适配字节格式化、空值判断、缓冲转换、日期格式化
class PowerToolUtil {
  // 适配 Tools_byte2Str：字节数格式化
  public static formatByteSize(bytes: number): string {
    if (bytes < 0) {
      return '0B';
    }
    if (bytes === 0) {
      return '0B';
    }
    const units: string[] = ['B', 'KB', 'MB', 'GB', 'TB'];
    let index: number = 0;
    let value: number = bytes;
    while (value >= 1024 && index < units.length - 1) {
      value = value / 1024;
      index++;
    }
    const formatted: string = value.toFixed(index === 0 ? 0 : 2).replace(/\.00$/, '');
    return formatted + units[index];
  }

  // 适配 Tools_isEmpty：空值判断
  public static isEmpty(value: string | null | undefined): boolean {
    if (value === null || value === undefined) {
      return true;
    }
    return value.length === 0;
  }

  // 适配 Tools_ArrayToString：缓冲转字符串
  public static bufferToString(bytes: Uint8Array): string {
    let result: string = '';
    for (let i = 0; i < bytes.length; i++) {
      result += String.fromCharCode(bytes[i]);
    }
    return result;
  }

  // 适配 Tools_ArrayToString：字符串转缓冲
  public static stringToBuffer(text: string): Uint8Array {
    const bytes = new Uint8Array(text.length);
    for (let i = 0; i < text.length; i++) {
      bytes[i] = text.charCodeAt(i);
    }
    return bytes;
  }

  // 适配 DateTools_formatDate：日期格式化
  public static formatDate(timestamp: number): string {
    const date = new Date(timestamp);
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    return `${year}-${month}-${day}`;
  }

  // 适配 SubtitleHelper_Path_Parsing：路径后缀匹配
  public static endsWith(text: string, suffix: string): boolean {
    return text.length >= suffix.length && text.slice(text.length - suffix.length) === suffix;
  }
}

// 电源图标工具：聚焦图标后缀识别
class PowerIconUtil {
  public static readonly FOCUS_SUFFIX: string = '_focus';

  public static getFocusIcon(icon: string): string {
    return icon + PowerIconUtil.FOCUS_SUFFIX;
  }

  public static isFocusIcon(icon: string): boolean {
    return PowerToolUtil.endsWith(icon, PowerIconUtil.FOCUS_SUFFIX);
  }
}

// 字节单位枚举：描述字节格式化的目标单位
enum ByteUnit {
  BYTE = 'B', KILOBYTE = 'KB', MEGABYTE = 'MB', GIGABYTE = 'GB', TERABYTE = 'TB', PETABYTE = 'PB'
}

// 日期格式类型枚举：描述日期格式化的目标格式
enum DateFormatKind {
  DATE_ONLY = 'yyyy-MM-dd', DATE_TIME = 'yyyy-MM-dd HH:mm:ss', TIME_ONLY = 'HH:mm:ss'
}

// 格式化选项接口：描述字节格式化器的配置项
interface FormatOptions {
  decimalPlaces: number;
  trimTrailingZeros: boolean;
}

// 解析日期接口：描述解析后的日期分量
interface ParsedDate {
  year: number;
  month: number;
  day: number;
  hour: number;
  minute: number;
  second: number;
}

// 字节格式化器：支持可配置精度的字节数格式化
class ByteFormatter {
  private options: FormatOptions;

  constructor(decimalPlaces: number, trimTrailingZeros: boolean) {
    this.options = { decimalPlaces, trimTrailingZeros };
  }

  public format(bytes: number): string {
    if (bytes < 0) {
      return '0' + ByteUnit.BYTE;
    }
    if (bytes === 0) {
      return '0' + ByteUnit.BYTE;
    }
    const units: string[] = ['B', 'KB', 'MB', 'GB', 'TB', 'PB'];
    let index: number = 0;
    let value: number = bytes;
    while (value >= 1024 && index < units.length - 1) {
      value = value / 1024;
      index++;
    }
    let formatted: string = value.toFixed(this.options.decimalPlaces);
    if (this.options.trimTrailingZeros) {
      formatted = formatted.replace(/\.?0+$/, '');
    }
    return formatted + units[index];
  }

  public getOptions(): FormatOptions {
    return this.options;
  }
}

// 字符串工具：提供修剪、填充与归一化能力
class StringUtility {
  public static trim(value: string): string {
    return value.trim();
  }

  public static padStart(value: string, length: number, pad: string): string {
    return value.padStart(length, pad);
  }

  public static padEnd(value: string, length: number, pad: string): string {
    return value.padEnd(length, pad);
  }

  public static toLowerCase(value: string): string {
    return value.toLowerCase();
  }

  public static toUpperCase(value: string): string {
    return value.toUpperCase();
  }

  public static reverse(value: string): string {
    let result: string = '';
    for (let i = value.length - 1; i >= 0; i--) {
      result += value.charAt(i);
    }
    return result;
  }

  public static isBlank(value: string): boolean {
    return value.trim().length === 0;
  }
}

// 日期工具：提供日期解析、比较与格式化能力
class DateUtility {
  public static parse(timestamp: number): ParsedDate {
    const date = new Date(timestamp);
    return {
      year: date.getFullYear(),
      month: date.getMonth() + 1,
      day: date.getDate(),
      hour: date.getHours(),
      minute: date.getMinutes(),
      second: date.getSeconds()
    };
  }

  public static format(timestamp: number, kind: DateFormatKind): string {
    const parsed: ParsedDate = DateUtility.parse(timestamp);
    const y: string = String(parsed.year);
    const m: string = String(parsed.month).padStart(2, '0');
    const d: string = String(parsed.day).padStart(2, '0');
    const h: string = String(parsed.hour).padStart(2, '0');
    const mi: string = String(parsed.minute).padStart(2, '0');
    const s: string = String(parsed.second).padStart(2, '0');
    if (kind === DateFormatKind.DATE_ONLY) {
      return `${y}-${m}-${d}`;
    }
    if (kind === DateFormatKind.TIME_ONLY) {
      return `${h}:${mi}:${s}`;
    }
    return `${y}-${m}-${d} ${h}:${mi}:${s}`;
  }

  public static isSameDay(a: number, b: number): boolean {
    const da: ParsedDate = DateUtility.parse(a);
    const db: ParsedDate = DateUtility.parse(b);
    return da.year === db.year && da.month === db.month && da.day === db.day;
  }
}

// 后缀匹配器：提供多种后缀匹配策略
class SuffixMatcher {
  public static endsWith(text: string, suffix: string): boolean {
    return text.length >= suffix.length && text.slice(text.length - suffix.length) === suffix;
  }

  public static endsWithAny(text: string, suffixes: string[]): boolean {
    return suffixes.some((suffix: string) => SuffixMatcher.endsWith(text, suffix));
  }

  public static startsWith(text: string, prefix: string): boolean {
    return text.length >= prefix.length && text.slice(0, prefix.length) === prefix;
  }

  public static contains(text: string, part: string): boolean {
    return text.includes(part);
  }

  public static extractSuffix(text: string, separator: string): string {
    const index: number = text.lastIndexOf(separator);
    if (index < 0) {
      return text;
    }
    return text.slice(index + 1);
  }
}

// 缓冲转换器：提供多种缓冲与字符串转换策略
class BufferConverter {
  public static toBytes(text: string): Uint8Array {
    const bytes = new Uint8Array(text.length);
    for (let i = 0; i < text.length; i++) {
      bytes[i] = text.charCodeAt(i);
    }
    return bytes;
  }

  public static fromBytes(bytes: Uint8Array): string {
    let result: string = '';
    for (let i = 0; i < bytes.length; i++) {
      result += String.fromCharCode(bytes[i]);
    }
    return result;
  }

  public static toHex(bytes: Uint8Array): string {
    let hex: string = '';
    for (let i = 0; i < bytes.length; i++) {
      hex += bytes[i].toString(16).padStart(2, '0');
    }
    return hex;
  }

  public static getLength(bytes: Uint8Array): number {
    return bytes.length;
  }
}

// 数值格式化器：提供多种数值格式化能力
class NumericFormatter {
  public static formatInteger(value: number): string {
    return Math.floor(value).toString();
  }

  public static formatPercent(value: number, total: number): string {
    if (total === 0) {
      return '0%';
    }
    const percent: number = (value / total) * 100;
    return percent.toFixed(2) + '%';
  }

  public static formatWithCommas(value: number): string {
    const text: string = Math.floor(value).toString();
    let result: string = '';
    for (let i = 0; i < text.length; i++) {
      if (i > 0 && (text.length - i) % 3 === 0) {
        result += ',';
      }
      result += text.charAt(i);
    }
    return result;
  }

  public static clamp(value: number, min: number, max: number): number {
    if (value < min) {
      return min;
    }
    if (value > max) {
      return max;
    }
    return value;
  }
}

// 文本指标计算器：计算文本的长度与字符统计
class TextMetricsCalculator {
  public static countChars(text: string): number {
    return text.length;
  }

  public static countWords(text: string): number {
    const trimmed: string = text.trim();
    if (trimmed.length === 0) {
      return 0;
    }
    const parts: string[] = trimmed.split(/\s+/);
    return parts.length;
  }

  public static countOccurrences(text: string, target: string): number {
    let count: number = 0;
    let index: number = text.indexOf(target);
    while (index >= 0) {
      count++;
      index = text.indexOf(target, index + target.length);
    }
    return count;
  }

  public static hasOnlyAscii(text: string): boolean {
    for (let i = 0; i < text.length; i++) {
      if (text.charCodeAt(i) > 127) {
        return false;
      }
    }
    return true;
  }
}

// 字节数组构建器：动态构建字节序列
class ByteArrayBuilder {
  private bytes: number[] = [];

  public appendByte(value: number): void {
    this.bytes.push(value & 0xff);
  }

  public appendBytes(values: number[]): void {
    this.bytes.push(...values);
  }

  public getBytes(): number[] {
    return [...this.bytes];
  }

  public getLength(): number {
    return this.bytes.length;
  }

  public toUint8Array(): Uint8Array {
    const result = new Uint8Array(this.bytes.length);
    for (let i = 0; i < this.bytes.length; i++) {
      result[i] = this.bytes[i];
    }
    return result;
  }

  public clear(): void {
    this.bytes = [];
  }
}

export default function powerEventToolValidationTest() {
  describe('PowerEventToolValidation_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 适配 Tools_byte2Str：零字节返回 0B
    it('byte_size_zero_should_return_0B', 0, async () => {
      expect(PowerToolUtil.formatByteSize(0)).assertEqual('0B');
    });

    // 适配 Tools_byte2Str：KB 范围格式化
    it('byte_size_kb_range_should_format_correctly', 0, async () => {
      expect(PowerToolUtil.formatByteSize(1024)).assertEqual('1KB');
      expect(PowerToolUtil.formatByteSize(2048)).assertEqual('2KB');
    });

    // 适配 Tools_byte2Str：MB 范围格式化
    it('byte_size_mb_range_should_format_correctly', 0, async () => {
      expect(PowerToolUtil.formatByteSize(1048576)).assertEqual('1MB');
    });

    // 适配 Tools_byte2Str：GB 范围格式化
    it('byte_size_gb_range_should_format_correctly', 0, async () => {
      expect(PowerToolUtil.formatByteSize(1073741824)).assertEqual('1GB');
    });

    // 适配 Tools_byte2Str：负值返回 0B
    it('byte_size_negative_should_return_0B', 0, async () => {
      expect(PowerToolUtil.formatByteSize(-1)).assertEqual('0B');
    });

    // 适配 Tools_isEmpty：空字符串返回 true
    it('is_empty_should_return_true_for_empty_string', 0, async () => {
      expect(PowerToolUtil.isEmpty('')).assertTrue();
      expect(PowerToolUtil.isEmpty(null)).assertTrue();
      expect(PowerToolUtil.isEmpty(undefined)).assertTrue();
    });

    // 适配 Tools_isEmpty：非空字符串返回 false
    it('is_empty_should_return_false_for_non_empty_string', 0, async () => {
      expect(PowerToolUtil.isEmpty('熄屏')).assertFalse();
    });

    // 适配 Tools_ArrayToString：缓冲与字符串往返转换
    it('buffer_string_roundtrip_should_work', 0, async () => {
      const original: string = 'power';
      const bytes = PowerToolUtil.stringToBuffer(original);
      const restored = PowerToolUtil.bufferToString(bytes);
      expect(restored).assertEqual(original);
    });

    // 适配 Tools_ArrayToString：空缓冲返回空字符串
    it('empty_buffer_should_return_empty_string', 0, async () => {
      const emptyBuffer = new Uint8Array(0);
      expect(PowerToolUtil.bufferToString(emptyBuffer)).assertEqual('');
    });

    // 适配 DateTools_formatDate：日期格式化
    it('format_date_should_return_yyyy_mm_dd', 0, async () => {
      const formatted = PowerToolUtil.formatDate(new Date(2026, 0, 15).getTime());
      expect(formatted).assertEqual('2026-01-15');
    });

    // 适配 DateTools_Edge_Cases：纪元时间
    it('format_date_epoch_should_work', 0, async () => {
      const formatted = PowerToolUtil.formatDate(0);
      expect(formatted.length).assertEqual(10);
    });

    // 适配 EndsWith_Semantics：精确后缀匹配
    it('ends_with_should_match_exact_suffix', 0, async () => {
      expect(PowerToolUtil.endsWith('app.media.screenout_focus', '_focus')).assertTrue();
      expect(PowerToolUtil.endsWith('app.media.screenout', '_focus')).assertFalse();
    });

    // 适配 EndsWith_Semantics：名称短于后缀永不匹配
    it('ends_with_short_text_should_not_match', 0, async () => {
      expect(PowerToolUtil.endsWith('a', '_focus')).assertFalse();
    });

    // 适配 Suffix_Matching_Boundary：聚焦图标生成
    it('get_focus_icon_should_append_suffix', 0, async () => {
      expect(PowerIconUtil.getFocusIcon('app.media.shutdown')).assertEqual('app.media.shutdown_focus');
      expect(PowerIconUtil.isFocusIcon('app.media.shutdown_focus')).assertTrue();
    });

    // 适配 Special_Char_Filenames：特殊字符名称处理
    it('special_characters_should_be_handled', 0, async () => {
      expect(PowerToolUtil.isEmpty('特殊*()')).assertFalse();
      expect(PowerIconUtil.getFocusIcon('icon!@#')).assertEqual('icon!@#_focus');
    });

    // 适配 RTL_Language_Compatibility：Unicode 名称处理
    it('unicode_name_should_be_handled', 0, async () => {
      const unicodeName: string = '熄屏_重启_关机';
      expect(PowerToolUtil.isEmpty(unicodeName)).assertFalse();
      expect(PowerToolUtil.endsWith(unicodeName, '关机')).assertTrue();
    });
  });
}
