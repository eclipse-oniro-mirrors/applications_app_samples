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

import { connection } from '@kit.NetworkKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

/** 日志域ID */
const DOMAIN: number = 0xFF00;
/** 日志标签 */
const TAG: string = 'NetworkUtils';

/**
 * 网络状态结构体
 * 用于存储和传递网络连接状态信息
 */
export class NetworkStatus {
  /** 是否有网络连接 */
  isConnected: boolean = false;
  /** 网络类型 */
  networkType: string = '';
  /** 是否为蜂窝网络 */
  isCellular: boolean = false;
  /** 是否为WiFi */
  isWifi: boolean = false;
  /** 是否为以太网 */
  isEthernet: boolean = false;
}

/**
 * 网络工具类
 * 提供网络状态检测、网络类型判断等功能
 * 
 * @remarks
 * 该类为静态工具类，无需实例化
 * 需要配置ohos.permission.GET_NETWORK_INFO权限
 * 
 * @example
 * ```typescript
 * // 检查网络是否可用
 * const isAvailable = await NetworkUtils.isNetworkAvailable();
 * 
 * // 获取网络类型
 * const type = await NetworkUtils.getNetworkType();
 * ```
 */
export class NetworkUtils {
  /** 网络类型：WiFi */
  static readonly NETWORK_TYPE_WIFI: string = 'wifi';
  /** 网络类型：蜂窝网络 */
  static readonly NETWORK_TYPE_CELLULAR: string = 'cellular';
  /** 网络类型：以太网 */
  static readonly NETWORK_TYPE_ETHERNET: string = 'ethernet';
  /** 网络类型：无网络 */
  static readonly NETWORK_TYPE_NONE: string = 'none';
  /** 网络类型：未知 */
  static readonly NETWORK_TYPE_UNKNOWN: string = 'unknown';

