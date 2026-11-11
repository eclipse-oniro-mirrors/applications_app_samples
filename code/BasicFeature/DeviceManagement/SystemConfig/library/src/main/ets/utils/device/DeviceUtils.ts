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
import { deviceInfo } from '@kit.BasicServicesKit';
import { display } from '@kit.ArkUI';
import { SystemConfigConstants } from '../../constants/SystemConfigConstants';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

// ========================================
// 设备类型常量定义
// ========================================

/** 设备类型 - 默认（手机） */
const DEVICE_TYPE_DEFAULT: string = 'default';
/** 设备类型 - 平板 */
const DEVICE_TYPE_TABLET: string = 'tablet';
/** 设备类型 - 电视 */
const DEVICE_TYPE_TV: string = 'tv';
/** 设备类型 - 穿戴 */
const DEVICE_TYPE_WEARABLE: string = 'wearable';
/** 设备类型 - 车机 */
const DEVICE_TYPE_CAR: string = 'car';

// ========================================
// 设备信息工具类
// ========================================

/**
 * 设备信息工具类。
 * 基于 deviceInfo 与 display 模块提供静态方法，
 * 获取设备类型、屏幕尺寸、系统版本等真实设备信息。
 */
export class DeviceUtils {
  /** 缓存的设备类型 */
  private static cachedDeviceType: string = '';
  /** 缓存的设备 ID */
  private static cachedDeviceId: string = '';
  /** 屏幕宽度（像素，0 表示尚未获取） */
  private static screenWidth: number = 0;
  /** 屏幕高度（像素，0 表示尚未获取） */
  private static screenHeight: number = 0;

