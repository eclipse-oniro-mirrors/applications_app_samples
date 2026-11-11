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
import { BluetoothConstants } from '../../constants/BluetoothConstants';

const TAG: string = BluetoothConstants.TAG;
const DOMAIN: number = BluetoothConstants.DOMAIN;

/**
 * 格式化工具类
 * 提供数据格式化相关的实用方法
 */
export class FormatUtils {
  /**
   * 格式化字节数为可读字符串
   * @param bytes - 字节数
   * @returns 格式化后的字符串
   */
  static formatBytes(bytes: number): string {
    if (bytes === 0) {
      return '0 B';
    }
    const units: string[] = ['B', 'KB', 'MB', 'GB', 'TB'];
    const k: number = 1024;
    const i: number = Math.floor(Math.log(bytes) / Math.log(k));
    const value: number = bytes / Math.pow(k, i);
    return value.toFixed(2) + ' ' + units[i];
  }

  /**
   * 格式化比特率为可读字符串
   * @param bps - 比特率
   * @returns 格式化后的字符串
   */
  static formatBitRate(bps: number): string {
    if (bps < 1000) {
      return bps + ' bps';
    }
    if (bps < 1000000) {
      return (bps / 1000).toFixed(1) + ' Kbps';
    }
    return (bps / 1000000).toFixed(1) + ' Mbps';
  }

  /**
   * 格式化MAC地址为标准格式
   * @param mac - 原始MAC地址
   * @returns 格式化后的MAC地址
   */
  static formatMacAddress(mac: string): string {
    if (!mac || mac.length < 12) {
      return mac;
    }
    const clean: string = mac.replace(/[:-]/g, '').toUpperCase();
    const parts: string[] = [];
    for (let i: number = 0; i < clean.length; i += 2) {
      parts.push(clean.substring(i, i + 2));
    }
    return parts.join(':');
  }

  /**
   * 格式化信号强度为描述性文本
   * @param rssi - RSSI值
   * @returns 信号强度描述
   */
  static formatSignalStrength(rssi: number): string {
    if (rssi >= -50) {
      return 'Excellent';
    }
    if (rssi >= -60) {
      return 'Good';
    }
    if (rssi >= -70) {
      return 'Fair';
    }
    if (rssi >= -80) {
      return 'Weak';
    }
    return 'Very Weak';
  }

  /**
   * 格式化百分比
   * @param value - 值
   * @param total - 总量
   * @returns 百分比字符串
   */
  static formatPercentage(value: number, total: number): string {
    if (total === 0) {
      return '0%';
    }
    return Math.round((value / total) * 100) + '%';
  }

  /**
   * 格式化数字，添加千位分隔符
   * @param num - 要格式化的数字
   * @returns 格式化后的字符串
   */
  static formatNumber(num: number): string {
    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
  }

  /**
   * 格式化电话号码
   * @param phone - 电话号码
   * @returns 格式化后的电话号码
   */
  static formatPhoneNumber(phone: string): string {
    if (!phone || phone.length !== 11) {
      return phone;
    }
    return phone.substring(0, 3) + ' ' + phone.substring(3, 7) + ' ' + phone.substring(7);
  }

  /**
   * 格式化UUID为标准格式
   * @param uuid - UUID字符串
   * @returns 格式化后的UUID
   */
  static formatUuid(uuid: string): string {
    if (!uuid) {
      return '';
    }
    const clean: string = uuid.replace(/-/g, '').toLowerCase();
    if (clean.length !== 32) {
      return uuid;
    }
    return clean.substring(0, 8) + '-' + clean.substring(8, 12) + '-' +
      clean.substring(12, 16) + '-' + clean.substring(16, 20) + '-' + clean.substring(20);
  }

  /**
   * 截断字符串到指定长度
   * @param str - 原始字符串
   * @param maxLen - 最大长度
   * @param suffix - 截断后缀
   * @returns 截断后的字符串
   */
  static truncate(str: string, maxLen: number, suffix: string = '...'): string {
    if (!str || str.length <= maxLen) {
      return str;
    }
    return str.substring(0, maxLen - suffix.length) + suffix;
  }

  /**
   * 将毫秒转换为时分秒格式
   * @param ms - 毫秒数
   * @returns 格式化后的时间字符串
   */
  static formatTimeMs(ms: number): string {
    const totalSeconds: number = Math.floor(ms / 1000);
    const hours: number = Math.floor(totalSeconds / 3600);
    const minutes: number = Math.floor((totalSeconds % 3600) / 60);
    const seconds: number = totalSeconds % 60;
    if (hours > 0) {
      return String(hours).padStart(2, '0') + ':' +
        String(minutes).padStart(2, '0') + ':' +
        String(seconds).padStart(2, '0');
    }
    return String(minutes).padStart(2, '0') + ':' + String(seconds).padStart(2, '0');
  }

  /**
   * 格式化蓝牙设备类别
   * @param deviceClass - 设备类别值
   * @returns 设备类别描述
   */
  static formatDeviceClass(deviceClass: number): string {
    const majorClass: number = (deviceClass >> 8) & 0x1F;
    switch (majorClass) {
      case 1: return 'Computer';
      case 2: return 'Phone';
      case 3: return 'LAN/Access Point';
      case 4: return 'Audio/Video';
      case 5: return 'Peripheral';
      case 6: return 'Imaging';
      case 7: return 'Wearable';
      case 8: return 'Toy';
      case 9: return 'Health';
      default: return 'Unknown';
    }
  }

  /**
   * 格式化JSON对象为美化字符串
   * @param obj - 要格式化的对象
   * @returns 美化后的JSON字符串
   */
  static formatJson(obj: object): string {
    try {
      return JSON.stringify(obj, null, 2);
    } catch (e) {
      return '{}';
    }
  }
}
