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

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

// ========================================
// 权限状态枚举
// ========================================

/**
 * 权限授予状态枚举。
 * 描述应用对某项系统权限的当前获取状态。
 */
export enum PermissionStatus {
  /** 权限已授予 */
  GRANTED = 'granted',
  /** 权限被拒绝 */
  DENIED = 'denied',
  /** 用户尚未做出决定 */
  NOT_DETERMINED = 'not_determined',
  /** 权限受系统限制，无法申请 */
  RESTRICTED = 'restricted'
}

// ========================================
// 权限回调接口
// ========================================

/**
 * 权限状态查询结果回调接口。
 * 用于返回单个权限的当前状态。
 */
export interface PermissionResultCallback {
  /** 权限授予状态 */
  status: PermissionStatus;
  /** 权限标识名称 */
  permission: string;
}

/**
 * 权限申请结果回调接口。
 * 用于批量返回权限申请的结果。
 */
export interface PermissionRequestCallback {
  /** 已授予的权限列表 */
  granted: string[];
  /** 被拒绝的权限列表 */
  denied: string[];
}

// ========================================
// 权限标签映射表
// ========================================

/** 常见权限标识与中文描述的映射 */
const PERMISSION_LABEL_MAP: Map<string, string> = new Map<string, string>([
  ['ohos.permission.GET_DONOTDISTURB_STATE', '免打扰状态查询'],
  ['ohos.permission.INTERNET', '网络访问'],
  ['ohos.permission.GET_NETWORK_INFO', '网络信息查询'],
  ['ohos.permission.SET_WIFI_CONFIG', 'Wi-Fi 配置设置'],
  ['ohos.permission.GET_WIFI_INFO', 'Wi-Fi 信息查询'],
  ['ohos.permission.SET_BLUETOOTH', '蓝牙设置'],
  ['ohos.permission.USE_BLUETOOTH', '蓝牙使用'],
  ['ohos.permission.GET_BLUETOOTH_LOCAL_INFO', '蓝牙本地信息查询'],
  ['ohos.permission.CAMERA', '相机使用'],
  ['ohos.permission.MICROPHONE', '麦克风使用'],
  ['ohos.permission.READ_MEDIA', '媒体文件读取'],
  ['ohos.permission.WRITE_MEDIA', '媒体文件写入'],
  ['ohos.permission.LOCATION', '位置信息'],
  ['ohos.permission.APPROXIMATELY_LOCATION', '粗略位置信息'],
  ['ohos.permission.READ_CONTACTS', '联系人读取'],
  ['ohos.permission.WRITE_CONTACTS', '联系人写入'],
  ['ohos.permission.READ_CALL_LOG', '通话记录读取'],
  ['ohos.permission.WRITE_CALL_LOG', '通话记录写入'],
  ['ohos.permission.READ_SMS', '短信读取'],
  ['ohos.permission.SEND_SMS', '短信发送'],
  ['ohos.permission.READ_STORAGE', '存储读取'],
  ['ohos.permission.WRITE_STORAGE', '存储写入'],
  ['ohos.permission.VIBRATE', '振动控制'],
  ['ohos.permission.SET_WALLPAPER', '壁纸设置'],
  ['ohos.permission.PUBLISH_AGENT_REMINDER', '发布代理提醒']
]);

// ========================================
// 权限工具类
// ========================================

/**
 * 权限检查工具类。
 * 提供权限状态模拟检查、权限标签获取、
 * 必要权限列表管理和权限列表格式化等静态方法。
 */
export class PermissionUtils {
  /** 已模拟授予的权限集合 */
  private static grantedPermissions: Set<string> = new Set<string>();

  /** 已模拟拒绝的权限集合 */
  private static deniedPermissions: Set<string> = new Set<string>();

  // ========================================
  // 权限状态检查方法
  // ========================================

