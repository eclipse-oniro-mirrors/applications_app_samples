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

import { bundleManager } from '@kit.AbilityKit';
import { BusinessError, deviceInfo } from '@kit.BasicServicesKit';

import { AppLogger } from '../AppLogger';

/** Fallback returned when a device related string value is unavailable. */
const UNKNOWN_VALUE: string = 'unknown';
/** Fallback returned when the app version code is unavailable. */
const UNKNOWN_VERSION_CODE: number = 0;

/**
 * Utility class for runtime device and application information.
 * Combines deviceInfo, canIUse and bundleManager reads behind static helpers.
 * All methods are static; failures log a warning and return safe fallbacks.
 */
export class DeviceUtils {
  /** Cached self bundle info, filled on the first successful query. */
  private static cachedBundleInfo: bundleManager.BundleInfo | null = null;

  /**
   * Returns the device type, for example 'phone', 'tablet' or '2in1'.
   */
  public static getDeviceType(): string {
    return deviceInfo.deviceType;
  }

  /**
   * Returns the device brand provided by the system.
   */
  public static getBrand(): string {
    return deviceInfo.brand;
  }

  /**
   * Returns the product model name provided by the system.
   */
  public static getModel(): string {
    return deviceInfo.productModel;
  }

  /**
   * Returns the full OS version string, for example 'OpenHarmony 5.0'.
   */
  public static getOsFullName(): string {
    return deviceInfo.osFullName;
  }

  /**
   * Returns the SDK API version of the running system.
   */
  public static getSdkApiVersion(): number {
    return deviceInfo.sdkApiVersion;
  }

  /**
   * Checks whether the running system supports the given API level.
   */
  public static isApiSupported(apiLevel: number): boolean {
    return deviceInfo.sdkApiVersion >= apiLevel;
  }

  /**
   * Checks whether a system capability is available on this device.
   * @param syscapName - capability name, e.g. 'SystemCapability.MultimodalInput.Input'.
   */
  public static hasSyscap(syscapName: string): boolean {
    // canIUse is the standard runtime capability probe.
    return canIUse(syscapName);
  }

  /**
   * Returns the app version name declared in the bundle config.
   * Logs a warning and returns 'unknown' when the query fails.
   */
  public static getAppVersionName(): string {
    const info: bundleManager.BundleInfo | null = DeviceUtils.getSelfBundleInfo();
    if (info === null) {
      return UNKNOWN_VALUE;
    }
    return info.versionName;
  }

  /**
   * Returns the app version code declared in the bundle config.
   * Logs a warning and returns 0 when the query fails.
   */
  public static getAppVersionCode(): number {
    const info: bundleManager.BundleInfo | null = DeviceUtils.getSelfBundleInfo();
    if (info === null) {
      return UNKNOWN_VERSION_CODE;
    }
    return info.versionCode;
  }

  /**
   * Returns the bundle name of the running application.
   */
  public static getAppBundleName(): string {
    const info: bundleManager.BundleInfo | null = DeviceUtils.getSelfBundleInfo();
    if (info === null) {
      return UNKNOWN_VALUE;
    }
    return info.name;
  }

  /**
   * Queries and caches the bundle info of the running application.
   * @returns the bundle info, or null when the query fails.
   */
  private static getSelfBundleInfo(): bundleManager.BundleInfo | null {
    // Serve repeated calls from the cache.
    if (DeviceUtils.cachedBundleInfo !== null) {
      return DeviceUtils.cachedBundleInfo;
    }
    try {
      // Self query needs no permission and always reads the running app.
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT;
      DeviceUtils.cachedBundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      return DeviceUtils.cachedBundleInfo;
    } catch (err) {
      const error: BusinessError = err as BusinessError;
      AppLogger.warn('DeviceUtils', `getSelfBundleInfo failed: ${error.message}`);
      return null;
    }
  }
}
