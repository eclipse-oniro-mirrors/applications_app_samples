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
import { BluetoothConstants, BluetoothConnectionState, BluetoothProfileType } from '../constants/BluetoothConstants';

const TAG: string = BluetoothConstants.TAG;
const DOMAIN: number = BluetoothConstants.DOMAIN;

/**
 * 蓝牙设备类型枚举。
 * 定义蓝牙设备的分类类型。
 */
export enum BluetoothDeviceType {
  /** 经典蓝牙设备 */
  CLASSIC = 'classic',
  /** 低功耗蓝牙设备 */
  BLE = 'ble',
  /** 双模设备 */
  DUAL_MODE = 'dual_mode',
  /** 未知类型 */
  UNKNOWN = 'unknown'
}

/**
 * 蓝牙设备主要服务类型枚举。
 */
export enum BluetoothMajorService {
  /** 音频 */
  AUDIO = 'audio',
  /** 电话 */
  TELEPHONY = 'telephony',
  /** 网络 */
  NETWORK = 'network',
  /** 输入设备 */
  INPUT = 'input',
  /** 健康 */
  HEALTH = 'health',
  /** 信息 */
  INFORMATION = 'information'
}

/**
 * 蓝牙设备JSON序列化接口。
 */
export interface BluetoothDeviceJson {
  deviceId: string;
  deviceName: string;
  macAddress: string;
  deviceType: BluetoothDeviceType;
  connectionState: BluetoothConnectionState;
  majorServices: BluetoothMajorService[];
  supportedProfiles: BluetoothProfileType[];
  rssi: number;
  bondState: number;
  lastConnectedTime: number;
  connectionCount: number;
  signalStrength: number;
  deviceClass: number;
}

/**
 * 蓝牙设备数据模型。
 * 封装蓝牙设备的基本信息和连接状态。
 */
export class BluetoothDeviceModel {
  /** 设备唯一标识 */
  deviceId: string;
  /** 设备名称 */
  deviceName: string;
  /** MAC地址 */
  macAddress: string;
  /** 设备类型 */
  deviceType: BluetoothDeviceType;
  /** 连接状态 */
  connectionState: BluetoothConnectionState;
  /** 主要服务类型 */
  majorServices: BluetoothMajorService[];
  /** 支持的Profile列表 */
  supportedProfiles: BluetoothProfileType[];
  /** 信号强度 */
  rssi: number;
  /** 配对状态 */
  bondState: number;
  /** 最后连接时间 */
  lastConnectedTime: number;
  /** 连接次数统计 */
  connectionCount: number;
  /** 信号强度百分比 */
  signalStrength: number;
  /** 设备类别 */
  deviceClass: number;

  /**
   * 创建蓝牙设备模型实例。
   * @param {string} deviceId - 设备ID
   * @param {string} deviceName - 设备名称
   * @param {string} macAddress - MAC地址
   * @param {BluetoothDeviceType} deviceType - 设备类型
   */
  constructor(
    deviceId: string = '',
    deviceName: string = '',
    macAddress: string = '',
    deviceType: BluetoothDeviceType = BluetoothDeviceType.UNKNOWN
  ) {
    hilog.info(DOMAIN, TAG, 'BluetoothDeviceModel constructor: id=%{public}s, name=%{public}s', deviceId, deviceName);
    this.deviceId = deviceId;
    this.deviceName = deviceName;
    this.macAddress = macAddress;
    this.deviceType = deviceType;
    this.connectionState = BluetoothConnectionState.DISCONNECTED;
    this.majorServices = [];
    this.supportedProfiles = [];
    this.rssi = 0;
    this.bondState = 0;
    this.lastConnectedTime = 0;
    this.connectionCount = 0;
    this.signalStrength = 0;
    this.deviceClass = 0;
  }

  /**
   * 更新连接状态。
   * @param {BluetoothConnectionState} state - 新的连接状态
   */
  updateConnectionState(state: BluetoothConnectionState): void {
    hilog.info(DOMAIN, TAG, 'BluetoothDeviceModel updateConnectionState: %{public}s -> %{public}s',
      this.connectionState.toString(), state.toString());
    this.connectionState = state;
    if (state === BluetoothConnectionState.CONNECTED) {
      this.lastConnectedTime = Date.now();
      this.connectionCount += 1;
    }
  }

  /**
   * 检查设备是否已连接。
   * @returns {boolean} 是否已连接
   */
  isConnected(): boolean {
    return this.connectionState === BluetoothConnectionState.CONNECTED;
  }

