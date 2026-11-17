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

import { BluetoothConstants } from '../../constants/BluetoothConstants';

/**
 * validation result interface
 */
export interface ValidationResult {
  isValid: boolean;
  errorMessage: string;
  errorCode: number;
}

/**
 * validation utility class
 * provides various data validation method method
 */
export class ValidationUtils {
  /**
   * validate Bluetooth MAC address format
   * @param mac - MAC ground address
   * @returns validation result
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
   * validate Bluetooth UUID format
   * @param uuid - UUID
   * @returns validation result
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
   * validate device name
   * @param name - device name
   * @returns validation result
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
   * validate RSSI value
   * @param rssi - RSSI value
   * @returns validation result
   */
  static validateRssi(rssi: number): ValidationResult {
    if (rssi < -120 || rssi > 0) {
      return { isValid: false, errorMessage: 'RSSI out of range', errorCode: 1 };
    }
    return { isValid: true, errorMessage: '', errorCode: 0 };
  }

  /**
   * validate volume value
   * @param volume - volume value
   * @param maxVolume - max volume
   * @returns validation result
   */
  static validateVolume(volume: number, maxVolume: number = 100): ValidationResult {
    if (volume < 0 || volume > maxVolume) {
      return { isValid: false, errorMessage: 'Volume out of range', errorCode: 1 };
    }
    return { isValid: true, errorMessage: '', errorCode: 0 };
  }

  /**
   * validate phone number
   * @param phone - electric talk number
   * @returns validation result
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
   * validate IP address
   * @param ip - IP ground address
   * @returns validation result
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
   * validate non-empty string
   * @param value - want validate value
   * @param fieldName - field name name
   * @returns validation result
   */
  static validateNonEmpty(value: string, fieldName: string): ValidationResult {
    if (!value || value.trim().length === 0) {
      return { isValid: false, errorMessage: fieldName + ' is required', errorCode: 1 };
    }
    return { isValid: true, errorMessage: '', errorCode: 0 };
  }

  /**
   * validate numeric range
   * @param value - want validate value
   * @param min - min value
   * @param max - max value
   * @param fieldName - field name name
   * @returns validation result
   */
  static validateRange(value: number, min: number, max: number, fieldName: string): ValidationResult {
    if (value < min || value > max) {
      return { isValid: false, errorMessage: fieldName + ' out of range [' + min + ', ' + max + ']', errorCode: 1 };
    }
    return { isValid: true, errorMessage: '', errorCode: 0 };
  }

  /**
   * validate string length
   * @param value - want validate string
   * @param minLen - min length degree
   * @param maxLen - max length degree
   * @param fieldName - field name name
   * @returns validation result
   */
  static validateLength(value: string, minLen: number, maxLen: number, fieldName: string): ValidationResult {
    if (!value || value.length < minLen || value.length > maxLen) {
      return { isValid: false, errorMessage: fieldName + ' length must be ' + minLen + '-' + maxLen, errorCode: 1 };
    }
    return { isValid: true, errorMessage: '', errorCode: 0 };
  }
}
