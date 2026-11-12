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

import { abilityAccessCtrl, common, bundleManager, Permissions, PermissionRequestResult } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

/** 日志域ID */
const DOMAIN: number = 0xF811;
/** 日志标签 */
const TAG: string = 'PermissionUtils';

/**
 * 权限状态枚举
 * 表示权限的授权状态
 */
export enum PermissionStatus {
  /** 已授权 */
  GRANTED = 0,
  /** 已拒绝 */
  DENIED = -1,
  /** 未确定（首次请求前） */
  UNDETERMINED = -2,
  /** 未知状态 */
  UNKNOWN = -3
}

/**
 * 权限请求结果结构体
 * 用于存储权限请求的响应结果
 */
export class PermissionRequestResults {
  /** 权限名称 */
  public permission: string = '';
  /** 授权状态 */
  public status: PermissionStatus = PermissionStatus.UNKNOWN;
}

/**
 * 权限工具类
 * 提供权限检查、请求、管理等功能
 */
export class PermissionUtils {
  /** 权限已授权常量 */
  public static readonly PERMISSION_GRANTED: number = 0;

  /**
   * 检查单个权限
   */
  static async checkPermission(context: common.Context, permission: Permissions): Promise<boolean> {
    hilog.debug(DOMAIN, TAG, `checkPermission() called with permission: ${permission}`);
    try {
      const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      const result: abilityAccessCtrl.GrantStatus = await atManager.checkAccessToken(
        context.applicationInfo.accessTokenId, 
        permission
      );
      const isGranted: boolean = (result as number) === PermissionUtils.PERMISSION_GRANTED;
      hilog.info(DOMAIN, TAG, `checkPermission() result: ${isGranted}`);
      return isGranted;
    } catch (error) {
      hilog.error(DOMAIN, TAG, `checkPermission() failed: ${(error as Error).message}`);
      return false;
    }
  }

  /**
   * 获取权限状态
   */
  static async getPermissionStatus(
    context: common.Context,
    permission: Permissions
  ): Promise<PermissionStatus> {
    hilog.debug(DOMAIN, TAG, `getPermissionStatus() called with permission: ${permission}`);
    try {
      const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      const result: abilityAccessCtrl.GrantStatus = await atManager.checkAccessToken(
        context.applicationInfo.accessTokenId,
        permission
      );
      let status: PermissionStatus = PermissionStatus.UNKNOWN;
      if ((result as number) === PermissionUtils.PERMISSION_GRANTED) {
        status = PermissionStatus.GRANTED;
      } else {
        // 非授予状态即为拒绝
        status = PermissionStatus.DENIED;
      }
      hilog.info(DOMAIN, TAG, `getPermissionStatus() result: ${status}`);
      return status;
    } catch (error) {
      hilog.error(DOMAIN, TAG, `getPermissionStatus() failed: ${(error as Error).message}`);
      return PermissionStatus.UNKNOWN;
    }
  }

  /**
   * 批量检查权限
   */
  static async checkPermissions(
    context: common.Context,
    permissions: Permissions[]
  ): Promise<Map<string, boolean>> {
    hilog.debug(DOMAIN, TAG, `checkPermissions() called with ${permissions.length} permissions`);
    const resultMap: Map<string, boolean> = new Map<string, boolean>();
    for (let i = 0; i < permissions.length; i++) {
      const permission: Permissions = permissions[i];
      const isGranted: boolean = await PermissionUtils.checkPermission(context, permission);
      resultMap.set(permission, isGranted);
    }
    hilog.info(DOMAIN, TAG, `checkPermissions() completed for ${resultMap.size} permissions`);
    return resultMap;
  }

  /**
   * 请求单个权限
   */
  static async requestPermission(
    context: common.Context,
    permission: Permissions
  ): Promise<PermissionStatus> {
    hilog.debug(DOMAIN, TAG, `requestPermission() called with permission: ${permission}`);
    try {
      const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      const result: PermissionRequestResult = await atManager.requestPermissionsFromUser(
        context as common.UIAbilityContext, 
        [permission]
      );
      const authResults: number[] = result.authResults;
      if (authResults && authResults.length > 0) {
        const status: PermissionStatus = authResults[0] === 0 ? PermissionStatus.GRANTED : PermissionStatus.DENIED;
        hilog.info(DOMAIN, TAG, `requestPermission() result: ${status}`);
        return status;
      }
      return PermissionStatus.UNKNOWN;
    } catch (error) {
      hilog.error(DOMAIN, TAG, `requestPermission() failed: ${(error as Error).message}`);
      return PermissionStatus.UNKNOWN;
    }
  }

