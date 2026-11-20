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

/**
 * 扫描图片命名规则：scan_{4 位序号}_{yyyymmdd}.{格式}。
 * 序号超 9999 不再补零，格式不支持时退回 jpg。
 */
export class ScanImageNaming {
  static readonly PREFIX: string = 'scan';
  static readonly SEPARATOR: string = '_';
  static readonly INDEX_DIGITS: number = 4;
  static readonly MAX_INDEX: number = 9999;
  static readonly INVALID_INDEX: number = -1;
  static readonly DEFAULT_FORMAT: string = 'jpg';
  static readonly SUPPORTED_FORMATS: string[] = ['jpg', 'jpeg', 'png', 'pdf', 'tiff'];

  static padIndex(index: number): string {
    const normalized: number = Math.floor(Math.abs(index));
    let text: string = normalized.toString();
    if (normalized > ScanImageNaming.MAX_INDEX) {
      return text;
    }
    while (text.length < ScanImageNaming.INDEX_DIGITS) {
      text = `0${text}`;
    }
    return text;
  }

  static pad2(value: number): string {
    return value < 10 ? `0${value}` : `${value}`;
  }

  static normalizeFormat(format: string): string {
    let text: string = format.trim().toLowerCase();
    if (text.startsWith('.')) {
      text = text.substring(1);
    }
    return text;
  }

  static isSupportedFormat(format: string): boolean {
    return ScanImageNaming.SUPPORTED_FORMATS.indexOf(ScanImageNaming.normalizeFormat(format)) >= 0;
  }

  /**
   * 用 UTC 日期，保证同一条用例在任何时区得到相同结果。
   */
  static formatDate(timestamp: number): string {
    const date: Date = new Date(timestamp);
    if (Number.isNaN(date.getTime())) {
      return '00000000';
    }
    const year: number = date.getUTCFullYear();
    const month: string = ScanImageNaming.pad2(date.getUTCMonth() + 1);
    const day: string = ScanImageNaming.pad2(date.getUTCDate());
    return `${year}${month}${day}`;
  }

  static build(index: number, format: string, timestamp: number): string {
    const normalized: string = ScanImageNaming.normalizeFormat(format);
    const safeFormat: string = ScanImageNaming.isSupportedFormat(normalized)
      ? normalized : ScanImageNaming.DEFAULT_FORMAT;
    return `${ScanImageNaming.PREFIX}${ScanImageNaming.SEPARATOR}${ScanImageNaming.padIndex(index)}` +
      `${ScanImageNaming.SEPARATOR}${ScanImageNaming.formatDate(timestamp)}.${safeFormat}`;
  }

  /**
   * 只接受恰好三段、前缀匹配、序号四位纯数字的名字。
   */
  static parseIndex(name: string): number {
    const parts: string[] = name.split(ScanImageNaming.SEPARATOR);
    if (parts.length !== 3) {
      return ScanImageNaming.INVALID_INDEX;
    }
    if (parts[0] !== ScanImageNaming.PREFIX) {
      return ScanImageNaming.INVALID_INDEX;
    }
    const indexText: string = parts[1];
    if (indexText.length !== ScanImageNaming.INDEX_DIGITS) {
      return ScanImageNaming.INVALID_INDEX;
    }
    const parsed: number = Number(indexText);
    if (Number.isNaN(parsed) || parsed < 0) {
      return ScanImageNaming.INVALID_INDEX;
    }
    return Math.floor(parsed);
  }

  static extractFormat(name: string): string {
    const dotIndex: number = name.lastIndexOf('.');
    if (dotIndex < 0 || dotIndex === name.length - 1) {
      return '';
    }
    const format: string = ScanImageNaming.normalizeFormat(name.substring(dotIndex + 1));
    return ScanImageNaming.isSupportedFormat(format) ? format : '';
  }

  static isValid(name: string): boolean {
    return ScanImageNaming.parseIndex(name) >= 0 && ScanImageNaming.extractFormat(name).length > 0;
  }

  static nextIndex(names: string[]): number {
    let maxIndex: number = 0;
    for (let index = 0; index < names.length; index++) {
      const parsed: number = ScanImageNaming.parseIndex(names[index]);
      if (parsed > maxIndex) {
        maxIndex = parsed;
      }
    }
    return maxIndex + 1;
  }

  /**
   * 无效编号统一排在末尾，有效编号按数值升序。
   */
  static sortByIndex(names: string[]): string[] {
    const sorted: string[] = names.slice(0);
    sorted.sort((left: string, right: string) => {
      const leftIndex: number = ScanImageNaming.parseIndex(left);
      const rightIndex: number = ScanImageNaming.parseIndex(right);
      const leftKey: number = leftIndex < 0 ? ScanImageNaming.MAX_INDEX + 1 : leftIndex;
      const rightKey: number = rightIndex < 0 ? ScanImageNaming.MAX_INDEX + 1 : rightIndex;
      return leftKey - rightKey;
    });
    return sorted;
  }
}
