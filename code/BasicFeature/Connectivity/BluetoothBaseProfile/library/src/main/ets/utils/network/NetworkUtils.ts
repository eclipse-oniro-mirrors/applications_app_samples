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
import { BluetoothConstants } from '../../constants/BluetoothConstants';

const TAG: string = BluetoothConstants.TAG;
const DOMAIN: number = BluetoothConstants.DOMAIN;

/**
 * network type enum
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
 * network state enum
 */
export enum NetworkState {
  CONNECTED = 'connected',
  DISCONNECTED = 'disconnected',
  CONNECTING = 'connecting',
  SUSPENDED = 'suspended'
}

/**
 * network callback interface
 */
export interface NetworkCallback {
  onAvailable(type: NetworkType): void;
  onLost(): void;
}

/**
 * network utility class
 * provides network state state check query and manage manage relative relate actual use method method
 */
export class NetworkUtils {
  /** current network type */
  private static currentType: NetworkType = NetworkType.UNKNOWN;
  /** current network state */
  private static currentState: NetworkState = NetworkState.DISCONNECTED;
  /** network callback list */
  private static callbacks: NetworkCallback[] = [];

  /**
   * get current network type
   * @returns network type
   */
  static getNetworkType(): NetworkType {
    return NetworkUtils.currentType;
  }

  /**
   * get current network state
   * @returns network state
   */
  static getNetworkState(): NetworkState {
    return NetworkUtils.currentState;
  }

  /**
   * check network whether available
   * @returns network whether available
   */
  static isNetworkAvailable(): boolean {
    return NetworkUtils.currentState === NetworkState.CONNECTED;
  }

  /**
   * check whether for WiFi network
   * @returns whether for WiFi
   */
  static isWifi(): boolean {
    return NetworkUtils.currentType === NetworkType.WIFI;
  }

  /**
   * check whether for cellular network
   * @returns whether for cellular network
   */
  static isCellular(): boolean {
    return NetworkUtils.currentType === NetworkType.CELLULAR;
  }

  /**
   * check whether for Bluetooth network
   * @returns whether for Bluetooth network
   */
  static isBluetooth(): boolean {
    return NetworkUtils.currentType === NetworkType.BLUETOOTH;
  }

  /**
   * set network type (used for simulate)
   * @param type - network type
   */
  static setNetworkType(type: NetworkType): void {
    hilog.info(DOMAIN, TAG, 'NetworkUtils setNetworkType: %{public}s', type);
    NetworkUtils.currentType = type;
  }

  /**
   * set network state (used for simulate)
   * @param state - network state
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
   * add network callback
   * @param callback - callback
   */
  static addCallback(callback: NetworkCallback): void {
    NetworkUtils.callbacks.push(callback);
  }

  /**
   * remove network callback
   * @param callback - callback
   */
  static removeCallback(callback: NetworkCallback): void {
    const index: number = NetworkUtils.callbacks.indexOf(callback);
    if (index !== -1) {
      NetworkUtils.callbacks.splice(index, 1);
    }
  }

  /**
   * notify all callbacks
   * @param state - new network state
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
   * get network type describe describe
   * @param type - network type
   * @returns description string
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
   * get network state describe describe
   * @param state - network state
   * @returns description string
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
   * reset network state
   */
  static reset(): void {
    NetworkUtils.currentType = NetworkType.UNKNOWN;
    NetworkUtils.currentState = NetworkState.DISCONNECTED;
    NetworkUtils.callbacks = [];
  }
}
