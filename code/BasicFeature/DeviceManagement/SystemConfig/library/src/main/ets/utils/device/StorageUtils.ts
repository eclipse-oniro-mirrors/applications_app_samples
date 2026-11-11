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

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

// ========================================
// 存储级别与阈值常量定义
// ========================================

/** 存储级别 - 充足 */
const LEVEL_SUFFICIENT: string = '充足';
/** 存储级别 - 一般 */
const LEVEL_NORMAL: string = '一般';
/** 存储级别 - 不足 */
const LEVEL_LOW: string = '不足';
/** 存储级别 - 危险 */
const LEVEL_CRITICAL: string = '危险';

/** 存储低阈值百分比（可用空间低于此值视为不足） */
const STORAGE_LOW_THRESHOLD_PERCENT: number = 10;
/** 存储充足阈值百分比 */
const STORAGE_SUFFICIENT_THRESHOLD: number = 50;
/** 存储一般阈值百分比 */
const STORAGE_NORMAL_THRESHOLD: number = 25;
/** 估算时假设的已用比例 */
const ESTIMATED_USAGE_RATIO: number = 0.65;

// ========================================
// 存储单位常量
// ========================================

/** 字节单位基数 */
const UNIT_BASE: number = 1024;
/** 存储单位列表 */
const STORAGE_UNITS: string[] = ['B', 'KB', 'MB', 'GB', 'TB'];

// ========================================
// 存储计算工具类
// ========================================

/**
 * 存储计算工具类。
 * 提供静态方法进行存储容量的格式化、解析、
 * 百分比计算、可用空间评估和存储级别判断等操作。
 */
export class StorageUtils {
  /**
   * 格式化存储容量为可读字符串。
   * 将字节数转换为 B/KB/MB/GB/TB 等人类可读格式，
   * 保留两位小数。
   * @param {number} bytes - 存储容量（字节）
   * @returns {string} 格式化后的存储容量字符串
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
   * 解析存储容量字符串为字节数。
   * 支持 B、KB、MB、GB、TB 等单位，不区分大小写。
   * @param {string} str - 存储容量字符串（如 "1.5 GB"）
   * @returns {number} 对应的字节数，解析失败返回 0
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
   * 拆分容量字符串的数值部分与单位部分。
   * @param {string} trimmedUpper - 已去空白并转大写的字符串
   * @returns {string[]} [数值部分, 单位部分]
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
   * 将单位字符串换算为字节倍率，未知单位按 1 处理。
   * @param {string} unitPart - 单位字符串（已转大写）
   * @returns {number} 字节倍率
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
  // 百分比与级别计算方法
  // ========================================

  /**
   * 获取可用空间百分比。
   * 计算可用空间占总容量的百分比。
   * @param {number} used - 已用空间（字节）
   * @param {number} total - 总容量（字节）
   * @returns {number} 可用空间百分比（0-100）
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
   * 判断存储空间是否不足。
   * 当可用空间占总容量百分比低于阈值时返回 true。
   * 非法输入（可用空间为负或总容量非正）返回 false。
   * @param {number} available - 可用空间（字节）
   * @param {number} total - 总容量（字节）
   * @returns {boolean} 存储空间是否不足
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
   * 获取存储级别描述。
   * 根据可用空间和总容量计算当前存储级别，
   * 返回中文描述："充足"、"一般"、"不足"、"危险"。
   * @param {number} available - 可用空间（字节）
   * @param {number} total - 总容量（字节）
   * @returns {string} 存储级别中文描述
   */
  static getStorageLevel(available: number, total: number): string {
    hilog.debug(DOMAIN, TAG, 'StorageUtils getStorageLevel: available=%{public}s, total=%{public}s',
      available.toString(), total.toString());
    if (total <= 0) {
      hilog.warn(DOMAIN, TAG, 'StorageUtils getStorageLevel: total is zero or negative');
      return LEVEL_CRITICAL;
    }
    const percent: number = StorageUtils.getAvailablePercent(total - available, total);
    let level: string;
    if (percent >= STORAGE_SUFFICIENT_THRESHOLD) {
      level = LEVEL_SUFFICIENT;
    } else if (percent >= STORAGE_NORMAL_THRESHOLD) {
      level = LEVEL_NORMAL;
    } else if (percent >= STORAGE_LOW_THRESHOLD_PERCENT) {
      level = LEVEL_LOW;
    } else {
      level = LEVEL_CRITICAL;
    }
    hilog.info(DOMAIN, TAG, 'StorageUtils getStorageLevel: percent=%{public}s, level=%{public}s',
      percent.toString(), level);
    return level;
  }

  // ========================================
  // 估算与使用率计算方法
  // ========================================

  /**
   * 估算可用空间对应的总容量。
   * 基于经验使用比例估算设备的总存储空间。
   * @param {number} total - 总容量（字节）
   * @returns {number} 估算的可用空间（字节）
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
   * 计算存储使用百分比。
   * 返回已用空间占总容量的百分比。
   * @param {number} used - 已用空间（字节）
   * @param {number} total - 总容量（字节）
   * @returns {number} 使用百分比（0-100）
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
   * 获取存储使用摘要信息。
   * 汇总已用、可用、总量及级别信息为可读字符串。
   * @param {number} used - 已用空间（字节）
   * @param {number} total - 总容量（字节）
   * @returns {string} 存储使用摘要
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
