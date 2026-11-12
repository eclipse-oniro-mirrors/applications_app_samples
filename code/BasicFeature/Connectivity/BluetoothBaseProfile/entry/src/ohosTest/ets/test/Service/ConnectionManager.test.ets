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

import { describe, it, expect } from '@ohos/hypium';
import {
  BluetoothConnectionManager,
  BluetoothConnectionState,
  BluetoothDeviceModel,
  BluetoothDeviceType,
  BluetoothProfileType
} from 'library';

const TEST_MAC: string = '11:22:33:44:55:FF';
const MAX_CONNECTED_DEVICES: number = 7;

/**
 * structure build test try use Bluetooth device.
 * @param {string} deviceId - device ID
 * @param {number} rssi - signal strength
 * @returns {BluetoothDeviceModel} device model
 */
function createDevice(deviceId: string, rssi: number): BluetoothDeviceModel {
  const device: BluetoothDeviceModel = new BluetoothDeviceModel(deviceId, `Device ${deviceId}`,
    TEST_MAC, BluetoothDeviceType.CLASSIC);
  device.updateRssi(rssi);
  return device;
}

/**
 * safe package controlled random number sequence, return restore function number.
 * connectDevice first consume one times random number calculate connection delay late, again consume one times
 * determine whether simulate failed,
 * cause this sequence first value for delay factor, times value for failure decision value.
 * @param {number[]} values - random number sequence, exhaust after reuse last one value
 * @returns {Function} restore original Math.random function number
 */
function installRandomSequence(values: number[]): () => void {
  const mathObject: ESObject = Math;
  const original: ESObject = mathObject.random;
  let cursor: number = 0;
  mathObject.random = (): number => {
    const index: number = cursor < values.length ? cursor : values.length - 1;
    cursor += 1;
    return values[index];
  };
  return (): void => {
    mathObject.random = original;
  };
}

/**
 * Connection Manager tests
 */
