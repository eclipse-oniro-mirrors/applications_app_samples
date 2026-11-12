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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { SystemConfigConstants } from '../../constants/SystemConfigConstants';
import { ResourceHelper } from '../basic/ResourceHelper';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

// ========================================
// Storage level and threshold constants
// ========================================

// Storage level texts moved into string.json (storage_level_*), resolved by name in getStorageLevel.

/** Low storage threshold percent (available space below this is considered insufficient) */
const STORAGE_LOW_THRESHOLD_PERCENT: number = 10;
/** Sufficient storage threshold percent */
const STORAGE_SUFFICIENT_THRESHOLD: number = 50;
/** Normal storage threshold percent */
const STORAGE_NORMAL_THRESHOLD: number = 25;
/** Assumed usage ratio for estimation */
const ESTIMATED_USAGE_RATIO: number = 0.65;

// ========================================
// Storage unit constants
// ========================================

/** Byte unit base */
const UNIT_BASE: number = 1024;
/** Storage unit list */
const STORAGE_UNITS: string[] = ['B', 'KB', 'MB', 'GB', 'TB'];

// ========================================
// Storage calculation utility class
// ========================================

/**
 * Storage calculation utility class.
 * Provides static methods for formatting and parsing storage capacity,
 * percentage calculation, free-space evaluation and storage level determination.
 */
export class StorageUtils {
  /**
   * Formats a storage capacity into a readable string.
   * Converts bytes into human-readable B/KB/MB/GB/TB formats
   * with two decimal places.
   * @param {number} bytes - Storage capacity in bytes
   * @returns {string} Formatted capacity string
   */
  static formatStorageSize(bytes: number): string {
    hilog.debug(DOMAIN, TAG, 'StorageUtils formatStorageSize: input bytes=%{public}s', bytes.toString());
    if (bytes < 0) {
      hilog.warn(DOMAIN, TAG, 'StorageUtils formatStorageSize: negative value, returning 0 B');
      return '0 B';
    }
    if (bytes === 0) {
      return '0 B';
    }
    let unitIndex: number = 0;
    let currentSize: number = bytes;
    while (currentSize >= UNIT_BASE && unitIndex < STORAGE_UNITS.length - 1) {
      currentSize = currentSize / UNIT_BASE;
      unitIndex++;
    }
    const formatted: string = currentSize.toFixed(2) + ' ' + STORAGE_UNITS[unitIndex];
    hilog.debug(DOMAIN, TAG, 'StorageUtils formatStorageSize: result=%{public}s', formatted);
    return formatted;
  }

  /**
   * Parses a storage capacity string into bytes.
   * Supports B, KB, MB, GB, TB units, case-insensitive.
   * @param {string} str - Capacity string (e.g. "1.5 GB")
   * @returns {number} Corresponding bytes, or 0 on parse failure
   */
  static parseStorageSize(str: string): number {
    hilog.debug(DOMAIN, TAG, 'StorageUtils parseStorageSize: input=%{public}s', str);
    if (str.length === 0) {
      hilog.warn(DOMAIN, TAG, 'StorageUtils parseStorageSize: empty string');
      return 0;
    }
    const parts: string[] = StorageUtils.splitNumberAndUnit(str.trim().toUpperCase());
    const numericPart: string = parts[0];
    const unitPart: string = parts[1];
    if (numericPart.length === 0) {
      hilog.warn(DOMAIN, TAG, 'StorageUtils parseStorageSize: no numeric part found');
      return 0;
    }
    const numericValue: number = parseFloat(numericPart);
    if (isNaN(numericValue)) {
      hilog.warn(DOMAIN, TAG, 'StorageUtils parseStorageSize: invalid numeric value');
      return 0;
    }
    const multiplier: number = StorageUtils.resolveUnitMultiplier(unitPart);
    const result: number = Math.floor(numericValue * multiplier);
    hilog.debug(DOMAIN, TAG, 'StorageUtils parseStorageSize: result=%{public}s bytes', result.toString());
    return result;
  }

