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

import { deviceInfo } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

/** 日志域ID */
const DOMAIN: number = 0xF811;
/** 日志标签 */
const TAG: string = 'DeviceUtils';

/**
 * 设备信息结构体
 * 用于存储和传递设备相关信息
 */
export class DeviceInfo {
  /** 设备品牌 */
  public brand: string = '';
  /** 设备型号 */
  public model: string = '';
  /** 系统版本 */
  public osVersion: string = '';
  /** 系统类型 */
  public osType: string = '';
  /** 设备类型 */
  public deviceType: string = '';
  /** 设备UDID */
  public udid: string = '';
}

/**
 * 设备工具类
 * 提供获取设备信息、判断设备类型等功能
 * 
 * @remarks
 * 该类为静态工具类，无需实例化
 * 可获取设备的硬件和软件信息
 * 
 * @example
 * ```typescript
 * // 获取设备信息
 * const info = DeviceUtils.getDeviceInfo();
 * hilog.info(0xF811, 'DeviceUtils', '设备型号: %{public}s', info.model);
 * 
 * // 判断是否为平板
 * const isTablet = DeviceUtils.isTablet();
 * ```
 */
export class DeviceUtils {
  /** 设备类型：手机 */
  public static readonly DEVICE_TYPE_PHONE: string = 'phone';
  /** 设备类型：平板 */
  public static readonly DEVICE_TYPE_TABLET: string = 'tablet';
  /** 设备类型：2in1 */
  public static readonly DEVICE_TYPE_2IN1: string = '2in1';
  /** 设备类型：未知 */
  public static readonly DEVICE_TYPE_UNKNOWN: string = 'unknown';

