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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { BluetoothConstants } from '../../constants/BluetoothConstants';

const TAG: string = BluetoothConstants.TAG;
const DOMAIN: number = BluetoothConstants.DOMAIN;

/**
 * 权限状态枚举
 */
export enum PermissionStatus {
  GRANTED = 'granted',
  DENIED = 'denied',
  UNKNOWN = 'unknown'
}

/**
 * 权限结果回调接口
 */
export interface PermissionResultCallback {
  onResult(permission: string, status: PermissionStatus): void;
}

/**
 * 权限请求回调接口
 */
export interface PermissionRequestCallback {
  onPermissionsResult(results: Map<string, PermissionStatus>): void;
}

/**
 * 权限工具类
 * 提供权限检查和请求相关的实用方法
 */
export class PermissionUtils {
  /** 已授予的权限集合 */
  private static grantedPermissions: Set<string> = new Set();
  /** 权限回调列表 */
  private static resultCallbacks: PermissionResultCallback[] = [];

  /**
   * 检查权限是否已授予
   * @param permission - 权限名称
   * @returns 是否已授予
   */
  static hasPermission(permission: string): boolean {
    return PermissionUtils.grantedPermissions.has(permission);
  }

  /**
   * 授予权限（模拟）
   * @param permission - 权限名称
   */
  static grantPermission(permission: string): void {
    hilog.info(DOMAIN, TAG, 'PermissionUtils grantPermission: %{public}s', permission);
    PermissionUtils.grantedPermissions.add(permission);
    PermissionUtils.notifyResult(permission, PermissionStatus.GRANTED);
  }

  /**
   * 撤销权限（模拟）
   * @param permission - 权限名称
   */
  static revokePermission(permission: string): void {
    hilog.info(DOMAIN, TAG, 'PermissionUtils revokePermission: %{public}s', permission);
    PermissionUtils.grantedPermissions.delete(permission);
    PermissionUtils.notifyResult(permission, PermissionStatus.DENIED);
  }

  /**
   * 请求多个权限
   * @param permissions - 权限列表
   * @param callback - 结果回调
   */
  static requestPermissions(permissions: string[], callback: PermissionRequestCallback): void {
    hilog.info(DOMAIN, TAG, 'PermissionUtils requestPermissions: requesting %{public}d permissions', permissions.length);
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
   * 检查蓝牙权限
   * @returns 是否有蓝牙权限
   */
  static hasBluetoothPermission(): boolean {
    return PermissionUtils.hasPermission('ohos.permission.USE_BLUETOOTH');
  }

  /**
   * 检查位置权限
   * @returns 是否有位置权限
   */
  static hasLocationPermission(): boolean {
    return PermissionUtils.hasPermission('ohos.permission.APPROXIMATELY_LOCATION');
  }

  /**
   * 添加权限结果回调
   * @param callback - 回调
   */
  static addResultCallback(callback: PermissionResultCallback): void {
    PermissionUtils.resultCallbacks.push(callback);
  }

  /**
   * 移除权限结果回调
   * @param callback - 回调
   */
  static removeResultCallback(callback: PermissionResultCallback): void {
    const index: number = PermissionUtils.resultCallbacks.indexOf(callback);
    if (index !== -1) {
      PermissionUtils.resultCallbacks.splice(index, 1);
    }
  }

  /**
   * 通知权限结果
   * @param permission - 权限名称
   * @param status - 权限状态
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
   * 获取所有已授予的权限
   * @returns 权限列表
   */
  static getGrantedPermissions(): string[] {
    return Array.from(PermissionUtils.grantedPermissions);
  }

  /**
   * 清除所有权限状态
   */
  static clearAll(): void {
    PermissionUtils.grantedPermissions.clear();
    PermissionUtils.resultCallbacks = [];
  }

  /**
   * 获取权限状态描述
   * @param status - 权限状态
   * @returns 描述字符串
   */
  static getStatusLabel(status: PermissionStatus): string {
    switch (status) {
      case PermissionStatus.GRANTED: return 'Granted';
      case PermissionStatus.DENIED: return 'Denied';
      default: return 'Unknown';
    }
  }
}
