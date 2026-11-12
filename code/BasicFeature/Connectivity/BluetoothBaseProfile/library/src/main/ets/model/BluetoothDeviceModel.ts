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
import { BluetoothConstants, BluetoothConnectionState, BluetoothProfileType } from '../constants/BluetoothConstants';

const TAG: string = BluetoothConstants.TAG;
const DOMAIN: number = BluetoothConstants.DOMAIN;

/**
 * Bluetooth device type enum.
 * specify meaning Bluetooth device classification class type.
 */
export enum BluetoothDeviceType {
  /** classic Bluetooth device */
  CLASSIC = 'classic',
  /** low-energy Bluetooth device */
  BLE = 'ble',
  /** dual-mode device */
  DUAL_MODE = 'dual_mode',
  /** not yet know class type */
  UNKNOWN = 'unknown'
}

/**
 * Bluetooth device main service type enum.
 */
export enum BluetoothMajorService {
  /** audio */
  AUDIO = 'audio',
  /** electric talk */
  TELEPHONY = 'telephony',
  /** network */
  NETWORK = 'network',
  /** input device */
  INPUT = 'input',
  /** health health */
  HEALTH = 'health',
  /** info info */
  INFORMATION = 'information'
}

/**
 * Bluetooth device JSON serialization interface.
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
 * Bluetooth device data model.
 * wrap package Bluetooth device base this info info and connection state.
 */
export class BluetoothDeviceModel {
  /** device unique identifier */
  deviceId: string;
  /** device name */
  deviceName: string;
  /** MAC ground address */
  macAddress: string;
  /** device type */
  deviceType: BluetoothDeviceType;
  /** connection state */
  connectionState: BluetoothConnectionState;
  /** main service class type */
  majorServices: BluetoothMajorService[];
  /** supported profile list */
  supportedProfiles: BluetoothProfileType[];
  /** signal strength */
  rssi: number;
  /** pairing state state */
  bondState: number;
  /** last connection time */
  lastConnectedTime: number;
  /** connection count statistics */
  connectionCount: number;
  /** signal strength percentage */
  signalStrength: number;
  /** device class */
  deviceClass: number;

  /**
   * create Bluetooth device model type instance.
   * @param {string} deviceId - device ID
   * @param {string} deviceName - device name
   * @param {string} macAddress - MAC ground address
   * @param {BluetoothDeviceType} deviceType - device type
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
   * update connection state.
   * @param {BluetoothConnectionState} state - new connection state
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
   * check device whether connected.
   * @returns {boolean} whether connected
   */
  isConnected(): boolean {
    return this.connectionState === BluetoothConnectionState.CONNECTED;
  }

  /**
   * check device whether already pairing.
   * @returns {boolean} whether already pairing
   */
  isBonded(): boolean {
    return this.bondState === 12;
  }

  /**
   * check device whether support hold specified Profile.
   * @param {BluetoothProfileType} profile - want check Profile class type
   * @returns {boolean} whether support hold
   */
  supportsProfile(profile: BluetoothProfileType): boolean {
    return this.supportedProfiles.indexOf(profile) !== -1;
  }

  /**
   * add support hold Profile.
   * @param {BluetoothProfileType} profile - want add Profile
   */
  addSupportedProfile(profile: BluetoothProfileType): void {
    if (!this.supportsProfile(profile)) {
      this.supportedProfiles.push(profile);
      hilog.debug(DOMAIN, TAG, 'BluetoothDeviceModel addSupportedProfile: added %{public}s', profile);
    }
  }

  /**
   * add main service class type.
   * @param {BluetoothMajorService} service - want add service class type
   */
  addMajorService(service: BluetoothMajorService): void {
    if (this.majorServices.indexOf(service) === -1) {
      this.majorServices.push(service);
    }
  }

  /**
   * update signal strength.
   * @param {number} rssi - RSSI value
   */
  updateRssi(rssi: number): void {
    this.rssi = rssi;
    // will RSSI convert for 0-100 signal strength percentage
    // RSSI range range through constant for -100 to -30dBm
    if (rssi <= -100) {
      this.signalStrength = 0;
    } else if (rssi >= -30) {
      this.signalStrength = 100;
    } else {
      this.signalStrength = Math.round((rssi + 100) * (100 / 70));
    }
  }

  /**
   * get signal strength level describe describe.
   * @returns {string} signal strength level
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
   * get device type describe describe.
   * @returns {string} device type describe describe
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
   * get connection state state describe describe.
   * @returns {string} connection state describe describe
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
   * serialize to JSON compatible content against object.
   * @returns {BluetoothDeviceJson} JSON table display
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
   * convert to readable string.
   * @returns {string} string description
   */
  toString(): string {
    return 'BluetoothDeviceModel[id=' + this.deviceId + ', name=' + this.deviceName +
      ', mac=' + this.macAddress + ', type=' + this.deviceType + ', state=' + this.connectionState + ']';
  }

  /**
   * reset device status.
   */
  reset(): void {
    this.connectionState = BluetoothConnectionState.DISCONNECTED;
    this.rssi = 0;
    this.signalStrength = 0;
    this.lastConnectedTime = 0;
  }
}
