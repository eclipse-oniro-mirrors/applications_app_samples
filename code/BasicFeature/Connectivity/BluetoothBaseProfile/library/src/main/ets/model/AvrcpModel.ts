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
/** * JSON representation of AvrcpModel. */export interface AvrcpJson {  state: string;  deviceId: string;  lastUpdateTime: number;}

/**
 * AVRCP音视频遥控连接状态枚举。
 */
export enum AvrcpState {
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
 * AVRCP音视频遥控数据接口。
 */
export interface AvrcpData {
  /** 播放状态 */
  playbackState: string;
  /** 当前曲目名称 */
  trackName: string;
  /** 艺术家名称 */
  artistName: string;
  /** 专辑名称 */
  albumName: string;
  /** 播放位置（毫秒） */
  position: number;
  /** 总时长（毫秒） */
  duration: number;
  /** 音量 (0-127) */
  volume: number;
  /** 播放列表数量 */
  playlistCount: number;
  /** 当前播放列表索引 */
  currentTrackIndex: number;
}

/**
 * AVRCP音视频遥控数据模型。
 * 封装AvrcpProfile的数据和状态信息。
 */
export class AvrcpModel {
  /** 当前连接状态 */
  state: AvrcpState = AvrcpState.DISCONNECTED;
  /** 关联的设备ID */
  deviceId: string = '';
  /** 最后更新时间戳 */
  lastUpdateTime: number = 0;
  /** 数据内容 */
  data: AvrcpData | null = null;
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
  /** Album name */
  albumName: string = '';
  /** Artist name */
  artistName: string = '';
  /** Current track index */
  currentTrackIndex: number = 0;
  /** Track duration */
  duration: number = 0;
  /** Playback state */
  playbackState: string = 'stopped';
  /** Playlist count */
  playlistCount: number = 0;
  /** Playback position */
  position: number = 0;
  /** Track name */
  trackName: string = '';
  /** Volume level */
  volume: number = 50;

  /**
   * 构造函数。
   * @param {string} deviceId - 设备ID
   */
  constructor(deviceId: string = '') {
    hilog.info(DOMAIN, TAG, 'AvrcpModel constructor: deviceId=%{public}s', deviceId);
    this.deviceId = deviceId;
    this.state = AvrcpState.DISCONNECTED;
    this.lastUpdateTime = Date.now();
    this.operationLog = [];
    this.retryCount = 0;
    this.isInitialized = true;
  }

  /**
   * 标记为连接中。
   */
  markConnecting(): void {
    hilog.info(DOMAIN, TAG, 'AvrcpModel markConnecting: deviceId=%{public}s', this.deviceId);
    this.state = AvrcpState.CONNECTING;
    this.lastUpdateTime = Date.now();
    this.connectionStartTime = Date.now();
    this.addLog('Connecting to device');
  }

  /**
   * 标记为已连接。
   */
  markConnected(): void {
    hilog.info(DOMAIN, TAG, 'AvrcpModel markConnected: deviceId=%{public}s', this.deviceId);
    this.state = AvrcpState.CONNECTED;
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
    hilog.info(DOMAIN, TAG, 'AvrcpModel markDisconnecting: deviceId=%{public}s', this.deviceId);
    this.state = AvrcpState.DISCONNECTING;
    this.lastUpdateTime = Date.now();
    this.addLog('Disconnecting from device');
  }

  /**
   * 标记为已断开。
   */
  markDisconnected(): void {
    hilog.info(DOMAIN, TAG, 'AvrcpModel markDisconnected: deviceId=%{public}s', this.deviceId);
    this.state = AvrcpState.DISCONNECTED;
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
    hilog.error(DOMAIN, TAG, 'AvrcpModel markError: message=%{public}s, code=%{public}d', message, code);
    this.state = AvrcpState.ERROR;
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
    return this.state === AvrcpState.CONNECTED;
  }

  /**
   * 检查是否正在连接。
   * @returns {boolean} 是否正在连接
   */
  isConnecting(): boolean {
    return this.state === AvrcpState.CONNECTING;
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
    hilog.info(DOMAIN, TAG, 'AvrcpModel clearLogs: clearing %{public}d entries', this.operationLog.length);
    this.operationLog = [];
  }

  /**
   * 更新数据。
   * @param {AvrcpData} data - 新数据
   */
  updateData(data: AvrcpData): void {
    hilog.debug(DOMAIN, TAG, 'AvrcpModel updateData: updating data for device %{public}s', this.deviceId);
    this.data = data;
    this.lastUpdateTime = Date.now();
  }

  /**
   * 获取连接持续时间（毫秒）。
   * @returns {number} 连接持续时间
   */
  getConnectionDuration(): number {
    if (this.state === AvrcpState.CONNECTED && this.connectionStartTime > 0) {
      return Date.now() - this.connectionStartTime;
    }
    return this.connectionDuration;
  }

  /**
   * 重置模型状态。
   */
  reset(): void {
    hilog.info(DOMAIN, TAG, 'AvrcpModel reset: resetting model for device %{public}s', this.deviceId);
    this.state = AvrcpState.DISCONNECTED;
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
    return 'AvrcpModel[deviceId=' + this.deviceId + ', state=' + this.state +
      ', retryCount=' + this.retryCount + ', ops=' + this.operationCount + ']';
  }

  /**
   * Update connection state.
   */
  updateConnectionState(newState: BluetoothConnectionState): void {
    hilog.info(DOMAIN, TAG, 'AvrcpModel updateConnectionState: %{public}s', String(newState));
    this.lastUpdateTime = Date.now();
  }

}
