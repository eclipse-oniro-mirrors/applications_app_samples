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
 * permission state enum
 */
export enum PermissionStatus {
  GRANTED = 'granted',
  DENIED = 'denied',
  UNKNOWN = 'unknown'
}

/**
 * permission result callback interface
 */
export interface PermissionResultCallback {
  onResult(permission: string, status: PermissionStatus): void;
}

/**
 * permission request callback interface
 */
export interface PermissionRequestCallback {
  onPermissionsResult(results: Map<string, PermissionStatus>): void;
}

/**
 * permission utility class
 * provides permission check and request request relative relate actual use method method
 */
export class PermissionUtils {
  /** granted permission set */
  private static grantedPermissions: Set<string> = new Set();
  /** permission callback list */
  private static resultCallbacks: PermissionResultCallback[] = [];

  /**
   * check whether the permission is granted
   * @param permission - permission name
   * @returns whether already grant give
   */
  static hasPermission(permission: string): boolean {
    return PermissionUtils.grantedPermissions.has(permission);
  }

  /**
   * grant permission (simulate)
   * @param permission - permission name
   */
  static grantPermission(permission: string): void {
    hilog.info(DOMAIN, TAG, 'PermissionUtils grantPermission: %{public}s', permission);
    PermissionUtils.grantedPermissions.add(permission);
    PermissionUtils.notifyResult(permission, PermissionStatus.GRANTED);
  }

  /**
   * revoke permission (simulate)
   * @param permission - permission name
   */
  static revokePermission(permission: string): void {
    hilog.info(DOMAIN, TAG, 'PermissionUtils revokePermission: %{public}s', permission);
    PermissionUtils.grantedPermissions.delete(permission);
    PermissionUtils.notifyResult(permission, PermissionStatus.DENIED);
  }

  /**
   * request multiple permissions
   * @param permissions - permission list
   * @param callback - result callback
   */
  static requestPermissions(permissions: string[], callback: PermissionRequestCallback): void {
    hilog.info(DOMAIN, TAG, 'PermissionUtils requestPermissions: requesting %{public}d permissions',
      permissions.length);
    const results: Map<string, PermissionStatus> = new Map();
    for (const perm of permissions) {
      if (PermissionUtils.grantedPermissions.has(perm)) {
        results.set(perm, PermissionStatus.GRANTED);
      } else {
        results.set(perm, PermissionStatus.DENIED);
      }
    }
    callback.onPermissionsResult(results);
  }

  /**
   * check Bluetooth permission
   * @returns whether it has Bluetooth permission
   */
  static hasBluetoothPermission(): boolean {
    return PermissionUtils.hasPermission('ohos.permission.USE_BLUETOOTH');
  }

  /**
   * check location permission
   * @returns whether it has location permission
   */
  static hasLocationPermission(): boolean {
    return PermissionUtils.hasPermission('ohos.permission.APPROXIMATELY_LOCATION');
  }

  /**
   * add permission result callback
   * @param callback - callback
   */
  static addResultCallback(callback: PermissionResultCallback): void {
    PermissionUtils.resultCallbacks.push(callback);
  }

  /**
   * remove permission result callback
   * @param callback - callback
   */
  static removeResultCallback(callback: PermissionResultCallback): void {
    const index: number = PermissionUtils.resultCallbacks.indexOf(callback);
    if (index !== -1) {
      PermissionUtils.resultCallbacks.splice(index, 1);
    }
  }

  /**
   * notify permission limit result result
   * @param permission - permission name
   * @param status - permission state
   */
  private static notifyResult(permission: string, status: PermissionStatus): void {
    for (const callback of PermissionUtils.resultCallbacks) {
      try {
        callback.onResult(permission, status);
      } catch (e) {
        hilog.error(DOMAIN, TAG, 'PermissionUtils notifyResult: error in callback');
      }
    }
  }

  /**
   * get all granted permissions
   * @returns permission list
   */
  static getGrantedPermissions(): string[] {
    return Array.from(PermissionUtils.grantedPermissions);
  }

  /**
   * clear all permission states
   */
  static clearAll(): void {
    PermissionUtils.grantedPermissions.clear();
    PermissionUtils.resultCallbacks = [];
  }

  /**
   * get permission state description
   * @param status - permission state
   * @returns description string
   */
  static getStatusLabel(status: PermissionStatus): string {
    switch (status) {
      case PermissionStatus.GRANTED: return 'Granted';
      case PermissionStatus.DENIED: return 'Denied';
      default: return 'Unknown';
    }
  }
}
