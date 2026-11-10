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

import { BluetoothConstants } from '../../constants/BluetoothConstants';

/**
 * 验证结果接口
 */
export interface ValidationResult {
  isValid: boolean;
  errorMessage: string;
  errorCode: number;
}

/**
 * 验证工具类
 * 提供各种数据验证方法
 */
export class ValidationUtils {
  /**
   * 验证蓝牙MAC地址格式
   * @param mac - MAC地址
   * @returns 验证结果
   */
  static validateMacAddress(mac: string): ValidationResult {
    if (!mac || mac.length === 0) {
      return { isValid: false, errorMessage: 'MAC address is empty', errorCode: 1 };
    }
    const regex: RegExp = /^([0-9A-Fa-f]{2}[:-]){5}[0-9A-Fa-f]{2}$/;
    if (!regex.test(mac)) {
      return { isValid: false, errorMessage: 'Invalid MAC format', errorCode: 2 };
    }
    return { isValid: true, errorMessage: '', errorCode: 0 };
  }

  /**
   * 验证蓝牙UUID格式
   * @param uuid - UUID
   * @returns 验证结果
   */
  static validateUuid(uuid: string): ValidationResult {
    if (!uuid || uuid.length === 0) {
      return { isValid: false, errorMessage: 'UUID is empty', errorCode: 1 };
    }
    const regex: RegExp = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;
    if (!regex.test(uuid)) {
      return { isValid: false, errorMessage: 'Invalid UUID format', errorCode: 2 };
    }
    return { isValid: true, errorMessage: '', errorCode: 0 };
  }

  /**
   * 验证设备名称
   * @param name - 设备名称
   * @returns 验证结果
   */
  static validateDeviceName(name: string): ValidationResult {
    if (!name || name.length === 0) {
      return { isValid: false, errorMessage: 'Device name is empty', errorCode: 1 };
    }
    if (name.length > BluetoothConstants.MAX_DEVICE_NAME_LENGTH) {
      return { isValid: false, errorMessage: 'Device name too long', errorCode: 2 };
    }
    return { isValid: true, errorMessage: '', errorCode: 0 };
  }

  /**
   * 验证RSSI值
   * @param rssi - RSSI值
   * @returns 验证结果
   */
  static validateRssi(rssi: number): ValidationResult {
    if (rssi < -120 || rssi > 0) {
      return { isValid: false, errorMessage: 'RSSI out of range', errorCode: 1 };
    }
    return { isValid: true, errorMessage: '', errorCode: 0 };
  }

  /**
   * 验证音量值
   * @param volume - 音量值
   * @param maxVolume - 最大音量
   * @returns 验证结果
   */
  static validateVolume(volume: number, maxVolume: number = 100): ValidationResult {
    if (volume < 0 || volume > maxVolume) {
      return { isValid: false, errorMessage: 'Volume out of range', errorCode: 1 };
    }
    return { isValid: true, errorMessage: '', errorCode: 0 };
  }

  /**
   * 验证电话号码
   * @param phone - 电话号码
   * @returns 验证结果
   */
  static validatePhoneNumber(phone: string): ValidationResult {
    if (!phone || phone.length === 0) {
      return { isValid: false, errorMessage: 'Phone number is empty', errorCode: 1 };
    }
    const regex: RegExp = /^[+]?[\d\s()-]{7,20}$/;
    if (!regex.test(phone)) {
      return { isValid: false, errorMessage: 'Invalid phone format', errorCode: 2 };
    }
    return { isValid: true, errorMessage: '', errorCode: 0 };
  }

  /**
   * 验证IP地址
   * @param ip - IP地址
   * @returns 验证结果
   */
  static validateIpAddress(ip: string): ValidationResult {
    if (!ip || ip.length === 0) {
      return { isValid: false, errorMessage: 'IP address is empty', errorCode: 1 };
    }
    const regex: RegExp = /^((25[0-5]|2[0-4]\d|[01]?\d\d?)\.){3}(25[0-5]|2[0-4]\d|[01]?\d\d?)$/;
    if (!regex.test(ip)) {
      return { isValid: false, errorMessage: 'Invalid IP format', errorCode: 2 };
    }
    return { isValid: true, errorMessage: '', errorCode: 0 };
  }

  /**
   * 验证非空字符串
   * @param value - 要验证的值
   * @param fieldName - 字段名称
   * @returns 验证结果
   */
  static validateNonEmpty(value: string, fieldName: string): ValidationResult {
    if (!value || value.trim().length === 0) {
      return { isValid: false, errorMessage: fieldName + ' is required', errorCode: 1 };
    }
    return { isValid: true, errorMessage: '', errorCode: 0 };
  }

  /**
   * 验证数值范围
   * @param value - 要验证的值
   * @param min - 最小值
   * @param max - 最大值
   * @param fieldName - 字段名称
   * @returns 验证结果
   */
  static validateRange(value: number, min: number, max: number, fieldName: string): ValidationResult {
    if (value < min || value > max) {
      return { isValid: false, errorMessage: fieldName + ' out of range [' + min + ', ' + max + ']', errorCode: 1 };
    }
    return { isValid: true, errorMessage: '', errorCode: 0 };
  }

  /**
   * 验证字符串长度
   * @param value - 要验证的字符串
   * @param minLen - 最小长度
   * @param maxLen - 最大长度
   * @param fieldName - 字段名称
   * @returns 验证结果
   */
  static validateLength(value: string, minLen: number, maxLen: number, fieldName: string): ValidationResult {
    if (!value || value.length < minLen || value.length > maxLen) {
      return { isValid: false, errorMessage: fieldName + ' length must be ' + minLen + '-' + maxLen, errorCode: 1 };
    }
    return { isValid: true, errorMessage: '', errorCode: 0 };
  }
}