  /**
   * 检查指定权限的当前授予状态（模拟实现）。
   * 根据内部维护的权限集合返回对应的权限状态。
   * @param {string} permission - 权限标识字符串
   * @returns {PermissionStatus} 权限当前状态
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
   * 判断权限状态是否为已授予。
   * @param {PermissionStatus} status - 权限状态枚举值
   * @returns {boolean} 是否已授予
   */
  static isPermissionGranted(status: PermissionStatus): boolean {
    const result: boolean = status === PermissionStatus.GRANTED;
    hilog.debug(DOMAIN, TAG, 'PermissionUtils isPermissionGranted: status=%{public}s, result=%{public}s',
      status, result.toString());
    return result;
  }

  /**
   * 判断权限状态是否为受限状态。
   * 受限权限无法通过申请获取。
   * @param {PermissionStatus} status - 权限状态枚举值
   * @returns {boolean} 是否受限
   */
  static isPermissionRestricted(status: PermissionStatus): boolean {
    const result: boolean = status === PermissionStatus.RESTRICTED;
    hilog.debug(DOMAIN, TAG, 'PermissionUtils isPermissionRestricted: status=%{public}s, result=%{public}s',
      status, result.toString());
    return result;
  }

  // ========================================
  // 权限标签方法
  // ========================================

  /**
   * 获取权限标识的中文描述标签。
   * 若权限不在映射表中，则返回权限标识本身。
   * @param {string} permission - 权限标识字符串
   * @returns {string} 权限中文标签
   */
  static getPermissionLabel(permission: string): string {
    hilog.debug(DOMAIN, TAG, 'PermissionUtils getPermissionLabel: looking up label for=%{public}s', permission);
    const label: string = PERMISSION_LABEL_MAP.get(permission) ?? permission;
    hilog.debug(DOMAIN, TAG, 'PermissionUtils getPermissionLabel: label=%{public}s', label);
    return label;
  }

  /**
   * 获取权限状态的中文描述。
   * @param {PermissionStatus} status - 权限状态枚举值
   * @returns {string} 权限状态的中文描述
   */
  static getPermissionStatusLabel(status: PermissionStatus): string {
    hilog.debug(DOMAIN, TAG, 'PermissionUtils getPermissionStatusLabel: status=%{public}s', status);
    switch (status) {
      case PermissionStatus.GRANTED:
        return '已授予';
      case PermissionStatus.DENIED:
        return '已拒绝';
      case PermissionStatus.NOT_DETERMINED:
        return '未决定';
      case PermissionStatus.RESTRICTED:
        return '受限';
      default:
        return '未知';
    }
  }

  // ========================================
  // 必要权限管理方法
  // ========================================

  /**
   * 获取应用所需的权限列表。
   * 返回系统配置示例所需的免打扰权限。
   * @returns {string[]} 所需权限标识数组
   */
  static getRequiredPermissions(): string[] {
    hilog.info(DOMAIN, TAG, 'PermissionUtils getRequiredPermissions: returning required permissions');
    const permissions: string[] = [SystemConfigConstants.PERMISSION_DND];
    hilog.info(DOMAIN, TAG, 'PermissionUtils getRequiredPermissions: count=%{public}d', permissions.length);
    return permissions;
  }

  /**
   * 获取所有已知权限的标识列表。
   * @returns {string[]} 所有已知权限标识数组
   */
  static getAllKnownPermissions(): string[] {
    const permissions: string[] = [];
    PERMISSION_LABEL_MAP.forEach((_value: string, key: string) => {
      permissions.push(key);
    });
    return permissions;
  }

  // ========================================
  // 权限列表格式化方法
  // ========================================

  /**
   * 将权限列表格式化为可读字符串。
   * 每个权限显示为中文标签，以顿号分隔。
   * @param {string[]} perms - 权限标识数组
   * @returns {string} 格式化后的权限描述字符串
   */
  static formatPermissionList(perms: string[]): string {
    hilog.info(DOMAIN, TAG, 'PermissionUtils formatPermissionList: formatting %{public}d permissions', perms.length);
    if (perms.length === 0) {
      return '无权限';
    }
    let result: string = '';
    for (let i: number = 0; i < perms.length; i++) {
      if (i > 0) {
        result += '、';
      }
      result += PermissionUtils.getPermissionLabel(perms[i]);
    }
    hilog.debug(DOMAIN, TAG, 'PermissionUtils formatPermissionList: result=%{public}s', result);
    return result;
  }
}
