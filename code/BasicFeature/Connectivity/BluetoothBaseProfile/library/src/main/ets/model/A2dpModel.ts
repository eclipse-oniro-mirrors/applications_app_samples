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
import { BluetoothConstants, BluetoothConnectionState } from '../constants/BluetoothConstants';

const TAG: string = BluetoothConstants.TAG;
const DOMAIN: number = BluetoothConstants.DOMAIN;

/**
 * JSON representation of A2dpModel.
 */
export interface A2dpJson {
  state: string;
  deviceId: string;
  lastUpdateTime: number;
  isPlaying: boolean;
  volume: number;
  codec: number;
  bitRate: number;
  playbackPosition: number;
}

/**
 * A2DP audio divide send connection state enum.
 */
export enum A2dpState {
  /** disconnected */
  DISCONNECTED = 'disconnected',
  /** connecting */
  CONNECTING = 'connecting',
  /** connected */
  CONNECTED = 'connected',
  /** disconnecting */
  DISCONNECTING = 'disconnecting',
  /** error state */
  ERROR = 'error'
}

/**
 * A2DP audio divide send data interface.
 */
export interface A2dpData {
  /** audio codec */
  codec: string;
  /** collect sample rate */
  sampleRate: number;
  /** compare special rate */
  bitRate: number;
  /** volume level (0-100) */
  volume: number;
  /** whether playing */
  isPlaying: boolean;
  /** playback progress (ms) */
  playbackPosition: number;
  /** total time length (ms) */
  totalDuration: number;
  /** audio source name */
  audioSourceName: string;
  /** audio source type */
  audioSourceType: string;
}

/**
 * A2DP audio divide send number data model type.
 * wrap package A2dpProfile number data and state state info info.
 */
export class A2dpModel {
  /** current connection state */
  state: A2dpState = A2dpState.DISCONNECTED;
  /** relate link device ID */
  deviceId: string = '';
  /** last update timestamp */
  lastUpdateTime: number = 0;
  /** number data internal content */
  data: A2dpData | null = null;
  /** operation log */
  operationLog: string[] = [];
  /** weight try times number */
  retryCount: number = 0;
  /** max weight try times number */
  maxRetries: number = BluetoothConstants.MAX_RETRY_COUNT;
  /** timeout (ms) */
  timeoutMs: number = BluetoothConstants.OPERATION_TIMEOUT_MS;
  /** whether already initialize */
  isInitialized: boolean = false;
  /** error info info */
  errorMessage: string = '';
  /** error code */
  errorCode: number = 0;
  /** connection duration (ms) */
  connectionDuration: number = 0;
  /** connection start time */
  connectionStartTime: number = 0;
  /** operation count */
  operationCount: number = 0;
  /** whether playing */
  isPlaying: boolean = false;
  /** volume level (0-100) */
  volume: number = 50;
  /** audio codec ID */
  codec: number = 0;
  /** compare special rate */
  bitRate: number = 0;
  /** playback position (ms) */
  playbackPosition: number = 0;

  /**
   * structure build function number.
   * @param {string} deviceId - device ID
   */
  constructor(deviceId: string = '') {
    hilog.info(DOMAIN, TAG, 'A2dpModel constructor: deviceId=%{public}s', deviceId);
    this.deviceId = deviceId;
    this.state = A2dpState.DISCONNECTED;
    this.lastUpdateTime = Date.now();
    this.operationLog = [];
    this.retryCount = 0;
    this.isInitialized = true;
  }

  /**
   * mark for connecting.
   */
  markConnecting(): void {
    hilog.info(DOMAIN, TAG, 'A2dpModel markConnecting: deviceId=%{public}s', this.deviceId);
    this.state = A2dpState.CONNECTING;
    this.lastUpdateTime = Date.now();
    this.connectionStartTime = Date.now();
    this.addLog('Connecting to device');
  }

  /**
   * mark for connected.
   */
  markConnected(): void {
    hilog.info(DOMAIN, TAG, 'A2dpModel markConnected: deviceId=%{public}s', this.deviceId);
    this.state = A2dpState.CONNECTED;
    this.lastUpdateTime = Date.now();
    this.connectionDuration = Date.now() - this.connectionStartTime;
    this.retryCount = 0;
    this.errorMessage = '';
    this.errorCode = 0;
    this.addLog('Connected to device');
  }

