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
 * 物理单位换算与展示。
 * 规则：mm 与 inch 基准 25.4；像素与 mm 的换算在 dpi 下进行；dpi 非正时不换算，返回 0。
 */
export class ScanUnitFormatter {
  static readonly MM_PER_INCH: number = 25.4;
  static readonly SCREEN_DPI: number = 96;
  static readonly DIGITS: number = 2;

  static getUnitText(unit: scan.PhysicalUnit): string {
    if (unit === scan.PhysicalUnit.SCAN_UNIT_PIXEL) {
      return 'px';
    }
    if (unit === scan.PhysicalUnit.SCAN_UNIT_BIT) {
      return 'bit';
    }
    if (unit === scan.PhysicalUnit.SCAN_UNIT_MM) {
      return 'mm';
    }
    if (unit === scan.PhysicalUnit.SCAN_UNIT_DPI) {
      return 'dpi';
    }
    if (unit === scan.PhysicalUnit.SCAN_UNIT_PERCENT) {
      return '%';
    }
    if (unit === scan.PhysicalUnit.SCAN_UNIT_MICROSECOND) {
      return 'us';
    }
    return '';
  }

  static getUnitLabel(unit: scan.PhysicalUnit): string {
    if (unit === scan.PhysicalUnit.SCAN_UNIT_PIXEL) {
      return 'scan_unit_pixel';
    }
    if (unit === scan.PhysicalUnit.SCAN_UNIT_BIT) {
      return 'scan_unit_bit';
    }
    if (unit === scan.PhysicalUnit.SCAN_UNIT_MM) {
      return 'scan_unit_mm';
    }
    if (unit === scan.PhysicalUnit.SCAN_UNIT_DPI) {
      return 'scan_unit_dpi';
    }
    if (unit === scan.PhysicalUnit.SCAN_UNIT_PERCENT) {
      return 'scan_unit_percent';
    }
    if (unit === scan.PhysicalUnit.SCAN_UNIT_MICROSECOND) {
      return 'scan_unit_microsecond';
    }
    return 'scan_unit_none';
  }

  static roundTo(value: number, digits: number): number {
    const factor: number = 10 ** digits;
    return Math.round(value * factor) / factor;
  }

  static format(value: number, unit: scan.PhysicalUnit): string {
    const rounded: number = ScanUnitFormatter.roundTo(value, ScanUnitFormatter.DIGITS);
    const text: string = rounded.toString();
    const suffix: string = ScanUnitFormatter.getUnitText(unit);
    if (suffix.length === 0) {
      return text;
    }
    return `${text} ${suffix}`;
  }

  static toMillimeter(value: number, unit: scan.PhysicalUnit): number {
    if (unit === scan.PhysicalUnit.SCAN_UNIT_PIXEL) {
      return ScanUnitFormatter.roundTo(value * ScanUnitFormatter.MM_PER_INCH / ScanUnitFormatter.SCREEN_DPI,
        ScanUnitFormatter.DIGITS);
    }
    return ScanUnitFormatter.roundTo(value, ScanUnitFormatter.DIGITS);
  }

  static fromMillimeter(millimeter: number, unit: scan.PhysicalUnit): number {
    if (unit === scan.PhysicalUnit.SCAN_UNIT_PIXEL) {
      return ScanUnitFormatter.roundTo(
        millimeter * ScanUnitFormatter.SCREEN_DPI / ScanUnitFormatter.MM_PER_INCH,
        ScanUnitFormatter.DIGITS);
    }
    return ScanUnitFormatter.roundTo(millimeter, ScanUnitFormatter.DIGITS);
  }

  /**
   * dpi 非正时返回 0，避免除零。
   */
  static millimeterToPixel(millimeter: number, dpi: number): number {
    if (dpi <= 0) {
      return 0;
    }
    return Math.round(millimeter * dpi / ScanUnitFormatter.MM_PER_INCH);
  }

  static pixelToMillimeter(pixel: number, dpi: number): number {
    if (dpi <= 0) {
      return 0;
    }
    return ScanUnitFormatter.roundTo(pixel * ScanUnitFormatter.MM_PER_INCH / dpi,
      ScanUnitFormatter.DIGITS);
  }

  static formatArea(widthMillimeter: number, heightMillimeter: number, dpi: number): string {
    const width: number = ScanUnitFormatter.pixelToMillimeter(widthMillimeter, dpi);
    const height: number = ScanUnitFormatter.pixelToMillimeter(heightMillimeter, dpi);
    return `${width}x${height}mm`;
  }

  static parseUnitText(text: string): scan.PhysicalUnit | undefined {
    const normalized: string = text.trim().toLowerCase();
    if (normalized === 'px') {
      return scan.PhysicalUnit.SCAN_UNIT_PIXEL;
    }
    if (normalized === 'bit') {
      return scan.PhysicalUnit.SCAN_UNIT_BIT;
    }
    if (normalized === 'mm') {
      return scan.PhysicalUnit.SCAN_UNIT_MM;
    }
    if (normalized === 'dpi') {
      return scan.PhysicalUnit.SCAN_UNIT_DPI;
    }
    if (normalized === '%') {
      return scan.PhysicalUnit.SCAN_UNIT_PERCENT;
    }
    if (normalized === 'us') {
      return scan.PhysicalUnit.SCAN_UNIT_MICROSECOND;
    }
    return undefined;
  }
}
