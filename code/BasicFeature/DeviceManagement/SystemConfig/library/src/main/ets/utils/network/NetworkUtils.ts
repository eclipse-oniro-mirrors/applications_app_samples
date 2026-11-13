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
import { SystemConfigConstants } from '../../constants/SystemConfigConstants';
import { ResourceHelper } from '../basic/ResourceHelper';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

// ========================================
// Network type enum
// ========================================

/**
 * Network type enum.
 * Defines the various network access methods a device can connect to.
 */
export enum NetworkType {
  /** Wi-Fi wireless network */
  WIFI = 'wifi',
  /** Cellular mobile network */
  CELLULAR = 'cellular',
  /** Ethernet wired network */
  ETHERNET = 'ethernet',
  /** Bluetooth network */
  BLUETOOTH = 'bluetooth',
  /** Unknown network type */
  UNKNOWN = 'unknown'
}

// ========================================
// Network state enum
// ========================================

/**
 * Network state enum.
 * Describes the real-time state of the current network connection.
 */
export enum NetworkState {
  /** Connected, network available */
  CONNECTED = 'connected',
  /** Disconnected, network unavailable */
  DISCONNECTED = 'disconnected',
  /** Connecting */
  CONNECTING = 'connecting',
  /** Network suspended */
  SUSPENDED = 'suspended'
}

// ========================================
// Network callback interface
// ========================================

/**
 * Network state change callback interface.
 * Triggered when the network state or network type changes.
 */
export interface NetworkCallback {
  /**
   * Network state change callback.
   * @param {NetworkState} newState - New network state
   */
  onStateChange(newState: NetworkState): void;

  /**
   * Network type change callback.
   * @param {NetworkType} newType - New network type
   */
  onTypeChange(newType: NetworkType): void;
}

// ========================================
// Signal level threshold constants
// ========================================

/** RSSI thresholds (dBm) corresponding to signal levels */
const SIGNAL_LEVEL_EXCELLENT: number = -50;
const SIGNAL_LEVEL_GOOD: number = -60;
const SIGNAL_LEVEL_FAIR: number = -70;
const SIGNAL_LEVEL_POOR: number = -80;

// ========================================
// Network utility class
// ========================================

/**
 * Network state utility class.
 * Provides static methods for type/state labels, connection checking,
 * bandwidth evaluation, signal level calculation and latency estimation.
 */
export class NetworkUtils {
  /** High-bandwidth network type list */
  private static readonly HIGH_BANDWIDTH_TYPES: NetworkType[] = [
    NetworkType.WIFI,
    NetworkType.ETHERNET
  ];

  /** Estimated latency per network type (milliseconds) */
  private static readonly LATENCY_MAP: Map<NetworkType, number> = new Map<NetworkType, number>([
    [NetworkType.WIFI, 20],
    [NetworkType.ETHERNET, 5],
    [NetworkType.CELLULAR, 100],
    [NetworkType.BLUETOOTH, 150],
    [NetworkType.UNKNOWN, 200]
  ]);

  // ========================================
  // Label getter methods
  // ========================================

  /**
   * Gets the localized label of a network type.
   * @param {NetworkType} type - Network type enum value
   * @returns {string} Localized network type description
   */
  static getNetworkTypeLabel(type: NetworkType): string {
    hilog.debug(DOMAIN, TAG, 'NetworkUtils getNetworkTypeLabel: type=%{public}s', type);
    switch (type) {
      case NetworkType.WIFI:
        return 'Wi-Fi';
      case NetworkType.CELLULAR:
        return ResourceHelper.getStringByName('net_type_cellular');
      case NetworkType.ETHERNET:
        return ResourceHelper.getStringByName('net_type_ethernet');
      case NetworkType.BLUETOOTH:
        return ResourceHelper.getStringByName('net_type_bluetooth');
      case NetworkType.UNKNOWN:
        return ResourceHelper.getStringByName('net_type_unknown');
      default:
        return ResourceHelper.getStringByName('net_type_none');
    }
  }

