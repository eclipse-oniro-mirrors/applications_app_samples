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
import { BusinessError } from '@kit.BasicServicesKit';

import { AppLogger } from '../AppLogger';

/** Fallback returned when an app info string value is unavailable. */
const UNKNOWN_STRING: string = 'unknown';
/** Fallback returned when an app info numeric value is unavailable. */
const UNKNOWN_NUMBER: number = 0;

/**
 * Utility class for application package information based on bundleManager.
 * All methods are static, read the running application only and never throw.
 * Failures log a warning and return safe fallbacks.
 */
export class AppInfoUtils {
  /** Cached self bundle info, filled on the first successful query. */
  private static cachedBundleInfo: bundleManager.BundleInfo | null = null;

  /**
   * Returns the bundle name of the running application.
   */
  public static getBundleName(): string {
    const info: bundleManager.BundleInfo | null = AppInfoUtils.getSelfBundleInfo();
    if (info === null) {
      return UNKNOWN_STRING;
    }
    return info.name;
  }

  /**
   * Returns the app version name declared in the bundle config.
   */
  public static getVersionName(): string {
    const info: bundleManager.BundleInfo | null = AppInfoUtils.getSelfBundleInfo();
    if (info === null) {
      return UNKNOWN_STRING;
    }
    return info.versionName;
  }

  /**
   * Returns the app version code declared in the bundle config.
   */
  public static getVersionCode(): number {
    const info: bundleManager.BundleInfo | null = AppInfoUtils.getSelfBundleInfo();
    if (info === null) {
      return UNKNOWN_NUMBER;
    }
    return info.versionCode;
  }

  /**
   * Returns the application id (appId) of the running bundle.
   * Falls back to the bundle name because BundleInfo does not expose appId.
   */
  public static getAppId(): string {
    const info: bundleManager.BundleInfo | null = AppInfoUtils.getSelfBundleInfo();
    if (info === null) {
      return UNKNOWN_STRING;
    }
    // BundleInfo has no appId field; the bundle name is the stable identifier.
    return info.name;
  }

  /**
   * Returns the first install time of the app in milliseconds since the epoch.
   */
  public static getInstallTime(): number {
    const info: bundleManager.BundleInfo | null = AppInfoUtils.getSelfBundleInfo();
    if (info === null) {
      return UNKNOWN_NUMBER;
    }
    return info.installTime;
  }

  /**
   * Queries and caches the bundle info of the running application.
   * @returns the bundle info, or null when the query fails.
   */
  private static getSelfBundleInfo(): bundleManager.BundleInfo | null {
    // Serve repeated calls from the cache.
    if (AppInfoUtils.cachedBundleInfo !== null) {
      return AppInfoUtils.cachedBundleInfo;
    }
    try {
      // Self query needs no permission and always reads the running app.
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT;
      AppInfoUtils.cachedBundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      return AppInfoUtils.cachedBundleInfo;
    } catch (err) {
      const error: BusinessError = err as BusinessError;
      AppLogger.warn('AppInfoUtils', `getSelfBundleInfo failed: ${error.message}`);
      return null;
    }
  }
}
