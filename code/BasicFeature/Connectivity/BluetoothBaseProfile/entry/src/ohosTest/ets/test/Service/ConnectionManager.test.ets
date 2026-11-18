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
import { hilog } from '@kit.PerformanceAnalysisKit';
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConnMgr0001', 'begin');
      const manager: BluetoothConnectionManager = new BluetoothConnectionManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0001',
        '#1 assert ' + "expect(manager.isManagerInitialized()).assertFalse()");
      expect(manager.isManagerInitialized()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0001',
        '#2 assert ' + "expect(manager.getConnectedCount()).assertEqual(0)");
      expect(manager.getConnectedCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0001',
        '#3 assert ' + "expect(manager.getConnectionRecords().length).assertEqual(0)");
      expect(manager.getConnectionRecords().length).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0001',
        '#4 assert ' + "expect(manager.initialize()).assertTrue()");
      expect(manager.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0001',
        '#5 assert ' + "expect(manager.isManagerInitialized()).assertTrue()");
      expect(manager.isManagerInitialized()).assertTrue();

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0001',
        '#6 ' + "stats.totalConnections" + ' = ' + JSON.stringify(stats.totalConnections));
      expect(stats.totalConnections).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0001',
        '#7 ' + "stats.currentConnectedCount" + ' = ' + JSON.stringify(stats.currentConnectedCount));
      expect(stats.currentConnectedCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0001',
        '#8 ' + "stats.shortestDuration" + ' = ' + JSON.stringify(stats.shortestDuration));
      expect(stats.shortestDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0001',
        '#9 ' + "stats.successRate" + ' = ' + JSON.stringify(stats.successRate));
      expect(stats.successRate).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0001',
        '#10 ' + "stats.totalUniqueDevices" + ' = ' + JSON.stringify(stats.totalUniqueDevices));
      expect(stats.totalUniqueDevices).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConnMgr0001', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConnMgr0002', 'begin');
      const manager: BluetoothConnectionManager = new BluetoothConnectionManager();
      const device = createDevice('dev_uninitialized', -50);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0002',
        '#1 assert ' + "expect(await manager.connectDevice(device, BluetoothProfileType.HID)).assertFalse()");
      expect(await manager.connectDevice(device, BluetoothProfileType.HID)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0002',
        '#2 assert ' + "expect(manager.getConnectedCount()).assertEqual(0)");
      expect(manager.getConnectedCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0002',
        '#3 assert ' + "expect(manager.getConnectionRecords().length).assertEqual(0)");
      expect(manager.getConnectionRecords().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0002',
        '#4 ' + "device.connectionState" + ' = ' + JSON.stringify(device.connectionState));
      expect(device.connectionState).assertEqual(BluetoothConnectionState.DISCONNECTED);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0002',
        '#5 assert ' +
        "expect(await manager.disconnectDevice(device.deviceId, BluetoothProfileType.HID)).assertFalse()");
      expect(await manager.disconnectDevice(device.deviceId, BluetoothProfileType.HID)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0002',
        '#6 assert ' + "expect(manager.isDeviceConnected(device.deviceId)).assertFalse()");
      expect(manager.isDeviceConnected(device.deviceId)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0002',
        '#7 assert ' + "expect(manager.getStatistics().totalFailures).assertEqual(0)");
      expect(manager.getStatistics().totalFailures).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConnMgr0002', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConnMgr0003', 'begin');
      const manager: BluetoothConnectionManager = new BluetoothConnectionManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0003',
        '#1 assert ' + "expect(manager.initialize()).assertTrue()");
      expect(manager.initialize()).assertTrue();
      const device = createDevice('dev_connect_ok', -55);

      const restore = installRandomSequence([0, 0.5]);
      let connected: boolean = false;
      try {
        connected = await manager.connectDevice(device, BluetoothProfileType.HID);
      } finally {
        restore();
      }

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0003',
        '#2 ' + "connected" + ' = ' + JSON.stringify(connected));
      expect(connected).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0003',
        '#3 assert ' + "expect(manager.getConnectedCount()).assertEqual(1)");
      expect(manager.getConnectedCount()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0003',
        '#4 assert ' + "expect(manager.isDeviceConnected(device.deviceId)).assertTrue()");
      expect(manager.isDeviceConnected(device.deviceId)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0003',
        '#5 assert ' +
        "expect(manager.isDeviceConnectedWithProfile(device.deviceId, BluetoothProfileType.HID)).assertTrue()");
      expect(manager.isDeviceConnectedWithProfile(device.deviceId, BluetoothProfileType.HID)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0003',
        '#6 assert ' + "expect(manager.getConnectedDevicesByProfile(BluetoothProfileType.HID).length).assertEqual(1)");
      expect(manager.getConnectedDevicesByProfile(BluetoothProfileType.HID).length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0003',
        '#7 ' + "device.connectionState" + ' = ' + JSON.stringify(device.connectionState));
      expect(device.connectionState).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0003',
        '#8 ' + "device.connectionCount" + ' = ' + JSON.stringify(device.connectionCount));
      expect(device.connectionCount).assertEqual(1);

      const records = manager.getConnectionRecords();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0003',
        '#9 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0003',
        '#10 ' + "records[0].state" + ' = ' + JSON.stringify(records[0].state));
      expect(records[0].state).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0003',
        '#11 ' + "records[0].deviceName" + ' = ' + JSON.stringify(records[0].deviceName));
      expect(records[0].deviceName).assertEqual('Device dev_connect_ok');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0003',
        '#12 ' + "records[0].rssi" + ' = ' + JSON.stringify(records[0].rssi));
      expect(records[0].rssi).assertEqual(-55);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConnMgr0003', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConnMgr0004', 'begin');
      const manager: BluetoothConnectionManager = new BluetoothConnectionManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0004',
        '#1 assert ' + "expect(manager.initialize()).assertTrue()");
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

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0004',
        '#2 ' + "connected" + ' = ' + JSON.stringify(connected));
      expect(connected).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0004',
        '#3 ' + "errorMessages.length" + ' = ' + JSON.stringify(errorMessages.length));
      expect(errorMessages.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0004',
        '#4 ' + "errorMessages[0]" + ' = ' + JSON.stringify(errorMessages[0]));
      expect(errorMessages[0]).assertEqual('Simulated connection failure');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0004',
        '#5 ' + "errorProfiles[0]" + ' = ' + JSON.stringify(errorProfiles[0]));
      expect(errorProfiles[0]).assertEqual(BluetoothProfileType.HID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0004',
        '#6 assert ' + "expect(manager.isDeviceConnected(device.deviceId)).assertFalse()");
      expect(manager.isDeviceConnected(device.deviceId)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0004',
        '#7 ' + "device.connectionState" + ' = ' + JSON.stringify(device.connectionState));
      expect(device.connectionState).assertEqual(BluetoothConnectionState.CONNECTION_FAILED);

      const records = manager.getConnectionRecords();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0004',
        '#8 ' + "records.length" + ' = ' + JSON.stringify(records.length));
      expect(records.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0004',
        '#9 ' + "records[0].state" + ' = ' + JSON.stringify(records[0].state));
      expect(records[0].state).assertEqual(BluetoothConnectionState.CONNECTION_FAILED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0004',
        '#10 ' + "records[0].errorMessage" + ' = ' + JSON.stringify(records[0].errorMessage));
      expect(records[0].errorMessage).assertEqual('Simulated connection failure');

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0004',
        '#11 ' + "stats.totalFailures" + ' = ' + JSON.stringify(stats.totalFailures));
      expect(stats.totalFailures).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0004',
        '#12 ' + "stats.totalConnections" + ' = ' + JSON.stringify(stats.totalConnections));
      expect(stats.totalConnections).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0004',
        '#13 ' + "stats.successRate" + ' = ' + JSON.stringify(stats.successRate));
      expect(stats.successRate).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConnMgr0004', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConnMgr0005', 'begin');
      const manager: BluetoothConnectionManager = new BluetoothConnectionManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0005',
        '#1 assert ' + "expect(manager.initialize()).assertTrue()");
      expect(manager.initialize()).assertTrue();
      const device = createDevice('dev_multi_profile', -60);

      const restore = installRandomSequence([0, 0.5]);
      try {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testConnMgr0005',
          '#2 assert ' + "expect(await manager.connectDevice(device, BluetoothProfileType.HID)).assertTrue()");
        expect(await manager.connectDevice(device, BluetoothProfileType.HID)).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testConnMgr0005',
          '#3 assert ' + "expect(await manager.connectDevice(device, BluetoothProfileType.HID)).assertTrue()");
        expect(await manager.connectDevice(device, BluetoothProfileType.HID)).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testConnMgr0005',
          '#4 assert ' + "expect(manager.getConnectionRecords().length).assertEqual(1)");
        expect(manager.getConnectionRecords().length).assertEqual(1);

        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testConnMgr0005',
          '#5 assert ' + "expect(await manager.connectDevice(device, BluetoothProfileType.A2DP)).assertTrue()");
        expect(await manager.connectDevice(device, BluetoothProfileType.A2DP)).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testConnMgr0005',
          '#6 assert ' + "expect(manager.getConnectedCount()).assertEqual(1)");
        expect(manager.getConnectedCount()).assertEqual(1);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testConnMgr0005',
          '#7 assert ' +
          "expect(manager.getConnectedDevicesByProfile(BluetoothProfileType.HID).length).assertEqual(1)");
        expect(manager.getConnectedDevicesByProfile(BluetoothProfileType.HID).length).assertEqual(1);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testConnMgr0005',
          '#8 assert ' +
          "expect(manager.getConnectedDevicesByProfile(BluetoothProfileType.A2DP).length).assertEqual(1)");
        expect(manager.getConnectedDevicesByProfile(BluetoothProfileType.A2DP).length).assertEqual(1);

        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testConnMgr0005',
          '#9 assert ' +
          "expect(await manager.disconnectDevice(device.deviceId, BluetoothProfileType.HID)).assertTrue()");
        expect(await manager.disconnectDevice(device.deviceId, BluetoothProfileType.HID)).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testConnMgr0005',
          '#10 assert ' +
          "expect(manager.isDeviceConnectedWithProfile(device.deviceId, BluetoothProfileType.HID)).assertFalse()");
        expect(manager.isDeviceConnectedWithProfile(device.deviceId, BluetoothProfileType.HID)).assertFalse();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testConnMgr0005',
          '#11 assert ' +
          "expect(manager.isDeviceConnectedWithProfile(device.deviceId, BluetoothProfileType.A2DP)).assertTrue()");
        expect(manager.isDeviceConnectedWithProfile(device.deviceId, BluetoothProfileType.A2DP)).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testConnMgr0005',
          '#12 assert ' + "expect(manager.isDeviceConnected(device.deviceId)).assertTrue()");
        expect(manager.isDeviceConnected(device.deviceId)).assertTrue();

        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testConnMgr0005',
          '#13 assert ' +
          "expect(await manager.disconnectDevice(device.deviceId, BluetoothProfileType.A2DP)).assertTrue()");
        expect(await manager.disconnectDevice(device.deviceId, BluetoothProfileType.A2DP)).assertTrue();
      } finally {
        restore();
      }

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0005',
        '#14 assert ' + "expect(manager.isDeviceConnected(device.deviceId)).assertFalse()");
      expect(manager.isDeviceConnected(device.deviceId)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0005',
        '#15 assert ' + "expect(manager.getConnectedCount()).assertEqual(0)");
      expect(manager.getConnectedCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0005',
        '#16 assert ' + "expect(manager.getStatistics().totalConnections).assertEqual(2)");
      expect(manager.getStatistics().totalConnections).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0005',
        '#17 assert ' + "expect(manager.getStatistics().totalDisconnections).assertEqual(2)");
      expect(manager.getStatistics().totalDisconnections).assertEqual(2);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConnMgr0005', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConnMgr0006', 'begin');
      const manager: BluetoothConnectionManager = new BluetoothConnectionManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0006',
        '#1 assert ' + "expect(manager.initialize()).assertTrue()");
      expect(manager.initialize()).assertTrue();

      const restore = installRandomSequence([0, 0.5]);
      try {
        for (let i: number = 0; i < MAX_CONNECTED_DEVICES; i++) {
          const device = createDevice(`dev_max_${i}`, -50);
          hilog.info(0xF811,
            '[Sample_BluetoothBaseProfile] testConnMgr0006',
            '#2 assert ' + "expect(await manager.connectDevice(device, BluetoothProfileType.HID)).assertTrue()");
          expect(await manager.connectDevice(device, BluetoothProfileType.HID)).assertTrue();
        }
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testConnMgr0006',
          '#3 assert ' + "expect(manager.getConnectedCount()).assertEqual(MAX_CONNECTED_DEVICES)");
        expect(manager.getConnectedCount()).assertEqual(MAX_CONNECTED_DEVICES);

        const overflow = createDevice('dev_max_overflow', -50);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testConnMgr0006',
          '#4 assert ' + "expect(await manager.connectDevice(overflow, BluetoothProfileType.HID)).assertFalse()");
        expect(await manager.connectDevice(overflow, BluetoothProfileType.HID)).assertFalse();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testConnMgr0006',
          '#5 ' + "overflow.connectionState" + ' = ' + JSON.stringify(overflow.connectionState));
        expect(overflow.connectionState).assertEqual(BluetoothConnectionState.DISCONNECTED);
      } finally {
        restore();
      }

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0006',
        '#6 assert ' + "expect(manager.getConnectedCount()).assertEqual(MAX_CONNECTED_DEVICES)");
      expect(manager.getConnectedCount()).assertEqual(MAX_CONNECTED_DEVICES);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0006',
        '#7 assert ' + "expect(manager.isDeviceConnected('dev_max_overflow')).assertFalse()");
      expect(manager.isDeviceConnected('dev_max_overflow')).assertFalse();

      const overflowRecords = manager.getRecordsByDevice('dev_max_overflow');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0006',
        '#8 ' + "overflowRecords.length" + ' = ' + JSON.stringify(overflowRecords.length));
      expect(overflowRecords.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0006',
        '#9 ' + "overflowRecords[0].state" + ' = ' + JSON.stringify(overflowRecords[0].state));
      expect(overflowRecords[0].state).assertEqual(BluetoothConnectionState.CONNECTION_FAILED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0006',
        '#10 ' + "overflowRecords[0].errorMessage" + ' = ' + JSON.stringify(overflowRecords[0].errorMessage));
      expect(overflowRecords[0].errorMessage).assertEqual('Maximum connections reached');

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0006',
        '#11 ' + "stats.totalConnections" + ' = ' + JSON.stringify(stats.totalConnections));
      expect(stats.totalConnections).assertEqual(MAX_CONNECTED_DEVICES);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0006',
        '#12 ' + "stats.totalFailures" + ' = ' + JSON.stringify(stats.totalFailures));
      expect(stats.totalFailures).assertEqual(1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConnMgr0006', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConnMgr0007', 'begin');
      const manager: BluetoothConnectionManager = new BluetoothConnectionManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0007',
        '#1 assert ' + "expect(manager.initialize()).assertTrue()");
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
          hilog.info(0xF811,
            '[Sample_BluetoothBaseProfile] testConnMgr0007',
            '#2 assert ' + "expect(await manager.connectDevice(device, profile)).assertTrue()");
          expect(await manager.connectDevice(device, profile)).assertTrue();
        }
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testConnMgr0007',
          '#3 assert ' + "expect(manager.getConnectionRecords().length).assertEqual(5)");
        expect(manager.getConnectionRecords().length).assertEqual(5);

        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testConnMgr0007',
          '#4 assert ' + "expect(await manager.connectDevice(device, BluetoothProfileType.MAP)).assertFalse()");
        expect(await manager.connectDevice(device, BluetoothProfileType.MAP)).assertFalse();
      } finally {
        restore();
      }

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0007',
        '#5 assert ' +
        "expect(manager.isDeviceConnectedWithProfile(device.deviceId, BluetoothProfileType.MAP)).assertFalse()");
      expect(manager.isDeviceConnectedWithProfile(device.deviceId, BluetoothProfileType.MAP)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0007',
        '#6 assert ' + "expect(manager.getConnectedDevicesByProfile(BluetoothProfileType.MAP).length).assertEqual(0)");
      expect(manager.getConnectedDevicesByProfile(BluetoothProfileType.MAP).length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0007',
        '#7 assert ' + "expect(manager.getConnectionRecords().length).assertEqual(5)");
      expect(manager.getConnectionRecords().length).assertEqual(5);

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0007',
        '#8 ' + "stats.totalConnections" + ' = ' + JSON.stringify(stats.totalConnections));
      expect(stats.totalConnections).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0007',
        '#9 ' + "stats.totalFailures" + ' = ' + JSON.stringify(stats.totalFailures));
      expect(stats.totalFailures).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0007',
        '#10 assert ' + "expect(stats.connectionsByProfile.get(BluetoothProfileType.HID)).assertEqual(1)");
      expect(stats.connectionsByProfile.get(BluetoothProfileType.HID)).assertEqual(1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConnMgr0007', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConnMgr0008', 'begin');
      const manager: BluetoothConnectionManager = new BluetoothConnectionManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0008',
        '#1 assert ' + "expect(manager.initialize()).assertTrue()");
      expect(manager.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0008',
        '#2 assert ' + "expect(await manager.disconnectAll()).assertEqual(0)");
      expect(await manager.disconnectAll()).assertEqual(0);

      const device = createDevice('dev_disconnect_all', -45);
      const restore = installRandomSequence([0, 0.5]);
      try {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testConnMgr0008',
          '#3 assert ' + "expect(await manager.connectDevice(device, BluetoothProfileType.HID)).assertTrue()");
        expect(await manager.connectDevice(device, BluetoothProfileType.HID)).assertTrue();
      } finally {
        restore();
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0008',
        '#4 assert ' + "expect(manager.getConnectedCount()).assertEqual(1)");
      expect(manager.getConnectedCount()).assertEqual(1);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0008',
        '#5 assert ' + "expect(await manager.disconnectAll()).assertEqual(1)");
      expect(await manager.disconnectAll()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0008',
        '#6 assert ' + "expect(manager.getConnectedCount()).assertEqual(0)");
      expect(manager.getConnectedCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0008',
        '#7 assert ' + "expect(manager.isDeviceConnected(device.deviceId)).assertFalse()");
      expect(manager.isDeviceConnected(device.deviceId)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0008',
        '#8 ' + "device.connectionState" + ' = ' + JSON.stringify(device.connectionState));
      expect(device.connectionState).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0008',
        '#9 assert ' + "expect(manager.getStatistics().totalDisconnections).assertEqual(1)");
      expect(manager.getStatistics().totalDisconnections).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0008',
        '#10 assert ' + "expect(await manager.disconnectAll()).assertEqual(0)");
      expect(await manager.disconnectAll()).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConnMgr0008', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConnMgr0009', 'begin');
      const manager: BluetoothConnectionManager = new BluetoothConnectionManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0009',
        '#1 assert ' + "expect(manager.initialize()).assertTrue()");
      expect(manager.initialize()).assertTrue();
      const device = createDevice('dev_records', -60);

      const restore = installRandomSequence([0, 0.5]);
      try {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testConnMgr0009',
          '#2 assert ' + "expect(await manager.connectDevice(device, BluetoothProfileType.HID)).assertTrue()");
        expect(await manager.connectDevice(device, BluetoothProfileType.HID)).assertTrue();
      } finally {
        restore();
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0009',
        '#3 assert ' +
        "expect(await manager.disconnectDevice(device.deviceId, BluetoothProfileType.HID)).assertTrue()");
      expect(await manager.disconnectDevice(device.deviceId, BluetoothProfileType.HID)).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0009',
        '#4 assert ' + "expect(manager.getConnectionRecords().length).assertEqual(2)");
      expect(manager.getConnectionRecords().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0009',
        '#5 assert ' + "expect(manager.getRecordsByDevice(device.deviceId).length).assertEqual(2)");
      expect(manager.getRecordsByDevice(device.deviceId).length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0009',
        '#6 assert ' + "expect(manager.getRecordsByProfile(BluetoothProfileType.HID).length).assertEqual(2)");
      expect(manager.getRecordsByProfile(BluetoothProfileType.HID).length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0009',
        '#7 assert ' + "expect(manager.getRecordsByProfile(BluetoothProfileType.A2DP).length).assertEqual(0)");
      expect(manager.getRecordsByProfile(BluetoothProfileType.A2DP).length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0009',
        '#8 assert ' + "expect(manager.getRecordsByDevice('dev_missing').length).assertEqual(0)");
      expect(manager.getRecordsByDevice('dev_missing').length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0009',
        '#9 assert ' + "expect(manager.getRecentRecords(60000).length).assertEqual(2)");
      expect(manager.getRecentRecords(60000).length).assertEqual(2);

      const deviceRecords = manager.getRecordsByDevice(device.deviceId);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0009',
        '#10 ' + "deviceRecords[1].state" + ' = ' + JSON.stringify(deviceRecords[1].state));
      expect(deviceRecords[1].state).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0009',
        '#11 ' + "deviceRecords[1].deviceName" + ' = ' + JSON.stringify(deviceRecords[1].deviceName));
      expect(deviceRecords[1].deviceName).assertEqual('Device dev_records');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0009',
        '#12 ' + "deviceRecords[1].duration >= 200" + ' = ' + JSON.stringify(deviceRecords[1].duration >= 200));
      expect(deviceRecords[1].duration >= 200).assertTrue();

      const snapshot = manager.getConnectionRecords();
      snapshot.pop();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0009',
        '#13 ' + "snapshot.length" + ' = ' + JSON.stringify(snapshot.length));
      expect(snapshot.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0009',
        '#14 assert ' + "expect(manager.getConnectionRecords().length).assertEqual(2)");
      expect(manager.getConnectionRecords().length).assertEqual(2);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConnMgr0009', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConnMgr0010', 'begin');
      const manager: BluetoothConnectionManager = new BluetoothConnectionManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0010',
        '#1 assert ' + "expect(manager.initialize()).assertTrue()");
      expect(manager.initialize()).assertTrue();
      const hidDevice = createDevice('dev_stats_hid', -60);
      const hfpDevice = createDevice('dev_stats_hfp', -60);

      const restore = installRandomSequence([0, 0.5]);
      try {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testConnMgr0010',
          '#2 assert ' + "expect(await manager.connectDevice(hidDevice, BluetoothProfileType.HID)).assertTrue()");
        expect(await manager.connectDevice(hidDevice, BluetoothProfileType.HID)).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testConnMgr0010',
          '#3 assert ' + "expect(await manager.connectDevice(hfpDevice, BluetoothProfileType.HFP)).assertTrue()");
        expect(await manager.connectDevice(hfpDevice, BluetoothProfileType.HFP)).assertTrue();
      } finally {
        restore();
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0010',
        '#4 assert ' +
        "expect(await manager.disconnectDevice(hfpDevice.deviceId, BluetoothProfileType.HFP)).assertTrue()");
      expect(await manager.disconnectDevice(hfpDevice.deviceId, BluetoothProfileType.HFP)).assertTrue();

      const stats = manager.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0010',
        '#5 ' + "stats.totalConnections" + ' = ' + JSON.stringify(stats.totalConnections));
      expect(stats.totalConnections).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0010',
        '#6 ' + "stats.totalDisconnections" + ' = ' + JSON.stringify(stats.totalDisconnections));
      expect(stats.totalDisconnections).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0010',
        '#7 ' + "stats.totalFailures" + ' = ' + JSON.stringify(stats.totalFailures));
      expect(stats.totalFailures).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0010',
        '#8 ' + "stats.currentConnectedCount" + ' = ' + JSON.stringify(stats.currentConnectedCount));
      expect(stats.currentConnectedCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0010',
        '#9 ' + "stats.totalUniqueDevices" + ' = ' + JSON.stringify(stats.totalUniqueDevices));
      expect(stats.totalUniqueDevices).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0010',
        '#10 ' + "stats.successRate" + ' = ' + JSON.stringify(stats.successRate));
      expect(stats.successRate).assertEqual(100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0010',
        '#11 ' + "stats.averageRssi" + ' = ' + JSON.stringify(stats.averageRssi));
      expect(stats.averageRssi).assertEqual(-60);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0010',
        '#12 ' + "stats.shortestDuration >= 200" + ' = ' + JSON.stringify(stats.shortestDuration >= 200));
      expect(stats.shortestDuration >= 200).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0010',
        '#13 ' + "stats.longestDuration >= stats.shortestDuration" + ' = ' +
        JSON.stringify(stats.longestDuration >= stats.shortestDuration));
      expect(stats.longestDuration >= stats.shortestDuration).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0010',
        '#14 ' + "stats.failuresByErrorCode.size" + ' = ' + JSON.stringify(stats.failuresByErrorCode.size));
      expect(stats.failuresByErrorCode.size).assertEqual(0);

      const hidConnections: number = stats.connectionsByProfile.get(BluetoothProfileType.HID) || 0;
      const hfpConnections: number = stats.connectionsByProfile.get(BluetoothProfileType.HFP) || 0;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0010',
        '#15 ' + "hidConnections" + ' = ' + JSON.stringify(hidConnections));
      expect(hidConnections).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0010',
        '#16 ' + "hfpConnections" + ' = ' + JSON.stringify(hfpConnections));
      expect(hfpConnections).assertEqual(1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConnMgr0010', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConnMgr0011', 'begin');
      const manager: BluetoothConnectionManager = new BluetoothConnectionManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0011',
        '#1 assert ' + "expect(manager.initialize()).assertTrue()");
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
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testConnMgr0011',
          '#2 assert ' + "expect(await manager.connectDevice(device, BluetoothProfileType.HID)).assertTrue()");
        expect(await manager.connectDevice(device, BluetoothProfileType.HID)).assertTrue();
      } finally {
        restore();
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0011',
        '#3 ' + "connectedEvents.length" + ' = ' + JSON.stringify(connectedEvents.length));
      expect(connectedEvents.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0011',
        '#4 ' + "connectedEvents[0]" + ' = ' + JSON.stringify(connectedEvents[0]));
      expect(connectedEvents[0]).assertEqual(`dev_callback:${BluetoothProfileType.HID}`);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0011',
        '#5 ' + "throwingCallbackCalls" + ' = ' + JSON.stringify(throwingCallbackCalls));
      expect(throwingCallbackCalls).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0011',
        '#6 assert ' + "expect(manager.isDeviceConnected(device.deviceId)).assertTrue()");
      expect(manager.isDeviceConnected(device.deviceId)).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0011',
        '#7 assert ' +
        "expect(await manager.disconnectDevice(device.deviceId, BluetoothProfileType.HID)).assertTrue()");
      expect(await manager.disconnectDevice(device.deviceId, BluetoothProfileType.HID)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0011',
        '#8 ' + "disconnectedEvents.length" + ' = ' + JSON.stringify(disconnectedEvents.length));
      expect(disconnectedEvents.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0011',
        '#9 ' + "disconnectedEvents[0]" + ' = ' + JSON.stringify(disconnectedEvents[0]));
      expect(disconnectedEvents[0]).assertEqual(`dev_callback:${BluetoothProfileType.HID}`);

      manager.reset();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0011',
        '#10 assert ' + "expect(manager.getConnectionRecords().length).assertEqual(0)");
      expect(manager.getConnectionRecords().length).assertEqual(0);
      const restoreAfterReset = installRandomSequence([0, 0.5]);
      try {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testConnMgr0011',
          '#11 assert ' + "expect(await manager.connectDevice(device, BluetoothProfileType.HID)).assertTrue()");
        expect(await manager.connectDevice(device, BluetoothProfileType.HID)).assertTrue();
      } finally {
        restoreAfterReset();
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0011',
        '#12 ' + "connectedEvents.length" + ' = ' + JSON.stringify(connectedEvents.length));
      expect(connectedEvents.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0011',
        '#13 ' + "throwingCallbackCalls" + ' = ' + JSON.stringify(throwingCallbackCalls));
      expect(throwingCallbackCalls).assertEqual(1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConnMgr0011', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConnMgr0012', 'begin');
      const manager: BluetoothConnectionManager = new BluetoothConnectionManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0012',
        '#1 assert ' + "expect(manager.initialize()).assertTrue()");
      expect(manager.initialize()).assertTrue();
      const device = createDevice('dev_lifecycle', -50);

      const restore = installRandomSequence([0, 0.5]);
      try {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testConnMgr0012',
          '#2 assert ' + "expect(await manager.connectDevice(device, BluetoothProfileType.HID)).assertTrue()");
        expect(await manager.connectDevice(device, BluetoothProfileType.HID)).assertTrue();
      } finally {
        restore();
      }

      manager.reset();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0012',
        '#3 assert ' + "expect(manager.getConnectedCount()).assertEqual(0)");
      expect(manager.getConnectedCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0012',
        '#4 assert ' + "expect(manager.getConnectionRecords().length).assertEqual(0)");
      expect(manager.getConnectionRecords().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0012',
        '#5 assert ' + "expect(manager.getStatistics().totalUniqueDevices).assertEqual(0)");
      expect(manager.getStatistics().totalUniqueDevices).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0012',
        '#6 assert ' + "expect(manager.isManagerInitialized()).assertTrue()");
      expect(manager.isManagerInitialized()).assertTrue();

      manager.destroy();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0012',
        '#7 assert ' + "expect(manager.isManagerInitialized()).assertFalse()");
      expect(manager.isManagerInitialized()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0012',
        '#8 assert ' + "expect(await manager.connectDevice(device, BluetoothProfileType.HID)).assertFalse()");
      expect(await manager.connectDevice(device, BluetoothProfileType.HID)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0012',
        '#9 assert ' + "expect(manager.getConnectedCount()).assertEqual(0)");
      expect(manager.getConnectedCount()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testConnMgr0012',
        '#10 assert ' + "expect(manager.getConnectionRecords().length).assertEqual(0)");
      expect(manager.getConnectionRecords().length).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testConnMgr0012', 'end');
    });
  });
}
