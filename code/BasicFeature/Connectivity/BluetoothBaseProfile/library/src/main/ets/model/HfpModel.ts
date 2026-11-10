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
import { BluetoothConstants, BluetoothConnectionState } from '../constants/BluetoothConstants';

const TAG: string = BluetoothConstants.TAG;
const DOMAIN: number = BluetoothConstants.DOMAIN;

/**
 * JSON representation of HfpModel.
 */
export interface HfpJson {
  state: string;
  deviceId: string;
  lastUpdateTime: number;
  callState: number;
  phoneNumber: string;
  callDuration: number;
  isMuted: boolean;
  isSpeakerOn: boolean;
  speakerVolume: number;
  micVolume: number;
}

/**
 * HFP免提连接状态枚举。
 */
export enum HfpState {
  /** 未连接 */
  DISCONNECTED = 'disconnected',
  /** 正在连接 */
  CONNECTING = 'connecting',
  /** 已连接 */
  CONNECTED = 'connected',
  /** 正在断开 */
  DISCONNECTING = 'disconnecting',
  /** 错误状态 */
  ERROR = 'error'
}

/**
 * HFP免提数据接口。
 */
export interface HfpData {
  /** 通话状态 */
  callState: string;
  /** 通话号码 */
  phoneNumber: string;
  /** 通话时长（秒） */
  callDuration: number;
  /** 是否静音 */
  isMuted: boolean;
  /** 是否使用扬声器 */
  isSpeakerOn: boolean;
  /** 音量级别 (0-15) */
  speakerVolume: number;
  /** 麦克风音量 (0-15) */
  micVolume: number;
  /** 电池电量 (0-100) */
  batteryLevel: number;
  /** 网络信号强度 (0-5) */
  networkSignal: number;
  /** 运营商名称 */
  carrierName: string;
}

/**
 * HFP免提数据模型。
 * 封装HfpProfile的数据和状态信息。
 */
export class HfpModel {
  /** 当前连接状态 */
  state: HfpState = HfpState.DISCONNECTED;
  /** 关联的设备ID */
  deviceId: string = '';
  /** 最后更新时间戳 */
  lastUpdateTime: number = 0;
  /** 数据内容 */
  data: HfpData | null = null;
  /** 操作日志 */
  operationLog: string[] = [];
  /** 重试次数 */
  retryCount: number = 0;
  /** 最大重试次数 */
  maxRetries: number = BluetoothConstants.MAX_RETRY_COUNT;
  /** 超时时间（毫秒） */
  timeoutMs: number = BluetoothConstants.OPERATION_TIMEOUT_MS;
  /** 是否已初始化 */
  isInitialized: boolean = false;
  /** 错误信息 */
  errorMessage: string = '';
  /** 错误码 */
  errorCode: number = 0;
  /** 连接持续时间（毫秒） */
  connectionDuration: number = 0;
  /** 连接开始时间 */
  connectionStartTime: number = 0;
  /** 操作计数 */
  operationCount: number = 0;
  /** 通话状态 */
  callState: number = 0;
  /** 通话号码 */
  phoneNumber: string = '';
  /** 通话时长（秒） */
  callDuration: number = 0;
  /** 是否静音 */
  isMuted: boolean = false;
  /** 是否使用扬声器 */
  isSpeakerOn: boolean = false;
  /** 扬声器音量 (0-15) */
  speakerVolume: number = 50;
  /** 麦克风音量 (0-15) */
  micVolume: number = 50;

  /**
   * 构造函数。
   * @param {string} deviceId - 设备ID
   */
  constructor(deviceId: string = '') {
    hilog.info(DOMAIN, TAG, 'HfpModel constructor: deviceId=%{public}s', deviceId);
    this.deviceId = deviceId;
    this.state = HfpState.DISCONNECTED;
    this.lastUpdateTime = Date.now();
    this.operationLog = [];
    this.retryCount = 0;
    this.isInitialized = true;
  }

  /**
   * 标记为连接中。
   */
  markConnecting(): void {
    hilog.info(DOMAIN, TAG, 'HfpModel markConnecting: deviceId=%{public}s', this.deviceId);
    this.state = HfpState.CONNECTING;
    this.lastUpdateTime = Date.now();
    this.connectionStartTime = Date.now();
    this.addLog('Connecting to device');
  }

  /**
   * 标记为已连接。
   */
  markConnected(): void {
    hilog.info(DOMAIN, TAG, 'HfpModel markConnected: deviceId=%{public}s', this.deviceId);
    this.state = HfpState.CONNECTED;
    this.lastUpdateTime = Date.now();
    this.connectionDuration = Date.now() - this.connectionStartTime;
    this.retryCount = 0;
    this.errorMessage = '';
    this.errorCode = 0;
    this.addLog('Connected to device');
  }

  /**
   * 标记为断开中。
   */
  markDisconnecting(): void {
    hilog.info(DOMAIN, TAG, 'HfpModel markDisconnecting: deviceId=%{public}s', this.deviceId);
    this.state = HfpState.DISCONNECTING;
    this.lastUpdateTime = Date.now();
    this.addLog('Disconnecting from device');
  }

