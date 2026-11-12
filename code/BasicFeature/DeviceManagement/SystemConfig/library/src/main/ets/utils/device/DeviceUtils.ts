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
// Device type constants
// ========================================

/** Device type - default (phone) */
const DEVICE_TYPE_DEFAULT: string = 'default';
/** Device type - tablet */
const DEVICE_TYPE_TABLET: string = 'tablet';
/** Device type - TV */
const DEVICE_TYPE_TV: string = 'tv';
/** Device type - wearable */
const DEVICE_TYPE_WEARABLE: string = 'wearable';
/** Device type - car */
const DEVICE_TYPE_CAR: string = 'car';

// ========================================
// Device info utility class
// ========================================

/**
 * Device info utility class.
 * Provides static methods based on the deviceInfo and display modules
 * to obtain real device info such as device type, screen size and OS version.
 */
export class DeviceUtils {
  /** Cached device type */
  private static cachedDeviceType: string = '';
  /** Cached device id */
  private static cachedDeviceId: string = '';
  /** Screen width in pixels (0 means not fetched yet) */
  private static screenWidth: number = 0;
  /** Screen height in pixels (0 means not fetched yet) */
  private static screenHeight: number = 0;

  /**
   * Gets the device type.
   * Reads the real deviceInfo.deviceType identifier and normalizes it into
   * default, tablet, tv, wearable, car, etc.
   * @returns {string} Device type string
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
        // Non-normalized real device types are returned as-is; empty values fall back to default to avoid caching an empty string
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
   * Lazily fetches the real screen size from the display module.
   * Keeps current values (possibly 0) on failure without fabricating defaults.
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
   * Gets the screen width.
   * Returns the width of the current device screen in pixels.
   * @returns {number} Screen width (pixels)
   */
  static getScreenWidth(): number {
    DeviceUtils.ensureScreenSize();
    hilog.debug(DOMAIN, TAG, 'DeviceUtils getScreenWidth: width=%{public}d', DeviceUtils.screenWidth);
    return DeviceUtils.screenWidth;
  }

  /**
   * Gets the screen height.
   * Returns the height of the current device screen in pixels.
   * @returns {number} Screen height (pixels)
   */
  static getScreenHeight(): number {
    DeviceUtils.ensureScreenSize();
    hilog.debug(DOMAIN, TAG, 'DeviceUtils getScreenHeight: height=%{public}d', DeviceUtils.screenHeight);
    return DeviceUtils.screenHeight;
  }

  /**
   * Sets the screen size.
   * Updates the cached values after the actual screen size is obtained.
   * @param {number} width - Screen width (pixels)
   * @param {number} height - Screen height (pixels)
   */
  static setScreenSize(width: number, height: number): void {
    hilog.info(DOMAIN, TAG, 'DeviceUtils setScreenSize: width=%{public}d, height=%{public}d', width, height);
    DeviceUtils.screenWidth = width;
    DeviceUtils.screenHeight = height;
  }

  // ========================================
  // Device state checks
  // ========================================

  /**
   * Checks whether the current device is an emulator.
   * Detects emulator markers in deviceInfo productModel / marketName / displayVersion;
   * the default device type is no longer treated as an emulator.
   * @returns {boolean} Whether it is an emulator
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
   * Checks whether the current orientation is portrait.
   * Portrait mode when screen height is greater than or equal to width.
   * @returns {boolean} Whether it is portrait
   */
  static isPortrait(): boolean {
    const result: boolean = DeviceUtils.getScreenHeight() >= DeviceUtils.getScreenWidth();
    hilog.debug(DOMAIN, TAG, 'DeviceUtils isPortrait: result=%{public}s', result.toString());
    return result;
  }

  /**
   * Checks whether the current orientation is landscape.
   * Landscape mode when screen width is greater than height.
   * @returns {boolean} Whether it is landscape
   */
  static isLandscape(): boolean {
    const result: boolean = DeviceUtils.getScreenWidth() > DeviceUtils.getScreenHeight();
    hilog.debug(DOMAIN, TAG, 'DeviceUtils isLandscape: result=%{public}s', result.toString());
    return result;
  }

  /**
   * Checks whether the current device is a tablet.
   * @returns {boolean} Whether it is a tablet device
   */
  static isTablet(): boolean {
    const result: boolean = DeviceUtils.getDeviceType() === DEVICE_TYPE_TABLET;
    hilog.debug(DOMAIN, TAG, 'DeviceUtils isTablet: result=%{public}s', result.toString());
    return result;
  }

  /**
   * Checks whether the current device is a TV.
   * @returns {boolean} Whether it is a TV device
   */
  static isTv(): boolean {
    const result: boolean = DeviceUtils.getDeviceType() === DEVICE_TYPE_TV;
    hilog.debug(DOMAIN, TAG, 'DeviceUtils isTv: result=%{public}s', result.toString());
    return result;
  }

  // ========================================
  // Device identity and version methods
  // ========================================

  /**
   * Gets the unique device identifier.
   * Generates a hashed ID from device info to identify the device.
   * @returns {string} Unique device id
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
   * Gets the OS version.
   * Returns the full OpenHarmony version of the device (deviceInfo.osFullName).
   * @returns {string} OS version string
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
   * Gets the API version.
   * Returns the API version supported by the device SDK (deviceInfo.sdkApiVersion).
   * @returns {number} API version number
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
   * Gets the application bundle name.
   * Returns the bundleName of the current application.
   * @returns {string} Bundle name
   */
  static getBundleName(): string {
    hilog.debug(DOMAIN, TAG, 'DeviceUtils getBundleName: bundleName=%{public}s', SystemConfigConstants.BUNDLE_NAME);
    return SystemConfigConstants.BUNDLE_NAME;
  }

  /**
   * Clears the device info cache.
   * Resets all cached device info so the next retrieval re-detects it.
   */
  static clearCache(): void {
    hilog.info(DOMAIN, TAG, 'DeviceUtils clearCache: clearing all cached device info');
    DeviceUtils.cachedDeviceType = '';
    DeviceUtils.cachedDeviceId = '';
    DeviceUtils.screenWidth = 0;
    DeviceUtils.screenHeight = 0;
  }
}
