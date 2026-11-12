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

import { BluetoothConstants, BluetoothConnectionState, BluetoothProfileType } from '../constants/BluetoothConstants';

/**
 * connection record interface
 */
export interface MockConnectionRecord {
  deviceId: string;
  deviceName: string;
  profile: BluetoothProfileType;
  state: BluetoothConnectionState;
  connectTime: number;
  disconnectTime: number;
  duration: number;
  rssi: number;
}

/**
 * connection mock data.
 * provides mock connection record data.
 */
export class ConnectionMockData {
  /**
   * generate mock connection record.
   * @param {number} count - record number amount
   * @returns {MockConnectionRecord[]} connection record list table
   */
  static generateRecords(count: number = 30): MockConnectionRecord[] {
    const records: MockConnectionRecord[] = [];
    const deviceNames: string[] = [
      'JBL Flip 6', 'Sony WH-1000XM5', 'Logitech K380', 'Microsoft Arc Mouse',
      'Demo Health Watch', 'Samsung Galaxy S24', 'BMW Car Audio', 'AirPods Pro 2'
    ];
    const profiles: BluetoothProfileType[] = [
      BluetoothProfileType.A2DP, BluetoothProfileType.HFP, BluetoothProfileType.HID,
      BluetoothProfileType.PAN, BluetoothProfileType.PBAP, BluetoothProfileType.MAP,
      BluetoothProfileType.AVRCP, BluetoothProfileType.HDP
    ];
    const states: BluetoothConnectionState[] = [
      BluetoothConnectionState.CONNECTED, BluetoothConnectionState.DISCONNECTED,
      BluetoothConnectionState.CONNECTION_FAILED
    ];

    for (let i: number = 0; i < count; i++) {
      const connectTime: number = Date.now() - (count - i) * 300000;
      const state: BluetoothConnectionState = states[Math.floor(Math.random() * states.length)];
      const duration: number = state === BluetoothConnectionState.DISCONNECTED ?
        Math.floor(Math.random() * 3600000) : 0;
      records.push({
        deviceId: 'dev_' + i + '_' + Math.random().toString(36).substring(2, 8),
        deviceName: deviceNames[Math.floor(Math.random() * deviceNames.length)],
        profile: profiles[Math.floor(Math.random() * profiles.length)],
        state: state,
        connectTime: connectTime,
        disconnectTime: state !== BluetoothConnectionState.CONNECTED ? connectTime + duration : 0,
        duration: duration,
        rssi: -30 - Math.floor(Math.random() * 70)
      });
    }
    return records;
  }

  /**
   * get current active connection.
   * @returns {MockConnectionRecord[]} active connection list table
   */
  static getActiveConnections(): MockConnectionRecord[] {
    const active: MockConnectionRecord[] = [];
    active.push({
      deviceId: 'active_001', deviceName: 'Sony WH-1000XM5',
      profile: BluetoothProfileType.A2DP, state: BluetoothConnectionState.CONNECTED,
      connectTime: Date.now() - 1800000, disconnectTime: 0, duration: 1800000, rssi: -42
    });
    active.push({
      deviceId: 'active_002', deviceName: 'Logitech K380',
      profile: BluetoothProfileType.HID, state: BluetoothConnectionState.CONNECTED,
      connectTime: Date.now() - 3600000, disconnectTime: 0, duration: 3600000, rssi: -50
    });
    active.push({
      deviceId: 'active_003', deviceName: 'Samsung Galaxy S24',
      profile: BluetoothProfileType.PBAP, state: BluetoothConnectionState.CONNECTED,
      connectTime: Date.now() - 900000, disconnectTime: 0, duration: 900000, rssi: -35
    });
    return active;
  }

  /**
   * generate connection log.
   * @param {number} count - log count
   * @returns {string[]} log list
   */
  static generateLogs(count: number = 50): string[] {
    const logs: string[] = [];
    const actions: string[] = [
      'SCAN_START', 'DEVICE_FOUND', 'SCAN_COMPLETE',
      'PAIR_REQUEST', 'PAIR_SUCCESS', 'PAIR_FAILED',
      'CONNECT_REQUEST', 'CONNECT_SUCCESS', 'CONNECT_FAILED',
      'DISCONNECT', 'RECONNECT', 'PROFILE_ACTIVATED',
      'PROFILE_DEACTIVATED', 'ERROR', 'TIMEOUT'
    ];
    for (let i: number = 0; i < count; i++) {
      const time: string = new Date(Date.now() - (count - i) * 30000).toISOString();
      const action: string = actions[Math.floor(Math.random() * actions.length)];
      const device: string = 'Device-' + (1000 + Math.floor(Math.random() * 9000));
      logs.push('[' + time + '] [' + action + '] ' + device);
    }
    return logs;
  }
}
