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
import { scan } from '@kit.BasicServicesKit';

/**
 * 选项取值的解析与换算。把 SDK 的 ScannerOptionValue 结构压成
 * 可断言文本/数值，并为区间截断与数值比较提供统一入口。
 */
export class ScanOptionValueParser {
  private static readonly FIXED_DIGITS: number = 2;

  static asNumber(value: scan.ScannerOptionValue): number {
    if (value.valueType === scan.OptionValueType.SCAN_TYPE_BOOL) {
      const boolValue: boolean | undefined = value.boolValue;
      return boolValue === true ? 1 : 0;
    }
    if (value.valueType === scan.OptionValueType.SCAN_TYPE_INT ||
      value.valueType === scan.OptionValueType.SCAN_TYPE_FIXED) {
      const numValue: number | undefined = value.numValue;
      return numValue === undefined ? 0 : numValue;
    }
    const strValue: string | undefined = value.strValue;
    if (strValue === undefined) {
      return 0;
    }
    return ScanOptionValueParser.parseFixed(strValue);
  }

  static asText(value: scan.ScannerOptionValue): string {
    if (value.valueType === scan.OptionValueType.SCAN_TYPE_BOOL) {
      const boolValue: boolean | undefined = value.boolValue;
      return boolValue === true ? 'on' : 'off';
    }
    if (value.valueType === scan.OptionValueType.SCAN_TYPE_INT) {
      const numValue: number | undefined = value.numValue;
      return numValue === undefined ? '' : Math.round(numValue).toString();
    }
    if (value.valueType === scan.OptionValueType.SCAN_TYPE_FIXED) {
      const numValue: number | undefined = value.numValue;
      if (numValue === undefined) {
        return '';
      }
      const factor: number = 10 ** ScanOptionValueParser.FIXED_DIGITS;
      return (Math.round(numValue * factor) / factor).toString();
    }
    const strValue: string | undefined = value.strValue;
    return strValue === undefined ? '' : strValue;
  }

  /**
   * 把数值截断到 [min, max]；当 min > max 时先交换两者，保证区间合法。
   */
  static clamp(value: number, min: number, max: number): number {
    const lower: number = min <= max ? min : max;
    const upper: number = min <= max ? max : min;
    if (value < lower) {
      return lower;
    }
    if (value > upper) {
      return upper;
    }
    return value;
  }

  static rangeText(min: number, max: number, quantum: number): string {
    return `${min}..${max}/${quantum}`;
  }

  static isNumeric(text: string): boolean {
    if (text.length === 0) {
      return false;
    }
    let hasDigit: boolean = false;
    for (let index = 0; index < text.length; index++) {
      const char: string = text.charAt(index);
      const isDigit: boolean = char >= '0' && char <= '9';
      const isSign: boolean = char === '.' || char === '-';
      if (isDigit) {
        hasDigit = true;
      }
      if (!isDigit && !isSign) {
        return false;
      }
    }
    return hasDigit;
  }

  /**
   * 把数字文本解析成定点值（保留两位小数），非法文本返回 0。
   */
  static parseFixed(text: string): number {
    const value: number = Number(text);
    if (Number.isNaN(value)) {
      return 0;
    }
    const factor: number = 10 ** ScanOptionValueParser.FIXED_DIGITS;
    return Math.round(value * factor) / factor;
  }

  static compare(left: scan.ScannerOptionValue, right: scan.ScannerOptionValue): number {
    const leftValue: number = ScanOptionValueParser.asNumber(left);
    const rightValue: number = ScanOptionValueParser.asNumber(right);
    if (leftValue < rightValue) {
      return -1;
    }
    if (leftValue > rightValue) {
      return 1;
    }
    return 0;
  }

  /**
   * 聚合摘要串：类型文本、数值、文本与布尔标记，供快照断言使用。
   */
  static describe(value: scan.ScannerOptionValue): string {
    const numValue: number | undefined = value.numValue;
    const strValue: string | undefined = value.strValue;
    const boolValue: boolean | undefined = value.boolValue;
    return `type=${value.valueType} num=${numValue === undefined ? '-' : numValue} ` +
      `str=${strValue === undefined ? '-' : strValue} bool=${boolValue === undefined ? '-' : boolValue}`;
  }
}
