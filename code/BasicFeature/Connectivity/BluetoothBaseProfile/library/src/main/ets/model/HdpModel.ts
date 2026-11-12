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
 * JSON representation of HdpModel.
 */
export interface HdpJson {
  state: string;
  deviceId: string;
  lastUpdateTime: number;
}

/**
 * HDP health device connection state enum.
 */
export enum HdpState {
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
 * HDP health device data interface.
 */
export interface HdpData {
  /** device type */
  healthDeviceType: string;
  /** number data class type */
  dataType: string;
  /** test amount value */
  measurementValue: number;
  /** test amount unit */
  measurementUnit: string;
  /** test amount time interval */
  measurementTime: number;
  /** whether is test amount */
  isMeasuring: boolean;
  /** history number data number amount */
  historyCount: number;
  /** number data precision degree */
  accuracy: number;
  /** device status */
  deviceStatus: string;
}

/**
 * HDP health device number data model type.
 * wrap package HdpProfile number data and state state info info.
 */
export class HdpModel {
  /** current connection state */
  state: HdpState = HdpState.DISCONNECTED;
  /** relate link device ID */
  deviceId: string = '';
  /** last update timestamp */
  lastUpdateTime: number = 0;
  /** number data internal content */
  data: HdpData | null = null;
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
  /** Measurement accuracy */
  accuracy: number = 0;
  /** Data type */
  dataType: string = '';
  /** Device status */
  deviceStatus: string = 'idle';
  /** Health device type */
  healthDeviceType: string = '';
  /** History count */
  historyCount: number = 0;
  /** Is measuring */
  isMeasuring: boolean = false;
  /** Measurement time */
  measurementTime: number = 0;
  /** Measurement unit */
  measurementUnit: string = '';
  /** Measurement value */
  measurementValue: number = 0;

  /**
   * structure build function number.
   * @param {string} deviceId - device ID
   */
  constructor(deviceId: string = '') {
    hilog.info(DOMAIN, TAG, 'HdpModel constructor: deviceId=%{public}s', deviceId);
    this.deviceId = deviceId;
    this.state = HdpState.DISCONNECTED;
    this.lastUpdateTime = Date.now();
    this.operationLog = [];
    this.retryCount = 0;
    this.isInitialized = true;
  }

  /**
   * mark for connecting.
   */
  markConnecting(): void {
    hilog.info(DOMAIN, TAG, 'HdpModel markConnecting: deviceId=%{public}s', this.deviceId);
    this.state = HdpState.CONNECTING;
    this.lastUpdateTime = Date.now();
    this.connectionStartTime = Date.now();
    this.addLog('Connecting to device');
  }

  /**
   * mark for connected.
   */
  markConnected(): void {
    hilog.info(DOMAIN, TAG, 'HdpModel markConnected: deviceId=%{public}s', this.deviceId);
    this.state = HdpState.CONNECTED;
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
    hilog.info(DOMAIN, TAG, 'HdpModel markDisconnecting: deviceId=%{public}s', this.deviceId);
    this.state = HdpState.DISCONNECTING;
    this.lastUpdateTime = Date.now();
    this.addLog('Disconnecting from device');
  }

  /**
   * mark for disconnected.
   */
  markDisconnected(): void {
    hilog.info(DOMAIN, TAG, 'HdpModel markDisconnected: deviceId=%{public}s', this.deviceId);
    this.state = HdpState.DISCONNECTED;
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
    hilog.error(DOMAIN, TAG, 'HdpModel markError: message=%{public}s, code=%{public}d', message, code);
    this.state = HdpState.ERROR;
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
    return this.state === HdpState.CONNECTED;
  }

  /**
   * check whether connecting.
   * @returns {boolean} whether connecting
   */
  isConnecting(): boolean {
    return this.state === HdpState.CONNECTING;
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
    hilog.info(DOMAIN, TAG, 'HdpModel clearLogs: clearing %{public}d entries', this.operationLog.length);
    this.operationLog = [];
  }

  /**
   * update number data.
   * @param {HdpData} data - new number data
   */
  updateData(data: HdpData): void {
    hilog.debug(DOMAIN, TAG, 'HdpModel updateData: updating data for device %{public}s', this.deviceId);
    this.data = data;
    this.lastUpdateTime = Date.now();
  }

  /**
   * get connection hold continue time interval (ms).
   * @returns {number} connection duration
   */
  getConnectionDuration(): number {
    if (this.state === HdpState.CONNECTED && this.connectionStartTime > 0) {
      return Date.now() - this.connectionStartTime;
    }
    return this.connectionDuration;
  }

  /**
   * reset model type state state.
   */
  reset(): void {
    hilog.info(DOMAIN, TAG, 'HdpModel reset: resetting model for device %{public}s', this.deviceId);
    this.state = HdpState.DISCONNECTED;
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
    return 'HdpModel[deviceId=' + this.deviceId + ', state=' + this.state +
      ', retryCount=' + this.retryCount + ', ops=' + this.operationCount + ']';
  }

  /**
   * Update connection state.
   */
  updateConnectionState(newState: BluetoothConnectionState): void {
    hilog.info(DOMAIN, TAG, 'HdpModel updateConnectionState: %{public}s', String(newState));
    this.lastUpdateTime = Date.now();
  }

}