  /**
   * 检查网络是否可用
   * 判断设备是否已连接到网络
   * 
   * @returns Promise<boolean> 可用返回true，否则返回false
   */
  static async isNetworkAvailable(): Promise<boolean> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'isNetworkAvailable() called');
    try {
      // 检查默认网络是否有连接
      const hasDefaultNet: boolean = await connection.hasDefaultNet();
      hilog.info(DOMAIN, TAG, `isNetworkAvailable() result: ${hasDefaultNet}`);
      return hasDefaultNet;
    } catch (error) {
      // 记录检查失败
      hilog.error(DOMAIN, TAG, `isNetworkAvailable() failed: ${(error as Error).message}`);
      return false;
    }
  }

  /**
   * 同步检查网络是否可用
   * 同步方式判断网络连接状态
   * 
   * @returns boolean 可用返回true，否则返回false
   */
  static isNetworkAvailableSync(): boolean {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'isNetworkAvailableSync() called');
    try {
      // 同步检查网络连接
      const hasDefaultNet: boolean = connection.hasDefaultNetSync();
      hilog.info(DOMAIN, TAG, `isNetworkAvailableSync() result: ${hasDefaultNet}`);
      return hasDefaultNet;
    } catch (error) {
      // 记录检查失败
      hilog.error(DOMAIN, TAG, `isNetworkAvailableSync() failed: ${(error as Error).message}`);
      return false;
    }
  }

  /**
   * 获取网络类型
   * 返回当前连接的网络类型标识
   * 
   * @returns Promise<string> 网络类型字符串
   */
  static async getNetworkType(): Promise<string> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'getNetworkType() called');
    try {
      // 获取默认网络
      const netHandle: connection.NetHandle = await connection.getDefaultNet();
      // 获取网络能力
      const netCap: connection.NetCapabilities = await connection.getNetCapabilities(netHandle);
      // 判断网络类型
      let networkType: string = NetworkUtils.NETWORK_TYPE_UNKNOWN;
      if (netCap.bearerTypes) {
        const bearerTypes: connection.NetBearType[] = netCap.bearerTypes;
        for (let i = 0; i < bearerTypes.length; i++) {
          const bearerType: connection.NetBearType = bearerTypes[i];
          if (bearerType === connection.NetBearType.BEARER_WIFI) {
            networkType = NetworkUtils.NETWORK_TYPE_WIFI;
            break;
          } else if (bearerType === connection.NetBearType.BEARER_CELLULAR) {
            networkType = NetworkUtils.NETWORK_TYPE_CELLULAR;
            break;
          } else if (bearerType === connection.NetBearType.BEARER_ETHERNET) {
            networkType = NetworkUtils.NETWORK_TYPE_ETHERNET;
            break;
          }
        }
      }
      hilog.info(DOMAIN, TAG, `getNetworkType() result: ${networkType}`);
      return networkType;
    } catch (error) {
      // 记录获取失败
      hilog.error(DOMAIN, TAG, `getNetworkType() failed: ${(error as Error).message}`);
      return NetworkUtils.NETWORK_TYPE_NONE;
    }
  }

  /**
   * 获取完整网络状态
   * 返回包含所有网络信息的状态对象
   * 
   * @returns Promise<NetworkStatus> 网络状态结构体
   */
  static async getNetworkStatus(): Promise<NetworkStatus> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'getNetworkStatus() called');
    try {
      // 获取网络可用性
      const isConnected: boolean = await NetworkUtils.isNetworkAvailable();
      // 获取网络类型
      const networkType: string = await NetworkUtils.getNetworkType();
      // 构建状态对象
      const status: NetworkStatus = new NetworkStatus();
      status.isConnected = isConnected;
      status.networkType = networkType;
      status.isCellular = networkType === NetworkUtils.NETWORK_TYPE_CELLULAR;
      status.isWifi = networkType === NetworkUtils.NETWORK_TYPE_WIFI;
      status.isEthernet = networkType === NetworkUtils.NETWORK_TYPE_ETHERNET;
      hilog.info(DOMAIN, TAG, `getNetworkStatus() result: isConnected=${status.isConnected}, type=${status.networkType}`);
      return status;
    } catch (error) {
      // 记录获取失败
      hilog.error(DOMAIN, TAG, `getNetworkStatus() failed: ${(error as Error).message}`);
      // 返回默认状态
      const defaultStatus: NetworkStatus = new NetworkStatus();
      defaultStatus.isConnected = false;
      defaultStatus.networkType = NetworkUtils.NETWORK_TYPE_NONE;
      return defaultStatus;
    }
  }

  /**
   * 检查是否为WiFi连接
   * 判断当前是否通过WiFi连接网络
   * 
   * @returns Promise<boolean> 是WiFi返回true，否则返回false
   */
  static async isWifi(): Promise<boolean> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'isWifi() called');
    // 获取网络类型并判断
    const networkType: string = await NetworkUtils.getNetworkType();
    const result: boolean = networkType === NetworkUtils.NETWORK_TYPE_WIFI;
    hilog.info(DOMAIN, TAG, `isWifi() result: ${result}`);
    return result;
  }

  /**
   * 检查是否为蜂窝网络
   * 判断当前是否通过移动网络连接
   * 
   * @returns Promise<boolean> 是蜂窝网络返回true，否则返回false
   */
  static async isCellular(): Promise<boolean> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'isCellular() called');
    // 获取网络类型并判断
    const networkType: string = await NetworkUtils.getNetworkType();
    const result: boolean = networkType === NetworkUtils.NETWORK_TYPE_CELLULAR;
    hilog.info(DOMAIN, TAG, `isCellular() result: ${result}`);
    return result;
  }

  /**
   * 检查是否为以太网连接
   * 判断当前是否通过以太网连接
   * 
   * @returns Promise<boolean> 是以太网返回true，否则返回false
   */
  static async isEthernet(): Promise<boolean> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'isEthernet() called');
    // 获取网络类型并判断
    const networkType: string = await NetworkUtils.getNetworkType();
    const result: boolean = networkType === NetworkUtils.NETWORK_TYPE_ETHERNET;
    hilog.info(DOMAIN, TAG, `isEthernet() result: ${result}`);
    return result;
  }

  /**
   * 注册网络状态变化监听器
   * 当网络连接状态发生变化时触发回调
   * 
   * @param callback - 网络状态变化回调函数
   * @returns Promise<void>
   */
  static async registerNetAvailableCallback(
    callback: (netHandle: connection.NetHandle) => void
  ): Promise<void> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'registerNetAvailableCallback() called');
    try {
      // 注册网络可用监听
      const netConnection: connection.NetConnection = connection.createNetConnection();
      netConnection.on('netAvailable', callback);
      hilog.info(DOMAIN, TAG, 'registerNetAvailableCallback() success');
    } catch (error) {
      // 记录注册失败
      hilog.error(DOMAIN, TAG, `registerNetAvailableCallback() failed: ${(error as Error).message}`);
      throw new Error(`registerNetAvailableCallback failed: ${(error as Error).message}`);
    }
  }

  /**
   * 注册网络能力变化监听器
   * 当网络能力发生变化时触发回调
   * 
   * @param callback - 网络能力变化回调函数
   * @returns Promise<void>
   */
  static async registerNetCapabilitiesCallback(
    callback: (netCap: connection.NetCapabilityInfo) => void
  ): Promise<void> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'registerNetCapabilitiesCallback() called');
    try {
      // 注册网络能力监听
      const netConnection: connection.NetConnection = connection.createNetConnection();
      netConnection.on('netCapabilitiesChange', callback);
      hilog.info(DOMAIN, TAG, 'registerNetCapabilitiesCallback() success');
    } catch (error) {
      // 记录注册失败
      hilog.error(DOMAIN, TAG, `registerNetCapabilitiesCallback() failed: ${(error as Error).message}`);
      throw new Error(`registerNetCapabilitiesCallback failed: ${(error as Error).message}`);
    }
  }

  /**
   * 注册网络丢失监听器
   * 当网络连接丢失时触发回调
   * 
   * @param callback - 网络丢失回调函数
   * @returns Promise<void>
   */
  static async registerNetLostCallback(
    callback: (netHandle: connection.NetHandle) => void
  ): Promise<void> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'registerNetLostCallback() called');
    try {
      // 注册网络丢失监听
      const netConnection: connection.NetConnection = connection.createNetConnection();
      netConnection.on('netLost', callback);
      hilog.info(DOMAIN, TAG, 'registerNetLostCallback() success');
    } catch (error) {
      // 记录注册失败
      hilog.error(DOMAIN, TAG, `registerNetLostCallback() failed: ${(error as Error).message}`);
      throw new Error(`registerNetLostCallback failed: ${(error as Error).message}`);
    }
  }

  /**
   * 注册网络连接监听器
   * 当建立网络连接时触发回调
   * 
   * @param callback - 网络连接回调函数
   * @returns Promise<void>
   */
  static async registerNetConnectedCallback(
    callback: (netHandle: connection.NetHandle) => void
  ): Promise<void> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'registerNetConnectedCallback() called');
    try {
      // 注册网络连接监听（使用netAvailable事件）
      const netConnection: connection.NetConnection = connection.createNetConnection();
      netConnection.on('netAvailable', callback);
      hilog.info(DOMAIN, TAG, 'registerNetConnectedCallback() success');
    } catch (error) {
      // 记录注册失败
      hilog.error(DOMAIN, TAG, `registerNetConnectedCallback() failed: ${(error as Error).message}`);
      throw new Error(`registerNetConnectedCallback failed: ${(error as Error).message}`);
    }
  }

  /**
   * 注销网络监听器
   * 移除所有网络状态变化的监听
   * 
   * @param event - 要注销的事件名称
   * @param callback - 要注销的回调函数
   * @returns Promise<void>
   */
  static async unregisterNetCallback(
    netConnection: connection.NetConnection
  ): Promise<void> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'unregisterNetCallback() called');
    try {
      // 注销监听（通过同一NetConnection实例调用unregister，需要传入回调参数）
      await new Promise<void>((resolve) => {
        netConnection.unregister((err: Object) => {
          resolve();
        });
      });
      hilog.info(DOMAIN, TAG, 'unregisterNetCallback() success');
    } catch (error) {
      // 记录注销失败
      hilog.error(DOMAIN, TAG, `unregisterNetCallback() failed: ${(error as Error).message}`);
      throw new Error(`unregisterNetCallback failed: ${(error as Error).message}`);
    }
  }

  /**
   * 获取当前IP地址
   * 获取设备在当前网络中的IP地址
   * 
   * @returns Promise<string> IP地址字符串
   */
  static async getIpAddress(): Promise<string> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'getIpAddress() called');
    try {
      // 获取默认网络句柄
      const netHandle: connection.NetHandle = await connection.getDefaultNet();
      // 获取连接属性（包含IP地址、DNS等信息）
      const props: connection.ConnectionProperties = await connection.getConnectionProperties(netHandle);
      let ipAddr: string = '0.0.0.0';
      if (props.linkAddresses && props.linkAddresses.length > 0) {
        // LinkAddress.address是NetAddress类型，NetAddress.address是字符串
        const netAddr: connection.NetAddress = props.linkAddresses[0].address;
        ipAddr = netAddr.address || '0.0.0.0';
      }
      hilog.info(DOMAIN, TAG, `getIpAddress() result: ${ipAddr}`);
      return ipAddr;
    } catch (error) {
      // 记录获取失败
      hilog.error(DOMAIN, TAG, `getIpAddress() failed: ${(error as Error).message}`);
      return '0.0.0.0';
    }
  }
}