export default function connectionManagerTest(): void {
  describe('ConnectionManagerTest', () => {
    /*
     * @tc.number: SUB_CONN_MGR_0100
     * @tc.name: testConnMgr0001
     * @tc.desc: Verify initial state and that initialize resets all connection data.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testConnMgr0001', 0, () => {
      const manager = new BluetoothConnectionManager();
      expect(manager.isManagerInitialized()).assertFalse();
      expect(manager.getConnectedCount()).assertEqual(0);
      expect(manager.getConnectionRecords().length).assertEqual(0);

      expect(manager.initialize()).assertTrue();
      expect(manager.isManagerInitialized()).assertTrue();

      const stats = manager.getStatistics();
      expect(stats.totalConnections).assertEqual(0);
      expect(stats.currentConnectedCount).assertEqual(0);
      expect(stats.shortestDuration).assertEqual(0);
      expect(stats.successRate).assertEqual(0);
      expect(stats.totalUniqueDevices).assertEqual(0);
    });

    /*
     * @tc.number: SUB_CONN_MGR_0200
     * @tc.name: testConnMgr0002
     * @tc.desc: Verify that connect and disconnect are rejected before initialization.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testConnMgr0002', 0, async () => {
      const manager = new BluetoothConnectionManager();
      const device = createDevice('dev_uninitialized', -50);

      expect(await manager.connectDevice(device, BluetoothProfileType.HID)).assertFalse();
      expect(manager.getConnectedCount()).assertEqual(0);
      expect(manager.getConnectionRecords().length).assertEqual(0);
      expect(device.connectionState).assertEqual(BluetoothConnectionState.DISCONNECTED);

      expect(await manager.disconnectDevice(device.deviceId, BluetoothProfileType.HID)).assertFalse();
      expect(manager.isDeviceConnected(device.deviceId)).assertFalse();
      expect(manager.getStatistics().totalFailures).assertEqual(0);
    });

    /*
     * @tc.number: SUB_CONN_MGR_0300
     * @tc.name: testConnMgr0003
     * @tc.desc: Verify a successful connection updates device, records and profile lookup.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testConnMgr0003', 0, async () => {
      const manager = new BluetoothConnectionManager();
      expect(manager.initialize()).assertTrue();
      const device = createDevice('dev_connect_ok', -55);

      const restore = installRandomSequence([0, 0.5]);
      let connected: boolean = false;
      try {
        connected = await manager.connectDevice(device, BluetoothProfileType.HID);
      } finally {
        restore();
      }

      expect(connected).assertTrue();
      expect(manager.getConnectedCount()).assertEqual(1);
      expect(manager.isDeviceConnected(device.deviceId)).assertTrue();
      expect(manager.isDeviceConnectedWithProfile(device.deviceId, BluetoothProfileType.HID)).assertTrue();
      expect(manager.getConnectedDevicesByProfile(BluetoothProfileType.HID).length).assertEqual(1);
      expect(device.connectionState).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(device.connectionCount).assertEqual(1);

      const records = manager.getConnectionRecords();
      expect(records.length).assertEqual(1);
      expect(records[0].state).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(records[0].deviceName).assertEqual('Device dev_connect_ok');
      expect(records[0].rssi).assertEqual(-55);
    });

    /*
     * @tc.number: SUB_CONN_MGR_0400
     * @tc.name: testConnMgr0004
     * @tc.desc: Verify the simulated connection failure is recorded and reported to error callbacks.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testConnMgr0004', 0, async () => {
      const manager = new BluetoothConnectionManager();
      expect(manager.initialize()).assertTrue();
      const device = createDevice('dev_connect_fail', -70);
      const errorMessages: string[] = [];
      const errorProfiles: string[] = [];

      manager.addEventCallback({
        onConnected: (deviceId: string, profile: BluetoothProfileType): void => {
          errorMessages.push(`unexpected:${deviceId}`);
        },
        onDisconnected: (deviceId: string, profile: BluetoothProfileType): void => {
          errorMessages.push(`unexpected:${deviceId}`);
        },
        onError: (deviceId: string, profile: BluetoothProfileType, error: string): void => {
          errorProfiles.push(profile);
          errorMessages.push(error);
        }
      });

      const restore = installRandomSequence([0, 0]);
      let connected: boolean = true;
      try {
        connected = await manager.connectDevice(device, BluetoothProfileType.HID);
      } finally {
        restore();
      }

      expect(connected).assertFalse();
      expect(errorMessages.length).assertEqual(1);
      expect(errorMessages[0]).assertEqual('Simulated connection failure');
      expect(errorProfiles[0]).assertEqual(BluetoothProfileType.HID);
      expect(manager.isDeviceConnected(device.deviceId)).assertFalse();
      expect(device.connectionState).assertEqual(BluetoothConnectionState.CONNECTION_FAILED);

      const records = manager.getConnectionRecords();
      expect(records.length).assertEqual(1);
      expect(records[0].state).assertEqual(BluetoothConnectionState.CONNECTION_FAILED);
      expect(records[0].errorMessage).assertEqual('Simulated connection failure');

      const stats = manager.getStatistics();
      expect(stats.totalFailures).assertEqual(1);
      expect(stats.totalConnections).assertEqual(0);
      expect(stats.successRate).assertEqual(0);
    });

    /*
     * @tc.number: SUB_CONN_MGR_0500
     * @tc.name: testConnMgr0005
     * @tc.desc: Verify repeated connect with the same profile is idempotent while other profiles stay independent.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testConnMgr0005', 0, async () => {
      const manager = new BluetoothConnectionManager();
      expect(manager.initialize()).assertTrue();
      const device = createDevice('dev_multi_profile', -60);

      const restore = installRandomSequence([0, 0.5]);
      try {
        expect(await manager.connectDevice(device, BluetoothProfileType.HID)).assertTrue();
        expect(await manager.connectDevice(device, BluetoothProfileType.HID)).assertTrue();
        expect(manager.getConnectionRecords().length).assertEqual(1);

        expect(await manager.connectDevice(device, BluetoothProfileType.A2DP)).assertTrue();
        expect(manager.getConnectedCount()).assertEqual(1);
        expect(manager.getConnectedDevicesByProfile(BluetoothProfileType.HID).length).assertEqual(1);
        expect(manager.getConnectedDevicesByProfile(BluetoothProfileType.A2DP).length).assertEqual(1);

        expect(await manager.disconnectDevice(device.deviceId, BluetoothProfileType.HID)).assertTrue();
        expect(manager.isDeviceConnectedWithProfile(device.deviceId, BluetoothProfileType.HID)).assertFalse();
        expect(manager.isDeviceConnectedWithProfile(device.deviceId, BluetoothProfileType.A2DP)).assertTrue();
        expect(manager.isDeviceConnected(device.deviceId)).assertTrue();

        expect(await manager.disconnectDevice(device.deviceId, BluetoothProfileType.A2DP)).assertTrue();
      } finally {
        restore();
      }

      expect(manager.isDeviceConnected(device.deviceId)).assertFalse();
      expect(manager.getConnectedCount()).assertEqual(0);
      expect(manager.getStatistics().totalConnections).assertEqual(2);
      expect(manager.getStatistics().totalDisconnections).assertEqual(2);
    });

    /*
     * @tc.number: SUB_CONN_MGR_0600
     * @tc.name: testConnMgr0006
     * @tc.desc: Verify the maximum connected device limit rejects additional devices.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testConnMgr0006', 0, async () => {
      const manager = new BluetoothConnectionManager();
      expect(manager.initialize()).assertTrue();

      const restore = installRandomSequence([0, 0.5]);
      try {
        for (let i: number = 0; i < MAX_CONNECTED_DEVICES; i++) {
          const device = createDevice(`dev_max_${i}`, -50);
          expect(await manager.connectDevice(device, BluetoothProfileType.HID)).assertTrue();
        }
        expect(manager.getConnectedCount()).assertEqual(MAX_CONNECTED_DEVICES);

        const overflow = createDevice('dev_max_overflow', -50);
        expect(await manager.connectDevice(overflow, BluetoothProfileType.HID)).assertFalse();
        expect(overflow.connectionState).assertEqual(BluetoothConnectionState.DISCONNECTED);
      } finally {
        restore();
      }

      expect(manager.getConnectedCount()).assertEqual(MAX_CONNECTED_DEVICES);
      expect(manager.isDeviceConnected('dev_max_overflow')).assertFalse();

      const overflowRecords = manager.getRecordsByDevice('dev_max_overflow');
      expect(overflowRecords.length).assertEqual(1);
      expect(overflowRecords[0].state).assertEqual(BluetoothConnectionState.CONNECTION_FAILED);
      expect(overflowRecords[0].errorMessage).assertEqual('Maximum connections reached');

      const stats = manager.getStatistics();
      expect(stats.totalConnections).assertEqual(MAX_CONNECTED_DEVICES);
      expect(stats.totalFailures).assertEqual(1);
    });

    /*
     * @tc.number: SUB_CONN_MGR_0700
     * @tc.name: testConnMgr0007
     * @tc.desc: Verify the fifth rapid connection attempt succeeds and the sixth is rate limited.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testConnMgr0007', 0, async () => {
      const manager = new BluetoothConnectionManager();
      expect(manager.initialize()).assertTrue();
      const device = createDevice('dev_rate_limit', -50);
      const profiles: BluetoothProfileType[] = [
        BluetoothProfileType.A2DP,
        BluetoothProfileType.HFP,
        BluetoothProfileType.HID,
        BluetoothProfileType.PAN,
        BluetoothProfileType.PBAP
      ];

      const restore = installRandomSequence([0, 0.5]);
      try {
        for (const profile of profiles) {
          expect(await manager.connectDevice(device, profile)).assertTrue();
        }
        expect(manager.getConnectionRecords().length).assertEqual(5);

        expect(await manager.connectDevice(device, BluetoothProfileType.MAP)).assertFalse();
      } finally {
        restore();
      }

      expect(manager.isDeviceConnectedWithProfile(device.deviceId, BluetoothProfileType.MAP)).assertFalse();
      expect(manager.getConnectedDevicesByProfile(BluetoothProfileType.MAP).length).assertEqual(0);
      expect(manager.getConnectionRecords().length).assertEqual(5);

      const stats = manager.getStatistics();
      expect(stats.totalConnections).assertEqual(5);
      expect(stats.totalFailures).assertEqual(0);
      expect(stats.connectionsByProfile.get(BluetoothProfileType.HID)).assertEqual(1);
    });

    /*
     * @tc.number: SUB_CONN_MGR_0800
     * @tc.name: testConnMgr0008
     * @tc.desc: Verify disconnectAll releases a single connected device and returns the released count.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testConnMgr0008', 0, async () => {
      const manager = new BluetoothConnectionManager();
      expect(manager.initialize()).assertTrue();
      expect(await manager.disconnectAll()).assertEqual(0);

      const device = createDevice('dev_disconnect_all', -45);
      const restore = installRandomSequence([0, 0.5]);
      try {
        expect(await manager.connectDevice(device, BluetoothProfileType.HID)).assertTrue();
      } finally {
        restore();
      }
      expect(manager.getConnectedCount()).assertEqual(1);

      expect(await manager.disconnectAll()).assertEqual(1);
      expect(manager.getConnectedCount()).assertEqual(0);
      expect(manager.isDeviceConnected(device.deviceId)).assertFalse();
      expect(device.connectionState).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(manager.getStatistics().totalDisconnections).assertEqual(1);
      expect(await manager.disconnectAll()).assertEqual(0);
    });

    /*
     * @tc.number: SUB_CONN_MGR_0900
     * @tc.name: testConnMgr0009
     * @tc.desc: Verify record queries by device, profile and time window return defensive copies.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testConnMgr0009', 0, async () => {
      const manager = new BluetoothConnectionManager();
      expect(manager.initialize()).assertTrue();
      const device = createDevice('dev_records', -60);

      const restore = installRandomSequence([0, 0.5]);
      try {
        expect(await manager.connectDevice(device, BluetoothProfileType.HID)).assertTrue();
      } finally {
        restore();
      }
      expect(await manager.disconnectDevice(device.deviceId, BluetoothProfileType.HID)).assertTrue();

      expect(manager.getConnectionRecords().length).assertEqual(2);
      expect(manager.getRecordsByDevice(device.deviceId).length).assertEqual(2);
      expect(manager.getRecordsByProfile(BluetoothProfileType.HID).length).assertEqual(2);
      expect(manager.getRecordsByProfile(BluetoothProfileType.A2DP).length).assertEqual(0);
      expect(manager.getRecordsByDevice('dev_missing').length).assertEqual(0);
      expect(manager.getRecentRecords(60000).length).assertEqual(2);

      const deviceRecords = manager.getRecordsByDevice(device.deviceId);
      expect(deviceRecords[1].state).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(deviceRecords[1].deviceName).assertEqual('Device dev_records');
      expect(deviceRecords[1].duration >= 200).assertTrue();

      const snapshot = manager.getConnectionRecords();
      snapshot.pop();
      expect(snapshot.length).assertEqual(1);
      expect(manager.getConnectionRecords().length).assertEqual(2);
    });

    /*
     * @tc.number: SUB_CONN_MGR_1000
     * @tc.name: testConnMgr0010
     * @tc.desc: Verify statistics aggregate connections, disconnections and profile counters consistently.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testConnMgr0010', 0, async () => {
      const manager = new BluetoothConnectionManager();
      expect(manager.initialize()).assertTrue();
      const hidDevice = createDevice('dev_stats_hid', -60);
      const hfpDevice = createDevice('dev_stats_hfp', -60);

      const restore = installRandomSequence([0, 0.5]);
      try {
        expect(await manager.connectDevice(hidDevice, BluetoothProfileType.HID)).assertTrue();
        expect(await manager.connectDevice(hfpDevice, BluetoothProfileType.HFP)).assertTrue();
      } finally {
        restore();
      }
      expect(await manager.disconnectDevice(hfpDevice.deviceId, BluetoothProfileType.HFP)).assertTrue();

      const stats = manager.getStatistics();
      expect(stats.totalConnections).assertEqual(2);
      expect(stats.totalDisconnections).assertEqual(1);
      expect(stats.totalFailures).assertEqual(0);
      expect(stats.currentConnectedCount).assertEqual(1);
      expect(stats.totalUniqueDevices).assertEqual(2);
      expect(stats.successRate).assertEqual(100);
      expect(stats.averageRssi).assertEqual(-60);
      expect(stats.shortestDuration >= 200).assertTrue();
      expect(stats.longestDuration >= stats.shortestDuration).assertTrue();
      expect(stats.failuresByErrorCode.size).assertEqual(0);

      const hidConnections: number = stats.connectionsByProfile.get(BluetoothProfileType.HID) || 0;
      const hfpConnections: number = stats.connectionsByProfile.get(BluetoothProfileType.HFP) || 0;
      expect(hidConnections).assertEqual(1);
      expect(hfpConnections).assertEqual(1);
    });

    /*
     * @tc.number: SUB_CONN_MGR_1100
     * @tc.name: testConnMgr0011
     * @tc.desc: Verify all callbacks are notified, a throwing callback is isolated and reset clears callbacks.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testConnMgr0011', 0, async () => {
      const manager = new BluetoothConnectionManager();
      expect(manager.initialize()).assertTrue();
      const device = createDevice('dev_callback', -50);
      const connectedEvents: string[] = [];
      const disconnectedEvents: string[] = [];
      let throwingCallbackCalls: number = 0;

      manager.addEventCallback({
        onConnected: (deviceId: string, profile: BluetoothProfileType): void => {
          connectedEvents.push(`${deviceId}:${profile}`);
        },
        onDisconnected: (deviceId: string, profile: BluetoothProfileType): void => {
          disconnectedEvents.push(`${deviceId}:${profile}`);
        },
        onError: (deviceId: string, profile: BluetoothProfileType, error: string): void => {
          connectedEvents.push(`error:${deviceId}`);
        }
      });
      manager.addEventCallback({
        onConnected: (deviceId: string, profile: BluetoothProfileType): void => {
          throwingCallbackCalls += 1;
          throw new Error('callback failure');
        },
        onDisconnected: (deviceId: string, profile: BluetoothProfileType): void => {
          throw new Error('callback failure');
        },
        onError: (deviceId: string, profile: BluetoothProfileType, error: string): void => {
          throw new Error('callback failure');
        }
      });

      const restore = installRandomSequence([0, 0.5]);
      try {
        expect(await manager.connectDevice(device, BluetoothProfileType.HID)).assertTrue();
      } finally {
        restore();
      }
      expect(connectedEvents.length).assertEqual(1);
      expect(connectedEvents[0]).assertEqual(`dev_callback:${BluetoothProfileType.HID}`);
      expect(throwingCallbackCalls).assertEqual(1);
      expect(manager.isDeviceConnected(device.deviceId)).assertTrue();

      expect(await manager.disconnectDevice(device.deviceId, BluetoothProfileType.HID)).assertTrue();
      expect(disconnectedEvents.length).assertEqual(1);
      expect(disconnectedEvents[0]).assertEqual(`dev_callback:${BluetoothProfileType.HID}`);

      manager.reset();
      expect(manager.getConnectionRecords().length).assertEqual(0);
      const restoreAfterReset = installRandomSequence([0, 0.5]);
      try {
        expect(await manager.connectDevice(device, BluetoothProfileType.HID)).assertTrue();
      } finally {
        restoreAfterReset();
      }
      expect(connectedEvents.length).assertEqual(1);
      expect(throwingCallbackCalls).assertEqual(1);
    });

    /*
     * @tc.number: SUB_CONN_MGR_1200
     * @tc.name: testConnMgr0012
     * @tc.desc: Verify reset clears connections and records while destroy blocks further connections.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testConnMgr0012', 0, async () => {
      const manager = new BluetoothConnectionManager();
      expect(manager.initialize()).assertTrue();
      const device = createDevice('dev_lifecycle', -50);

      const restore = installRandomSequence([0, 0.5]);
      try {
        expect(await manager.connectDevice(device, BluetoothProfileType.HID)).assertTrue();
      } finally {
        restore();
      }

      manager.reset();
      expect(manager.getConnectedCount()).assertEqual(0);
      expect(manager.getConnectionRecords().length).assertEqual(0);
      expect(manager.getStatistics().totalUniqueDevices).assertEqual(0);
      expect(manager.isManagerInitialized()).assertTrue();

      manager.destroy();
      expect(manager.isManagerInitialized()).assertFalse();
      expect(await manager.connectDevice(device, BluetoothProfileType.HID)).assertFalse();
      expect(manager.getConnectedCount()).assertEqual(0);
      expect(manager.getConnectionRecords().length).assertEqual(0);
    });
  });
}
