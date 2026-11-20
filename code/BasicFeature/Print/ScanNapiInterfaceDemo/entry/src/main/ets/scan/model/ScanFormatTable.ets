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
 * 扫描图像格式与页面尺寸的冻结数据表。
 * 尺寸按 300dpi 换算成像素点对；未知键一律回退到文档默认值，避免界面显示空数据。
 */
export class ScanFormatTable {
  /** 页面尺寸键序：A3 / A4 / A5 / B4 / B5 / LETTER / LEGAL */
  static readonly PAGE_KEYS: string[] = ['A3', 'A4', 'A5', 'B4', 'B5', 'LETTER', 'LEGAL'];

  /** 300dpi 下的像素点对 [宽, 高] */
  static readonly PAGE_DOTS: number[][] = [
    [3508, 4961],
    [2480, 3508],
    [1748, 2480],
    [2953, 4169],
    [2079, 2953],
    [2550, 3300],
    [2550, 4200]
  ];

  /** 图像格式键序 */
  static readonly FORMAT_KEYS: string[] = ['jpg', 'png', 'pdf', 'bmp', 'tiff'];

  static pageSizeKeys(): string[] {
    return ScanFormatTable.PAGE_KEYS.slice(0);
  }

  static pageSizeIndex(key: string): number {
    return ScanFormatTable.PAGE_KEYS.indexOf(key);
  }

  static pageSizeAt(index: number): string {
    if (index < 0 || index >= ScanFormatTable.PAGE_KEYS.length) {
      return '';
    }
    return ScanFormatTable.PAGE_KEYS[index];
  }

  static dotsFor(key: string): number[] {
    const index: number = ScanFormatTable.pageSizeIndex(key);
    if (index < 0) {
      return [2480, 3508];
    }
    return [ScanFormatTable.PAGE_DOTS[index][0], ScanFormatTable.PAGE_DOTS[index][1]];
  }

  static dotsText(key: string): string {
    const dots: number[] = ScanFormatTable.dotsFor(key);
    return `${dots[0]}x${dots[1]}`;
  }

  static totalPixels(key: string): number {
    const dots: number[] = ScanFormatTable.dotsFor(key);
    return dots[0] * dots[1];
  }

  static formatKeys(): string[] {
    return ScanFormatTable.FORMAT_KEYS.slice(0);
  }

  static formatIndex(key: string): number {
    return ScanFormatTable.FORMAT_KEYS.indexOf(key);
  }

  static extension(key: string): string {
    if (ScanFormatTable.formatIndex(key) < 0) {
      return '';
    }
    return key;
  }

  static mimeType(key: string): string {
    if (key === 'jpg') {
      return 'image/jpeg';
    }
    if (key === 'png') {
      return 'image/png';
    }
    if (key === 'pdf') {
      return 'application/pdf';
    }
    if (key === 'bmp') {
      return 'image/bmp';
    }
    if (key === 'tiff') {
      return 'image/tiff';
    }
    return 'application/octet-stream';
  }

  static isMultiPage(key: string): boolean {
    return key === 'pdf' || key === 'tiff';
  }

  static supportsGray(key: string): boolean {
    return key === 'bmp' || key === 'tiff';
  }

  static colorDepth(key: string): number {
    if (key === 'pdf') {
      return 32;
    }
    if (key === 'jpg' || key === 'png' || key === 'bmp' || key === 'tiff') {
      return 24;
    }
    return 0;
  }

  /**
   * 聚合摘要串：格式、页面尺寸、像素点对与多页标记，供快照断言使用。
   */
  static describe(formatKey: string, pageKey: string): string {
    return `format=${formatKey} page=${pageKey} pixels=${ScanFormatTable.dotsText(pageKey)} ` +
      `multi=${ScanFormatTable.isMultiPage(formatKey)}`;
  }
}
