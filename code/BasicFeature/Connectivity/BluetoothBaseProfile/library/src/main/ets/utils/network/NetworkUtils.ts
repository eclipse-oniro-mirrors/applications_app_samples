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
 * 网络类型枚举
 */
export enum NetworkType {
  WIFI = 'wifi',
  CELLULAR = 'cellular',
  ETHERNET = 'ethernet',
  BLUETOOTH = 'bluetooth',
  NONE = 'none',
  UNKNOWN = 'unknown'
}

/**
 * 网络状态枚举
 */
export enum NetworkState {
  CONNECTED = 'connected',
  DISCONNECTED = 'disconnected',
  CONNECTING = 'connecting',
  SUSPENDED = 'suspended'
}

/**
 * 网络回调接口
 */
export interface NetworkCallback {
  onAvailable(type: NetworkType): void;
  onLost(): void;
}

/**
 * 网络工具类
 * 提供网络状态查询和管理相关的实用方法
 */
export class NetworkUtils {
  /** 当前网络类型 */
  private static currentType: NetworkType = NetworkType.UNKNOWN;
  /** 当前网络状态 */
  private static currentState: NetworkState = NetworkState.DISCONNECTED;
  /** 网络回调列表 */
  private static callbacks: NetworkCallback[] = [];

  /**
   * 获取当前网络类型
   * @returns 网络类型
   */
  static getNetworkType(): NetworkType {
    return NetworkUtils.currentType;
  }

  /**
   * 获取当前网络状态
   * @returns 网络状态
   */
  static getNetworkState(): NetworkState {
    return NetworkUtils.currentState;
  }

  /**
   * 检查网络是否可用
   * @returns 网络是否可用
   */
  static isNetworkAvailable(): boolean {
    return NetworkUtils.currentState === NetworkState.CONNECTED;
  }

  /**
   * 检查是否为WiFi网络
   * @returns 是否为WiFi
   */
  static isWifi(): boolean {
    return NetworkUtils.currentType === NetworkType.WIFI;
  }

  /**
   * 检查是否为蜂窝网络
   * @returns 是否为蜂窝网络
   */
  static isCellular(): boolean {
    return NetworkUtils.currentType === NetworkType.CELLULAR;
  }

  /**
   * 检查是否为蓝牙网络
   * @returns 是否为蓝牙网络
   */
  static isBluetooth(): boolean {
    return NetworkUtils.currentType === NetworkType.BLUETOOTH;
  }

  /**
   * 设置网络类型（用于模拟）
   * @param type - 网络类型
   */
  static setNetworkType(type: NetworkType): void {
    hilog.info(DOMAIN, TAG, 'NetworkUtils setNetworkType: %{public}s', type);
    NetworkUtils.currentType = type;
  }

  /**
   * 设置网络状态（用于模拟）
   * @param state - 网络状态
   */
  static setNetworkState(state: NetworkState): void {
    hilog.info(DOMAIN, TAG, 'NetworkUtils setNetworkState: %{public}s', state);
    const previousState: NetworkState = NetworkUtils.currentState;
    NetworkUtils.currentState = state;
    if (previousState !== state) {
      NetworkUtils.notifyCallbacks(state);
    }
  }

  /**
   * 添加网络回调
   * @param callback - 回调
   */
  static addCallback(callback: NetworkCallback): void {
    NetworkUtils.callbacks.push(callback);
  }

  /**
   * 移除网络回调
   * @param callback - 回调
   */
  static removeCallback(callback: NetworkCallback): void {
    const index: number = NetworkUtils.callbacks.indexOf(callback);
    if (index !== -1) {
      NetworkUtils.callbacks.splice(index, 1);
    }
  }

  /**
   * 通知所有回调
   * @param state - 新的网络状态
   */
  private static notifyCallbacks(state: NetworkState): void {
    for (const callback of NetworkUtils.callbacks) {
      try {
        if (state === NetworkState.CONNECTED) {
          callback.onAvailable(NetworkUtils.currentType);
        } else {
          callback.onLost();
        }
      } catch (e) {
        hilog.error(DOMAIN, TAG, 'NetworkUtils notifyCallbacks: error in callback');
      }
    }
  }

  /**
   * 获取网络类型描述
   * @param type - 网络类型
   * @returns 描述字符串
   */
  static getNetworkTypeLabel(type: NetworkType): string {
    switch (type) {
      case NetworkType.WIFI: return 'WiFi';
      case NetworkType.CELLULAR: return 'Cellular';
      case NetworkType.ETHERNET: return 'Ethernet';
      case NetworkType.BLUETOOTH: return 'Bluetooth';
      case NetworkType.NONE: return 'None';
      default: return 'Unknown';
    }
  }

  /**
   * 获取网络状态描述
   * @param state - 网络状态
   * @returns 描述字符串
   */
  static getNetworkStateLabel(state: NetworkState): string {
    switch (state) {
      case NetworkState.CONNECTED: return 'Connected';
      case NetworkState.DISCONNECTED: return 'Disconnected';
      case NetworkState.CONNECTING: return 'Connecting';
      case NetworkState.SUSPENDED: return 'Suspended';
      default: return 'Unknown';
    }
  }

  /**
   * 重置网络状态
   */
  static reset(): void {
    NetworkUtils.currentType = NetworkType.UNKNOWN;
    NetworkUtils.currentState = NetworkState.DISCONNECTED;
    NetworkUtils.callbacks = [];
  }
}