  /**
   * 检查设备是否已配对。
   * @returns {boolean} 是否已配对
   */
  isBonded(): boolean {
    return this.bondState === 12;
  }

  /**
   * 检查设备是否支持指定Profile。
   * @param {BluetoothProfileType} profile - 要检查的Profile类型
   * @returns {boolean} 是否支持
   */
  supportsProfile(profile: BluetoothProfileType): boolean {
    return this.supportedProfiles.indexOf(profile) !== -1;
  }

  /**
   * 添加支持的Profile。
   * @param {BluetoothProfileType} profile - 要添加的Profile
   */
  addSupportedProfile(profile: BluetoothProfileType): void {
    if (!this.supportsProfile(profile)) {
      this.supportedProfiles.push(profile);
      hilog.debug(DOMAIN, TAG, 'BluetoothDeviceModel addSupportedProfile: added %{public}s', profile);
    }
  }

  /**
   * 添加主要服务类型。
   * @param {BluetoothMajorService} service - 要添加的服务类型
   */
  addMajorService(service: BluetoothMajorService): void {
    if (this.majorServices.indexOf(service) === -1) {
      this.majorServices.push(service);
    }
  }

  /**
   * 更新信号强度。
   * @param {number} rssi - RSSI值
   */
  updateRssi(rssi: number): void {
    this.rssi = rssi;
    // 将RSSI转换为0-100的信号强度百分比
    // RSSI范围通常为-100到-30dBm
    if (rssi <= -100) {
      this.signalStrength = 0;
    } else if (rssi >= -30) {
      this.signalStrength = 100;
    } else {
      this.signalStrength = Math.round((rssi + 100) * (100 / 70));
    }
  }

  /**
   * 获取信号强度等级描述。
   * @returns {string} 信号强度等级
   */
  getSignalLevel(): string {
    if (this.signalStrength >= 80) {
      return 'excellent';
    } else if (this.signalStrength >= 60) {
      return 'good';
    } else if (this.signalStrength >= 40) {
      return 'fair';
    } else if (this.signalStrength >= 20) {
      return 'weak';
    }
    return 'very_weak';
  }

  /**
   * 获取设备类型描述。
   * @returns {string} 设备类型描述
   */
  getDeviceTypeLabel(): string {
    switch (this.deviceType) {
      case BluetoothDeviceType.CLASSIC:
        return 'classic_bluetooth';
      case BluetoothDeviceType.BLE:
        return 'ble';
      case BluetoothDeviceType.DUAL_MODE:
        return 'dual_mode';
      default:
        return 'unknown';
    }
  }

  /**
   * 获取连接状态描述。
   * @returns {string} 连接状态描述
   */
  getConnectionStateLabel(): string {
    switch (this.connectionState) {
      case BluetoothConnectionState.DISCONNECTED:
        return 'disconnected';
      case BluetoothConnectionState.CONNECTING:
        return 'connecting';
      case BluetoothConnectionState.CONNECTED:
        return 'connected';
      case BluetoothConnectionState.DISCONNECTING:
        return 'disconnecting';
      case BluetoothConnectionState.CONNECTION_FAILED:
        return 'connection_failed';
      case BluetoothConnectionState.CONNECTION_TIMEOUT:
        return 'connection_timeout';
      default:
        return 'unknown_state';
    }
  }

  /**
   * 序列化为JSON兼容对象。
   * @returns {BluetoothDeviceJson} JSON表示
   */
  toJSON(): BluetoothDeviceJson {
    return {
      deviceId: this.deviceId,
      deviceName: this.deviceName,
      macAddress: this.macAddress,
      deviceType: this.deviceType,
      connectionState: this.connectionState,
      majorServices: this.majorServices,
      supportedProfiles: this.supportedProfiles,
      rssi: this.rssi,
      bondState: this.bondState,
      lastConnectedTime: this.lastConnectedTime,
      connectionCount: this.connectionCount,
      signalStrength: this.signalStrength,
      deviceClass: this.deviceClass
    };
  }

  /**
   * 转换为可读字符串。
   * @returns {string} 字符串描述
   */
  toString(): string {
    return 'BluetoothDeviceModel[id=' + this.deviceId + ', name=' + this.deviceName +
      ', mac=' + this.macAddress + ', type=' + this.deviceType + ', state=' + this.connectionState + ']';
  }

  /**
   * 重置设备状态。
   */
  reset(): void {
    this.connectionState = BluetoothConnectionState.DISCONNECTED;
    this.rssi = 0;
    this.signalStrength = 0;
    this.lastConnectedTime = 0;
  }
}
