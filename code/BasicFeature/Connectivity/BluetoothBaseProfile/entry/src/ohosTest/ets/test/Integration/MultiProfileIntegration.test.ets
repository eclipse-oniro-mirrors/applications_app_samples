/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect } from '@ohos/hypium';
import {
  A2dpProfileManager,
  AvrcpProfileManager,
  BluetoothConnectionState,
  BluetoothProfileType,
  HdpProfileManager,
  HfpProfileManager,
  HidProfileManager,
  MapProfileManager,
  PanProfileManager,
  PbapProfileManager
} from 'library';

/**
 * @description Cross-profile integration scenarios of the eight profile managers.
 * @since 26.0.0
 */

const DEVICE_MAIN: string = 'multi_dev_main';
const DEVICE_OTHER: string = 'multi_dev_other';
const DEVICE_THIRD: string = 'multi_dev_third';
const GHOST_DEVICE: string = 'multi_dev_ghost';
const HEALTHY_SCORE: number = 100;
const IDLE_SCORE: number = 60;
const CRITICAL_SCORE: number = 10;

async function initA2dp(): Promise<A2dpProfileManager> {
  const manager = new A2dpProfileManager();
  await manager.initialize();
  return manager;
}

async function initHfp(): Promise<HfpProfileManager> {
  const manager = new HfpProfileManager();
  await manager.initialize();
  return manager;
}

async function initHid(): Promise<HidProfileManager> {
  const manager = new HidProfileManager();
  await manager.initialize();
  return manager;
}

async function initPan(): Promise<PanProfileManager> {
  const manager = new PanProfileManager();
  await manager.initialize();
  return manager;
}

async function initPbap(): Promise<PbapProfileManager> {
  const manager = new PbapProfileManager();
  await manager.initialize();
  return manager;
}

async function initMap(): Promise<MapProfileManager> {
  const manager = new MapProfileManager();
  await manager.initialize();
  return manager;
}

async function initAvrcp(): Promise<AvrcpProfileManager> {
  const manager = new AvrcpProfileManager();
  await manager.initialize();
  return manager;
}

async function initHdp(): Promise<HdpProfileManager> {
  const manager = new HdpProfileManager();
  await manager.initialize();
  return manager;
}

