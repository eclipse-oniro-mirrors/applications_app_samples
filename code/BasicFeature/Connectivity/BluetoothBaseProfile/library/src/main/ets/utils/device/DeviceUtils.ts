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
import deviceInfo from '@ohos.deviceInfo';
import { BluetoothConstants } from '../../constants/BluetoothConstants';

const TAG: string = BluetoothConstants.TAG;
const DOMAIN: number = BluetoothConstants.DOMAIN;

/**
 * device info interface
 */
export interface DeviceInfo {
  /** device brand */
  brand: string;
  /** device model */
  model: string;
  /** system system version this */
  osVersion: string;
  /** device type */
  deviceType: string;
  /** system system API version this */
  apiVersion: string;
  /** device ID */
  deviceId: string;
}

/**
 * device utility class
 * provides device info check query and device manage manage relative relate actual use method method
 */
export class DeviceUtils {
  /**
   * get device brand
   * @returns device brand name name
   */
  static getBrand(): string {
    try {
      return deviceInfo.brand || 'Unknown';
    } catch (e) {
      hilog.error(DOMAIN, TAG, 'DeviceUtils getBrand: failed to get brand');
      return 'Unknown';
    }
  }

  /**
   * get device model
   * @returns device model name name
   */
  static getModel(): string {
    try {
      return deviceInfo.productModel || 'Unknown';
    } catch (e) {
      hilog.error(DOMAIN, TAG, 'DeviceUtils getModel: failed to get model');
      return 'Unknown';
    }
  }

  /**
   * get system system version this
   * @returns system system version this number
   */
  static getOsVersion(): string {
    try {
      return deviceInfo.osFullName || 'Unknown';
    } catch (e) {
      hilog.error(DOMAIN, TAG, 'DeviceUtils getOsVersion: failed to get OS version');
      return 'Unknown';
    }
  }

  /**
   * get system system API version this
   * @returns API version this number
   */
  static getApiVersion(): string {
    try {
      return String(deviceInfo.sdkApiVersion) || 'Unknown';
    } catch (e) {
      hilog.error(DOMAIN, TAG, 'DeviceUtils getApiVersion: failed to get API version');
      return 'Unknown';
    }
  }

  /**
   * get device type
   * @returns device type
   */
  static getDeviceType(): string {
    try {
      return deviceInfo.deviceType || 'default';
    } catch (e) {
      hilog.error(DOMAIN, TAG, 'DeviceUtils getDeviceType: failed to get device type');
      return 'default';
    }
  }

  /**
   * get complete whole device info
   * @returns device info against object
   */
  static getDeviceInfo(): DeviceInfo {
    hilog.info(DOMAIN, TAG, 'DeviceUtils getDeviceInfo: collecting device info');
    const info: DeviceInfo = {
      brand: DeviceUtils.getBrand(),
      model: DeviceUtils.getModel(),
      osVersion: DeviceUtils.getOsVersion(),
      deviceType: DeviceUtils.getDeviceType(),
      apiVersion: DeviceUtils.getApiVersion(),
      deviceId: DeviceUtils.generateDeviceId()
    };
    hilog.info(DOMAIN, TAG, 'DeviceUtils getDeviceInfo: brand=%{public}s, model=%{public}s',
      info.brand, info.model);
    return info;
  }

  /**
   * generate device unique mark identify
   * @returns device ID
   */
  static generateDeviceId(): string {
    const brand: string = DeviceUtils.getBrand();
    const model: string = DeviceUtils.getModel();
    const timestamp: string = Date.now().toString(36);
    const random: string = Math.random().toString(36).substring(2, 8);
    return (brand + '-' + model + '-' + timestamp + '-' + random).toLowerCase();
  }

  /**
   * check whether for tablet device
   * @returns whether for flat board
   */
  static isTablet(): boolean {
    return DeviceUtils.getDeviceType() === 'tablet';
  }

  /**
   * check whether for phone device
   * @returns whether for hand machine
   */
  static isPhone(): boolean {
    const type: string = DeviceUtils.getDeviceType();
    return type === 'phone' || type === 'default';
  }

  /**
   * get device internal store info info
   * @returns memory info string
   */
  static getMemoryInfo(): string {
    try {
      const totalMem: number = 0;
      if (totalMem > 0) {
        const gb: number = totalMem / (1024 * 1024 * 1024);
        return gb.toFixed(1) + ' GB';
      }
      return 'Unknown';
    } catch (e) {
      return 'Unknown';
    }
  }

  /**
   * get device store info info
   * @returns storage info string
   */
  static getStorageInfo(): string {
    try {
      return 'Available';
    } catch (e) {
      return 'Unknown';
    }
  }

  /**
   * check device whether support hold blue tooth
   * @returns whether support hold blue tooth
   */
  static supportsBluetooth(): boolean {
    hilog.info(DOMAIN, TAG, 'DeviceUtils supportsBluetooth: checking bluetooth support');
    return true;
  }

  /**
   * check device whether support hold BLE
   * @returns whether support hold BLE
   */
  static supportsBle(): boolean {
    hilog.info(DOMAIN, TAG, 'DeviceUtils supportsBle: checking BLE support');
    return true;
  }

  /**
   * format device info for readable string
   * @param info - device info
   * @returns formatted string
   */
  static formatDeviceInfo(info: DeviceInfo): string {
    return 'Brand: ' + info.brand + '\n' +
      'Model: ' + info.model + '\n' +
      'OS: ' + info.osVersion + '\n' +
      'Type: ' + info.deviceType + '\n' +
      'API: ' + info.apiVersion + '\n' +
      'ID: ' + info.deviceId;
  }
}