  /**
   * 获取设备品牌
   * 返回设备制造商品牌名称
   * 
   * @returns string 设备品牌名称
   */
  static getBrand(): string {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'getBrand() called');
    try {
      // 获取并返回设备品牌
      const brand: string = deviceInfo.brand || DeviceUtils.DEVICE_TYPE_UNKNOWN;
      hilog.info(DOMAIN, TAG, `getBrand() result: ${brand}`);
      return brand;
    } catch (error) {
      // 记录获取失败
      hilog.error(DOMAIN, TAG, `getBrand() failed: ${(error as Error).message}`);
      return DeviceUtils.DEVICE_TYPE_UNKNOWN;
    }
  }

  /**
   * 获取设备型号
   * 返回设备的型号标识
   * 
   * @returns string 设备型号
   */
  static getModel(): string {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'getModel() called');
    try {
      // 获取并返回设备型号
      const model: string = deviceInfo.productModel || DeviceUtils.DEVICE_TYPE_UNKNOWN;
      hilog.info(DOMAIN, TAG, `getModel() result: ${model}`);
      return model;
    } catch (error) {
      // 记录获取失败
      hilog.error(DOMAIN, TAG, `getModel() failed: ${(error as Error).message}`);
      return DeviceUtils.DEVICE_TYPE_UNKNOWN;
    }
  }

  /**
   * 获取系统版本
   * 返回操作系统版本号
   * 
   * @returns string 系统版本号
   */
  static getOsVersion(): string {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'getOsVersion() called');
    try {
      // 获取并返回系统版本
      const version: string = deviceInfo.osFullName || DeviceUtils.DEVICE_TYPE_UNKNOWN;
      hilog.info(DOMAIN, TAG, `getOsVersion() result: ${version}`);
      return version;
    } catch (error) {
      // 记录获取失败
      hilog.error(DOMAIN, TAG, `getOsVersion() failed: ${(error as Error).message}`);
      return DeviceUtils.DEVICE_TYPE_UNKNOWN;
    }
  }

  /**
   * 获取系统类型
   * 通过deviceInfo.majorVersion（OpenHarmony系统属性）判定系统类型
   *
   * @returns string 系统类型（如：OpenHarmony），获取失败时返回回退值
   */
  static getOsType(): string {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'getOsType() called');
    try {
      // majorVersion可正常读取即为OpenHarmony系统，读取异常时判定为未知
      const majorVersion: number = deviceInfo.majorVersion;
      const osType: string = majorVersion > 0 ? 'OpenHarmony' : DeviceUtils.DEVICE_TYPE_UNKNOWN;
      hilog.info(DOMAIN, TAG, `getOsType() result: ${osType}`);
      return osType;
    } catch (error) {
      // 记录获取失败
      hilog.error(DOMAIN, TAG, `getOsType() failed: ${(error as Error).message}`);
      return DeviceUtils.DEVICE_TYPE_UNKNOWN;
    }
  }

  /**
   * 获取设备UDID
   * 返回设备唯一标识符
   * 
   * @returns string 设备UDID
   * @remarks
   * 需要相应权限才能获取真实的UDID
   * 在无权限情况下返回模拟值
   */
  static getUdid(): string {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'getUdid() called');
    try {
      // 尝试获取UDID
      const udid: string = deviceInfo.udid || 'unknown';
      hilog.info(DOMAIN, TAG, 'getUdid() result obtained');
      return udid;
    } catch (error) {
      // 记录获取失败
      hilog.error(DOMAIN, TAG, `getUdid() failed: ${(error as Error).message}`);
      return 'unknown';
    }
  }

  /**
   * 获取完整设备信息
   * 返回包含所有设备信息的结构体
   * 
   * @returns DeviceInfo 设备信息结构体
   */
  static getDeviceInfo(): DeviceInfo {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'getDeviceInfo() called');
    // 组装设备信息
    const info: DeviceInfo = new DeviceInfo();
    info.brand = DeviceUtils.getBrand();
    info.model = DeviceUtils.getModel();
    info.osVersion = DeviceUtils.getOsVersion();
    info.osType = DeviceUtils.getOsType();
    info.deviceType = DeviceUtils.getDeviceType();
    info.udid = DeviceUtils.getUdid();
    hilog.info(DOMAIN, TAG, `getDeviceInfo() result: brand=${info.brand}, model=${info.model}`);
    return info;
  }

  /**
   * 获取设备类型
   * 根据屏幕尺寸等信息判断设备类型
   * 
   * @returns string 设备类型标识
   */
  static getDeviceType(): string {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'getDeviceType() called');
    try {
      // 获取设备类型
      const deviceType: string = deviceInfo.deviceType || DeviceUtils.DEVICE_TYPE_UNKNOWN;
      hilog.info(DOMAIN, TAG, `getDeviceType() result: ${deviceType}`);
      return deviceType;
    } catch (error) {
      // 记录获取失败
      hilog.error(DOMAIN, TAG, `getDeviceType() failed: ${(error as Error).message}`);
      return DeviceUtils.DEVICE_TYPE_UNKNOWN;
    }
  }

  /**
   * 判断是否为手机设备
   * 
   * @returns boolean 是手机返回true，否则返回false
   */
  static isPhone(): boolean {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'isPhone() called');
    // 判断设备类型
    const result: boolean = DeviceUtils.getDeviceType() === DeviceUtils.DEVICE_TYPE_PHONE;
    hilog.info(DOMAIN, TAG, `isPhone() result: ${result}`);
    return result;
  }

  /**
   * 判断是否为平板设备
   * 
   * @returns boolean 是平板返回true，否则返回false
   */
  static isTablet(): boolean {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'isTablet() called');
    // 判断设备类型
    const result: boolean = DeviceUtils.getDeviceType() === DeviceUtils.DEVICE_TYPE_TABLET;
    hilog.info(DOMAIN, TAG, `isTablet() result: ${result}`);
    return result;
  }

  /**
   * 判断是否为2in1设备
   * 
   * @returns boolean 是2in1返回true，否则返回false
   */
  static is2in1(): boolean {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'is2in1() called');
    // 判断设备类型
    const result: boolean = DeviceUtils.getDeviceType() === DeviceUtils.DEVICE_TYPE_2IN1;
    hilog.info(DOMAIN, TAG, `is2in1() result: ${result}`);
    return result;
  }

  /**
   * 获取系统SDK版本
   * 返回当前系统的API版本号
   * 
   * @returns number API版本号
   */
  static getSdkVersion(): number {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'getSdkVersion() called');
    try {
      // 获取SDK版本
      const version: number = deviceInfo.sdkApiVersion || 0;
      hilog.info(DOMAIN, TAG, `getSdkVersion() result: ${version}`);
      return version;
    } catch (error) {
      // 记录获取失败
      hilog.error(DOMAIN, TAG, `getSdkVersion() failed: ${(error as Error).message}`);
      return 0;
    }
  }

  /**
   * 获取系统API版本
   * 返回当前系统的API版本标识
   * 
   * @returns string API版本字符串
   */
  static getAPIVersion(): string {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'getAPIVersion() called');
    try {
      // 获取API版本
      const version: string = deviceInfo.sdkApiVersion?.toString() || 'unknown';
      hilog.info(DOMAIN, TAG, `getAPIVersion() result: ${version}`);
      return version;
    } catch (error) {
      // 记录获取失败
      hilog.error(DOMAIN, TAG, `getAPIVersion() failed: ${(error as Error).message}`);
      return 'unknown';
    }
  }

  /**
   * 获取设备支持的ABI列表
   * 返回设备支持的CPU架构（hardwareAbi与supportedAbis组合）
   *
   * @returns string[] ABI数组
   */
  static getSupportedAbis(): string[] {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'getSupportedAbis() called');
    try {
      // abiList为逗号分隔的CPU架构字符串（如arm64-v8a,armeabi-v7a）
      const abis: string[] = [];
      const abiList: string = deviceInfo.abiList || '';
      if (abiList.length > 0) {
        const parts: string[] = abiList.split(',');
        for (let i = 0; i < parts.length; i++) {
          const abi: string = parts[i].trim();
          if (abi.length > 0) {
            abis.push(abi);
          }
        }
      }
      hilog.info(DOMAIN, TAG, `getSupportedAbis() result: ${abis.length} abis`);
      return abis;
    } catch (error) {
      // 记录获取失败
      hilog.error(DOMAIN, TAG, `getSupportedAbis() failed: ${(error as Error).message}`);
      return [];
    }
  }

  /**
   * 检查系统版本是否满足最低要求
   * 按"."分段转数字逐段比较，避免字符串字典序比较导致"5.10.0"小于"5.2.0"之类的误判
   *
   * @param minVersion - 最低系统版本要求（如：5.0.0）
   * @returns boolean 满足要求返回true，否则返回false
   */
  static isSystemVersionAtLeast(minVersion: string): boolean {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `isSystemVersionAtLeast() called with minVersion: ${minVersion}`);
    try {
      // 获取当前系统版本
      const currentVersion: string = DeviceUtils.getOsVersion();
      const result: boolean = DeviceUtils.compareVersion(currentVersion, minVersion) >= 0;
      hilog.info(DOMAIN, TAG, `isSystemVersionAtLeast() result: ${result}`);
      return result;
    } catch (error) {
      // 记录检查失败
      hilog.error(DOMAIN, TAG, `isSystemVersionAtLeast() failed: ${(error as Error).message}`);
      return false;
    }
  }

  /**
   * 提取版本字符串中的数字段
   * 版本号可能带非数字前缀（如OpenHarmony 5.0.1.112），仅提取连续数字段参与比较
   *
   * @param version - 版本字符串
   * @returns number[] 数字段数组
   */
  private static parseVersionSegments(version: string): number[] {
    const segments: number[] = [];
    const parts: string[] = version.split('.');
    for (let i = 0; i < parts.length; i++) {
      const digits: string = parts[i].replace(/[^0-9]/g, '');
      if (digits.length > 0) {
        segments.push(parseInt(digits, 10));
      }
    }
    return segments;
  }

  /**
   * 逐段比较两个版本号
   *
   * @param left - 左侧版本字符串
   * @param right - 右侧版本字符串
   * @returns number 左大于右返回1，等于返回0，小于返回-1
   */
  private static compareVersion(left: string, right: string): number {
    const leftSegments: number[] = DeviceUtils.parseVersionSegments(left);
    const rightSegments: number[] = DeviceUtils.parseVersionSegments(right);
    const maxLen: number = Math.max(leftSegments.length, rightSegments.length);
    for (let i = 0; i < maxLen; i++) {
      // 缺失的短版本段按0处理
      const leftPart: number = i < leftSegments.length ? leftSegments[i] : 0;
      const rightPart: number = i < rightSegments.length ? rightSegments[i] : 0;
      if (leftPart !== rightPart) {
        return leftPart > rightPart ? 1 : -1;
      }
    }
    return 0;
  }

  /**
   * 获取设备显示信息
   * 返回用于日志记录的设备摘要信息
   * 
   * @returns string 设备显示信息
   */
  static getDisplayInfo(): string {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'getDisplayInfo() called');
    // 组装显示信息
    const info: string = `${DeviceUtils.getBrand()} ${DeviceUtils.getModel()} (${DeviceUtils.getOsVersion()})`;
    hilog.info(DOMAIN, TAG, `getDisplayInfo() result: ${info}`);
    return info;
  }
}
