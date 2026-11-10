/*
 * Copyright (c) 2024 Hunan OpenValley Digital Industry Development Co., Ltd.
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
// 格式化单位枚举
// ========================================

/**
 * 字节单位枚举
 * 定义文件大小格式化时使用的单位类型
 */
export enum ByteUnit {
  /** 自动选择合适单位 */
  AUTO = 'auto',
  /** 字节 */
  BYTES = 'B',
  /** 千字节 */
  KILOBYTES = 'KB',
  /** 兆字节 */
  MEGABYTES = 'MB',
  /** 吉字节 */
  GIGABYTES = 'GB',
  /** 太字节 */
  TERABYTES = 'TB',
}

// ========================================
// 格式化工具类
// ========================================

/**
 * 格式化工具类
 * 提供各类数据格式化的静态方法，包括字节大小、时间长度、数字、字符串等
 * 所有格式化方法均支持中文输出
 */
export class FormatUtils {
  /** 字节单位换算基数 */
  private static readonly BYTE_BASE: number = 1024;

  /** 字节单位标签数组 */
  private static readonly BYTE_UNITS: string[] = ['B', 'KB', 'MB', 'GB', 'TB', 'PB'];

  /** 时间单位常量 */
  private static readonly MS_PER_SECOND: number = 1000;
  private static readonly MS_PER_MINUTE: number = 60000;
  private static readonly MS_PER_HOUR: number = 3600000;
  private static readonly MS_PER_DAY: number = 86400000;

  // ========================================
  // 字节格式化
  // ========================================

  /**
   * 将字节数格式化为人类可读的文件大小字符串
   * 自动选择合适的单位（B、KB、MB、GB、TB）
   * @param bytes - 字节数
   * @param decimals - 小数位数，默认为2
   * @returns 格式化后的大小字符串，如"1.5 MB"
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

    // 移除末尾多余的零
    const cleanValue: string = parseFloat(formatted).toString();
    const prefix: string = isNegative ? '-' : '';

    return `${prefix}${cleanValue} ${FormatUtils.BYTE_UNITS[safeUnitIndex]}`;
  }

  /**
   * 将字节数格式化为精确的指定单位
   * @param bytes - 字节数
   * @param unit - 目标单位
   * @param decimals - 小数位数，默认为2
   * @returns 格式化后的大小字符串
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
  // 时间长度格式化
  // ========================================

  /**
   * 将毫秒数格式化为人类可读的时间长度字符串
   * 支持天、小时、分钟、秒的组合显示
   * @param ms - 毫秒数
   * @returns 格式化后的时间长度字符串，如"2小时30分"
   */
  static formatDuration(ms: number): string {
    if (ms <= 0) {
      return '0秒';
    }

    const days: number = Math.floor(ms / FormatUtils.MS_PER_DAY);
    const hours: number = Math.floor((ms % FormatUtils.MS_PER_DAY) / FormatUtils.MS_PER_HOUR);
    const minutes: number = Math.floor((ms % FormatUtils.MS_PER_HOUR) / FormatUtils.MS_PER_MINUTE);
    const seconds: number = Math.floor((ms % FormatUtils.MS_PER_MINUTE) / FormatUtils.MS_PER_SECOND);

    let result: string = '';

    if (days > 0) {
      result += `${days}天`;
    }
    if (hours > 0) {
      result += `${hours}小时`;
    }
    if (minutes > 0) {
      result += `${minutes}分`;
    }
    if (seconds > 0 && days === 0) {
      result += `${seconds}秒`;
    }

    return result || '0秒';
  }

  /**
   * 将秒数格式化为 HH:mm:ss 格式的时间字符串
   * @param totalSeconds - 总秒数
   * @returns 格式化后的时间字符串
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
  // 数字格式化
  // ========================================

  /**
   * 格式化数字，保留指定小数位数
   * @param num - 要格式化的数字
   * @param decimals - 小数位数，默认为2
   * @returns 格式化后的数字字符串
   */
  static formatNumber(num: number, decimals: number = 2): string {
    if (isNaN(num)) {
      hilog.warn(DOMAIN, TAG, '格式化无效数字');
      return '0';
    }
    return num.toFixed(decimals);
  }

  /**
   * 格式化数字为带千分位分隔符的字符串
   * @param num - 要格式化的数字
   * @returns 带千分位分隔符的数字字符串，如"1,234,567"
   */
  static formatWithSeparator(num: number): string {
    const parts: string[] = num.toString().split('.');
    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    return parts.join('.');
  }

  /**
   * 格式化大数字为简短表示（万、亿）
   * @param num - 要格式化的数字
   * @returns 简短的数字表示，如"1.5万"、"2.3亿"
   */
  static formatCompactNumber(num: number): string {
    if (Math.abs(num) >= 100000000) {
      return `${(num / 100000000).toFixed(1)}亿`;
    }
    if (Math.abs(num) >= 10000) {
      return `${(num / 10000).toFixed(1)}万`;
    }
    return num.toString();
  }

  // ========================================
  // 字符串格式化
  // ========================================

  /**
   * 在字符串开头填充指定字符到目标长度
   * @param str - 原始字符串
   * @param len - 目标总长度
   * @param char - 填充字符，默认为空格
   * @returns 填充后的字符串
   */
  static padStart(str: string, len: number, char: string = ' '): string {
    if (str.length >= len) {
      return str;
    }
    const padding: string = char.repeat(len - str.length);
    return padding + str;
  }

  /**
   * 在字符串末尾填充指定字符到目标长度
   * @param str - 原始字符串
   * @param len - 目标总长度
   * @param char - 填充字符，默认为空格
   * @returns 填充后的字符串
   */
  static padEnd(str: string, len: number, char: string = ' '): string {
    if (str.length >= len) {
      return str;
    }
    const padding: string = char.repeat(len - str.length);
    return str + padding;
  }

  /**
   * 截断字符串到指定最大长度，超出部分用省略号替代
   * @param str - 原始字符串
   * @param maxLen - 最大长度（包含省略号）
   * @param suffix - 超出部分的替代后缀，默认为"..."
   * @returns 截断后的字符串
   */
  static truncate(str: string, maxLen: number, suffix: string = '...'): string {
    if (str.length <= maxLen) {
      return str;
    }
    return str.substring(0, maxLen - suffix.length) + suffix;
  }

  /**
   * 格式化百分比数值
   * @param ratio - 比率值（0-1之间的小数或0-100的整数）
   * @param decimals - 小数位数，默认为1
   * @returns 格式化后的百分比字符串，如"75.5%"
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
   * 格式化手机号码，中间部分用星号替代
   * @param phone - 手机号码字符串
   * @returns 脱敏后的手机号码，如"138****5678"
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
   * 格式化邮箱地址，用户名部分用星号替代
   * @param email - 邮箱地址
   * @returns 脱敏后的邮箱地址
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