  /**
   * Splits a capacity string into its numeric and unit parts.
   * @param {string} trimmedUpper - String already trimmed and uppercased
   * @returns {string[]} [numeric part, unit part]
   */
  private static splitNumberAndUnit(trimmedUpper: string): string[] {
    let numericPart: string = '';
    let unitPart: string = '';
    let foundUnit: boolean = false;
    for (let i: number = 0; i < trimmedUpper.length; i++) {
      const ch: string = trimmedUpper.charAt(i);
      if (!foundUnit && ((ch >= '0' && ch <= '9') || ch === '.')) {
        numericPart += ch;
      } else {
        foundUnit = true;
        unitPart += ch;
      }
    }
    return [numericPart, unitPart.trim()];
  }

  /**
   * Converts a unit string to its byte multiplier; unknown units are treated as 1.
   * @param {string} unitPart - Unit string (already uppercased)
   * @returns {number} Byte multiplier
   */
  private static resolveUnitMultiplier(unitPart: string): number {
    switch (unitPart) {
      case '':
      case 'B':
        return 1;
      case 'KB':
      case 'K':
        return UNIT_BASE;
      case 'MB':
      case 'M':
        return UNIT_BASE * UNIT_BASE;
      case 'GB':
      case 'G':
        return UNIT_BASE * UNIT_BASE * UNIT_BASE;
      case 'TB':
      case 'T':
        return UNIT_BASE * UNIT_BASE * UNIT_BASE * UNIT_BASE;
      default:
        hilog.warn(DOMAIN, TAG, 'StorageUtils parseStorageSize: unknown unit=%{public}s', unitPart);
        return 1;
    }
  }

  // ========================================
  // Percentage and level calculation methods
  // ========================================

  /**
   * Gets the available space percentage.
   * Calculates the available space as a percentage of total capacity.
   * @param {number} used - Used space in bytes
   * @param {number} total - Total capacity in bytes
   * @returns {number} Available percentage (0-100)
   */
  static getAvailablePercent(used: number, total: number): number {
    hilog.debug(DOMAIN, TAG, 'StorageUtils getAvailablePercent: used=%{public}s, total=%{public}s',
      used.toString(), total.toString());
    if (total <= 0) {
      hilog.warn(DOMAIN, TAG, 'StorageUtils getAvailablePercent: total is zero or negative');
      return 0;
    }
    if (used < 0) {
      hilog.warn(DOMAIN, TAG, 'StorageUtils getAvailablePercent: used is negative, treating as 0');
      used = 0;
    }
    if (used > total) {
      hilog.warn(DOMAIN, TAG, 'StorageUtils getAvailablePercent: used exceeds total');
      used = total;
    }
    const available: number = total - used;
    const percent: number = Math.round((available / total) * 10000) / 100;
    hilog.debug(DOMAIN, TAG, 'StorageUtils getAvailablePercent: result=%{public}s%', percent.toString());
    return percent;
  }

  /**
   * Checks whether storage space is low.
   * Returns true when available space is below the threshold percentage of total capacity.
   * Invalid inputs (negative available or non-positive total) return false.
   * @param {number} available - Available space in bytes
   * @param {number} total - Total capacity in bytes
   * @returns {boolean} Whether storage is low
   */
  static isStorageLow(available: number, total: number): boolean {
    hilog.debug(DOMAIN, TAG, 'StorageUtils isStorageLow: available=%{public}s, total=%{public}s',
      available.toString(), total.toString());
    if (available < 0 || total <= 0) {
      hilog.warn(DOMAIN, TAG, 'StorageUtils isStorageLow: invalid input, returning false');
      return false;
    }
    const clampedAvailable: number = Math.min(available, total);
    const percent: number = (clampedAvailable / total) * 100;
    const isLow: boolean = percent < STORAGE_LOW_THRESHOLD_PERCENT;
    hilog.info(DOMAIN, TAG, 'StorageUtils isStorageLow: percent=%{public}s, isLow=%{public}s',
      percent.toFixed(1), isLow.toString());
    return isLow;
  }

