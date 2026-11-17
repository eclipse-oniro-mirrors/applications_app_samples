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
import { SystemConfigConstants } from '../../constants/SystemConfigConstants';
import { ResourceHelper } from '../basic/ResourceHelper';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

// ========================================
// Permission status enum
// ========================================

/**
 * Permission grant status enum.
 * Describes the current state of a system permission for the app.
 */
export enum PermissionStatus {
  /** Permission granted */
  GRANTED = 'granted',
  /** Permission denied */
  DENIED = 'denied',
  /** User has not decided yet */
  NOT_DETERMINED = 'not_determined',
  /** Permission is system-restricted and cannot be requested */
  RESTRICTED = 'restricted'
}

// ========================================
// Permission callback interfaces
// ========================================

/**
 * Permission status query result callback interface.
 * Returns the current status of a single permission.
 */
export interface PermissionResultCallback {
  /** Permission grant status */
  status: PermissionStatus;
  /** Permission identifier name */
  permission: string;
}

/**
 * Permission request result callback interface.
 * Returns the results of a batch permission request.
 */
export interface PermissionRequestCallback {
  /** List of granted permissions */
  granted: string[];
  /** List of denied permissions */
  denied: string[];
}

// ========================================
// Permission label mapping table
// ========================================

/** Mapping from common permission identifiers to string resource names (label texts moved into string.json, resolved by name) */
const PERMISSION_LABEL_MAP: Map<string, string> = new Map<string, string>([
  ['ohos.permission.GET_DONOTDISTURB_STATE', 'perm_dnd'],
  ['ohos.permission.INTERNET', 'perm_internet'],
  ['ohos.permission.GET_NETWORK_INFO', 'perm_network_info'],
  ['ohos.permission.SET_WIFI_CONFIG', 'perm_wifi_config'],
  ['ohos.permission.GET_WIFI_INFO', 'perm_wifi_info'],
  ['ohos.permission.SET_BLUETOOTH', 'perm_bluetooth_set'],
  ['ohos.permission.USE_BLUETOOTH', 'perm_bluetooth_use'],
  ['ohos.permission.GET_BLUETOOTH_LOCAL_INFO', 'perm_bluetooth_local_info'],
  ['ohos.permission.CAMERA', 'perm_camera'],
  ['ohos.permission.MICROPHONE', 'perm_microphone'],
  ['ohos.permission.READ_MEDIA', 'perm_read_media'],
  ['ohos.permission.WRITE_MEDIA', 'perm_write_media'],
  ['ohos.permission.LOCATION', 'perm_location'],
  ['ohos.permission.APPROXIMATELY_LOCATION', 'perm_approx_location'],
  ['ohos.permission.READ_CONTACTS', 'perm_read_contacts'],
  ['ohos.permission.WRITE_CONTACTS', 'perm_write_contacts'],
  ['ohos.permission.READ_CALL_LOG', 'perm_read_call_log'],
  ['ohos.permission.WRITE_CALL_LOG', 'perm_write_call_log'],
  ['ohos.permission.READ_SMS', 'perm_read_sms'],
  ['ohos.permission.SEND_SMS', 'perm_send_sms'],
  ['ohos.permission.READ_STORAGE', 'perm_read_storage'],
  ['ohos.permission.WRITE_STORAGE', 'perm_write_storage'],
  ['ohos.permission.VIBRATE', 'perm_vibrate'],
  ['ohos.permission.SET_WALLPAPER', 'perm_wallpaper'],
  ['ohos.permission.PUBLISH_AGENT_REMINDER', 'perm_agent_reminder']
]);

// ========================================
// Permission utility class
// ========================================

/**
 * Permission checking utility class.
 * Provides static methods for simulated permission status checks,
 * permission label lookup, required permission list management and
 * permission list formatting.
 */
export class PermissionUtils {
  /** Set of simulated granted permissions */
  private static grantedPermissions: Set<string> = new Set<string>();

  /** Set of simulated denied permissions */
  private static deniedPermissions: Set<string> = new Set<string>();

  // ========================================
  // Permission status checking methods
  // ========================================

  /**
   * Checks the current grant status of a permission (simulated implementation).
   * Returns the corresponding status based on the internally maintained permission sets.
   * @param {string} permission - Permission identifier string
   * @returns {PermissionStatus} Current permission status
   */
  static checkPermissionStatus(permission: string): PermissionStatus {
    hilog.info(DOMAIN, TAG, 'PermissionUtils checkPermissionStatus: checking permission=%{public}s', permission);
    if (PermissionUtils.grantedPermissions.has(permission)) {
      hilog.info(DOMAIN, TAG, 'PermissionUtils checkPermissionStatus: permission GRANTED');
      return PermissionStatus.GRANTED;
    }
    if (PermissionUtils.deniedPermissions.has(permission)) {
      hilog.info(DOMAIN, TAG, 'PermissionUtils checkPermissionStatus: permission DENIED');
      return PermissionStatus.DENIED;
    }
    hilog.info(DOMAIN, TAG, 'PermissionUtils checkPermissionStatus: permission NOT_DETERMINED');
    return PermissionStatus.NOT_DETERMINED;
  }