  /**
   * 批量请求权限
   */
  static async requestPermissions(
    context: common.Context,
    permissions: Permissions[]
  ): Promise<PermissionRequestResults[]> {
    hilog.debug(DOMAIN, TAG, `requestPermissions() called with ${permissions.length} permissions`);
    try {
      const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      const result: PermissionRequestResult = await atManager.requestPermissionsFromUser(
        context as common.UIAbilityContext,
        permissions
      );
      const results: PermissionRequestResults[] = [];
      const authResults: number[] = result.authResults || [];
      for (let i = 0; i < permissions.length; i++) {
        const reqResult: PermissionRequestResults = new PermissionRequestResults();
        reqResult.permission = permissions[i];
        reqResult.status = authResults[i] === 0 ? PermissionStatus.GRANTED : PermissionStatus.DENIED;
        results.push(reqResult);
      }
      hilog.info(DOMAIN, TAG, `requestPermissions() completed for ${results.length} permissions`);
      return results;
    } catch (error) {
      hilog.error(DOMAIN, TAG, `requestPermissions() failed: ${(error as Error).message}`);
      const results: PermissionRequestResults[] = [];
      for (let i = 0; i < permissions.length; i++) {
        const reqResult: PermissionRequestResults = new PermissionRequestResults();
        reqResult.permission = permissions[i];
        reqResult.status = PermissionStatus.DENIED;
        results.push(reqResult);
      }
      return results;
    }
  }

  /**
   * 检查是否所有权限都已授予
   */
  static async hasAllPermissions(context: common.Context, permissions: Permissions[]): Promise<boolean> {
    hilog.debug(DOMAIN, TAG, `hasAllPermissions() called with ${permissions.length} permissions`);
    const results: Map<string, boolean> = await PermissionUtils.checkPermissions(context, permissions);
    let allGranted: boolean = true;
    const keys: string[] = Array.from(results.keys());
    for (let i = 0; i < keys.length; i++) {
      const isGranted: boolean = results.get(keys[i]) || false;
      if (!isGranted) {
        allGranted = false;
        break;
      }
    }
    hilog.info(DOMAIN, TAG, `hasAllPermissions() result: ${allGranted}`);
    return allGranted;
  }

  /**
   * 检查是否有任一权限已授予
   */
  static async hasAnyPermission(context: common.Context, permissions: Permissions[]): Promise<boolean> {
    hilog.debug(DOMAIN, TAG, `hasAnyPermission() called with ${permissions.length} permissions`);
    const results: Map<string, boolean> = await PermissionUtils.checkPermissions(context, permissions);
    let anyGranted: boolean = false;
    const keys: string[] = Array.from(results.keys());
    for (let i = 0; i < keys.length; i++) {
      const isGranted: boolean = results.get(keys[i]) || false;
      if (isGranted) {
        anyGranted = true;
        break;
      }
    }
    hilog.info(DOMAIN, TAG, `hasAnyPermission() result: ${anyGranted}`);
    return anyGranted;
  }

  /**
   * 获取未授予的权限列表
   */
  static async getDeniedPermissions(
    context: common.Context,
    permissions: Permissions[]
  ): Promise<Permissions[]> {
    hilog.debug(DOMAIN, TAG, `getDeniedPermissions() called with ${permissions.length} permissions`);
    const results: Map<string, boolean> = await PermissionUtils.checkPermissions(context, permissions);
    const deniedPermissions: Permissions[] = [];
    const keys: string[] = Array.from(results.keys());
    for (let i = 0; i < keys.length; i++) {
      const isGranted: boolean = results.get(keys[i]) || false;
      if (!isGranted) {
        deniedPermissions.push(keys[i] as Permissions);
      }
    }
    hilog.info(DOMAIN, TAG, `getDeniedPermissions() found ${deniedPermissions.length} denied`);
    return deniedPermissions;
  }

  /**
   * 获取应用已声明的权限列表
   */
  static async getDeclaredPermissions(context: common.Context): Promise<string[]> {
    hilog.debug(DOMAIN, TAG, 'getDeclaredPermissions() called');
    try {
      // 使用单参数重载获取BundleInfo
      const bundleInfo: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION
      );
      const permissions: string[] = [];
      // ApplicationInfo.permissions是string[]类型，包含应用声明的权限列表
      const appInfo: bundleManager.ApplicationInfo = bundleInfo.appInfo;
      const appPermissions: string[] = appInfo.permissions;
      if (appPermissions) {
        for (let i: number = 0; i < appPermissions.length; i++) {
          const permission: string = appPermissions[i];
          permissions.push(permission);
        }
      }
      hilog.info(DOMAIN, TAG, `getDeclaredPermissions() found ${permissions.length} permissions`);
      return permissions;
    } catch (error) {
      hilog.error(DOMAIN, TAG, `getDeclaredPermissions() failed: ${(error as Error).message}`);
      return [];
    }
  }

  /**
   * 检查权限是否可以再次请求
   */
  static async shouldShowRequestPermissionRationale(
    context: common.Context,
    permission: Permissions
  ): Promise<boolean> {
    hilog.debug(DOMAIN, TAG, `shouldShowRequestPermissionRationale() called with permission: ${permission}`);
    try {
      const status: PermissionStatus = await PermissionUtils.getPermissionStatus(context, permission);
      const canRequest: boolean = status === PermissionStatus.UNDETERMINED || status === PermissionStatus.DENIED;
      hilog.info(DOMAIN, TAG, `shouldShowRequestPermissionRationale() result: ${canRequest}`);
      return canRequest;
    } catch (error) {
      hilog.error(DOMAIN, TAG, `shouldShowRequestPermissionRationale() failed: ${(error as Error).message}`);
      return false;
    }
  }
}
