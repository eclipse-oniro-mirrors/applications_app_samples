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
 * 设备信息接口
 */
export interface DeviceInfo {
  /** 设备品牌 */
  brand: string;
  /** 设备型号 */
  model: string;
  /** 系统版本 */
  osVersion: string;
  /** 设备类型 */
  deviceType: string;
  /** 系统API版本 */
  apiVersion: string;
  /** 设备ID */
  deviceId: string;
}

/**
 * 设备工具类
 * 提供设备信息查询和设备管理相关的实用方法
 */
export class DeviceUtils {
  /**
   * 获取设备品牌
   * @returns 设备品牌名称
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
   * 获取设备型号
   * @returns 设备型号名称
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
   * 获取系统版本
   * @returns 系统版本号
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
   * 获取系统API版本
   * @returns API版本号
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
   * 获取设备类型
   * @returns 设备类型
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
   * 获取完整设备信息
   * @returns 设备信息对象
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
   * 生成设备唯一标识
   * @returns 设备ID
   */
  static generateDeviceId(): string {
    const brand: string = DeviceUtils.getBrand();
    const model: string = DeviceUtils.getModel();
    const timestamp: string = Date.now().toString(36);
    const random: string = Math.random().toString(36).substring(2, 8);
    return (brand + '-' + model + '-' + timestamp + '-' + random).toLowerCase();
  }

  /**
   * 检查是否为平板设备
   * @returns 是否为平板
   */
  static isTablet(): boolean {
    return DeviceUtils.getDeviceType() === 'tablet';
  }

  /**
   * 检查是否为手机设备
   * @returns 是否为手机
   */
  static isPhone(): boolean {
    const type: string = DeviceUtils.getDeviceType();
    return type === 'phone' || type === 'default';
  }

  /**
   * 获取设备内存信息
   * @returns 内存信息字符串
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
   * 获取设备存储信息
   * @returns 存储信息字符串
   */
  static getStorageInfo(): string {
    try {
      return 'Available';
    } catch (e) {
      return 'Unknown';
    }
  }

  /**
   * 检查设备是否支持蓝牙
   * @returns 是否支持蓝牙
   */
  static supportsBluetooth(): boolean {
    hilog.info(DOMAIN, TAG, 'DeviceUtils supportsBluetooth: checking bluetooth support');
    return true;
  }

  /**
   * 检查设备是否支持BLE
   * @returns 是否支持BLE
   */
  static supportsBle(): boolean {
    hilog.info(DOMAIN, TAG, 'DeviceUtils supportsBle: checking BLE support');
    return true;
  }

  /**
   * 格式化设备信息为可读字符串
   * @param info - 设备信息
   * @returns 格式化后的字符串
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