  /**
   * 标记为已断开。
   */
  markDisconnected(): void {
    hilog.info(DOMAIN, TAG, 'HfpModel markDisconnected: deviceId=%{public}s', this.deviceId);
    this.state = HfpState.DISCONNECTED;
    this.lastUpdateTime = Date.now();
    this.connectionDuration = 0;
    this.addLog('Disconnected from device');
  }

  /**
   * 标记为错误状态。
   * @param {string} message - 错误信息
   * @param {number} code - 错误码
   */
  markError(message: string, code: number): void {
    hilog.error(DOMAIN, TAG, 'HfpModel markError: message=%{public}s, code=%{public}d', message, code);
    this.state = HfpState.ERROR;
    this.errorMessage = message;
    this.errorCode = code;
    this.lastUpdateTime = Date.now();
    this.retryCount += 1;
    this.addLog('Error: ' + message);
  }

  /**
   * 检查是否已连接。
   * @returns {boolean} 是否已连接
   */
  isConnected(): boolean {
    return this.state === HfpState.CONNECTED;
  }

  /**
   * 检查是否正在连接。
   * @returns {boolean} 是否正在连接
   */
  isConnecting(): boolean {
    return this.state === HfpState.CONNECTING;
  }

  /**
   * 检查是否可以重试。
   * @returns {boolean} 是否可以重试
   */
  canRetry(): boolean {
    return this.retryCount < this.maxRetries;
  }

  /**
   * 添加操作日志。
   * @param {string} log - 日志内容
   */
  addLog(log: string): void {
    const timestamp: string = new Date().toISOString();
    this.operationLog.push('[' + timestamp + '] ' + log);
    this.operationCount += 1;
    // 保持日志数量在合理范围内
    if (this.operationLog.length > BluetoothConstants.MAX_LOG_ENTRIES) {
      this.operationLog = this.operationLog.slice(-BluetoothConstants.MAX_LOG_ENTRIES);
    }
  }

  /**
   * 获取操作日志。
   * @returns {string[]} 日志数组
   */
  getLogs(): string[] {
    return [...this.operationLog];
  }

  /**
   * 清空操作日志。
   */
  clearLogs(): void {
    hilog.info(DOMAIN, TAG, 'HfpModel clearLogs: clearing %{public}d entries', this.operationLog.length);
    this.operationLog = [];
  }

  /**
   * 更新数据。
   * @param {HfpData} data - 新数据
   */
  updateData(data: HfpData): void {
    hilog.debug(DOMAIN, TAG, 'HfpModel updateData: updating data for device %{public}s', this.deviceId);
    this.data = data;
    this.lastUpdateTime = Date.now();
  }

  /**
   * 获取连接持续时间（毫秒）。
   * @returns {number} 连接持续时间
   */
  getConnectionDuration(): number {
    if (this.state === HfpState.CONNECTED && this.connectionStartTime > 0) {
      return Date.now() - this.connectionStartTime;
    }
    return this.connectionDuration;
  }

  /**
   * 重置模型状态。
   */
  reset(): void {
    hilog.info(DOMAIN, TAG, 'HfpModel reset: resetting model for device %{public}s', this.deviceId);
    this.state = HfpState.DISCONNECTED;
    this.data = null;
    this.lastUpdateTime = Date.now();
    this.operationLog = [];
    this.retryCount = 0;
    this.errorMessage = '';
    this.errorCode = 0;
    this.connectionDuration = 0;
    this.connectionStartTime = 0;
    this.operationCount = 0;
  }

  /**
   * 序列化为JSON。
   * @returns {object} JSON对象
   */
  toJSON(): object {
    return {
      state: this.state,
      deviceId: this.deviceId,
      lastUpdateTime: this.lastUpdateTime,
      data: this.data,
      retryCount: this.retryCount,
      errorMessage: this.errorMessage,
      errorCode: this.errorCode,
      connectionDuration: this.connectionDuration,
      operationCount: this.operationCount
    };
  }

  /**
   * 转换为可读字符串。
   * @returns {string} 字符串描述
   */
  toString(): string {
    return 'HfpModel[deviceId=' + this.deviceId + ', state=' + this.state +
      ', retryCount=' + this.retryCount + ', ops=' + this.operationCount + ']';
  }

  /**
   * 更新连接状态。
   * @param {BluetoothConnectionState} newState - 新的连接状态
   */
  updateConnectionState(newState: BluetoothConnectionState): void {
    hilog.info(DOMAIN, TAG, 'HfpModel updateConnectionState: %{public}s', String(newState));
    switch (newState) {
      case BluetoothConnectionState.CONNECTED:
        this.markConnected();
        break;
      case BluetoothConnectionState.CONNECTING:
        this.markConnecting();
        break;
      case BluetoothConnectionState.DISCONNECTING:
        this.markDisconnecting();
        break;
      case BluetoothConnectionState.DISCONNECTED:
        this.markDisconnected();
        break;
      default:
        break;
    }
  }

}