export default function multiProfileIntegrationTest(): void {
  describe('MultiProfileIntegrationTest', () => {
    // ==================== 多协议初始化与身份（1 条） ====================

    /*
     * @tc.number: SUB_MULTI_PROFILE_0100
     * @tc.name: testMultiProfile0001
     * @tc.desc: Verify that all eight profile managers initialize on their own and expose their profile type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMultiProfile0001', 0, async () => {
      const a2dp = await initA2dp();
      const hfp = await initHfp();
      const hid = await initHid();
      const pan = await initPan();
      const pbap = await initPbap();
      const map = await initMap();
      const avrcp = await initAvrcp();
      const hdp = await initHdp();

      expect(a2dp.getProfileType()).assertEqual(BluetoothProfileType.A2DP);
      expect(hfp.getProfileType()).assertEqual(BluetoothProfileType.HFP);
      expect(hid.getProfileType()).assertEqual(BluetoothProfileType.HID);
      expect(pan.getProfileType()).assertEqual(BluetoothProfileType.PAN);
      expect(pbap.getProfileType()).assertEqual(BluetoothProfileType.PBAP);
      expect(map.getProfileType()).assertEqual(BluetoothProfileType.MAP);
      expect(avrcp.getProfileType()).assertEqual(BluetoothProfileType.AVRCP);
      expect(hdp.getProfileType()).assertEqual(BluetoothProfileType.HDP);

      expect(a2dp.isConnected()).assertFalse();
      expect(hfp.isConnected()).assertFalse();
      expect(hid.isConnected()).assertFalse();
      expect(pan.isConnected()).assertFalse();
      expect(pbap.isConnected()).assertFalse();
      expect(map.isConnected()).assertFalse();
      expect(avrcp.isConnected()).assertFalse();
      expect(hdp.isConnected()).assertFalse();

      expect(a2dp.getOperationRecords().length).assertEqual(1);
      expect(hfp.getOperationRecords().length).assertEqual(1);
      expect(hid.getOperationRecords().length).assertEqual(1);
      expect(pan.getOperationRecords().length).assertEqual(1);
      expect(pbap.getOperationRecords().length).assertEqual(1);
      expect(map.getOperationRecords().length).assertEqual(1);
      expect(avrcp.getOperationRecords().length).assertEqual(1);
      expect(hdp.getOperationRecords().length).assertEqual(1);

      expect(a2dp.getStatistics().totalOperations).assertEqual(1);
      expect(hfp.getStatistics().totalOperations).assertEqual(1);
      expect(hid.getStatistics().totalOperations).assertEqual(1);
      expect(pan.getStatistics().totalOperations).assertEqual(1);
      expect(pbap.getStatistics().totalOperations).assertEqual(1);
      expect(map.getStatistics().totalOperations).assertEqual(1);
      expect(avrcp.getStatistics().totalOperations).assertEqual(1);
      expect(hdp.getStatistics().totalOperations).assertEqual(1);

      expect(a2dp.getService().getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(hfp.getService().getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(hdp.getService().getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(a2dp.getConnectedDeviceIds().length).assertEqual(0);
      expect(hfp.getConnectedDeviceIds().length).assertEqual(0);
      expect(hdp.getConnectedDeviceIds().length).assertEqual(0);

      await a2dp.destroy();
      await hfp.destroy();
      await hid.destroy();
      await pan.destroy();
      await pbap.destroy();
      await map.destroy();
      await avrcp.destroy();
      await hdp.destroy();
    });

    // ==================== 同一设备多协议并行接入（4 条） ====================

    /*
     * @tc.number: SUB_MULTI_PROFILE_0200
     * @tc.name: testMultiProfile0002
     * @tc.desc: Verify that one device can be connected through audio and voice profiles at the same time.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMultiProfile0002', 0, async () => {
      const a2dp = await initA2dp();
      const hfp = await initHfp();
      const hid = await initHid();
      const flags: boolean[] = await Promise.all(
        [a2dp.connect(DEVICE_MAIN), hfp.connect(DEVICE_MAIN), hid.connect(DEVICE_MAIN)]);

      expect(flags[0]).assertTrue();
      expect(flags[1]).assertTrue();
      expect(flags[2]).assertTrue();
      expect(a2dp.isConnected()).assertTrue();
      expect(hfp.isConnected()).assertTrue();
      expect(hid.isConnected()).assertTrue();
      expect(a2dp.getConnectedDeviceIds()[0]).assertEqual(DEVICE_MAIN);
      expect(hfp.getConnectedDeviceIds()[0]).assertEqual(DEVICE_MAIN);
      expect(hid.getConnectedDeviceIds()[0]).assertEqual(DEVICE_MAIN);
      expect(a2dp.getService().getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(hfp.getService().getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(hid.getService().getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(a2dp.getStatistics().successfulConnections).assertEqual(1);
      expect(hfp.getStatistics().successfulConnections).assertEqual(1);
      expect(hid.getStatistics().successfulConnections).assertEqual(1);
      expect(a2dp.getStatistics().managedDeviceCount).assertEqual(1);
      expect(hfp.getStatistics().managedDeviceCount).assertEqual(1);

      expect(await a2dp.disconnect(DEVICE_MAIN)).assertTrue();
      expect(a2dp.isConnected()).assertFalse();
      expect(hfp.isConnected()).assertTrue();
      expect(hid.isConnected()).assertTrue();
      expect(hfp.getStatistics().disconnectionEvents).assertEqual(0);
      expect(a2dp.getService().getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);

      await hid.disconnect(DEVICE_MAIN);
      await hfp.disconnect(DEVICE_MAIN);
      await a2dp.destroy();
      await hfp.destroy();
      await hid.destroy();
    });

    /*
     * @tc.number: SUB_MULTI_PROFILE_0300
     * @tc.name: testMultiProfile0003
     * @tc.desc: Verify that cascading disconnections keep the remaining profiles connected.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMultiProfile0003', 0, async () => {
      const a2dp = await initA2dp();
      const hfp = await initHfp();
      const hid = await initHid();
      await Promise.all([a2dp.connect(DEVICE_MAIN), hfp.connect(DEVICE_MAIN), hid.connect(DEVICE_MAIN)]);

      expect(await a2dp.disconnect(DEVICE_MAIN)).assertTrue();
      expect(a2dp.isConnected()).assertFalse();
      expect(hfp.isConnected()).assertTrue();
      expect(hid.isConnected()).assertTrue();

      expect(await hid.disconnect(DEVICE_MAIN)).assertTrue();
      expect(hid.isConnected()).assertFalse();
      expect(a2dp.isConnected()).assertFalse();
      expect(hfp.isConnected()).assertTrue();

      expect(await hfp.disconnect(DEVICE_MAIN)).assertTrue();
      expect(hfp.isConnected()).assertFalse();
      expect(a2dp.getStatistics().disconnectionEvents).assertEqual(1);
      expect(hfp.getStatistics().disconnectionEvents).assertEqual(1);
      expect(hid.getStatistics().disconnectionEvents).assertEqual(1);
      expect(a2dp.getOperationRecords().length).assertEqual(3);
      expect(hfp.getOperationRecords().length).assertEqual(3);
      expect(hid.getOperationRecords().length).assertEqual(3);
      expect(a2dp.getService().getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(hid.getService().getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(a2dp.getStatistics().healthScore).assertEqual(HEALTHY_SCORE);
      expect(hfp.getStatistics().healthScore).assertEqual(HEALTHY_SCORE);

      await a2dp.destroy();
      await hfp.destroy();
      await hid.destroy();
    });

    /*
     * @tc.number: SUB_MULTI_PROFILE_0400
     * @tc.name: testMultiProfile0004
     * @tc.desc: Verify that four profiles connect and disconnect one device without cross interference.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMultiProfile0004', 0, async () => {
      const a2dp = await initA2dp();
      const hfp = await initHfp();
      const hid = await initHid();
      const avrcp = await initAvrcp();
      const connected: boolean[] = await Promise.all(
        [a2dp.connect(DEVICE_MAIN), hfp.connect(DEVICE_MAIN), hid.connect(DEVICE_MAIN), avrcp.connect(DEVICE_MAIN)]);

      expect(connected[0]).assertTrue();
      expect(connected[1]).assertTrue();
      expect(connected[2]).assertTrue();
      expect(connected[3]).assertTrue();
      expect(a2dp.isConnected()).assertTrue();
      expect(hfp.isConnected()).assertTrue();
      expect(hid.isConnected()).assertTrue();
      expect(avrcp.isConnected()).assertTrue();
      expect(a2dp.getManagedDeviceCount()).assertEqual(1);
      expect(hfp.getManagedDeviceCount()).assertEqual(1);
      expect(hid.getManagedDeviceCount()).assertEqual(1);
      expect(avrcp.getManagedDeviceCount()).assertEqual(1);

      const released: boolean[] = await Promise.all(
        [a2dp.disconnect(DEVICE_MAIN), hfp.disconnect(DEVICE_MAIN),
          hid.disconnect(DEVICE_MAIN), avrcp.disconnect(DEVICE_MAIN)]);
      expect(released[0]).assertTrue();
      expect(released[1]).assertTrue();
      expect(released[2]).assertTrue();
      expect(released[3]).assertTrue();
      expect(a2dp.isConnected()).assertFalse();
      expect(hfp.isConnected()).assertFalse();
      expect(hid.isConnected()).assertFalse();
      expect(avrcp.isConnected()).assertFalse();
      expect(a2dp.getStatistics().disconnectionEvents).assertEqual(1);
      expect(avrcp.getStatistics().disconnectionEvents).assertEqual(1);
      expect(hid.getStatistics().totalConnectionAttempts).assertEqual(1);
      expect(hfp.getStatistics().connectionSuccessRate).assertEqual(100);
      expect(a2dp.getService().getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(avrcp.getService().getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);

      await a2dp.destroy();
      await hfp.destroy();
      await hid.destroy();
      await avrcp.destroy();
    });

    /*
     * @tc.number: SUB_MULTI_PROFILE_0500
     * @tc.name: testMultiProfile0005
     * @tc.desc: Verify that two profiles manage the same pair of devices with independent device lists.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMultiProfile0005', 0, async () => {
      const a2dp = await initA2dp();
      const pbap = await initPbap();
      const flags: boolean[] = await Promise.all(
        [a2dp.connect(DEVICE_MAIN), a2dp.connect(DEVICE_OTHER),
          pbap.connect(DEVICE_MAIN), pbap.connect(DEVICE_OTHER)]);
      for (let i = 0; i < flags.length; i++) {
        expect(flags[i]).assertTrue();
      }

      const a2dpIds = a2dp.getConnectedDeviceIds();
      const pbapIds = pbap.getConnectedDeviceIds();
      expect(a2dpIds.length).assertEqual(2);
      expect(pbapIds.length).assertEqual(2);
      expect(a2dpIds.indexOf(DEVICE_MAIN)).assertLargerOrEqual(0);
      expect(a2dpIds.indexOf(DEVICE_OTHER)).assertLargerOrEqual(0);
      expect(pbapIds.indexOf(DEVICE_MAIN)).assertLargerOrEqual(0);
      expect(pbapIds.indexOf(DEVICE_OTHER)).assertLargerOrEqual(0);
      expect(a2dpIds.indexOf(DEVICE_THIRD)).assertEqual(-1);
      expect(pbapIds.indexOf(DEVICE_THIRD)).assertEqual(-1);
      expect(a2dp.getStatistics().totalConnectionAttempts).assertEqual(2);
      expect(pbap.getStatistics().totalConnectionAttempts).assertEqual(2);
      expect(a2dp.getStatistics().managedDeviceCount).assertEqual(2);
      expect(pbap.getStatistics().connectedDeviceCount).assertEqual(2);
      expect(a2dp.getManagedDeviceCount()).assertEqual(pbap.getManagedDeviceCount());

      expect(await a2dp.disconnect(DEVICE_MAIN)).assertTrue();
      expect(a2dp.getManagedDeviceCount()).assertEqual(1);
      expect(pbap.getManagedDeviceCount()).assertEqual(2);
      expect(pbap.isConnected()).assertTrue();

      await pbap.disconnect(DEVICE_MAIN);
      await pbap.disconnect(DEVICE_OTHER);
      await a2dp.disconnect(DEVICE_OTHER);
      await a2dp.destroy();
      await pbap.destroy();
    });

    // ==================== 故障、健康度与配置隔离（5 条） ====================

    /*
     * @tc.number: SUB_MULTI_PROFILE_0600
     * @tc.name: testMultiProfile0006
     * @tc.desc: Verify that a connection failure of one profile leaves the other profiles healthy.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMultiProfile0006', 0, async () => {
      const a2dp = await initA2dp();
      const hfp = await initHfp();
      expect(await a2dp.connect('')).assertFalse();
      expect(await hfp.connect(DEVICE_MAIN)).assertTrue();

      const a2dpStats = a2dp.getStatistics();
      expect(a2dpStats.totalConnectionAttempts).assertEqual(1);
      expect(a2dpStats.failedConnections).assertEqual(1);
      expect(a2dpStats.successfulConnections).assertEqual(0);
      expect(a2dpStats.errorRate).assertEqual(50);
      expect(a2dpStats.healthScore).assertEqual(CRITICAL_SCORE);
      expect(a2dpStats.isHealthy).assertFalse();
      expect(a2dp.isConnected()).assertFalse();
      expect(a2dp.getConnectedDeviceIds().length).assertEqual(0);

      const hfpStats = hfp.getStatistics();
      expect(hfpStats.failedConnections).assertEqual(0);
      expect(hfpStats.successfulConnections).assertEqual(1);
      expect(hfpStats.totalOperations).assertEqual(2);
      expect(hfpStats.failedOperations).assertEqual(0);
      expect(hfpStats.errorRate).assertEqual(0);
      expect(hfpStats.connectionSuccessRate).assertEqual(100);
      expect(hfpStats.healthScore).assertEqual(HEALTHY_SCORE);
      expect(hfpStats.isHealthy).assertTrue();
      expect(hfp.isConnected()).assertTrue();
      expect(hfp.getOperationRecords()[1].success).assertTrue();

      await hfp.disconnect(DEVICE_MAIN);
      await a2dp.destroy();
      await hfp.destroy();
    });

    /*
     * @tc.number: SUB_MULTI_PROFILE_0700
     * @tc.name: testMultiProfile0007
     * @tc.desc: Compare the health scores of a degraded, a connected and an idle profile manager.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMultiProfile0007', 0, async () => {
      const a2dp = await initA2dp();
      const hfp = await initHfp();
      const hid = await initHid();
      expect(await a2dp.connect('')).assertFalse();
      expect(await a2dp.connect('')).assertFalse();
      expect(await hfp.connect(DEVICE_MAIN)).assertTrue();

      const a2dpStats = a2dp.getStatistics();
      expect(a2dpStats.totalConnectionAttempts).assertEqual(2);
      expect(a2dpStats.failedConnections).assertEqual(2);
      expect(a2dpStats.totalOperations).assertEqual(3);
      expect(a2dpStats.failedOperations).assertEqual(2);
      expect(a2dpStats.errorRate).assertEqual(2 / 3 * 100);
      expect(a2dpStats.healthScore).assertEqual(CRITICAL_SCORE);
      expect(a2dpStats.isHealthy).assertFalse();

      const hfpStats = hfp.getStatistics();
      expect(hfpStats.connectionSuccessRate).assertEqual(100);
      expect(hfpStats.errorRate).assertEqual(0);
      expect(hfpStats.healthScore).assertEqual(HEALTHY_SCORE);
      expect(hfpStats.isHealthy).assertTrue();

      const hidStats = hid.getStatistics();
      expect(hidStats.totalConnectionAttempts).assertEqual(0);
      expect(hidStats.totalOperations).assertEqual(1);
      expect(hidStats.healthScore).assertEqual(IDLE_SCORE);
      expect(hidStats.isHealthy).assertTrue();
      expect(a2dpStats.healthScore < hfpStats.healthScore).assertTrue();
      expect(hidStats.healthScore < hfpStats.healthScore).assertTrue();

      await hfp.disconnect(DEVICE_MAIN);
      await a2dp.destroy();
      await hfp.destroy();
      await hid.destroy();
    });

    /*
     * @tc.number: SUB_MULTI_PROFILE_0800
     * @tc.name: testMultiProfile0008
     * @tc.desc: Verify that a profile configuration change is applied only to the changed profile.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMultiProfile0008', 0, async () => {
      const a2dp = await initA2dp();
      const hfp = await initHfp();
      const a2dpConfig = a2dp.getConfig();
      a2dpConfig.maxManagedDevices = 1;
      a2dpConfig.connectionTimeoutMs = 60000;
      a2dp.setConfig(a2dpConfig);

      expect(a2dp.getConfig().maxManagedDevices).assertEqual(1);
      expect(a2dp.getConfig().connectionTimeoutMs).assertEqual(60000);
      expect(hfp.getConfig().maxManagedDevices).assertEqual(10);
      expect(hfp.getConfig().connectionTimeoutMs).assertEqual(30000);
      expect(hfp.getConfig().maxRetryAttempts).assertEqual(3);

      expect(await a2dp.connect(DEVICE_MAIN)).assertTrue();
      expect(await a2dp.connect(DEVICE_OTHER)).assertFalse();
      expect(await hfp.connect(DEVICE_MAIN)).assertTrue();
      expect(await hfp.connect(DEVICE_OTHER)).assertTrue();

      const blocked = a2dp.getOperationRecords()[2];
      expect(blocked.operationName).assertEqual('connect');
      expect(blocked.errorMessage).assertEqual('Max devices');
      expect(blocked.details).assertEqual('Maximum managed devices reached');
      expect(a2dp.getManagedDeviceCount()).assertEqual(1);
      expect(hfp.getManagedDeviceCount()).assertEqual(2);
      expect(a2dp.getStatistics().totalConnectionAttempts).assertEqual(1);
      expect(hfp.getStatistics().totalConnectionAttempts).assertEqual(2);
      expect(hfp.getStatistics().failedConnections).assertEqual(0);

      await hfp.disconnect(DEVICE_MAIN);
      await hfp.disconnect(DEVICE_OTHER);
      await a2dp.disconnect(DEVICE_MAIN);
      await a2dp.destroy();
      await hfp.destroy();
    });

    /*
     * @tc.number: SUB_MULTI_PROFILE_0900
     * @tc.name: testMultiProfile0009
     * @tc.desc: Verify that resetting one profile keeps the connections of the other profiles.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMultiProfile0009', 0, async () => {
      const a2dp = await initA2dp();
      const hfp = await initHfp();
      const hid = await initHid();
      await Promise.all([a2dp.connect(DEVICE_MAIN), hfp.connect(DEVICE_MAIN), hid.connect(DEVICE_MAIN)]);

      await a2dp.reset();
      expect(a2dp.isConnected()).assertFalse();
      expect(a2dp.getConnectedDeviceIds().length).assertEqual(0);
      expect(a2dp.getOperationRecords().length).assertEqual(1);
      expect(a2dp.getOperationRecords()[0].operationName).assertEqual('reset');
      expect(a2dp.getStatistics().totalConnectionAttempts).assertEqual(1);
      expect(a2dp.getStatistics().successfulConnections).assertEqual(1);
      expect(a2dp.getStatistics().totalOperations).assertEqual(4);
      expect(a2dp.getService().getOperationHistory().length).assertEqual(1);
      expect(hfp.isConnected()).assertTrue();
      expect(hid.isConnected()).assertTrue();
      expect(hfp.getConnectedDeviceIds()[0]).assertEqual(DEVICE_MAIN);
      expect(hfp.getOperationRecords().length).assertEqual(2);
      expect(hid.getOperationRecords().length).assertEqual(2);
      expect(hid.getStatistics().disconnectionEvents).assertEqual(0);

      expect(await a2dp.connect(DEVICE_OTHER)).assertTrue();
      expect(a2dp.getConnectedDeviceIds()[0]).assertEqual(DEVICE_OTHER);
      expect(a2dp.getStatistics().managedDeviceCount).assertEqual(1);

      await hid.disconnect(DEVICE_MAIN);
      await hfp.disconnect(DEVICE_MAIN);
      await a2dp.disconnect(DEVICE_OTHER);
      await a2dp.destroy();
      await hfp.destroy();
      await hid.destroy();
    });

    /*
     * @tc.number: SUB_MULTI_PROFILE_1000
     * @tc.name: testMultiProfile0010
     * @tc.desc: Verify that destroyed audio profile still refuses work while the voice profile keeps serving.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMultiProfile0010', 0, async () => {
      const a2dp = await initA2dp();
      const hfp = await initHfp();
      await Promise.all([a2dp.connect(DEVICE_MAIN), hfp.connect(DEVICE_MAIN)]);
      await a2dp.destroy();

      expect(a2dp.isConnected()).assertFalse();
      expect(await a2dp.connect(DEVICE_OTHER)).assertFalse();
      expect(await a2dp.disconnect(DEVICE_MAIN)).assertFalse();
      expect(await hfp.connect(DEVICE_OTHER)).assertTrue();
      expect(hfp.isConnected()).assertTrue();
      expect(hfp.getManagedDeviceCount()).assertEqual(2);
      expect(hfp.getStatistics().failedConnections).assertEqual(0);
      expect(hfp.getStatistics().successfulConnections).assertEqual(2);
      expect(hfp.getStatistics().healthScore).assertEqual(HEALTHY_SCORE);

      const a2dpRecords = a2dp.getOperationRecords();
      expect(a2dpRecords.length).assertEqual(3);
      expect(a2dpRecords[0].operationName).assertEqual('reset');
      expect(a2dpRecords[1].errorMessage).assertEqual('Not ready');
      expect(a2dp.getStatistics().totalConnectionAttempts).assertEqual(1);
      expect(a2dp.getStatistics().failedConnections).assertEqual(0);

      await hfp.disconnect(DEVICE_MAIN);
      await hfp.disconnect(DEVICE_OTHER);
      await hfp.destroy();
    });

    // ==================== 统一守卫行为（4 条） ====================

    /*
     * @tc.number: SUB_MULTI_PROFILE_1100
     * @tc.name: testMultiProfile0011
     * @tc.desc: Verify that uninitialized managers of four profiles refuse connect and disconnect alike.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMultiProfile0011', 0, async () => {
      const a2dp = new A2dpProfileManager();
      const hfp = new HfpProfileManager();
      const hid = new HidProfileManager();
      const pan = new PanProfileManager();

      expect(await a2dp.connect(DEVICE_MAIN)).assertFalse();
      expect(await hfp.connect(DEVICE_MAIN)).assertFalse();
      expect(await hid.connect(DEVICE_MAIN)).assertFalse();
      expect(await pan.connect(DEVICE_MAIN)).assertFalse();
      expect(await a2dp.disconnect(DEVICE_MAIN)).assertFalse();
      expect(await hfp.disconnect(DEVICE_MAIN)).assertFalse();
      expect(await hid.disconnect(DEVICE_MAIN)).assertFalse();
      expect(await pan.disconnect(DEVICE_MAIN)).assertFalse();

      const a2dpRecords = a2dp.getOperationRecords();
      const panRecords = pan.getOperationRecords();
      expect(a2dpRecords.length).assertEqual(2);
      expect(hfp.getOperationRecords().length).assertEqual(2);
      expect(hid.getOperationRecords().length).assertEqual(2);
      expect(panRecords.length).assertEqual(2);
      expect(a2dpRecords[0].errorMessage).assertEqual('Not ready');
      expect(a2dpRecords[1].operationName).assertEqual('disconnect');
      expect(panRecords[1].errorMessage).assertEqual('Not ready');

      expect(a2dp.getStatistics().totalConnectionAttempts).assertEqual(0);
      expect(hfp.getStatistics().failedConnections).assertEqual(0);
      expect(hid.getStatistics().totalOperations).assertEqual(2);
      expect(pan.getStatistics().failedOperations).assertEqual(2);
      expect(a2dp.getStatistics().errorRate).assertEqual(100);
      expect(hfp.getStatistics().healthScore).assertEqual(CRITICAL_SCORE);
      expect(hid.getStatistics().isHealthy).assertFalse();
      expect(pan.getStatistics().healthScore).assertEqual(CRITICAL_SCORE);
      expect(a2dp.getService().getOperationHistory().length).assertEqual(0);
      expect(hid.getService().getOperationHistory().length).assertEqual(0);
      expect(pan.getService().getOperationHistory().length).assertEqual(0);
      expect(a2dp.getConnectedDeviceIds().length).assertEqual(0);
    });

    /*
     * @tc.number: SUB_MULTI_PROFILE_1200
     * @tc.name: testMultiProfile0012
     * @tc.desc: Verify that an empty device identifier is refused by every initialized profile manager.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMultiProfile0012', 0, async () => {
      const a2dp = await initA2dp();
      const hfp = await initHfp();
      const hid = await initHid();
      const pbap = await initPbap();

      expect(await a2dp.connect('')).assertFalse();
      expect(await hfp.connect('')).assertFalse();
      expect(await hid.connect('')).assertFalse();
      expect(await pbap.connect('')).assertFalse();

      const a2dpRecords = a2dp.getOperationRecords();
      expect(a2dpRecords[1].errorMessage).assertEqual('Connection failed');
      expect(a2dpRecords[1].details).assertEqual('Failed to connect to ');
      expect(hfp.getOperationRecords()[1].details).assertEqual('Failed to connect to ');
      expect(pbap.getOperationRecords().length).assertEqual(2);
      expect(a2dp.getStatistics().totalConnectionAttempts).assertEqual(1);
      expect(hid.getStatistics().failedConnections).assertEqual(1);
      expect(hfp.getStatistics().successfulConnections).assertEqual(0);
      expect(pbap.getStatistics().errorRate).assertEqual(50);
      expect(a2dp.getStatistics().healthScore).assertEqual(CRITICAL_SCORE);
      expect(hid.getStatistics().isHealthy).assertFalse();
      expect(a2dp.getService().getOperationHistory()[1].details).assertEqual('Invalid device ID');
      expect(hfp.getService().getOperationHistory()[1].details).assertEqual('Invalid device ID');
      expect(pbap.getService().getOperationHistory().length).assertEqual(2);
      expect(a2dp.getConnectedDeviceIds().length).assertEqual(0);
      expect(hid.isConnected()).assertFalse();
      expect(pbap.isConnected()).assertFalse();

      await a2dp.destroy();
      await hfp.destroy();
      await hid.destroy();
      await pbap.destroy();
    });

    /*
     * @tc.number: SUB_MULTI_PROFILE_1300
     * @tc.name: testMultiProfile0013
     * @tc.desc: Verify that disconnecting an unmanaged device is refused without calling the services.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMultiProfile0013', 0, async () => {
      const a2dp = await initA2dp();
      const hfp = await initHfp();
      const hid = await initHid();

      expect(await a2dp.disconnect(GHOST_DEVICE)).assertFalse();
      expect(await hfp.disconnect(GHOST_DEVICE)).assertFalse();
      expect(await hid.disconnect(GHOST_DEVICE)).assertFalse();

      const a2dpRecords = a2dp.getOperationRecords();
      expect(a2dpRecords[1].errorMessage).assertEqual('Not managed');
      expect(a2dpRecords[1].details).assertEqual(`Device ${GHOST_DEVICE} not managed`);
      expect(hfp.getOperationRecords()[1].operationName).assertEqual('disconnect');
      expect(hid.getOperationRecords().length).assertEqual(2);
      expect(a2dp.getStatistics().disconnectionEvents).assertEqual(0);
      expect(hfp.getStatistics().totalConnectionAttempts).assertEqual(0);
      expect(hid.getStatistics().failedOperations).assertEqual(1);
      expect(a2dp.getStatistics().errorRate).assertEqual(50);
      expect(hfp.getStatistics().healthScore).assertEqual(CRITICAL_SCORE);
      expect(hid.getStatistics().isHealthy).assertFalse();
      expect(a2dp.getService().getOperationHistory().length).assertEqual(1);
      expect(hfp.getService().getOperationHistory().length).assertEqual(1);
      expect(hid.getService().getOperationHistory().length).assertEqual(1);
      expect(a2dp.getConnectedDeviceIds().length).assertEqual(0);
      expect(hid.getService().getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);

      await a2dp.destroy();
      await hfp.destroy();
      await hid.destroy();
    });

    /*
     * @tc.number: SUB_MULTI_PROFILE_1400
     * @tc.name: testMultiProfile0014
     * @tc.desc: Verify that a repeated initialization is refused for every profile manager involved.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMultiProfile0014', 0, async () => {
      const a2dp = await initA2dp();
      const hfp = await initHfp();
      const hid = await initHid();
      const pan = await initPan();

      expect(await a2dp.initialize()).assertFalse();
      expect(await hfp.initialize()).assertFalse();
      expect(await hid.initialize()).assertFalse();
      expect(await pan.initialize()).assertFalse();

      expect(a2dp.getOperationRecords().length).assertEqual(1);
      expect(hfp.getOperationRecords().length).assertEqual(1);
      expect(hid.getOperationRecords().length).assertEqual(1);
      expect(pan.getOperationRecords().length).assertEqual(1);
      expect(a2dp.getStatistics().totalOperations).assertEqual(1);
      expect(hfp.getStatistics().totalOperations).assertEqual(1);
      expect(a2dp.getService().getOperationHistory().length).assertEqual(1);
      expect(hid.getService().getOperationHistory().length).assertEqual(1);
      expect(pan.getService().getOperationHistory().length).assertEqual(1);
      expect(pan.getProfileType()).assertEqual(BluetoothProfileType.PAN);

      const flags: boolean[] = await Promise.all([a2dp.connect(DEVICE_MAIN), pan.connect(DEVICE_MAIN)]);
      expect(flags[0]).assertTrue();
      expect(flags[1]).assertTrue();
      expect(a2dp.isConnected()).assertTrue();
      expect(pan.isConnected()).assertTrue();
      expect(hid.isConnected()).assertFalse();

      await a2dp.disconnect(DEVICE_MAIN);
      await pan.disconnect(DEVICE_MAIN);
      await a2dp.destroy();
      await hfp.destroy();
      await hid.destroy();
      await pan.destroy();
    });

    /*
     * @tc.number: SUB_MULTI_PROFILE_1500
     * @tc.name: testMultiProfile0015
     * @tc.desc: Verify that non audio profiles reach the connected service state for one shared device.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMultiProfile0015', 0, async () => {
      const pan = await initPan();
      const map = await initMap();
      const hdp = await initHdp();
      const pbap = await initPbap();
      const flags: boolean[] = await Promise.all(
        [pan.connect(DEVICE_MAIN), map.connect(DEVICE_MAIN),
          hdp.connect(DEVICE_MAIN), pbap.connect(DEVICE_MAIN)]);

      expect(flags[0]).assertTrue();
      expect(flags[1]).assertTrue();
      expect(flags[2]).assertTrue();
      expect(flags[3]).assertTrue();
      expect(pan.getProfileType()).assertEqual(BluetoothProfileType.PAN);
      expect(map.getProfileType()).assertEqual(BluetoothProfileType.MAP);
      expect(hdp.getProfileType()).assertEqual(BluetoothProfileType.HDP);
      expect(pbap.getProfileType()).assertEqual(BluetoothProfileType.PBAP);
      expect(pan.isConnected()).assertTrue();
      expect(map.isConnected()).assertTrue();
      expect(hdp.isConnected()).assertTrue();
      expect(pbap.isConnected()).assertTrue();
      expect(pan.getService().getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(map.getService().getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(hdp.getService().getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(pbap.getService().getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(pan.getConnectedDeviceIds()[0]).assertEqual(DEVICE_MAIN);
      expect(pbap.getStatistics().successfulConnections).assertEqual(1);
      expect(map.getStatistics().managedDeviceCount).assertEqual(1);

      expect(await pan.disconnect(DEVICE_MAIN)).assertTrue();
      expect(await map.disconnect(DEVICE_MAIN)).assertTrue();
      expect(await hdp.disconnect(DEVICE_MAIN)).assertTrue();
      expect(await pbap.disconnect(DEVICE_MAIN)).assertTrue();
      expect(pan.getStatistics().disconnectionEvents).assertEqual(1);
      expect(map.getStatistics().disconnectionEvents).assertEqual(1);
      expect(hdp.getStatistics().disconnectionEvents).assertEqual(1);
      expect(pbap.getStatistics().disconnectionEvents).assertEqual(1);
      expect(pan.isConnected()).assertFalse();
      expect(pbap.isConnected()).assertFalse();

      await pan.destroy();
      await map.destroy();
      await hdp.destroy();
      await pbap.destroy();
    });

    // ==================== 数据与统计隔离（5 条） ====================

    /*
     * @tc.number: SUB_MULTI_PROFILE_1600
     * @tc.name: testMultiProfile0016
     * @tc.desc: Verify that profile models stay independent while both profiles are active.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMultiProfile0016', 0, async () => {
      const a2dp = await initA2dp();
      const hfp = await initHfp();
      const idleAudio = a2dp.getModel();
      expect(idleAudio.volume).assertEqual(50);
      expect(idleAudio.codec).assertEqual(0);
      expect(idleAudio.isPlaying).assertFalse();
      expect(idleAudio.bitRate).assertEqual(0);
      const idleCall = hfp.getModel();
      expect(idleCall.callState).assertEqual(0);
      expect(idleCall.phoneNumber).assertEqual('');

      await Promise.all([a2dp.connect(DEVICE_MAIN), hfp.connect(DEVICE_MAIN)]);
      expect(await a2dp.getService().play()).assertTrue();
      expect(a2dp.getModel().isPlaying).assertTrue();
      expect(hfp.getModel().callState).assertEqual(0);

      expect(await hfp.getService().answerCall()).assertTrue();
      expect(hfp.getModel().callState).assertEqual(1);
      expect(a2dp.getModel().isPlaying).assertTrue();
      expect(a2dp.getModel().volume).assertEqual(50);

      expect(await a2dp.setVolume(30)).assertTrue();
      expect(a2dp.getModel().volume).assertEqual(30);
      expect(hfp.getModel().phoneNumber).assertEqual('');
      expect(a2dp.getConnectedDeviceIds()[0]).assertEqual(DEVICE_MAIN);
      expect(hfp.getConnectedDeviceIds()[0]).assertEqual(DEVICE_MAIN);
      expect(a2dp.getStatistics().failedOperations).assertEqual(0);
      expect(hfp.getStatistics().failedOperations).assertEqual(0);

      await a2dp.disconnect(DEVICE_MAIN);
      await hfp.disconnect(DEVICE_MAIN);
      await a2dp.destroy();
      await hfp.destroy();
    });

    /*
     * @tc.number: SUB_MULTI_PROFILE_1700
     * @tc.name: testMultiProfile0017
     * @tc.desc: Verify that a statistics snapshot of one profile is not rewritten by another profile.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMultiProfile0017', 0, async () => {
      const a2dp = await initA2dp();
      const hfp = await initHfp();
      await Promise.all([a2dp.connect(DEVICE_MAIN), hfp.connect(DEVICE_MAIN)]);

      const a2dpSnap = a2dp.getStatistics();
      const hfpSnap = hfp.getStatistics();
      expect(a2dpSnap.totalConnectionAttempts).assertEqual(1);
      expect(hfpSnap.totalConnectionAttempts).assertEqual(1);
      expect(a2dpSnap.totalOperations).assertEqual(2);
      expect(a2dpSnap.successfulConnections).assertEqual(1);
      expect(hfpSnap.errorRate).assertEqual(0);

      expect(await a2dp.connect(DEVICE_OTHER)).assertTrue();
      expect(a2dpSnap.totalConnectionAttempts).assertEqual(1);
      expect(a2dpSnap.totalOperations).assertEqual(2);
      expect(a2dpSnap.successfulConnections).assertEqual(1);
      expect(hfpSnap.totalOperations).assertEqual(2);
      expect(a2dp.getStatistics().totalConnectionAttempts).assertEqual(2);
      expect(a2dp.getStatistics().totalOperations).assertEqual(3);
      expect(a2dp.getStatistics().managedDeviceCount).assertEqual(2);
      expect(hfp.getStatistics().totalConnectionAttempts).assertEqual(1);
      expect(hfp.getStatistics().totalOperations).assertEqual(2);
      expect(hfp.getConnectedDeviceIds().length).assertEqual(1);
      expect(a2dp.getConnectedDeviceIds().length).assertEqual(2);

      a2dpSnap.totalOperations = 999;
      expect(a2dp.getStatistics().totalOperations).assertEqual(3);

      await a2dp.disconnect(DEVICE_MAIN);
      await a2dp.disconnect(DEVICE_OTHER);
      await hfp.disconnect(DEVICE_MAIN);
      await a2dp.destroy();
      await hfp.destroy();
    });

    /*
     * @tc.number: SUB_MULTI_PROFILE_1800
     * @tc.name: testMultiProfile0018
     * @tc.desc: Verify that a reset of three profiles clears their records while their counters are kept.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMultiProfile0018', 0, async () => {
      const a2dp = await initA2dp();
      const hfp = await initHfp();
      const hid = await initHid();
      expect(await a2dp.connect('')).assertFalse();
      expect(await a2dp.connect('')).assertFalse();
      expect(await hfp.connect(DEVICE_MAIN)).assertTrue();
      expect(await hid.disconnect(GHOST_DEVICE)).assertFalse();

      await Promise.all([a2dp.reset(), hfp.reset(), hid.reset()]);

      expect(a2dp.getOperationRecords().length).assertEqual(1);
      expect(hfp.getOperationRecords().length).assertEqual(1);
      expect(hid.getOperationRecords().length).assertEqual(1);
      expect(a2dp.getOperationRecords()[0].operationName).assertEqual('reset');
      expect(hfp.getOperationRecords()[0].details).assertEqual('Manager reset');
      expect(hid.getOperationRecords()[0].success).assertTrue();
      expect(a2dp.getService().getOperationHistory().length).assertEqual(1);
      expect(hfp.getService().getOperationHistory().length).assertEqual(1);
      expect(hid.getService().getOperationHistory().length).assertEqual(1);

      const a2dpStats = a2dp.getStatistics();
      expect(a2dpStats.totalConnectionAttempts).assertEqual(2);
      expect(a2dpStats.failedConnections).assertEqual(2);
      expect(a2dpStats.totalOperations).assertEqual(4);
      expect(a2dpStats.failedOperations).assertEqual(2);
      const hfpStats = hfp.getStatistics();
      expect(hfpStats.successfulConnections).assertEqual(1);
      expect(hfpStats.disconnectionEvents).assertEqual(1);
      expect(hfpStats.totalOperations).assertEqual(4);
      expect(hfpStats.failedOperations).assertEqual(0);
      expect(hfpStats.healthScore).assertEqual(HEALTHY_SCORE);
      const hidStats = hid.getStatistics();
      expect(hidStats.totalConnectionAttempts).assertEqual(0);
      expect(hidStats.totalOperations).assertEqual(3);
      expect(hidStats.failedOperations).assertEqual(1);
      expect(hidStats.errorRate).assertEqual(1 / 3 * 100);
      expect(hidStats.healthScore).assertEqual(20);
      expect(a2dp.isConnected()).assertFalse();
      expect(hfp.isConnected()).assertFalse();
      expect(hid.isConnected()).assertFalse();

      await a2dp.destroy();
      await hfp.destroy();
      await hid.destroy();
    });

    /*
     * @tc.number: SUB_MULTI_PROFILE_1900
     * @tc.name: testMultiProfile0019
     * @tc.desc: Verify that operation records of each profile grow only with the operations of that profile.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMultiProfile0019', 0, async () => {
      const a2dp = await initA2dp();
      const hfp = await initHfp();
      const hid = await initHid();
      expect(await a2dp.connect('')).assertFalse();
      expect(await hfp.connect('')).assertFalse();
      expect(await hid.connect('')).assertFalse();

      expect(a2dp.getOperationRecords().length).assertEqual(2);
      expect(hfp.getOperationRecords().length).assertEqual(2);
      expect(hid.getOperationRecords().length).assertEqual(2);
      expect(a2dp.getOperationRecords()[1].operationId).assertEqual('mgr_op_2');
      expect(hfp.getOperationRecords()[1].errorMessage).assertEqual('Connection failed');
      expect(hid.getOperationRecords()[1].details).assertEqual('Failed to connect to ');
      expect(a2dp.getStatistics().failedOperations).assertEqual(1);
      expect(hfp.getStatistics().totalOperations).assertEqual(2);
      expect(hid.getStatistics().errorRate).assertEqual(50);

      expect(await a2dp.disconnect(GHOST_DEVICE)).assertFalse();
      expect(await a2dp.disconnect(GHOST_DEVICE)).assertFalse();
      expect(a2dp.getOperationRecords().length).assertEqual(4);
      expect(hfp.getOperationRecords().length).assertEqual(2);
      expect(hid.getOperationRecords().length).assertEqual(2);
      expect(a2dp.getOperationRecords()[3].operationId).assertEqual('mgr_op_4');
      expect(a2dp.getOperationRecords()[2].errorMessage).assertEqual('Not managed');
      expect(a2dp.getStatistics().failedOperations).assertEqual(3);
      expect(a2dp.getStatistics().totalOperations).assertEqual(4);
      expect(hfp.getStatistics().failedOperations).assertEqual(1);
      expect(hid.getStatistics().totalOperations).assertEqual(2);
      expect(hid.getService().getOperationHistory().length).assertEqual(2);

      await a2dp.destroy();
      await hfp.destroy();
      await hid.destroy();
    });

    /*
     * @tc.number: SUB_MULTI_PROFILE_2000
     * @tc.name: testMultiProfile0020
     * @tc.desc: Walk one audio and one voice profile through initialization, reset, destruction and recovery.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMultiProfile0020', 0, async () => {
      const a2dp = new A2dpProfileManager();
      const hfp = new HfpProfileManager();
      expect(await a2dp.connect(DEVICE_MAIN)).assertFalse();
      expect(a2dp.getOperationRecords().length).assertEqual(1);

      expect(await a2dp.initialize()).assertTrue();
      expect(await hfp.initialize()).assertTrue();
      expect(a2dp.getOperationRecords().length).assertEqual(1);
      expect(a2dp.getOperationRecords()[0].operationName).assertEqual('initialize');

      const flags: boolean[] = await Promise.all([a2dp.connect(DEVICE_MAIN), hfp.connect(DEVICE_MAIN)]);
      expect(flags[0]).assertTrue();
      expect(flags[1]).assertTrue();
      expect(a2dp.isConnected()).assertTrue();
      expect(hfp.isConnected()).assertTrue();

      await a2dp.reset();
      expect(a2dp.isConnected()).assertFalse();
      expect(hfp.isConnected()).assertTrue();
      expect(await a2dp.connect(DEVICE_OTHER)).assertTrue();
      const recovered = a2dp.getStatistics();
      expect(recovered.totalConnectionAttempts).assertEqual(2);
      expect(recovered.successfulConnections).assertEqual(2);
      expect(recovered.failedOperations).assertEqual(0);
      expect(recovered.totalOperations).assertEqual(5);
      expect(recovered.healthScore).assertEqual(HEALTHY_SCORE);
      expect(recovered.connectionSuccessRate).assertEqual(100);

      await a2dp.destroy();
      expect(await a2dp.connect(DEVICE_THIRD)).assertFalse();
      expect(a2dp.getOperationRecords().length).assertEqual(2);
      expect(a2dp.getOperationRecords()[1].errorMessage).assertEqual('Not ready');
      expect(a2dp.isConnected()).assertFalse();

      expect(await hfp.connect(DEVICE_OTHER)).assertTrue();
      expect(hfp.getManagedDeviceCount()).assertEqual(2);
      expect(hfp.getStatistics().totalConnectionAttempts).assertEqual(2);
      await hfp.disconnect(DEVICE_OTHER);
      expect(hfp.getConnectedDeviceIds()[0]).assertEqual(DEVICE_MAIN);
      await hfp.destroy();
      expect(hfp.isConnected()).assertFalse();
      expect(hfp.getStatistics().disconnectionEvents).assertEqual(2);
      expect(hfp.getOperationRecords().length).assertEqual(1);
      expect(hfp.getOperationRecords()[0].operationName).assertEqual('reset');
      expect(hfp.getStatistics().successfulConnections).assertEqual(2);
      expect(hfp.getProfileType()).assertEqual(BluetoothProfileType.HFP);
    });
  });
}
