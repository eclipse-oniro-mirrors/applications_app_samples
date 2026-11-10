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
import { SystemConfigConstants } from '../../constants/SystemConfigConstants';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

// ========================================
// 网络类型枚举
// ========================================

/**
 * 网络类型枚举。
 * 定义设备可连接的各类网络接入方式。
 */
export enum NetworkType {
  /** Wi-Fi 无线网络 */
  WIFI = 'wifi',
  /** 蜂窝移动网络 */
  CELLULAR = 'cellular',
  /** 以太网有线网络 */
  ETHERNET = 'ethernet',
  /** 蓝牙网络 */
  BLUETOOTH = 'bluetooth',
  /** 未知网络类型 */
  UNKNOWN = 'unknown'
}

// ========================================
// 网络状态枚举
// ========================================

/**
 * 网络状态枚举。
 * 描述当前网络连接的实时状态。
 */
export enum NetworkState {
  /** 已连接，网络可用 */
  CONNECTED = 'connected',
  /** 已断开，网络不可用 */
  DISCONNECTED = 'disconnected',
  /** 正在连接中 */
  CONNECTING = 'connecting',
  /** 网络已暂停 */
  SUSPENDED = 'suspended'
}

// ========================================
// 网络回调接口
// ========================================

/**
 * 网络状态变化回调接口。
 * 当网络状态或网络类型发生变化时触发。
 */
export interface NetworkCallback {
  /**
   * 网络状态变化回调。
   * @param {NetworkState} newState - 新的网络状态
   */
  onStateChange(newState: NetworkState): void;

  /**
   * 网络类型变化回调。
   * @param {NetworkType} newType - 新的网络类型
   */
  onTypeChange(newType: NetworkType): void;
}

// ========================================
// 信号等级阈值常量
// ========================================

/** 信号等级对应的 RSSI 阈值（dBm） */
const SIGNAL_LEVEL_EXCELLENT: number = -50;
const SIGNAL_LEVEL_GOOD: number = -60;
const SIGNAL_LEVEL_FAIR: number = -70;
const SIGNAL_LEVEL_POOR: number = -80;

// ========================================
// 网络工具类
// ========================================

/**
 * 网络状态工具类。
 * 提供网络类型与状态的标签获取、连接判断、
 * 带宽评估、信号等级计算、延迟估算等静态方法。
 */
export class NetworkUtils {
  /** 高带宽网络类型列表 */
  private static readonly HIGH_BANDWIDTH_TYPES: NetworkType[] = [
    NetworkType.WIFI,
    NetworkType.ETHERNET
  ];

  /** 各网络类型的估算延迟（毫秒） */
  private static readonly LATENCY_MAP: Map<NetworkType, number> = new Map<NetworkType, number>([
    [NetworkType.WIFI, 20],
    [NetworkType.ETHERNET, 5],
    [NetworkType.CELLULAR, 100],
    [NetworkType.BLUETOOTH, 150],
    [NetworkType.UNKNOWN, 200]
  ]);

  // ========================================
  // 标签获取方法
  // ========================================

  /**
   * 获取网络类型的中文标签。
   * @param {NetworkType} type - 网络类型枚举值
   * @returns {string} 网络类型的中文描述
   */
  static getNetworkTypeLabel(type: NetworkType): string {
    hilog.debug(DOMAIN, TAG, 'NetworkUtils getNetworkTypeLabel: type=%{public}s', type);
    switch (type) {
      case NetworkType.WIFI:
        return 'Wi-Fi';
      case NetworkType.CELLULAR:
        return '蜂窝网络';
      case NetworkType.ETHERNET:
        return '以太网';
      case NetworkType.BLUETOOTH:
        return '蓝牙';
      case NetworkType.UNKNOWN:
        return '未知网络';
      default:
        return '未识别';
    }
  }

  /**
   * 获取网络状态的中文标签。
   * @param {NetworkState} state - 网络状态枚举值
   * @returns {string} 网络状态的中文描述
   */
  static getNetworkStateLabel(state: NetworkState): string {
    hilog.debug(DOMAIN, TAG, 'NetworkUtils getNetworkStateLabel: state=%{public}s', state);
    switch (state) {
      case NetworkState.CONNECTED:
        return '已连接';
      case NetworkState.DISCONNECTED:
        return '已断开';
      case NetworkState.CONNECTING:
        return '连接中';
      case NetworkState.SUSPENDED:
        return '已暂停';
      default:
        return '未知状态';
    }
  }