  /**
   * 获取设备类型。
   * 读取 deviceInfo.deviceType 真实设备类型标识，
   * 归一化为 default、tablet、tv、wearable、car 等类型。
   * @returns {string} 设备类型字符串
   */
  static getDeviceType(): string {
    if (DeviceUtils.cachedDeviceType.length > 0) {
      hilog.debug(DOMAIN, TAG, 'DeviceUtils getDeviceType: returning cached=%{public}s', DeviceUtils.cachedDeviceType);
      return DeviceUtils.cachedDeviceType;
    }
    hilog.info(DOMAIN, TAG, 'DeviceUtils getDeviceType: detecting device type');
    let deviceType: string = DEVICE_TYPE_DEFAULT;
    try {
      const rawType: string = deviceInfo.deviceType.toLowerCase();
      if (rawType === DEVICE_TYPE_TABLET) {
        deviceType = DEVICE_TYPE_TABLET;
      } else if (rawType === DEVICE_TYPE_TV) {
        deviceType = DEVICE_TYPE_TV;
      } else if (rawType === DEVICE_TYPE_WEARABLE) {
        deviceType = DEVICE_TYPE_WEARABLE;
      } else if (rawType === DEVICE_TYPE_CAR) {
        deviceType = DEVICE_TYPE_CAR;
      } else {
        // 未归一化的真实设备类型原样返回，空值兜底为 default 以免缓存空串
        deviceType = rawType.length > 0 ? rawType : DEVICE_TYPE_DEFAULT;
      }
      hilog.info(DOMAIN, TAG, 'DeviceUtils getDeviceType: detected=%{public}s', deviceType);
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'DeviceUtils getDeviceType: detection failed, using default');
      deviceType = DEVICE_TYPE_DEFAULT;
    }
    DeviceUtils.cachedDeviceType = deviceType;
    return deviceType;
  }

  /**
   * 从 display 模块惰性获取真实屏幕尺寸。
   * 获取失败时保持当前值（可能为 0），不伪造默认尺寸。
   */
  private static ensureScreenSize(): void {
    if (DeviceUtils.screenWidth > 0 && DeviceUtils.screenHeight > 0) {
      return;
    }
    try {
      const defaultDisplay: display.Display = display.getDefaultDisplaySync();
      DeviceUtils.screenWidth = defaultDisplay.width;
      DeviceUtils.screenHeight = defaultDisplay.height;
      hilog.info(DOMAIN, TAG, 'DeviceUtils ensureScreenSize: width=%{public}d, height=%{public}d',
        DeviceUtils.screenWidth, DeviceUtils.screenHeight);
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'DeviceUtils ensureScreenSize: failed to read display size');
    }
  }

  /**
   * 获取屏幕宽度。
   * 返回当前设备屏幕的宽度（像素值）。
   * @returns {number} 屏幕宽度（像素）
   */
  static getScreenWidth(): number {
    DeviceUtils.ensureScreenSize();
    hilog.debug(DOMAIN, TAG, 'DeviceUtils getScreenWidth: width=%{public}d', DeviceUtils.screenWidth);
    return DeviceUtils.screenWidth;
  }

  /**
   * 获取屏幕高度。
   * 返回当前设备屏幕的高度（像素值）。
   * @returns {number} 屏幕高度（像素）
   */
  static getScreenHeight(): number {
    DeviceUtils.ensureScreenSize();
    hilog.debug(DOMAIN, TAG, 'DeviceUtils getScreenHeight: height=%{public}d', DeviceUtils.screenHeight);
    return DeviceUtils.screenHeight;
  }

  /**
   * 设置屏幕尺寸。
   * 用于在获取到实际屏幕尺寸后更新缓存值。
   * @param {number} width - 屏幕宽度（像素）
   * @param {number} height - 屏幕高度（像素）
   */
  static setScreenSize(width: number, height: number): void {
    hilog.info(DOMAIN, TAG, 'DeviceUtils setScreenSize: width=%{public}d, height=%{public}d', width, height);
    DeviceUtils.screenWidth = width;
    DeviceUtils.screenHeight = height;
  }

  // ========================================
  // 设备状态判断方法
  // ========================================

  /**
   * 判断当前设备是否为模拟器。
   * 通过 deviceInfo 的 productModel / marketName / displayVersion
   * 中的模拟器特征标识判断，default 设备类型不再视为模拟器。
   * @returns {boolean} 是否为模拟器
   */
  static isEmulator(): boolean {
    let isEmu: boolean = false;
    try {
      const model: string = deviceInfo.productModel.toLowerCase();
      const market: string = deviceInfo.marketName.toLowerCase();
      const displayVersion: string = deviceInfo.displayVersion.toLowerCase();
      isEmu = model.indexOf('emulator') >= 0 || model.indexOf('virt') >= 0 ||
        market.indexOf('emulator') >= 0 || displayVersion.indexOf('emulator') >= 0;
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'DeviceUtils isEmulator: detection failed, returning false');
      isEmu = false;
    }
    hilog.debug(DOMAIN, TAG, 'DeviceUtils isEmulator: result=%{public}s', isEmu.toString());
    return isEmu;
  }

  /**
   * 判断当前屏幕方向是否为竖屏。
   * 当屏幕高度大于或等于宽度时判定为竖屏模式。
   * @returns {boolean} 是否为竖屏
   */
  static isPortrait(): boolean {
    const result: boolean = DeviceUtils.getScreenHeight() >= DeviceUtils.getScreenWidth();
    hilog.debug(DOMAIN, TAG, 'DeviceUtils isPortrait: result=%{public}s', result.toString());
    return result;
  }

  /**
   * 判断当前屏幕方向是否为横屏。
   * 当屏幕宽度大于高度时判定为横屏模式。
   * @returns {boolean} 是否为横屏
   */
  static isLandscape(): boolean {
    const result: boolean = DeviceUtils.getScreenWidth() > DeviceUtils.getScreenHeight();
    hilog.debug(DOMAIN, TAG, 'DeviceUtils isLandscape: result=%{public}s', result.toString());
    return result;
  }

  /**
   * 判断当前设备是否为平板。
   * @returns {boolean} 是否为平板设备
   */
  static isTablet(): boolean {
    const result: boolean = DeviceUtils.getDeviceType() === DEVICE_TYPE_TABLET;
    hilog.debug(DOMAIN, TAG, 'DeviceUtils isTablet: result=%{public}s', result.toString());
    return result;
  }

  /**
   * 判断当前设备是否为电视。
   * @returns {boolean} 是否为电视设备
   */
  static isTv(): boolean {
    const result: boolean = DeviceUtils.getDeviceType() === DEVICE_TYPE_TV;
    hilog.debug(DOMAIN, TAG, 'DeviceUtils isTv: result=%{public}s', result.toString());
    return result;
  }

  // ========================================
  // 设备标识与版本方法
  // ========================================

  /**
   * 获取设备唯一标识。
   * 基于设备信息生成哈希 ID，用于标识唯一设备。
   * @returns {string} 设备唯一 ID
   */
  static getDeviceId(): string {
    if (DeviceUtils.cachedDeviceId.length > 0) {
      hilog.debug(DOMAIN, TAG, 'DeviceUtils getDeviceId: returning cached id');
      return DeviceUtils.cachedDeviceId;
    }
    hilog.info(DOMAIN, TAG, 'DeviceUtils getDeviceId: generating device id');
    const rawInfo: string = DeviceUtils.getDeviceType() + '_' +
      DeviceUtils.getScreenWidth().toString() + '_' +
      DeviceUtils.getScreenHeight().toString() + '_' +
      DeviceUtils.getOsVersion();
    let hash: number = 0;
    for (let i: number = 0; i < rawInfo.length; i++) {
      const charCode: number = rawInfo.charCodeAt(i);
      hash = ((hash << 5) - hash) + charCode;
      hash = hash & hash;
    }
    const timestamp: number = Date.now();
    const deviceId: string = 'dev_' + Math.abs(hash).toString(16) + '_' + timestamp.toString(16);
    DeviceUtils.cachedDeviceId = deviceId;
    hilog.info(DOMAIN, TAG, 'DeviceUtils getDeviceId: generated id=%{public}s', deviceId);
    return deviceId;
  }

  /**
   * 获取操作系统版本。
   * 返回当前设备的 OpenHarmony 系统版本全称（deviceInfo.osFullName）。
   * @returns {string} 系统版本号
   */
  static getOsVersion(): string {
    hilog.debug(DOMAIN, TAG, 'DeviceUtils getOsVersion: fetching OS version');
    let osVersion: string = '';
    try {
      osVersion = deviceInfo.osFullName;
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'DeviceUtils getOsVersion: detection failed');
      osVersion = '';
    }
    hilog.info(DOMAIN, TAG, 'DeviceUtils getOsVersion: version=%{public}s', osVersion);
    return osVersion;
  }

  /**
   * 获取 API 版本号。
   * 返回当前设备 SDK 支持的 API 版本（deviceInfo.sdkApiVersion）。
   * @returns {number} API 版本号
   */
  static getApiVersion(): number {
    let apiVersion: number = 0;
    try {
      apiVersion = deviceInfo.sdkApiVersion;
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'DeviceUtils getApiVersion: detection failed');
      apiVersion = 0;
    }
    hilog.debug(DOMAIN, TAG, 'DeviceUtils getApiVersion: apiVersion=%{public}d', apiVersion);
    return apiVersion;
  }

  /**
   * 获取应用包名。
   * 返回当前应用的 bundleName。
   * @returns {string} 应用包名
   */
  static getBundleName(): string {
    hilog.debug(DOMAIN, TAG, 'DeviceUtils getBundleName: bundleName=%{public}s', SystemConfigConstants.BUNDLE_NAME);
    return SystemConfigConstants.BUNDLE_NAME;
  }

  /**
   * 清除设备信息缓存。
   * 重置所有缓存的设备信息，下次获取时重新检测。
   */
  static clearCache(): void {
    hilog.info(DOMAIN, TAG, 'DeviceUtils clearCache: clearing all cached device info');
    DeviceUtils.cachedDeviceType = '';
    DeviceUtils.cachedDeviceId = '';
    DeviceUtils.screenWidth = 0;
    DeviceUtils.screenHeight = 0;
  }
}
