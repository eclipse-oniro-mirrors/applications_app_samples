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
import { ResourceHelper } from './ResourceHelper';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

// ========================================
// Format unit enum
// ========================================

/**
 * Byte unit enum
 * Defines unit types used when formatting file sizes
 */
export enum ByteUnit {
  /** Automatically selects a suitable unit */
  AUTO = 'auto',
  /** Bytes */
  BYTES = 'B',
  /** Kilobytes */
  KILOBYTES = 'KB',
  /** Megabytes */
  MEGABYTES = 'MB',
  /** Gigabytes */
  GIGABYTES = 'GB',
  /** Terabytes */
  TERABYTES = 'TB',
}

// ========================================
// Formatting utility class
// ========================================

/**
 * Formatting utility class
 * Provides static methods for various data formats, including byte size, duration,
 * numbers and strings
 * Language-dependent units and texts come from string.json resources
 * (duration_*, compact_unit_*)
 */
export class FormatUtils {
  /** Byte conversion base */
  private static readonly BYTE_BASE: number = 1024;

  /** Byte unit label array */
  private static readonly BYTE_UNITS: string[] = ['B', 'KB', 'MB', 'GB', 'TB', 'PB'];

  /** Time unit constants */
  private static readonly MS_PER_SECOND: number = 1000;
  private static readonly MS_PER_MINUTE: number = 60000;
  private static readonly MS_PER_HOUR: number = 3600000;
  private static readonly MS_PER_DAY: number = 86400000;

  // ========================================
  // Byte formatting
  // ========================================

  /**
   * Formats a byte count into a human-readable file size string
   * Automatically selects a suitable unit (B, KB, MB, GB, TB)
   * @param bytes - Byte count
   * @param decimals - Digits after the decimal point, default 2
   * @returns Formatted size string, e.g. "1.5 MB"
   */
  static formatBytes(bytes: number, decimals: number = 2): string {
    if (bytes === 0) {
      return '0 B';
    }

    const isNegative: boolean = bytes < 0;
    const absBytes: number = Math.abs(bytes);
    const unitIndex: number = Math.floor(Math.log(absBytes) / Math.log(FormatUtils.BYTE_BASE));
    const safeUnitIndex: number = Math.min(unitIndex, FormatUtils.BYTE_UNITS.length - 1);
    const value: number = absBytes / Math.pow(FormatUtils.BYTE_BASE, safeUnitIndex);
    const formatted: string = value.toFixed(decimals);

    // Remove trailing redundant zeros
    const cleanValue: string = parseFloat(formatted).toString();
    const prefix: string = isNegative ? '-' : '';

    return `${prefix}${cleanValue} ${FormatUtils.BYTE_UNITS[safeUnitIndex]}`;
  }

  /**
   * Formats a byte count into an exact specified unit
   * @param bytes - Byte count
   * @param unit - Target unit
   * @param decimals - Digits after the decimal point, default 2
   * @returns Formatted size string
   */
  static formatBytesInUnit(bytes: number, unit: ByteUnit, decimals: number = 2): string {
    if (unit === ByteUnit.AUTO) {
      return FormatUtils.formatBytes(bytes, decimals);
    }

    const unitMap: Map<string, number> = new Map<string, number>([
      ['B', 0],
      ['KB', 1],
      ['MB', 2],
      ['GB', 3],
      ['TB', 4],
    ]);

    const power: number = unitMap.get(unit) ?? 0;
    const value: number = bytes / Math.pow(FormatUtils.BYTE_BASE, power);
    return `${value.toFixed(decimals)} ${unit}`;
  }

  // ========================================
  // Duration formatting
  // ========================================

  /**
   * Formats milliseconds into a human-readable duration string
   * Supports combinations of days, hours, minutes and seconds; unit texts come from
   * string.json duration_* resources
   * @param ms - Milliseconds
   * @returns Formatted duration string
   */
  static formatDuration(ms: number): string {
    if (ms <= 0) {
      return ResourceHelper.getStringByName('duration_zero');
    }

    const days: number = Math.floor(ms / FormatUtils.MS_PER_DAY);
    const hours: number = Math.floor((ms % FormatUtils.MS_PER_DAY) / FormatUtils.MS_PER_HOUR);
    const minutes: number = Math.floor((ms % FormatUtils.MS_PER_HOUR) / FormatUtils.MS_PER_MINUTE);
    const seconds: number = Math.floor((ms % FormatUtils.MS_PER_MINUTE) / FormatUtils.MS_PER_SECOND);

    let result: string = '';

    if (days > 0) {
      result += ResourceHelper.getStringByName('duration_days', days);
    }
    if (hours > 0) {
      result += ResourceHelper.getStringByName('duration_hours', hours);
    }
    if (minutes > 0) {
      result += ResourceHelper.getStringByName('duration_minutes', minutes);
    }
    if (seconds > 0 && days === 0) {
      result += ResourceHelper.getStringByName('duration_seconds', seconds);
    }

    return result || ResourceHelper.getStringByName('duration_zero');
  }