  /**
   * Checks whether a permission status is granted.
   * @param {PermissionStatus} status - Permission status enum value
   * @returns {boolean} Whether granted
   */
  static isPermissionGranted(status: PermissionStatus): boolean {
    const result: boolean = status === PermissionStatus.GRANTED;
    hilog.debug(DOMAIN, TAG, 'PermissionUtils isPermissionGranted: status=%{public}s, result=%{public}s',
      status, result.toString());
    return result;
  }

  /**
   * Checks whether a permission status is restricted.
   * Restricted permissions cannot be obtained by requesting.
   * @param {PermissionStatus} status - Permission status enum value
   * @returns {boolean} Whether restricted
   */
  static isPermissionRestricted(status: PermissionStatus): boolean {
    const result: boolean = status === PermissionStatus.RESTRICTED;
    hilog.debug(DOMAIN, TAG, 'PermissionUtils isPermissionRestricted: status=%{public}s, result=%{public}s',
      status, result.toString());
    return result;
  }

  // ========================================
  // Permission label methods
  // ========================================

  /**
   * Gets the localized label of a permission identifier.
   * Returns the permission identifier itself when it is not in the mapping table.
   * @param {string} permission - Permission identifier string
   * @returns {string} Localized permission label
   */
  static getPermissionLabel(permission: string): string {
    hilog.debug(DOMAIN, TAG, 'PermissionUtils getPermissionLabel: looking up label for=%{public}s', permission);
    const resName: string | undefined = PERMISSION_LABEL_MAP.get(permission);
    const label: string = resName !== undefined ? ResourceHelper.getStringByName(resName) : permission;
    hilog.debug(DOMAIN, TAG, 'PermissionUtils getPermissionLabel: label=%{public}s', label);
    return label;
  }

  /**
   * Gets the localized description of a permission status.
   * @param {PermissionStatus} status - Permission status enum value
   * @returns {string} Localized permission status description
   */
  static getPermissionStatusLabel(status: PermissionStatus): string {
    hilog.debug(DOMAIN, TAG, 'PermissionUtils getPermissionStatusLabel: status=%{public}s', status);
    switch (status) {
      case PermissionStatus.GRANTED:
        return ResourceHelper.getStringByName('perm_status_granted');
      case PermissionStatus.DENIED:
        return ResourceHelper.getStringByName('perm_status_denied');
      case PermissionStatus.NOT_DETERMINED:
        return ResourceHelper.getStringByName('perm_status_not_determined');
      case PermissionStatus.RESTRICTED:
        return ResourceHelper.getStringByName('perm_status_restricted');
      default:
        return ResourceHelper.getStringByName('perm_status_unknown');
    }
  }

  // ========================================
  // Required permission management methods
  // ========================================

  /**
   * Gets the permission list required by the app.
   * Returns the Do Not Disturb permission needed by the system config sample.
   * @returns {string[]} Array of required permission identifiers
   */
  static getRequiredPermissions(): string[] {
    hilog.info(DOMAIN, TAG, 'PermissionUtils getRequiredPermissions: returning required permissions');
    const permissions: string[] = [SystemConfigConstants.PERMISSION_DND];
    hilog.info(DOMAIN, TAG, 'PermissionUtils getRequiredPermissions: count=%{public}d', permissions.length);
    return permissions;
  }

  /**
   * Gets the identifiers of all known permissions.
   * @returns {string[]} Array of all known permission identifiers
   */
  static getAllKnownPermissions(): string[] {
    const permissions: string[] = [];
    PERMISSION_LABEL_MAP.forEach((_value: string, key: string) => {
      permissions.push(key);
    });
    return permissions;
  }

  // ========================================
  // Permission list formatting methods
  // ========================================

  /**
   * Formats a permission list into a readable string.
   * Each permission is shown as its localized label, joined by the separator defined in the list_separator resource.
   * @param {string[]} perms - Array of permission identifiers
   * @returns {string} Formatted permission description string
   */
  static formatPermissionList(perms: string[]): string {
    hilog.info(DOMAIN, TAG, 'PermissionUtils formatPermissionList: formatting %{public}d permissions', perms.length);
    if (perms.length === 0) {
      return ResourceHelper.getStringByName('perm_none');
    }
    const separator: string = ResourceHelper.getStringByName('list_separator');
    let result: string = '';
    for (let i: number = 0; i < perms.length; i++) {
      if (i > 0) {
        result += separator;
      }
      result += PermissionUtils.getPermissionLabel(perms[i]);
    }
    hilog.debug(DOMAIN, TAG, 'PermissionUtils formatPermissionList: result=%{public}s', result);
    return result;
  }
}