  /**
   * Gets the localized label of a network state.
   * @param {NetworkState} state - Network state enum value
   * @returns {string} Localized network state description
   */
  static getNetworkStateLabel(state: NetworkState): string {
    hilog.debug(DOMAIN, TAG, 'NetworkUtils getNetworkStateLabel: state=%{public}s', state);
    switch (state) {
      case NetworkState.CONNECTED:
        return ResourceHelper.getStringByName('net_state_connected');
      case NetworkState.DISCONNECTED:
        return ResourceHelper.getStringByName('net_state_disconnected');
      case NetworkState.CONNECTING:
        return ResourceHelper.getStringByName('net_state_connecting');
      case NetworkState.SUSPENDED:
        return ResourceHelper.getStringByName('net_state_suspended');
      default:
        return ResourceHelper.getStringByName('net_state_unknown');
    }
  }

  // ========================================
  // State checking methods
  // ========================================

  /**
   * Checks whether the current network state is connected.
   * @param {NetworkState} state - Network state
   * @returns {boolean} Whether connected
   */
  static isConnected(state: NetworkState): boolean {
    const result: boolean = state === NetworkState.CONNECTED;
    hilog.debug(DOMAIN, TAG, 'NetworkUtils isConnected: state=%{public}s, result=%{public}s',
      state, result.toString());
    return result;
  }

  /**
   * Checks whether the current network state is available (connected and not suspended).
   * @param {NetworkState} state - Network state
   * @returns {boolean} Whether the network is available
   */
  static isAvailable(state: NetworkState): boolean {
    const result: boolean = state === NetworkState.CONNECTED || state === NetworkState.CONNECTING;
    hilog.debug(DOMAIN, TAG, 'NetworkUtils isAvailable: state=%{public}s, result=%{public}s',
      state, result.toString());
    return result;
  }

  /**
   * Checks whether the given network type is a high-bandwidth network.
   * Wi-Fi and Ethernet are treated as high-bandwidth networks.
   * @param {NetworkType} type - Network type
   * @returns {boolean} Whether it is a high-bandwidth network
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
  // Signal and latency estimation methods
  // ========================================

  /**
   * Calculates the signal level from an RSSI value.
   * Signal level ranges from 0 to 4, larger values mean stronger signal.
   * @param {number} rssi - Received Signal Strength Indicator (dBm), typical range -30 to -100
   * @returns {number} Signal level, 0 means no signal, 4 means excellent signal
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
   * Estimates latency from the network type.
   * Returns the estimated round-trip latency (milliseconds) in typical scenarios.
   * @param {NetworkType} type - Network type
   * @returns {number} Estimated latency (milliseconds)
   */
  static estimateLatency(type: NetworkType): number {
    const latency: number = NetworkUtils.LATENCY_MAP.get(type) ?? 200;
    hilog.debug(DOMAIN, TAG, 'NetworkUtils estimateLatency: type=%{public}s, latency=%{public}dms', type, latency);
    return latency;
  }

  // ========================================
  // Network info description methods
  // ========================================

  /**
   * Gets the bandwidth description of a network type.
   * @param {NetworkType} type - Network type
   * @returns {string} Bandwidth description text
   */
  static getBandwidthDescription(type: NetworkType): string {
    switch (type) {
      case NetworkType.ETHERNET:
        return ResourceHelper.getStringByName('net_bw_gigabit');
      case NetworkType.WIFI:
        return ResourceHelper.getStringByName('net_bw_megabit');
      case NetworkType.CELLULAR:
        return ResourceHelper.getStringByName('net_bw_mobile');
      case NetworkType.BLUETOOTH:
        return ResourceHelper.getStringByName('net_bw_low_power');
      default:
        return ResourceHelper.getStringByName('net_bw_unknown');
    }
  }
}