  // ========================================
  // 状态判断方法
  // ========================================

  /**
   * 判断当前网络状态是否为已连接。
   * @param {NetworkState} state - 网络状态
   * @returns {boolean} 是否已连接
   */
  static isConnected(state: NetworkState): boolean {
    const result: boolean = state === NetworkState.CONNECTED;
    hilog.debug(DOMAIN, TAG, 'NetworkUtils isConnected: state=%{public}s, result=%{public}s',
      state, result.toString());
    return result;
  }

  /**
   * 判断当前网络状态是否可用（已连接且未暂停）。
   * @param {NetworkState} state - 网络状态
   * @returns {boolean} 网络是否可用
   */
  static isAvailable(state: NetworkState): boolean {
    const result: boolean = state === NetworkState.CONNECTED || state === NetworkState.CONNECTING;
    hilog.debug(DOMAIN, TAG, 'NetworkUtils isAvailable: state=%{public}s, result=%{public}s',
      state, result.toString());
    return result;
  }

  /**
   * 判断指定网络类型是否为高带宽网络。
   * Wi-Fi 和以太网被视为高带宽网络。
   * @param {NetworkType} type - 网络类型
   * @returns {boolean} 是否为高带宽网络
   */
  static isHighBandwidth(type: NetworkType): boolean {
    let result: boolean = false;
    for (let i: number = 0; i < NetworkUtils.HIGH_BANDWIDTH_TYPES.length; i++) {
      if (NetworkUtils.HIGH_BANDWIDTH_TYPES[i] === type) {
        result = true;
        break;
      }
    }
    hilog.debug(DOMAIN, TAG, 'NetworkUtils isHighBandwidth: type=%{public}s, result=%{public}s',
      type, result.toString());
    return result;
  }

  // ========================================
  // 信号与延迟估算方法
  // ========================================

  /**
   * 根据 RSSI 值计算信号等级。
   * 信号等级范围 0-4，值越大信号越强。
   * @param {number} rssi - 接收信号强度指示（dBm），典型范围 -30 至 -100
   * @returns {number} 信号等级，0 表示无信号，4 表示信号极好
   */
  static getSignalLevel(rssi: number): number {
    let level: number;
    if (rssi >= SIGNAL_LEVEL_EXCELLENT) {
      level = 4;
    } else if (rssi >= SIGNAL_LEVEL_GOOD) {
      level = 3;
    } else if (rssi >= SIGNAL_LEVEL_FAIR) {
      level = 2;
    } else if (rssi >= SIGNAL_LEVEL_POOR) {
      level = 1;
    } else {
      level = 0;
    }
    hilog.debug(DOMAIN, TAG, 'NetworkUtils getSignalLevel: rssi=%{public}d, level=%{public}d', rssi, level);
    return level;
  }

  /**
   * 根据网络类型估算延迟。
   * 返回典型场景下的估算往返延迟时间（毫秒）。
   * @param {NetworkType} type - 网络类型
   * @returns {number} 估算延迟（毫秒）
   */
  static estimateLatency(type: NetworkType): number {
    const latency: number = NetworkUtils.LATENCY_MAP.get(type) ?? 200;
    hilog.debug(DOMAIN, TAG, 'NetworkUtils estimateLatency: type=%{public}s, latency=%{public}dms', type, latency);
    return latency;
  }

  // ========================================
  // 网络信息描述方法
  // ========================================

  /**
   * 获取网络类型的带宽描述。
   * @param {NetworkType} type - 网络类型
   * @returns {string} 带宽描述文本
   */
  static getBandwidthDescription(type: NetworkType): string {
    switch (type) {
      case NetworkType.ETHERNET:
        return '千兆级带宽';
      case NetworkType.WIFI:
        return '百兆级带宽';
      case NetworkType.CELLULAR:
        return '移动网络带宽';
      case NetworkType.BLUETOOTH:
        return '低功耗窄带';
      default:
        return '未知带宽';
    }
  }
}