  /**
   * Formats seconds into an HH:mm:ss time string
   * @param totalSeconds - Total seconds
   * @returns Formatted time string
   */
  static formatSeconds(totalSeconds: number): string {
    const hours: number = Math.floor(totalSeconds / 3600);
    const minutes: number = Math.floor((totalSeconds % 3600) / 60);
    const seconds: number = totalSeconds % 60;

    const hoursStr: string = hours.toString().padStart(2, '0');
    const minutesStr: string = minutes.toString().padStart(2, '0');
    const secondsStr: string = seconds.toString().padStart(2, '0');

    return `${hoursStr}:${minutesStr}:${secondsStr}`;
  }

  // ========================================
  // Number formatting
  // ========================================

  /**
   * Formats a number keeping the given digits after the decimal point
   * @param num - Number to format
   * @param decimals - Digits after the decimal point, default 2
   * @returns Formatted number string
   */
  static formatNumber(num: number, decimals: number = 2): string {
    if (isNaN(num)) {
      hilog.warn(DOMAIN, TAG, 'FormatUtils invalid number input');
      return '0';
    }
    return num.toFixed(decimals);
  }

  /**
   * Formats a number with thousands separators
   * @param num - Number to format
   * @returns Number string with thousands separators, e.g. "1,234,567"
   */
  static formatWithSeparator(num: number): string {
    const parts: string[] = num.toString().split('.');
    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    return parts.join('.');
  }

  /**
   * Formats a large number in compact form, using units from string.json compact_unit_* resources
   * @param num - Number to format
   * @returns Compact number representation
   */
  static formatCompactNumber(num: number): string {
    if (Math.abs(num) >= 100000000) {
      return `${(num / 100000000).toFixed(1)}${ResourceHelper.getStringByName('compact_unit_yi')}`;
    }
    if (Math.abs(num) >= 10000) {
      return `${(num / 10000).toFixed(1)}${ResourceHelper.getStringByName('compact_unit_wan')}`;
    }
    return num.toString();
  }

  // ========================================
  // String formatting
  // ========================================

  /**
   * Pads a string at the start with a character until the target length
   * @param str - Original string
   * @param len - Target total length
   * @param char - Padding character, default space
   * @returns Padded string
   */
  static padStart(str: string, len: number, char: string = ' '): string {
    if (str.length >= len) {
      return str;
    }
    const padding: string = char.repeat(len - str.length);
    return padding + str;
  }

  /**
   * Pads a string at the end with a character until the target length
   * @param str - Original string
   * @param len - Target total length
   * @param char - Padding character, default space
   * @returns Padded string
   */
  static padEnd(str: string, len: number, char: string = ' '): string {
    if (str.length >= len) {
      return str;
    }
    const padding: string = char.repeat(len - str.length);
    return str + padding;
  }

  /**
   * Truncates a string to a maximum length, replacing the overflow with an ellipsis
   * @param str - Original string
   * @param maxLen - Maximum length (including the ellipsis)
   * @param suffix - Replacement suffix for the overflow, default "..."
   * @returns Truncated string
   */
  static truncate(str: string, maxLen: number, suffix: string = '...'): string {
    if (str.length <= maxLen) {
      return str;
    }
    return str.substring(0, maxLen - suffix.length) + suffix;
  }

  /**
   * Formats a percentage value
   * @param ratio - Ratio (a decimal between 0-1 or an integer between 0-100)
   * @param decimals - Digits after the decimal point, default 1
   * @returns Formatted percentage string, e.g. "75.5%"
   */
  static formatPercentage(ratio: number, decimals: number = 1): string {
    let percentage: number;
    if (ratio >= 0 && ratio <= 1) {
      percentage = ratio * 100;
    } else {
      percentage = ratio;
    }
    return `${percentage.toFixed(decimals)}%`;
  }

  /**
   * Formats a phone number with the middle part masked by asterisks
   * @param phone - Phone number string
   * @returns Masked phone number, e.g. "138****5678"
   */
  static maskPhone(phone: string): string {
    if (phone.length < 7) {
      return phone;
    }
    const prefix: string = phone.substring(0, 3);
    const suffix: string = phone.substring(phone.length - 4);
    const masked: string = '****';
    return `${prefix}${masked}${suffix}`;
  }

  /**
   * Formats an email address with the username part masked by asterisks
   * @param email - Email address
   * @returns Masked email address
   */
  static maskEmail(email: string): string {
    const atIndex: number = email.indexOf('@');
    if (atIndex <= 0) {
      return email;
    }
    const username: string = email.substring(0, atIndex);
    const domain: string = email.substring(atIndex);
    const masked: string = username.length > 2
      ? username[0] + '***' + username[username.length - 1]
      : '***';
    return `${masked}${domain}`;
  }
}
