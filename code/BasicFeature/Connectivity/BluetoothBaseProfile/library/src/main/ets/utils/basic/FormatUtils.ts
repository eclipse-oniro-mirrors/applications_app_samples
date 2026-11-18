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
 * format utility class
 * provides data format relative relate actual use method method
 */
export class FormatUtils {
  /**
   * format bytes to readable string
   * @param bytes - character section number
   * @returns formatted string
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
   * format bitrate to readable string
   * @param bps - compare special rate
   * @returns formatted string
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
   * format MAC address to standard format
   * @param mac - original MAC ground address
   * @returns formatted MAC ground address
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
   * format signal strength to descriptive text
   * @param rssi - RSSI value
   * @returns signal strength description
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
   * format percentage
   * @param value - value
   * @param total - total amount
   * @returns percentage string
   */
  static formatPercentage(value: number, total: number): string {
    if (total === 0) {
      return '0%';
    }
    return Math.round((value / total) * 100) + '%';
  }

  /**
   * format number with thousands separator
   * @param num - want format number character
   * @returns formatted string
   */
  static formatNumber(num: number): string {
    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
  }

  /**
   * format phone number
   * @param phone - electric talk number
   * @returns formatted electric talk number
   */
  static formatPhoneNumber(phone: string): string {
    if (!phone || phone.length !== 11) {
      return phone;
    }
    return phone.substring(0, 3) + ' ' + phone.substring(3, 7) + ' ' + phone.substring(7);
  }

  /**
   * format UUID to standard format
   * @param uuid - UUID string
   * @returns formatted UUID
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
   * truncate string to the specified length
   * @param str - original string
   * @param maxLen - max length degree
   * @param suffix - cut disconnect suffix
   * @returns truncated string
   */
  static truncate(str: string, maxLen: number, suffix: string = '...'): string {
    if (!str || str.length <= maxLen) {
      return str;
    }
    return str.substring(0, maxLen - suffix.length) + suffix;
  }

  /**
   * convert ms to hour-minute-second format
   * @param ms - milliseconds
   * @returns formatted time string
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
   * format Bluetooth device class
   * @param deviceClass - device class value
   * @returns device class describe describe
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
   * format JSON object to pretty string
   * @param obj - want format against object
   * @returns pretty ize after JSON string
   */
  static formatJson(obj: object): string {
    try {
      return JSON.stringify(obj, null, 2);
    } catch (e) {
      return '{}';
    }
  }
}