  /**
   * mark for disconnecting.
   */
  markDisconnecting(): void {
    hilog.info(DOMAIN, TAG, 'A2dpModel markDisconnecting: deviceId=%{public}s', this.deviceId);
    this.state = A2dpState.DISCONNECTING;
    this.lastUpdateTime = Date.now();
    this.addLog('Disconnecting from device');
  }

  /**
   * mark for disconnected.
   */
  markDisconnected(): void {
    hilog.info(DOMAIN, TAG, 'A2dpModel markDisconnected: deviceId=%{public}s', this.deviceId);
    this.state = A2dpState.DISCONNECTED;
    this.lastUpdateTime = Date.now();
    this.connectionDuration = 0;
    this.addLog('Disconnected from device');
  }

  /**
   * mark for error state.
   * @param {string} message - error info info
   * @param {number} code - error code
   */
  markError(message: string, code: number): void {
    hilog.error(DOMAIN, TAG, 'A2dpModel markError: message=%{public}s, code=%{public}d', message, code);
    this.state = A2dpState.ERROR;
    this.errorMessage = message;
    this.errorCode = code;
    this.lastUpdateTime = Date.now();
    this.retryCount += 1;
    this.addLog('Error: ' + message);
  }

  /**
   * check whether connected.
   * @returns {boolean} whether connected
   */
  isConnected(): boolean {
    return this.state === A2dpState.CONNECTED;
  }

  /**
   * check whether connecting.
   * @returns {boolean} whether connecting
   */
  isConnecting(): boolean {
    return this.state === A2dpState.CONNECTING;
  }

  /**
   * check whether can weight try.
   * @returns {boolean} whether can weight try
   */
  canRetry(): boolean {
    return this.retryCount < this.maxRetries;
  }

  /**
   * add operation log.
   * @param {string} log - day log internal content
   */
  addLog(log: string): void {
    const timestamp: string = new Date().toISOString();
    this.operationLog.push('[' + timestamp + '] ' + log);
    this.operationCount += 1;
    // keep hold log count at combine manage range range internal
    if (this.operationLog.length > BluetoothConstants.MAX_LOG_ENTRIES) {
      this.operationLog = this.operationLog.slice(-BluetoothConstants.MAX_LOG_ENTRIES);
    }
  }

  /**
   * get operation log.
   * @returns {string[]} log array
   */
  getLogs(): string[] {
    return [...this.operationLog];
  }

  /**
   * clear operation log.
   */
  clearLogs(): void {
    hilog.info(DOMAIN, TAG, 'A2dpModel clearLogs: clearing %{public}d entries', this.operationLog.length);
    this.operationLog = [];
  }

  /**
   * update number data.
   * @param {A2dpData} data - new number data
   */
  updateData(data: A2dpData): void {
    hilog.debug(DOMAIN, TAG, 'A2dpModel updateData: updating data for device %{public}s', this.deviceId);
    this.data = data;
    this.lastUpdateTime = Date.now();
  }

  /**
   * get connection hold continue time interval (ms).
   * @returns {number} connection duration
   */
  getConnectionDuration(): number {
    if (this.state === A2dpState.CONNECTED && this.connectionStartTime > 0) {
      return Date.now() - this.connectionStartTime;
    }
    return this.connectionDuration;
  }

  /**
   * reset model type state state.
   */
  reset(): void {
    hilog.info(DOMAIN, TAG, 'A2dpModel reset: resetting model for device %{public}s', this.deviceId);
    this.state = A2dpState.DISCONNECTED;
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
   * serialize to JSON.
   * @returns {object} JSON against object
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
   * convert to readable string.
   * @returns {string} string description
   */
  toString(): string {
    return 'A2dpModel[deviceId=' + this.deviceId + ', state=' + this.state +
      ', retryCount=' + this.retryCount + ', ops=' + this.operationCount + ']';
  }

  /**
   * update connection state.
   * @param {BluetoothConnectionState} newState - new connection state
   */
  updateConnectionState(newState: BluetoothConnectionState): void {
    hilog.info(DOMAIN, TAG, 'A2dpModel updateConnectionState: %{public}s', String(newState));
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