  /**
   * Gets the storage level description.
   * Determines the current storage level from available and total capacity;
   * texts come from string.json storage_level_* resources.
   * @param {number} available - Available space in bytes
   * @param {number} total - Total capacity in bytes
   * @returns {string} Localized storage level description
   */
  static getStorageLevel(available: number, total: number): string {
    hilog.debug(DOMAIN, TAG, 'StorageUtils getStorageLevel: available=%{public}s, total=%{public}s',
      available.toString(), total.toString());
    if (total <= 0) {
      hilog.warn(DOMAIN, TAG, 'StorageUtils getStorageLevel: total is zero or negative');
      return ResourceHelper.getStringByName('storage_level_critical');
    }
    const percent: number = StorageUtils.getAvailablePercent(total - available, total);
    let level: string;
    if (percent >= STORAGE_SUFFICIENT_THRESHOLD) {
      level = ResourceHelper.getStringByName('storage_level_sufficient');
    } else if (percent >= STORAGE_NORMAL_THRESHOLD) {
      level = ResourceHelper.getStringByName('storage_level_normal');
    } else if (percent >= STORAGE_LOW_THRESHOLD_PERCENT) {
      level = ResourceHelper.getStringByName('storage_level_low');
    } else {
      level = ResourceHelper.getStringByName('storage_level_critical');
    }
    hilog.info(DOMAIN, TAG, 'StorageUtils getStorageLevel: percent=%{public}s, level=%{public}s',
      percent.toString(), level);
    return level;
  }

  // ========================================
  // Estimation and usage percent methods
  // ========================================

  /**
   * Estimates free space from the total capacity.
   * Uses an empirical usage ratio to estimate the free space.
   * @param {number} total - Total capacity in bytes
   * @returns {number} Estimated free space in bytes
   */
  static estimateFreeSpace(total: number): number {
    hilog.debug(DOMAIN, TAG, 'StorageUtils estimateFreeSpace: total=%{public}s', total.toString());
    if (total <= 0) {
      hilog.warn(DOMAIN, TAG, 'StorageUtils estimateFreeSpace: total is zero or negative');
      return 0;
    }
    const estimatedFree: number = Math.floor(total * (1 - ESTIMATED_USAGE_RATIO));
    hilog.debug(DOMAIN, TAG, 'StorageUtils estimateFreeSpace: estimated=%{public}s', estimatedFree.toString());
    return estimatedFree;
  }

  /**
   * Calculates the storage usage percentage.
   * Returns the used space as a percentage of total capacity.
   * @param {number} used - Used space in bytes
   * @param {number} total - Total capacity in bytes
   * @returns {number} Usage percentage (0-100)
   */
  static calculateUsagePercent(used: number, total: number): number {
    hilog.debug(DOMAIN, TAG, 'StorageUtils calculateUsagePercent: used=%{public}s, total=%{public}s',
      used.toString(), total.toString());
    if (total <= 0) {
      hilog.warn(DOMAIN, TAG, 'StorageUtils calculateUsagePercent: total is zero or negative');
      return 0;
    }
    if (used < 0) {
      hilog.warn(DOMAIN, TAG, 'StorageUtils calculateUsagePercent: used is negative, treating as 0');
      used = 0;
    }
    if (used > total) {
      hilog.warn(DOMAIN, TAG, 'StorageUtils calculateUsagePercent: used exceeds total, capping');
      used = total;
    }
    const percent: number = Math.round((used / total) * 10000) / 100;
    hilog.debug(DOMAIN, TAG, 'StorageUtils calculateUsagePercent: result=%{public}s%', percent.toString());
    return percent;
  }

  /**
   * Gets a storage usage summary.
   * Combines used, available, total and level info into a readable string.
   * @param {number} used - Used space in bytes
   * @param {number} total - Total capacity in bytes
   * @returns {string} Storage usage summary
   */
  static getStorageSummary(used: number, total: number): string {
    hilog.info(DOMAIN, TAG, 'StorageUtils getStorageSummary: building summary');
    const available: number = Math.max(0, total - used);
    const usagePercent: number = StorageUtils.calculateUsagePercent(used, total);
    const level: string = StorageUtils.getStorageLevel(available, total);
    const summary: string = 'StorageUtils[used=' + StorageUtils.formatStorageSize(used) +
      ', available=' + StorageUtils.formatStorageSize(available) +
      ', total=' + StorageUtils.formatStorageSize(total) +
      ', usage=' + usagePercent.toString() + '%' +
      ', level=' + level + ']';
    hilog.info(DOMAIN, TAG, 'StorageUtils getStorageSummary: %{public}s', summary);
    return summary;
  }
}
