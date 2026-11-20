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
import { hilog } from '@kit.PerformanceAnalysisKit';
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
  const manager: A2dpProfileManager = new A2dpProfileManager();
  await manager.initialize();
  return manager;
}

async function initHfp(): Promise<HfpProfileManager> {
  const manager: HfpProfileManager = new HfpProfileManager();
  await manager.initialize();
  return manager;
}

async function initHid(): Promise<HidProfileManager> {
  const manager: HidProfileManager = new HidProfileManager();
  await manager.initialize();
  return manager;
}

async function initPan(): Promise<PanProfileManager> {
  const manager: PanProfileManager = new PanProfileManager();
  await manager.initialize();
  return manager;
}

async function initPbap(): Promise<PbapProfileManager> {
  const manager: PbapProfileManager = new PbapProfileManager();
  await manager.initialize();
  return manager;
}

async function initMap(): Promise<MapProfileManager> {
  const manager: MapProfileManager = new MapProfileManager();
  await manager.initialize();
  return manager;
}

async function initAvrcp(): Promise<AvrcpProfileManager> {
  const manager: AvrcpProfileManager = new AvrcpProfileManager();
  await manager.initialize();
  return manager;
}

async function initHdp(): Promise<HdpProfileManager> {
  const manager: HdpProfileManager = new HdpProfileManager();
  await manager.initialize();
  return manager;
}

export default function multiProfileIntegrationTest(): void {
  describe('MultiProfileIntegrationTest', () => {
    // ==================== multi-profile initialize and body copy (1 cases) ====================

    /*
     * @tc.number: SUB_MULTI_PROFILE_0100
     * @tc.name: testMultiProfile0001
     * @tc.desc: Verify that all eight profile managers initialize on their own and expose their profile type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMultiProfile0001', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0001', 'begin');
      const a2dp = await initA2dp();
      const hfp = await initHfp();
      const hid = await initHid();
      const pan = await initPan();
      const pbap = await initPbap();
      const map = await initMap();
      const avrcp = await initAvrcp();
      const hdp = await initHdp();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#1 assert ' + "expect(a2dp.getProfileType()).assertEqual(BluetoothProfileType.A2DP)");
      expect(a2dp.getProfileType()).assertEqual(BluetoothProfileType.A2DP);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#2 assert ' + "expect(hfp.getProfileType()).assertEqual(BluetoothProfileType.HFP)");
      expect(hfp.getProfileType()).assertEqual(BluetoothProfileType.HFP);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#3 assert ' + "expect(hid.getProfileType()).assertEqual(BluetoothProfileType.HID)");
      expect(hid.getProfileType()).assertEqual(BluetoothProfileType.HID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#4 assert ' + "expect(pan.getProfileType()).assertEqual(BluetoothProfileType.PAN)");
      expect(pan.getProfileType()).assertEqual(BluetoothProfileType.PAN);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#5 assert ' + "expect(pbap.getProfileType()).assertEqual(BluetoothProfileType.PBAP)");
      expect(pbap.getProfileType()).assertEqual(BluetoothProfileType.PBAP);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#6 assert ' + "expect(map.getProfileType()).assertEqual(BluetoothProfileType.MAP)");
      expect(map.getProfileType()).assertEqual(BluetoothProfileType.MAP);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#7 assert ' + "expect(avrcp.getProfileType()).assertEqual(BluetoothProfileType.AVRCP)");
      expect(avrcp.getProfileType()).assertEqual(BluetoothProfileType.AVRCP);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#8 assert ' + "expect(hdp.getProfileType()).assertEqual(BluetoothProfileType.HDP)");
      expect(hdp.getProfileType()).assertEqual(BluetoothProfileType.HDP);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#9 assert ' + "expect(a2dp.isConnected()).assertFalse()");
      expect(a2dp.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#10 assert ' + "expect(hfp.isConnected()).assertFalse()");
      expect(hfp.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#11 assert ' + "expect(hid.isConnected()).assertFalse()");
      expect(hid.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#12 assert ' + "expect(pan.isConnected()).assertFalse()");
      expect(pan.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#13 assert ' + "expect(pbap.isConnected()).assertFalse()");
      expect(pbap.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#14 assert ' + "expect(map.isConnected()).assertFalse()");
      expect(map.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#15 assert ' + "expect(avrcp.isConnected()).assertFalse()");
      expect(avrcp.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#16 assert ' + "expect(hdp.isConnected()).assertFalse()");
      expect(hdp.isConnected()).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#17 assert ' + "expect(a2dp.getOperationRecords().length).assertEqual(1)");
      expect(a2dp.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#18 assert ' + "expect(hfp.getOperationRecords().length).assertEqual(1)");
      expect(hfp.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#19 assert ' + "expect(hid.getOperationRecords().length).assertEqual(1)");
      expect(hid.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#20 assert ' + "expect(pan.getOperationRecords().length).assertEqual(1)");
      expect(pan.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#21 assert ' + "expect(pbap.getOperationRecords().length).assertEqual(1)");
      expect(pbap.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#22 assert ' + "expect(map.getOperationRecords().length).assertEqual(1)");
      expect(map.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#23 assert ' + "expect(avrcp.getOperationRecords().length).assertEqual(1)");
      expect(avrcp.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#24 assert ' + "expect(hdp.getOperationRecords().length).assertEqual(1)");
      expect(hdp.getOperationRecords().length).assertEqual(1);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#25 assert ' + "expect(a2dp.getStatistics().totalOperations).assertEqual(1)");
      expect(a2dp.getStatistics().totalOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#26 assert ' + "expect(hfp.getStatistics().totalOperations).assertEqual(1)");
      expect(hfp.getStatistics().totalOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#27 assert ' + "expect(hid.getStatistics().totalOperations).assertEqual(1)");
      expect(hid.getStatistics().totalOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#28 assert ' + "expect(pan.getStatistics().totalOperations).assertEqual(1)");
      expect(pan.getStatistics().totalOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#29 assert ' + "expect(pbap.getStatistics().totalOperations).assertEqual(1)");
      expect(pbap.getStatistics().totalOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#30 assert ' + "expect(map.getStatistics().totalOperations).assertEqual(1)");
      expect(map.getStatistics().totalOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#31 assert ' + "expect(avrcp.getStatistics().totalOperations).assertEqual(1)");
      expect(avrcp.getStatistics().totalOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#32 assert ' + "expect(hdp.getStatistics().totalOperations).assertEqual(1)");
      expect(hdp.getStatistics().totalOperations).assertEqual(1);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#33 assert ' +
        "expect(a2dp.getService().getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(a2dp.getService().getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#34 assert ' +
        "expect(hfp.getService().getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(hfp.getService().getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#35 assert ' +
        "expect(hdp.getService().getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(hdp.getService().getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#36 assert ' + "expect(a2dp.getConnectedDeviceIds().length).assertEqual(0)");
      expect(a2dp.getConnectedDeviceIds().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#37 assert ' + "expect(hfp.getConnectedDeviceIds().length).assertEqual(0)");
      expect(hfp.getConnectedDeviceIds().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0001',
        '#38 assert ' + "expect(hdp.getConnectedDeviceIds().length).assertEqual(0)");
      expect(hdp.getConnectedDeviceIds().length).assertEqual(0);

      await a2dp.destroy();
      await hfp.destroy();
      await hid.destroy();
      await pan.destroy();
      await pbap.destroy();
      await map.destroy();
      await avrcp.destroy();
      await hdp.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0001', 'end');
    });

    // ==================== same one device multi-profile parallel access (4 cases) ====================

    /*
     * @tc.number: SUB_MULTI_PROFILE_0200
     * @tc.name: testMultiProfile0002
     * @tc.desc: Verify that one device can be connected through audio and voice profiles at the same time.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMultiProfile0002', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0002', 'begin');
      const a2dp = await initA2dp();
      const hfp = await initHfp();
      const hid = await initHid();
      const flags: boolean[] = await Promise.all(
        [a2dp.connect(DEVICE_MAIN), hfp.connect(DEVICE_MAIN), hid.connect(DEVICE_MAIN)]);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0002',
        '#1 ' + "flags[0]" + ' = ' + JSON.stringify(flags[0]));
      expect(flags[0]).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0002',
        '#2 ' + "flags[1]" + ' = ' + JSON.stringify(flags[1]));
      expect(flags[1]).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0002',
        '#3 ' + "flags[2]" + ' = ' + JSON.stringify(flags[2]));
      expect(flags[2]).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0002',
        '#4 assert ' + "expect(a2dp.isConnected()).assertTrue()");
      expect(a2dp.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0002',
        '#5 assert ' + "expect(hfp.isConnected()).assertTrue()");
      expect(hfp.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0002',
        '#6 assert ' + "expect(hid.isConnected()).assertTrue()");
      expect(hid.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0002',
        '#7 assert ' + "expect(a2dp.getConnectedDeviceIds()[0]).assertEqual(DEVICE_MAIN)");
      expect(a2dp.getConnectedDeviceIds()[0]).assertEqual(DEVICE_MAIN);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0002',
        '#8 assert ' + "expect(hfp.getConnectedDeviceIds()[0]).assertEqual(DEVICE_MAIN)");
      expect(hfp.getConnectedDeviceIds()[0]).assertEqual(DEVICE_MAIN);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0002',
        '#9 assert ' + "expect(hid.getConnectedDeviceIds()[0]).assertEqual(DEVICE_MAIN)");
      expect(hid.getConnectedDeviceIds()[0]).assertEqual(DEVICE_MAIN);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0002',
        '#10 assert ' +
        "expect(a2dp.getService().getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED)");
      expect(a2dp.getService().getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0002',
        '#11 assert ' +
        "expect(hfp.getService().getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED)");
      expect(hfp.getService().getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0002',
        '#12 assert ' +
        "expect(hid.getService().getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED)");
      expect(hid.getService().getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0002',
        '#13 assert ' + "expect(a2dp.getStatistics().successfulConnections).assertEqual(1)");
      expect(a2dp.getStatistics().successfulConnections).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0002',
        '#14 assert ' + "expect(hfp.getStatistics().successfulConnections).assertEqual(1)");
      expect(hfp.getStatistics().successfulConnections).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0002',
        '#15 assert ' + "expect(hid.getStatistics().successfulConnections).assertEqual(1)");
      expect(hid.getStatistics().successfulConnections).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0002',
        '#16 assert ' + "expect(a2dp.getStatistics().managedDeviceCount).assertEqual(1)");
      expect(a2dp.getStatistics().managedDeviceCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0002',
        '#17 assert ' + "expect(hfp.getStatistics().managedDeviceCount).assertEqual(1)");
      expect(hfp.getStatistics().managedDeviceCount).assertEqual(1);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0002',
        '#18 assert ' + "expect(await a2dp.disconnect(DEVICE_MAIN)).assertTrue()");
      expect(await a2dp.disconnect(DEVICE_MAIN)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0002',
        '#19 assert ' + "expect(a2dp.isConnected()).assertFalse()");
      expect(a2dp.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0002',
        '#20 assert ' + "expect(hfp.isConnected()).assertTrue()");
      expect(hfp.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0002',
        '#21 assert ' + "expect(hid.isConnected()).assertTrue()");
      expect(hid.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0002',
        '#22 assert ' + "expect(hfp.getStatistics().disconnectionEvents).assertEqual(0)");
      expect(hfp.getStatistics().disconnectionEvents).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0002',
        '#23 assert ' +
        "expect(a2dp.getService().getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(a2dp.getService().getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);

      await hid.disconnect(DEVICE_MAIN);
      await hfp.disconnect(DEVICE_MAIN);
      await a2dp.destroy();
      await hfp.destroy();
      await hid.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0002', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0003', 'begin');
      const a2dp = await initA2dp();
      const hfp = await initHfp();
      const hid = await initHid();
      await Promise.all([a2dp.connect(DEVICE_MAIN), hfp.connect(DEVICE_MAIN), hid.connect(DEVICE_MAIN)]);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0003',
        '#1 assert ' + "expect(await a2dp.disconnect(DEVICE_MAIN)).assertTrue()");
      expect(await a2dp.disconnect(DEVICE_MAIN)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0003',
        '#2 assert ' + "expect(a2dp.isConnected()).assertFalse()");
      expect(a2dp.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0003',
        '#3 assert ' + "expect(hfp.isConnected()).assertTrue()");
      expect(hfp.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0003',
        '#4 assert ' + "expect(hid.isConnected()).assertTrue()");
      expect(hid.isConnected()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0003',
        '#5 assert ' + "expect(await hid.disconnect(DEVICE_MAIN)).assertTrue()");
      expect(await hid.disconnect(DEVICE_MAIN)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0003',
        '#6 assert ' + "expect(hid.isConnected()).assertFalse()");
      expect(hid.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0003',
        '#7 assert ' + "expect(a2dp.isConnected()).assertFalse()");
      expect(a2dp.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0003',
        '#8 assert ' + "expect(hfp.isConnected()).assertTrue()");
      expect(hfp.isConnected()).assertTrue();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0003',
        '#9 assert ' + "expect(await hfp.disconnect(DEVICE_MAIN)).assertTrue()");
      expect(await hfp.disconnect(DEVICE_MAIN)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0003',
        '#10 assert ' + "expect(hfp.isConnected()).assertFalse()");
      expect(hfp.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0003',
        '#11 assert ' + "expect(a2dp.getStatistics().disconnectionEvents).assertEqual(1)");
      expect(a2dp.getStatistics().disconnectionEvents).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0003',
        '#12 assert ' + "expect(hfp.getStatistics().disconnectionEvents).assertEqual(1)");
      expect(hfp.getStatistics().disconnectionEvents).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0003',
        '#13 assert ' + "expect(hid.getStatistics().disconnectionEvents).assertEqual(1)");
      expect(hid.getStatistics().disconnectionEvents).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0003',
        '#14 assert ' + "expect(a2dp.getOperationRecords().length).assertEqual(3)");
      expect(a2dp.getOperationRecords().length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0003',
        '#15 assert ' + "expect(hfp.getOperationRecords().length).assertEqual(3)");
      expect(hfp.getOperationRecords().length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0003',
        '#16 assert ' + "expect(hid.getOperationRecords().length).assertEqual(3)");
      expect(hid.getOperationRecords().length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0003',
        '#17 assert ' +
        "expect(a2dp.getService().getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(a2dp.getService().getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0003',
        '#18 assert ' +
        "expect(hid.getService().getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(hid.getService().getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0003',
        '#19 assert ' + "expect(a2dp.getStatistics().healthScore).assertEqual(HEALTHY_SCORE)");
      expect(a2dp.getStatistics().healthScore).assertEqual(HEALTHY_SCORE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0003',
        '#20 assert ' + "expect(hfp.getStatistics().healthScore).assertEqual(HEALTHY_SCORE)");
      expect(hfp.getStatistics().healthScore).assertEqual(HEALTHY_SCORE);

      await a2dp.destroy();
      await hfp.destroy();
      await hid.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0003', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0004', 'begin');
      const a2dp = await initA2dp();
      const hfp = await initHfp();
      const hid = await initHid();
      const avrcp = await initAvrcp();
      const connected: boolean[] = await Promise.all(
        [a2dp.connect(DEVICE_MAIN), hfp.connect(DEVICE_MAIN), hid.connect(DEVICE_MAIN), avrcp.connect(DEVICE_MAIN)]);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0004',
        '#1 ' + "connected[0]" + ' = ' + JSON.stringify(connected[0]));
      expect(connected[0]).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0004',
        '#2 ' + "connected[1]" + ' = ' + JSON.stringify(connected[1]));
      expect(connected[1]).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0004',
        '#3 ' + "connected[2]" + ' = ' + JSON.stringify(connected[2]));
      expect(connected[2]).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0004',
        '#4 ' + "connected[3]" + ' = ' + JSON.stringify(connected[3]));
      expect(connected[3]).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0004',
        '#5 assert ' + "expect(a2dp.isConnected()).assertTrue()");
      expect(a2dp.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0004',
        '#6 assert ' + "expect(hfp.isConnected()).assertTrue()");
      expect(hfp.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0004',
        '#7 assert ' + "expect(hid.isConnected()).assertTrue()");
      expect(hid.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0004',
        '#8 assert ' + "expect(avrcp.isConnected()).assertTrue()");
      expect(avrcp.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0004',
        '#9 assert ' + "expect(a2dp.getManagedDeviceCount()).assertEqual(1)");
      expect(a2dp.getManagedDeviceCount()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0004',
        '#10 assert ' + "expect(hfp.getManagedDeviceCount()).assertEqual(1)");
      expect(hfp.getManagedDeviceCount()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0004',
        '#11 assert ' + "expect(hid.getManagedDeviceCount()).assertEqual(1)");
      expect(hid.getManagedDeviceCount()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0004',
        '#12 assert ' + "expect(avrcp.getManagedDeviceCount()).assertEqual(1)");
      expect(avrcp.getManagedDeviceCount()).assertEqual(1);

      const released: boolean[] = await Promise.all(
        [a2dp.disconnect(DEVICE_MAIN), hfp.disconnect(DEVICE_MAIN),
          hid.disconnect(DEVICE_MAIN), avrcp.disconnect(DEVICE_MAIN)]);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0004',
        '#13 ' + "released[0]" + ' = ' + JSON.stringify(released[0]));
      expect(released[0]).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0004',
        '#14 ' + "released[1]" + ' = ' + JSON.stringify(released[1]));
      expect(released[1]).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0004',
        '#15 ' + "released[2]" + ' = ' + JSON.stringify(released[2]));
      expect(released[2]).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0004',
        '#16 ' + "released[3]" + ' = ' + JSON.stringify(released[3]));
      expect(released[3]).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0004',
        '#17 assert ' + "expect(a2dp.isConnected()).assertFalse()");
      expect(a2dp.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0004',
        '#18 assert ' + "expect(hfp.isConnected()).assertFalse()");
      expect(hfp.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0004',
        '#19 assert ' + "expect(hid.isConnected()).assertFalse()");
      expect(hid.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0004',
        '#20 assert ' + "expect(avrcp.isConnected()).assertFalse()");
      expect(avrcp.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0004',
        '#21 assert ' + "expect(a2dp.getStatistics().disconnectionEvents).assertEqual(1)");
      expect(a2dp.getStatistics().disconnectionEvents).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0004',
        '#22 assert ' + "expect(avrcp.getStatistics().disconnectionEvents).assertEqual(1)");
      expect(avrcp.getStatistics().disconnectionEvents).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0004',
        '#23 assert ' + "expect(hid.getStatistics().totalConnectionAttempts).assertEqual(1)");
      expect(hid.getStatistics().totalConnectionAttempts).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0004',
        '#24 assert ' + "expect(hfp.getStatistics().connectionSuccessRate).assertEqual(100)");
      expect(hfp.getStatistics().connectionSuccessRate).assertEqual(100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0004',
        '#25 assert ' +
        "expect(a2dp.getService().getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(a2dp.getService().getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0004',
        '#26 assert ' +
        "expect(avrcp.getService().getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(avrcp.getService().getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);

      await a2dp.destroy();
      await hfp.destroy();
      await hid.destroy();
      await avrcp.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0004', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0005', 'begin');
      const a2dp = await initA2dp();
      const pbap = await initPbap();
      const flags: boolean[] = await Promise.all(
        [a2dp.connect(DEVICE_MAIN), a2dp.connect(DEVICE_OTHER),
          pbap.connect(DEVICE_MAIN), pbap.connect(DEVICE_OTHER)]);
      for (let i = 0; i < flags.length; i++) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testMultiProfile0005',
          '#1 ' + "flags[i]" + ' = ' + JSON.stringify(flags[i]));
        expect(flags[i]).assertTrue();
      }

      const a2dpIds = a2dp.getConnectedDeviceIds();
      const pbapIds = pbap.getConnectedDeviceIds();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0005',
        '#2 ' + "a2dpIds.length" + ' = ' + JSON.stringify(a2dpIds.length));
      expect(a2dpIds.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0005',
        '#3 ' + "pbapIds.length" + ' = ' + JSON.stringify(pbapIds.length));
      expect(pbapIds.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0005',
        '#4 assert ' + "expect(a2dpIds.indexOf(DEVICE_MAIN)).assertLargerOrEqual(0)");
      expect(a2dpIds.indexOf(DEVICE_MAIN)).assertLargerOrEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0005',
        '#5 assert ' + "expect(a2dpIds.indexOf(DEVICE_OTHER)).assertLargerOrEqual(0)");
      expect(a2dpIds.indexOf(DEVICE_OTHER)).assertLargerOrEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0005',
        '#6 assert ' + "expect(pbapIds.indexOf(DEVICE_MAIN)).assertLargerOrEqual(0)");
      expect(pbapIds.indexOf(DEVICE_MAIN)).assertLargerOrEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0005',
        '#7 assert ' + "expect(pbapIds.indexOf(DEVICE_OTHER)).assertLargerOrEqual(0)");
      expect(pbapIds.indexOf(DEVICE_OTHER)).assertLargerOrEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0005',
        '#8 assert ' + "expect(a2dpIds.indexOf(DEVICE_THIRD)).assertEqual(-1)");
      expect(a2dpIds.indexOf(DEVICE_THIRD)).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0005',
        '#9 assert ' + "expect(pbapIds.indexOf(DEVICE_THIRD)).assertEqual(-1)");
      expect(pbapIds.indexOf(DEVICE_THIRD)).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0005',
        '#10 assert ' + "expect(a2dp.getStatistics().totalConnectionAttempts).assertEqual(2)");
      expect(a2dp.getStatistics().totalConnectionAttempts).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0005',
        '#11 assert ' + "expect(pbap.getStatistics().totalConnectionAttempts).assertEqual(2)");
      expect(pbap.getStatistics().totalConnectionAttempts).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0005',
        '#12 assert ' + "expect(a2dp.getStatistics().managedDeviceCount).assertEqual(2)");
      expect(a2dp.getStatistics().managedDeviceCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0005',
        '#13 assert ' + "expect(pbap.getStatistics().connectedDeviceCount).assertEqual(2)");
      expect(pbap.getStatistics().connectedDeviceCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0005',
        '#14 assert ' + "expect(a2dp.getManagedDeviceCount()).assertEqual(pbap.getManagedDeviceCount())");
      expect(a2dp.getManagedDeviceCount()).assertEqual(pbap.getManagedDeviceCount());

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0005',
        '#15 assert ' + "expect(await a2dp.disconnect(DEVICE_MAIN)).assertTrue()");
      expect(await a2dp.disconnect(DEVICE_MAIN)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0005',
        '#16 assert ' + "expect(a2dp.getManagedDeviceCount()).assertEqual(1)");
      expect(a2dp.getManagedDeviceCount()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0005',
        '#17 assert ' + "expect(pbap.getManagedDeviceCount()).assertEqual(2)");
      expect(pbap.getManagedDeviceCount()).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0005',
        '#18 assert ' + "expect(pbap.isConnected()).assertTrue()");
      expect(pbap.isConnected()).assertTrue();

      await pbap.disconnect(DEVICE_MAIN);
      await pbap.disconnect(DEVICE_OTHER);
      await a2dp.disconnect(DEVICE_OTHER);
      await a2dp.destroy();
      await pbap.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0005', 'end');
    });

    // ==================== fault, health score and config set isolation (5 cases) ====================

    /*
     * @tc.number: SUB_MULTI_PROFILE_0600
     * @tc.name: testMultiProfile0006
     * @tc.desc: Verify that a connection failure of one profile leaves the other profiles healthy.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMultiProfile0006', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0006', 'begin');
      const a2dp = await initA2dp();
      const hfp = await initHfp();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0006',
        '#1 assert ' + "expect(await a2dp.connect('')).assertFalse()");
      expect(await a2dp.connect('')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0006',
        '#2 assert ' + "expect(await hfp.connect(DEVICE_MAIN)).assertTrue()");
      expect(await hfp.connect(DEVICE_MAIN)).assertTrue();

      const a2dpStats = a2dp.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0006',
        '#3 ' + "a2dpStats.totalConnectionAttempts" + ' = ' + JSON.stringify(a2dpStats.totalConnectionAttempts));
      expect(a2dpStats.totalConnectionAttempts).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0006',
        '#4 ' + "a2dpStats.failedConnections" + ' = ' + JSON.stringify(a2dpStats.failedConnections));
      expect(a2dpStats.failedConnections).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0006',
        '#5 ' + "a2dpStats.successfulConnections" + ' = ' + JSON.stringify(a2dpStats.successfulConnections));
      expect(a2dpStats.successfulConnections).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0006',
        '#6 ' + "a2dpStats.errorRate" + ' = ' + JSON.stringify(a2dpStats.errorRate));
      expect(a2dpStats.errorRate).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0006',
        '#7 ' + "a2dpStats.healthScore" + ' = ' + JSON.stringify(a2dpStats.healthScore));
      expect(a2dpStats.healthScore).assertEqual(CRITICAL_SCORE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0006',
        '#8 ' + "a2dpStats.isHealthy" + ' = ' + JSON.stringify(a2dpStats.isHealthy));
      expect(a2dpStats.isHealthy).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0006',
        '#9 assert ' + "expect(a2dp.isConnected()).assertFalse()");
      expect(a2dp.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0006',
        '#10 assert ' + "expect(a2dp.getConnectedDeviceIds().length).assertEqual(0)");
      expect(a2dp.getConnectedDeviceIds().length).assertEqual(0);

      const hfpStats = hfp.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0006',
        '#11 ' + "hfpStats.failedConnections" + ' = ' + JSON.stringify(hfpStats.failedConnections));
      expect(hfpStats.failedConnections).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0006',
        '#12 ' + "hfpStats.successfulConnections" + ' = ' + JSON.stringify(hfpStats.successfulConnections));
      expect(hfpStats.successfulConnections).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0006',
        '#13 ' + "hfpStats.totalOperations" + ' = ' + JSON.stringify(hfpStats.totalOperations));
      expect(hfpStats.totalOperations).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0006',
        '#14 ' + "hfpStats.failedOperations" + ' = ' + JSON.stringify(hfpStats.failedOperations));
      expect(hfpStats.failedOperations).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0006',
        '#15 ' + "hfpStats.errorRate" + ' = ' + JSON.stringify(hfpStats.errorRate));
      expect(hfpStats.errorRate).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0006',
        '#16 ' + "hfpStats.connectionSuccessRate" + ' = ' + JSON.stringify(hfpStats.connectionSuccessRate));
      expect(hfpStats.connectionSuccessRate).assertEqual(100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0006',
        '#17 ' + "hfpStats.healthScore" + ' = ' + JSON.stringify(hfpStats.healthScore));
      expect(hfpStats.healthScore).assertEqual(HEALTHY_SCORE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0006',
        '#18 ' + "hfpStats.isHealthy" + ' = ' + JSON.stringify(hfpStats.isHealthy));
      expect(hfpStats.isHealthy).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0006',
        '#19 assert ' + "expect(hfp.isConnected()).assertTrue()");
      expect(hfp.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0006',
        '#20 assert ' + "expect(hfp.getOperationRecords()[1].success).assertTrue()");
      expect(hfp.getOperationRecords()[1].success).assertTrue();

      await hfp.disconnect(DEVICE_MAIN);
      await a2dp.destroy();
      await hfp.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0006', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0007', 'begin');
      const a2dp = await initA2dp();
      const hfp = await initHfp();
      const hid = await initHid();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0007',
        '#1 assert ' + "expect(await a2dp.connect('')).assertFalse()");
      expect(await a2dp.connect('')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0007',
        '#2 assert ' + "expect(await a2dp.connect('')).assertFalse()");
      expect(await a2dp.connect('')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0007',
        '#3 assert ' + "expect(await hfp.connect(DEVICE_MAIN)).assertTrue()");
      expect(await hfp.connect(DEVICE_MAIN)).assertTrue();

      const a2dpStats = a2dp.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0007',
        '#4 ' + "a2dpStats.totalConnectionAttempts" + ' = ' + JSON.stringify(a2dpStats.totalConnectionAttempts));
      expect(a2dpStats.totalConnectionAttempts).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0007',
        '#5 ' + "a2dpStats.failedConnections" + ' = ' + JSON.stringify(a2dpStats.failedConnections));
      expect(a2dpStats.failedConnections).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0007',
        '#6 ' + "a2dpStats.totalOperations" + ' = ' + JSON.stringify(a2dpStats.totalOperations));
      expect(a2dpStats.totalOperations).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0007',
        '#7 ' + "a2dpStats.failedOperations" + ' = ' + JSON.stringify(a2dpStats.failedOperations));
      expect(a2dpStats.failedOperations).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0007',
        '#8 ' + "a2dpStats.errorRate" + ' = ' + JSON.stringify(a2dpStats.errorRate));
      expect(a2dpStats.errorRate).assertEqual(2 / 3 * 100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0007',
        '#9 ' + "a2dpStats.healthScore" + ' = ' + JSON.stringify(a2dpStats.healthScore));
      expect(a2dpStats.healthScore).assertEqual(CRITICAL_SCORE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0007',
        '#10 ' + "a2dpStats.isHealthy" + ' = ' + JSON.stringify(a2dpStats.isHealthy));
      expect(a2dpStats.isHealthy).assertFalse();

      const hfpStats = hfp.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0007',
        '#11 ' + "hfpStats.connectionSuccessRate" + ' = ' + JSON.stringify(hfpStats.connectionSuccessRate));
      expect(hfpStats.connectionSuccessRate).assertEqual(100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0007',
        '#12 ' + "hfpStats.errorRate" + ' = ' + JSON.stringify(hfpStats.errorRate));
      expect(hfpStats.errorRate).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0007',
        '#13 ' + "hfpStats.healthScore" + ' = ' + JSON.stringify(hfpStats.healthScore));
      expect(hfpStats.healthScore).assertEqual(HEALTHY_SCORE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0007',
        '#14 ' + "hfpStats.isHealthy" + ' = ' + JSON.stringify(hfpStats.isHealthy));
      expect(hfpStats.isHealthy).assertTrue();

      const hidStats = hid.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0007',
        '#15 ' + "hidStats.totalConnectionAttempts" + ' = ' + JSON.stringify(hidStats.totalConnectionAttempts));
      expect(hidStats.totalConnectionAttempts).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0007',
        '#16 ' + "hidStats.totalOperations" + ' = ' + JSON.stringify(hidStats.totalOperations));
      expect(hidStats.totalOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0007',
        '#17 ' + "hidStats.healthScore" + ' = ' + JSON.stringify(hidStats.healthScore));
      expect(hidStats.healthScore).assertEqual(IDLE_SCORE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0007',
        '#18 ' + "hidStats.isHealthy" + ' = ' + JSON.stringify(hidStats.isHealthy));
      expect(hidStats.isHealthy).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0007',
        '#19 ' + "a2dpStats.healthScore < hfpStats.healthScore" + ' = ' +
        JSON.stringify(a2dpStats.healthScore < hfpStats.healthScore));
      expect(a2dpStats.healthScore < hfpStats.healthScore).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0007',
        '#20 ' + "hidStats.healthScore < hfpStats.healthScore" + ' = ' +
        JSON.stringify(hidStats.healthScore < hfpStats.healthScore));
      expect(hidStats.healthScore < hfpStats.healthScore).assertTrue();

      await hfp.disconnect(DEVICE_MAIN);
      await a2dp.destroy();
      await hfp.destroy();
      await hid.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0007', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0008', 'begin');
      const a2dp = await initA2dp();
      const hfp = await initHfp();
      const a2dpConfig = a2dp.getConfig();
      a2dpConfig.maxManagedDevices = 1;
      a2dpConfig.connectionTimeoutMs = 60000;
      a2dp.setConfig(a2dpConfig);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0008',
        '#1 assert ' + "expect(a2dp.getConfig().maxManagedDevices).assertEqual(1)");
      expect(a2dp.getConfig().maxManagedDevices).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0008',
        '#2 assert ' + "expect(a2dp.getConfig().connectionTimeoutMs).assertEqual(60000)");
      expect(a2dp.getConfig().connectionTimeoutMs).assertEqual(60000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0008',
        '#3 assert ' + "expect(hfp.getConfig().maxManagedDevices).assertEqual(10)");
      expect(hfp.getConfig().maxManagedDevices).assertEqual(10);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0008',
        '#4 assert ' + "expect(hfp.getConfig().connectionTimeoutMs).assertEqual(30000)");
      expect(hfp.getConfig().connectionTimeoutMs).assertEqual(30000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0008',
        '#5 assert ' + "expect(hfp.getConfig().maxRetryAttempts).assertEqual(3)");
      expect(hfp.getConfig().maxRetryAttempts).assertEqual(3);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0008',
        '#6 assert ' + "expect(await a2dp.connect(DEVICE_MAIN)).assertTrue()");
      expect(await a2dp.connect(DEVICE_MAIN)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0008',
        '#7 assert ' + "expect(await a2dp.connect(DEVICE_OTHER)).assertFalse()");
      expect(await a2dp.connect(DEVICE_OTHER)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0008',
        '#8 assert ' + "expect(await hfp.connect(DEVICE_MAIN)).assertTrue()");
      expect(await hfp.connect(DEVICE_MAIN)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0008',
        '#9 assert ' + "expect(await hfp.connect(DEVICE_OTHER)).assertTrue()");
      expect(await hfp.connect(DEVICE_OTHER)).assertTrue();

      const blocked = a2dp.getOperationRecords()[2];
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0008',
        '#10 ' + "blocked.operationName" + ' = ' + JSON.stringify(blocked.operationName));
      expect(blocked.operationName).assertEqual('connect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0008',
        '#11 ' + "blocked.errorMessage" + ' = ' + JSON.stringify(blocked.errorMessage));
      expect(blocked.errorMessage).assertEqual('Max devices');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0008',
        '#12 ' + "blocked.details" + ' = ' + JSON.stringify(blocked.details));
      expect(blocked.details).assertEqual('Maximum managed devices reached');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0008',
        '#13 assert ' + "expect(a2dp.getManagedDeviceCount()).assertEqual(1)");
      expect(a2dp.getManagedDeviceCount()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0008',
        '#14 assert ' + "expect(hfp.getManagedDeviceCount()).assertEqual(2)");
      expect(hfp.getManagedDeviceCount()).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0008',
        '#15 assert ' + "expect(a2dp.getStatistics().totalConnectionAttempts).assertEqual(1)");
      expect(a2dp.getStatistics().totalConnectionAttempts).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0008',
        '#16 assert ' + "expect(hfp.getStatistics().totalConnectionAttempts).assertEqual(2)");
      expect(hfp.getStatistics().totalConnectionAttempts).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0008',
        '#17 assert ' + "expect(hfp.getStatistics().failedConnections).assertEqual(0)");
      expect(hfp.getStatistics().failedConnections).assertEqual(0);

      await hfp.disconnect(DEVICE_MAIN);
      await hfp.disconnect(DEVICE_OTHER);
      await a2dp.disconnect(DEVICE_MAIN);
      await a2dp.destroy();
      await hfp.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0008', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0009', 'begin');
      const a2dp = await initA2dp();
      const hfp = await initHfp();
      const hid = await initHid();
      await Promise.all([a2dp.connect(DEVICE_MAIN), hfp.connect(DEVICE_MAIN), hid.connect(DEVICE_MAIN)]);

      await a2dp.reset();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0009',
        '#1 assert ' + "expect(a2dp.isConnected()).assertFalse()");
      expect(a2dp.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0009',
        '#2 assert ' + "expect(a2dp.getConnectedDeviceIds().length).assertEqual(0)");
      expect(a2dp.getConnectedDeviceIds().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0009',
        '#3 assert ' + "expect(a2dp.getOperationRecords().length).assertEqual(1)");
      expect(a2dp.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0009',
        '#4 assert ' + "expect(a2dp.getOperationRecords()[0].operationName).assertEqual('reset')");
      expect(a2dp.getOperationRecords()[0].operationName).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0009',
        '#5 assert ' + "expect(a2dp.getStatistics().totalConnectionAttempts).assertEqual(1)");
      expect(a2dp.getStatistics().totalConnectionAttempts).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0009',
        '#6 assert ' + "expect(a2dp.getStatistics().successfulConnections).assertEqual(1)");
      expect(a2dp.getStatistics().successfulConnections).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0009',
        '#7 assert ' + "expect(a2dp.getStatistics().totalOperations).assertEqual(4)");
      expect(a2dp.getStatistics().totalOperations).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0009',
        '#8 assert ' + "expect(a2dp.getService().getOperationHistory().length).assertEqual(1)");
      expect(a2dp.getService().getOperationHistory().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0009',
        '#9 assert ' + "expect(hfp.isConnected()).assertTrue()");
      expect(hfp.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0009',
        '#10 assert ' + "expect(hid.isConnected()).assertTrue()");
      expect(hid.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0009',
        '#11 assert ' + "expect(hfp.getConnectedDeviceIds()[0]).assertEqual(DEVICE_MAIN)");
      expect(hfp.getConnectedDeviceIds()[0]).assertEqual(DEVICE_MAIN);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0009',
        '#12 assert ' + "expect(hfp.getOperationRecords().length).assertEqual(2)");
      expect(hfp.getOperationRecords().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0009',
        '#13 assert ' + "expect(hid.getOperationRecords().length).assertEqual(2)");
      expect(hid.getOperationRecords().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0009',
        '#14 assert ' + "expect(hid.getStatistics().disconnectionEvents).assertEqual(0)");
      expect(hid.getStatistics().disconnectionEvents).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0009',
        '#15 assert ' + "expect(await a2dp.connect(DEVICE_OTHER)).assertTrue()");
      expect(await a2dp.connect(DEVICE_OTHER)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0009',
        '#16 assert ' + "expect(a2dp.getConnectedDeviceIds()[0]).assertEqual(DEVICE_OTHER)");
      expect(a2dp.getConnectedDeviceIds()[0]).assertEqual(DEVICE_OTHER);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0009',
        '#17 assert ' + "expect(a2dp.getStatistics().managedDeviceCount).assertEqual(1)");
      expect(a2dp.getStatistics().managedDeviceCount).assertEqual(1);

      await hid.disconnect(DEVICE_MAIN);
      await hfp.disconnect(DEVICE_MAIN);
      await a2dp.disconnect(DEVICE_OTHER);
      await a2dp.destroy();
      await hfp.destroy();
      await hid.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0009', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0010', 'begin');
      const a2dp = await initA2dp();
      const hfp = await initHfp();
      await Promise.all([a2dp.connect(DEVICE_MAIN), hfp.connect(DEVICE_MAIN)]);
      await a2dp.destroy();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0010',
        '#1 assert ' + "expect(a2dp.isConnected()).assertFalse()");
      expect(a2dp.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0010',
        '#2 assert ' + "expect(await a2dp.connect(DEVICE_OTHER)).assertFalse()");
      expect(await a2dp.connect(DEVICE_OTHER)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0010',
        '#3 assert ' + "expect(await a2dp.disconnect(DEVICE_MAIN)).assertFalse()");
      expect(await a2dp.disconnect(DEVICE_MAIN)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0010',
        '#4 assert ' + "expect(await hfp.connect(DEVICE_OTHER)).assertTrue()");
      expect(await hfp.connect(DEVICE_OTHER)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0010',
        '#5 assert ' + "expect(hfp.isConnected()).assertTrue()");
      expect(hfp.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0010',
        '#6 assert ' + "expect(hfp.getManagedDeviceCount()).assertEqual(2)");
      expect(hfp.getManagedDeviceCount()).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0010',
        '#7 assert ' + "expect(hfp.getStatistics().failedConnections).assertEqual(0)");
      expect(hfp.getStatistics().failedConnections).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0010',
        '#8 assert ' + "expect(hfp.getStatistics().successfulConnections).assertEqual(2)");
      expect(hfp.getStatistics().successfulConnections).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0010',
        '#9 assert ' + "expect(hfp.getStatistics().healthScore).assertEqual(HEALTHY_SCORE)");
      expect(hfp.getStatistics().healthScore).assertEqual(HEALTHY_SCORE);

      const a2dpRecords = a2dp.getOperationRecords();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0010',
        '#10 ' + "a2dpRecords.length" + ' = ' + JSON.stringify(a2dpRecords.length));
      expect(a2dpRecords.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0010',
        '#11 ' + "a2dpRecords[0].operationName" + ' = ' + JSON.stringify(a2dpRecords[0].operationName));
      expect(a2dpRecords[0].operationName).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0010',
        '#12 ' + "a2dpRecords[1].errorMessage" + ' = ' + JSON.stringify(a2dpRecords[1].errorMessage));
      expect(a2dpRecords[1].errorMessage).assertEqual('Not ready');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0010',
        '#13 assert ' + "expect(a2dp.getStatistics().totalConnectionAttempts).assertEqual(1)");
      expect(a2dp.getStatistics().totalConnectionAttempts).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0010',
        '#14 assert ' + "expect(a2dp.getStatistics().failedConnections).assertEqual(0)");
      expect(a2dp.getStatistics().failedConnections).assertEqual(0);

      await hfp.disconnect(DEVICE_MAIN);
      await hfp.disconnect(DEVICE_OTHER);
      await hfp.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0010', 'end');
    });

    // ==================== system one guard row for (4 cases) ====================

    /*
     * @tc.number: SUB_MULTI_PROFILE_1100
     * @tc.name: testMultiProfile0011
     * @tc.desc: Verify that uninitialized managers of four profiles refuse connect and disconnect alike.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMultiProfile0011', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0011', 'begin');
      const a2dp: A2dpProfileManager = new A2dpProfileManager();
      const hfp: HfpProfileManager = new HfpProfileManager();
      const hid: HidProfileManager = new HidProfileManager();
      const pan: PanProfileManager = new PanProfileManager();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0011',
        '#1 assert ' + "expect(await a2dp.connect(DEVICE_MAIN)).assertFalse()");
      expect(await a2dp.connect(DEVICE_MAIN)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0011',
        '#2 assert ' + "expect(await hfp.connect(DEVICE_MAIN)).assertFalse()");
      expect(await hfp.connect(DEVICE_MAIN)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0011',
        '#3 assert ' + "expect(await hid.connect(DEVICE_MAIN)).assertFalse()");
      expect(await hid.connect(DEVICE_MAIN)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0011',
        '#4 assert ' + "expect(await pan.connect(DEVICE_MAIN)).assertFalse()");
      expect(await pan.connect(DEVICE_MAIN)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0011',
        '#5 assert ' + "expect(await a2dp.disconnect(DEVICE_MAIN)).assertFalse()");
      expect(await a2dp.disconnect(DEVICE_MAIN)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0011',
        '#6 assert ' + "expect(await hfp.disconnect(DEVICE_MAIN)).assertFalse()");
      expect(await hfp.disconnect(DEVICE_MAIN)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0011',
        '#7 assert ' + "expect(await hid.disconnect(DEVICE_MAIN)).assertFalse()");
      expect(await hid.disconnect(DEVICE_MAIN)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0011',
        '#8 assert ' + "expect(await pan.disconnect(DEVICE_MAIN)).assertFalse()");
      expect(await pan.disconnect(DEVICE_MAIN)).assertFalse();

      const a2dpRecords = a2dp.getOperationRecords();
      const panRecords = pan.getOperationRecords();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0011',
        '#9 ' + "a2dpRecords.length" + ' = ' + JSON.stringify(a2dpRecords.length));
      expect(a2dpRecords.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0011',
        '#10 assert ' + "expect(hfp.getOperationRecords().length).assertEqual(2)");
      expect(hfp.getOperationRecords().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0011',
        '#11 assert ' + "expect(hid.getOperationRecords().length).assertEqual(2)");
      expect(hid.getOperationRecords().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0011',
        '#12 ' + "panRecords.length" + ' = ' + JSON.stringify(panRecords.length));
      expect(panRecords.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0011',
        '#13 ' + "a2dpRecords[0].errorMessage" + ' = ' + JSON.stringify(a2dpRecords[0].errorMessage));
      expect(a2dpRecords[0].errorMessage).assertEqual('Not ready');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0011',
        '#14 ' + "a2dpRecords[1].operationName" + ' = ' + JSON.stringify(a2dpRecords[1].operationName));
      expect(a2dpRecords[1].operationName).assertEqual('disconnect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0011',
        '#15 ' + "panRecords[1].errorMessage" + ' = ' + JSON.stringify(panRecords[1].errorMessage));
      expect(panRecords[1].errorMessage).assertEqual('Not ready');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0011',
        '#16 assert ' + "expect(a2dp.getStatistics().totalConnectionAttempts).assertEqual(0)");
      expect(a2dp.getStatistics().totalConnectionAttempts).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0011',
        '#17 assert ' + "expect(hfp.getStatistics().failedConnections).assertEqual(0)");
      expect(hfp.getStatistics().failedConnections).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0011',
        '#18 assert ' + "expect(hid.getStatistics().totalOperations).assertEqual(2)");
      expect(hid.getStatistics().totalOperations).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0011',
        '#19 assert ' + "expect(pan.getStatistics().failedOperations).assertEqual(2)");
      expect(pan.getStatistics().failedOperations).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0011',
        '#20 assert ' + "expect(a2dp.getStatistics().errorRate).assertEqual(100)");
      expect(a2dp.getStatistics().errorRate).assertEqual(100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0011',
        '#21 assert ' + "expect(hfp.getStatistics().healthScore).assertEqual(CRITICAL_SCORE)");
      expect(hfp.getStatistics().healthScore).assertEqual(CRITICAL_SCORE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0011',
        '#22 assert ' + "expect(hid.getStatistics().isHealthy).assertFalse()");
      expect(hid.getStatistics().isHealthy).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0011',
        '#23 assert ' + "expect(pan.getStatistics().healthScore).assertEqual(CRITICAL_SCORE)");
      expect(pan.getStatistics().healthScore).assertEqual(CRITICAL_SCORE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0011',
        '#24 assert ' + "expect(a2dp.getService().getOperationHistory().length).assertEqual(0)");
      expect(a2dp.getService().getOperationHistory().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0011',
        '#25 assert ' + "expect(hid.getService().getOperationHistory().length).assertEqual(0)");
      expect(hid.getService().getOperationHistory().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0011',
        '#26 assert ' + "expect(pan.getService().getOperationHistory().length).assertEqual(0)");
      expect(pan.getService().getOperationHistory().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0011',
        '#27 assert ' + "expect(a2dp.getConnectedDeviceIds().length).assertEqual(0)");
      expect(a2dp.getConnectedDeviceIds().length).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0011', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0012', 'begin');
      const a2dp = await initA2dp();
      const hfp = await initHfp();
      const hid = await initHid();
      const pbap = await initPbap();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0012',
        '#1 assert ' + "expect(await a2dp.connect('')).assertFalse()");
      expect(await a2dp.connect('')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0012',
        '#2 assert ' + "expect(await hfp.connect('')).assertFalse()");
      expect(await hfp.connect('')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0012',
        '#3 assert ' + "expect(await hid.connect('')).assertFalse()");
      expect(await hid.connect('')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0012',
        '#4 assert ' + "expect(await pbap.connect('')).assertFalse()");
      expect(await pbap.connect('')).assertFalse();

      const a2dpRecords = a2dp.getOperationRecords();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0012',
        '#5 ' + "a2dpRecords[1].errorMessage" + ' = ' + JSON.stringify(a2dpRecords[1].errorMessage));
      expect(a2dpRecords[1].errorMessage).assertEqual('Connection failed');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0012',
        '#6 ' + "a2dpRecords[1].details" + ' = ' + JSON.stringify(a2dpRecords[1].details));
      expect(a2dpRecords[1].details).assertEqual('Failed to connect to ');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0012',
        '#7 assert ' + "expect(hfp.getOperationRecords()[1].details).assertEqual('Failed to connect to ')");
      expect(hfp.getOperationRecords()[1].details).assertEqual('Failed to connect to ');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0012',
        '#8 assert ' + "expect(pbap.getOperationRecords().length).assertEqual(2)");
      expect(pbap.getOperationRecords().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0012',
        '#9 assert ' + "expect(a2dp.getStatistics().totalConnectionAttempts).assertEqual(1)");
      expect(a2dp.getStatistics().totalConnectionAttempts).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0012',
        '#10 assert ' + "expect(hid.getStatistics().failedConnections).assertEqual(1)");
      expect(hid.getStatistics().failedConnections).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0012',
        '#11 assert ' + "expect(hfp.getStatistics().successfulConnections).assertEqual(0)");
      expect(hfp.getStatistics().successfulConnections).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0012',
        '#12 assert ' + "expect(pbap.getStatistics().errorRate).assertEqual(50)");
      expect(pbap.getStatistics().errorRate).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0012',
        '#13 assert ' + "expect(a2dp.getStatistics().healthScore).assertEqual(CRITICAL_SCORE)");
      expect(a2dp.getStatistics().healthScore).assertEqual(CRITICAL_SCORE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0012',
        '#14 assert ' + "expect(hid.getStatistics().isHealthy).assertFalse()");
      expect(hid.getStatistics().isHealthy).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0012',
        '#15 assert ' + "expect(a2dp.getService().getOperationHistory()[1].details).assertEqual('Invalid device ID')");
      expect(a2dp.getService().getOperationHistory()[1].details).assertEqual('Invalid device ID');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0012',
        '#16 assert ' + "expect(hfp.getService().getOperationHistory()[1].details).assertEqual('Invalid device ID')");
      expect(hfp.getService().getOperationHistory()[1].details).assertEqual('Invalid device ID');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0012',
        '#17 assert ' + "expect(pbap.getService().getOperationHistory().length).assertEqual(2)");
      expect(pbap.getService().getOperationHistory().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0012',
        '#18 assert ' + "expect(a2dp.getConnectedDeviceIds().length).assertEqual(0)");
      expect(a2dp.getConnectedDeviceIds().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0012',
        '#19 assert ' + "expect(hid.isConnected()).assertFalse()");
      expect(hid.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0012',
        '#20 assert ' + "expect(pbap.isConnected()).assertFalse()");
      expect(pbap.isConnected()).assertFalse();

      await a2dp.destroy();
      await hfp.destroy();
      await hid.destroy();
      await pbap.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0012', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0013', 'begin');
      const a2dp = await initA2dp();
      const hfp = await initHfp();
      const hid = await initHid();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0013',
        '#1 assert ' + "expect(await a2dp.disconnect(GHOST_DEVICE)).assertFalse()");
      expect(await a2dp.disconnect(GHOST_DEVICE)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0013',
        '#2 assert ' + "expect(await hfp.disconnect(GHOST_DEVICE)).assertFalse()");
      expect(await hfp.disconnect(GHOST_DEVICE)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0013',
        '#3 assert ' + "expect(await hid.disconnect(GHOST_DEVICE)).assertFalse()");
      expect(await hid.disconnect(GHOST_DEVICE)).assertFalse();

      const a2dpRecords = a2dp.getOperationRecords();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0013',
        '#4 ' + "a2dpRecords[1].errorMessage" + ' = ' + JSON.stringify(a2dpRecords[1].errorMessage));
      expect(a2dpRecords[1].errorMessage).assertEqual('Not managed');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0013',
        '#5 ' + "a2dpRecords[1].details" + ' = ' + JSON.stringify(a2dpRecords[1].details));
      expect(a2dpRecords[1].details).assertEqual(`Device ${GHOST_DEVICE} not managed`);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0013',
        '#6 assert ' + "expect(hfp.getOperationRecords()[1].operationName).assertEqual('disconnect')");
      expect(hfp.getOperationRecords()[1].operationName).assertEqual('disconnect');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0013',
        '#7 assert ' + "expect(hid.getOperationRecords().length).assertEqual(2)");
      expect(hid.getOperationRecords().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0013',
        '#8 assert ' + "expect(a2dp.getStatistics().disconnectionEvents).assertEqual(0)");
      expect(a2dp.getStatistics().disconnectionEvents).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0013',
        '#9 assert ' + "expect(hfp.getStatistics().totalConnectionAttempts).assertEqual(0)");
      expect(hfp.getStatistics().totalConnectionAttempts).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0013',
        '#10 assert ' + "expect(hid.getStatistics().failedOperations).assertEqual(1)");
      expect(hid.getStatistics().failedOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0013',
        '#11 assert ' + "expect(a2dp.getStatistics().errorRate).assertEqual(50)");
      expect(a2dp.getStatistics().errorRate).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0013',
        '#12 assert ' + "expect(hfp.getStatistics().healthScore).assertEqual(CRITICAL_SCORE)");
      expect(hfp.getStatistics().healthScore).assertEqual(CRITICAL_SCORE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0013',
        '#13 assert ' + "expect(hid.getStatistics().isHealthy).assertFalse()");
      expect(hid.getStatistics().isHealthy).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0013',
        '#14 assert ' + "expect(a2dp.getService().getOperationHistory().length).assertEqual(1)");
      expect(a2dp.getService().getOperationHistory().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0013',
        '#15 assert ' + "expect(hfp.getService().getOperationHistory().length).assertEqual(1)");
      expect(hfp.getService().getOperationHistory().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0013',
        '#16 assert ' + "expect(hid.getService().getOperationHistory().length).assertEqual(1)");
      expect(hid.getService().getOperationHistory().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0013',
        '#17 assert ' + "expect(a2dp.getConnectedDeviceIds().length).assertEqual(0)");
      expect(a2dp.getConnectedDeviceIds().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0013',
        '#18 assert ' +
        "expect(hid.getService().getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED)");
      expect(hid.getService().getConnectionState()).assertEqual(BluetoothConnectionState.DISCONNECTED);

      await a2dp.destroy();
      await hfp.destroy();
      await hid.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0013', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0014', 'begin');
      const a2dp = await initA2dp();
      const hfp = await initHfp();
      const hid = await initHid();
      const pan = await initPan();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0014',
        '#1 assert ' + "expect(await a2dp.initialize()).assertFalse()");
      expect(await a2dp.initialize()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0014',
        '#2 assert ' + "expect(await hfp.initialize()).assertFalse()");
      expect(await hfp.initialize()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0014',
        '#3 assert ' + "expect(await hid.initialize()).assertFalse()");
      expect(await hid.initialize()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0014',
        '#4 assert ' + "expect(await pan.initialize()).assertFalse()");
      expect(await pan.initialize()).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0014',
        '#5 assert ' + "expect(a2dp.getOperationRecords().length).assertEqual(1)");
      expect(a2dp.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0014',
        '#6 assert ' + "expect(hfp.getOperationRecords().length).assertEqual(1)");
      expect(hfp.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0014',
        '#7 assert ' + "expect(hid.getOperationRecords().length).assertEqual(1)");
      expect(hid.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0014',
        '#8 assert ' + "expect(pan.getOperationRecords().length).assertEqual(1)");
      expect(pan.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0014',
        '#9 assert ' + "expect(a2dp.getStatistics().totalOperations).assertEqual(1)");
      expect(a2dp.getStatistics().totalOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0014',
        '#10 assert ' + "expect(hfp.getStatistics().totalOperations).assertEqual(1)");
      expect(hfp.getStatistics().totalOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0014',
        '#11 assert ' + "expect(a2dp.getService().getOperationHistory().length).assertEqual(1)");
      expect(a2dp.getService().getOperationHistory().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0014',
        '#12 assert ' + "expect(hid.getService().getOperationHistory().length).assertEqual(1)");
      expect(hid.getService().getOperationHistory().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0014',
        '#13 assert ' + "expect(pan.getService().getOperationHistory().length).assertEqual(1)");
      expect(pan.getService().getOperationHistory().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0014',
        '#14 assert ' + "expect(pan.getProfileType()).assertEqual(BluetoothProfileType.PAN)");
      expect(pan.getProfileType()).assertEqual(BluetoothProfileType.PAN);

      const flags: boolean[] = await Promise.all([a2dp.connect(DEVICE_MAIN), pan.connect(DEVICE_MAIN)]);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0014',
        '#15 ' + "flags[0]" + ' = ' + JSON.stringify(flags[0]));
      expect(flags[0]).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0014',
        '#16 ' + "flags[1]" + ' = ' + JSON.stringify(flags[1]));
      expect(flags[1]).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0014',
        '#17 assert ' + "expect(a2dp.isConnected()).assertTrue()");
      expect(a2dp.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0014',
        '#18 assert ' + "expect(pan.isConnected()).assertTrue()");
      expect(pan.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0014',
        '#19 assert ' + "expect(hid.isConnected()).assertFalse()");
      expect(hid.isConnected()).assertFalse();

      await a2dp.disconnect(DEVICE_MAIN);
      await pan.disconnect(DEVICE_MAIN);
      await a2dp.destroy();
      await hfp.destroy();
      await hid.destroy();
      await pan.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0014', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0015', 'begin');
      const pan = await initPan();
      const map = await initMap();
      const hdp = await initHdp();
      const pbap = await initPbap();
      const flags: boolean[] = await Promise.all(
        [pan.connect(DEVICE_MAIN), map.connect(DEVICE_MAIN),
          hdp.connect(DEVICE_MAIN), pbap.connect(DEVICE_MAIN)]);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0015',
        '#1 ' + "flags[0]" + ' = ' + JSON.stringify(flags[0]));
      expect(flags[0]).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0015',
        '#2 ' + "flags[1]" + ' = ' + JSON.stringify(flags[1]));
      expect(flags[1]).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0015',
        '#3 ' + "flags[2]" + ' = ' + JSON.stringify(flags[2]));
      expect(flags[2]).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0015',
        '#4 ' + "flags[3]" + ' = ' + JSON.stringify(flags[3]));
      expect(flags[3]).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0015',
        '#5 assert ' + "expect(pan.getProfileType()).assertEqual(BluetoothProfileType.PAN)");
      expect(pan.getProfileType()).assertEqual(BluetoothProfileType.PAN);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0015',
        '#6 assert ' + "expect(map.getProfileType()).assertEqual(BluetoothProfileType.MAP)");
      expect(map.getProfileType()).assertEqual(BluetoothProfileType.MAP);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0015',
        '#7 assert ' + "expect(hdp.getProfileType()).assertEqual(BluetoothProfileType.HDP)");
      expect(hdp.getProfileType()).assertEqual(BluetoothProfileType.HDP);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0015',
        '#8 assert ' + "expect(pbap.getProfileType()).assertEqual(BluetoothProfileType.PBAP)");
      expect(pbap.getProfileType()).assertEqual(BluetoothProfileType.PBAP);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0015',
        '#9 assert ' + "expect(pan.isConnected()).assertTrue()");
      expect(pan.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0015',
        '#10 assert ' + "expect(map.isConnected()).assertTrue()");
      expect(map.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0015',
        '#11 assert ' + "expect(hdp.isConnected()).assertTrue()");
      expect(hdp.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0015',
        '#12 assert ' + "expect(pbap.isConnected()).assertTrue()");
      expect(pbap.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0015',
        '#13 assert ' +
        "expect(pan.getService().getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED)");
      expect(pan.getService().getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0015',
        '#14 assert ' +
        "expect(map.getService().getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED)");
      expect(map.getService().getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0015',
        '#15 assert ' +
        "expect(hdp.getService().getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED)");
      expect(hdp.getService().getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0015',
        '#16 assert ' +
        "expect(pbap.getService().getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED)");
      expect(pbap.getService().getConnectionState()).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0015',
        '#17 assert ' + "expect(pan.getConnectedDeviceIds()[0]).assertEqual(DEVICE_MAIN)");
      expect(pan.getConnectedDeviceIds()[0]).assertEqual(DEVICE_MAIN);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0015',
        '#18 assert ' + "expect(pbap.getStatistics().successfulConnections).assertEqual(1)");
      expect(pbap.getStatistics().successfulConnections).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0015',
        '#19 assert ' + "expect(map.getStatistics().managedDeviceCount).assertEqual(1)");
      expect(map.getStatistics().managedDeviceCount).assertEqual(1);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0015',
        '#20 assert ' + "expect(await pan.disconnect(DEVICE_MAIN)).assertTrue()");
      expect(await pan.disconnect(DEVICE_MAIN)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0015',
        '#21 assert ' + "expect(await map.disconnect(DEVICE_MAIN)).assertTrue()");
      expect(await map.disconnect(DEVICE_MAIN)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0015',
        '#22 assert ' + "expect(await hdp.disconnect(DEVICE_MAIN)).assertTrue()");
      expect(await hdp.disconnect(DEVICE_MAIN)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0015',
        '#23 assert ' + "expect(await pbap.disconnect(DEVICE_MAIN)).assertTrue()");
      expect(await pbap.disconnect(DEVICE_MAIN)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0015',
        '#24 assert ' + "expect(pan.getStatistics().disconnectionEvents).assertEqual(1)");
      expect(pan.getStatistics().disconnectionEvents).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0015',
        '#25 assert ' + "expect(map.getStatistics().disconnectionEvents).assertEqual(1)");
      expect(map.getStatistics().disconnectionEvents).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0015',
        '#26 assert ' + "expect(hdp.getStatistics().disconnectionEvents).assertEqual(1)");
      expect(hdp.getStatistics().disconnectionEvents).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0015',
        '#27 assert ' + "expect(pbap.getStatistics().disconnectionEvents).assertEqual(1)");
      expect(pbap.getStatistics().disconnectionEvents).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0015',
        '#28 assert ' + "expect(pan.isConnected()).assertFalse()");
      expect(pan.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0015',
        '#29 assert ' + "expect(pbap.isConnected()).assertFalse()");
      expect(pbap.isConnected()).assertFalse();

      await pan.destroy();
      await map.destroy();
      await hdp.destroy();
      await pbap.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0015', 'end');
    });

    // ==================== number data and statistics isolation (5 cases) ====================

    /*
     * @tc.number: SUB_MULTI_PROFILE_1600
     * @tc.name: testMultiProfile0016
     * @tc.desc: Verify that profile models stay independent while both profiles are active.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMultiProfile0016', 0, async () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0016', 'begin');
      const a2dp = await initA2dp();
      const hfp = await initHfp();
      const idleAudio = a2dp.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0016',
        '#1 ' + "idleAudio.volume" + ' = ' + JSON.stringify(idleAudio.volume));
      expect(idleAudio.volume).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0016',
        '#2 ' + "idleAudio.codec" + ' = ' + JSON.stringify(idleAudio.codec));
      expect(idleAudio.codec).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0016',
        '#3 ' + "idleAudio.isPlaying" + ' = ' + JSON.stringify(idleAudio.isPlaying));
      expect(idleAudio.isPlaying).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0016',
        '#4 ' + "idleAudio.bitRate" + ' = ' + JSON.stringify(idleAudio.bitRate));
      expect(idleAudio.bitRate).assertEqual(0);
      const idleCall = hfp.getModel();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0016',
        '#5 ' + "idleCall.callState" + ' = ' + JSON.stringify(idleCall.callState));
      expect(idleCall.callState).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0016',
        '#6 ' + "idleCall.phoneNumber" + ' = ' + JSON.stringify(idleCall.phoneNumber));
      expect(idleCall.phoneNumber).assertEqual('');

      await Promise.all([a2dp.connect(DEVICE_MAIN), hfp.connect(DEVICE_MAIN)]);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0016',
        '#7 assert ' + "expect(await a2dp.getService().play()).assertTrue()");
      expect(await a2dp.getService().play()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0016',
        '#8 assert ' + "expect(a2dp.getModel().isPlaying).assertTrue()");
      expect(a2dp.getModel().isPlaying).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0016',
        '#9 assert ' + "expect(hfp.getModel().callState).assertEqual(0)");
      expect(hfp.getModel().callState).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0016',
        '#10 assert ' + "expect(await hfp.getService().answerCall()).assertTrue()");
      expect(await hfp.getService().answerCall()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0016',
        '#11 assert ' + "expect(hfp.getModel().callState).assertEqual(1)");
      expect(hfp.getModel().callState).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0016',
        '#12 assert ' + "expect(a2dp.getModel().isPlaying).assertTrue()");
      expect(a2dp.getModel().isPlaying).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0016',
        '#13 assert ' + "expect(a2dp.getModel().volume).assertEqual(50)");
      expect(a2dp.getModel().volume).assertEqual(50);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0016',
        '#14 assert ' + "expect(await a2dp.setVolume(30)).assertTrue()");
      expect(await a2dp.setVolume(30)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0016',
        '#15 assert ' + "expect(a2dp.getModel().volume).assertEqual(30)");
      expect(a2dp.getModel().volume).assertEqual(30);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0016',
        '#16 assert ' + "expect(hfp.getModel().phoneNumber).assertEqual('')");
      expect(hfp.getModel().phoneNumber).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0016',
        '#17 assert ' + "expect(a2dp.getConnectedDeviceIds()[0]).assertEqual(DEVICE_MAIN)");
      expect(a2dp.getConnectedDeviceIds()[0]).assertEqual(DEVICE_MAIN);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0016',
        '#18 assert ' + "expect(hfp.getConnectedDeviceIds()[0]).assertEqual(DEVICE_MAIN)");
      expect(hfp.getConnectedDeviceIds()[0]).assertEqual(DEVICE_MAIN);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0016',
        '#19 assert ' + "expect(a2dp.getStatistics().failedOperations).assertEqual(0)");
      expect(a2dp.getStatistics().failedOperations).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0016',
        '#20 assert ' + "expect(hfp.getStatistics().failedOperations).assertEqual(0)");
      expect(hfp.getStatistics().failedOperations).assertEqual(0);

      await a2dp.disconnect(DEVICE_MAIN);
      await hfp.disconnect(DEVICE_MAIN);
      await a2dp.destroy();
      await hfp.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0016', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0017', 'begin');
      const a2dp = await initA2dp();
      const hfp = await initHfp();
      await Promise.all([a2dp.connect(DEVICE_MAIN), hfp.connect(DEVICE_MAIN)]);

      const a2dpSnap = a2dp.getStatistics();
      const hfpSnap = hfp.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0017',
        '#1 ' + "a2dpSnap.totalConnectionAttempts" + ' = ' + JSON.stringify(a2dpSnap.totalConnectionAttempts));
      expect(a2dpSnap.totalConnectionAttempts).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0017',
        '#2 ' + "hfpSnap.totalConnectionAttempts" + ' = ' + JSON.stringify(hfpSnap.totalConnectionAttempts));
      expect(hfpSnap.totalConnectionAttempts).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0017',
        '#3 ' + "a2dpSnap.totalOperations" + ' = ' + JSON.stringify(a2dpSnap.totalOperations));
      expect(a2dpSnap.totalOperations).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0017',
        '#4 ' + "a2dpSnap.successfulConnections" + ' = ' + JSON.stringify(a2dpSnap.successfulConnections));
      expect(a2dpSnap.successfulConnections).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0017',
        '#5 ' + "hfpSnap.errorRate" + ' = ' + JSON.stringify(hfpSnap.errorRate));
      expect(hfpSnap.errorRate).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0017',
        '#6 assert ' + "expect(await a2dp.connect(DEVICE_OTHER)).assertTrue()");
      expect(await a2dp.connect(DEVICE_OTHER)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0017',
        '#7 ' + "a2dpSnap.totalConnectionAttempts" + ' = ' + JSON.stringify(a2dpSnap.totalConnectionAttempts));
      expect(a2dpSnap.totalConnectionAttempts).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0017',
        '#8 ' + "a2dpSnap.totalOperations" + ' = ' + JSON.stringify(a2dpSnap.totalOperations));
      expect(a2dpSnap.totalOperations).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0017',
        '#9 ' + "a2dpSnap.successfulConnections" + ' = ' + JSON.stringify(a2dpSnap.successfulConnections));
      expect(a2dpSnap.successfulConnections).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0017',
        '#10 ' + "hfpSnap.totalOperations" + ' = ' + JSON.stringify(hfpSnap.totalOperations));
      expect(hfpSnap.totalOperations).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0017',
        '#11 assert ' + "expect(a2dp.getStatistics().totalConnectionAttempts).assertEqual(2)");
      expect(a2dp.getStatistics().totalConnectionAttempts).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0017',
        '#12 assert ' + "expect(a2dp.getStatistics().totalOperations).assertEqual(3)");
      expect(a2dp.getStatistics().totalOperations).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0017',
        '#13 assert ' + "expect(a2dp.getStatistics().managedDeviceCount).assertEqual(2)");
      expect(a2dp.getStatistics().managedDeviceCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0017',
        '#14 assert ' + "expect(hfp.getStatistics().totalConnectionAttempts).assertEqual(1)");
      expect(hfp.getStatistics().totalConnectionAttempts).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0017',
        '#15 assert ' + "expect(hfp.getStatistics().totalOperations).assertEqual(2)");
      expect(hfp.getStatistics().totalOperations).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0017',
        '#16 assert ' + "expect(hfp.getConnectedDeviceIds().length).assertEqual(1)");
      expect(hfp.getConnectedDeviceIds().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0017',
        '#17 assert ' + "expect(a2dp.getConnectedDeviceIds().length).assertEqual(2)");
      expect(a2dp.getConnectedDeviceIds().length).assertEqual(2);

      a2dpSnap.totalOperations = 999;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0017',
        '#18 assert ' + "expect(a2dp.getStatistics().totalOperations).assertEqual(3)");
      expect(a2dp.getStatistics().totalOperations).assertEqual(3);

      await a2dp.disconnect(DEVICE_MAIN);
      await a2dp.disconnect(DEVICE_OTHER);
      await hfp.disconnect(DEVICE_MAIN);
      await a2dp.destroy();
      await hfp.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0017', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0018', 'begin');
      const a2dp = await initA2dp();
      const hfp = await initHfp();
      const hid = await initHid();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0018',
        '#1 assert ' + "expect(await a2dp.connect('')).assertFalse()");
      expect(await a2dp.connect('')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0018',
        '#2 assert ' + "expect(await a2dp.connect('')).assertFalse()");
      expect(await a2dp.connect('')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0018',
        '#3 assert ' + "expect(await hfp.connect(DEVICE_MAIN)).assertTrue()");
      expect(await hfp.connect(DEVICE_MAIN)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0018',
        '#4 assert ' + "expect(await hid.disconnect(GHOST_DEVICE)).assertFalse()");
      expect(await hid.disconnect(GHOST_DEVICE)).assertFalse();

      await Promise.all([a2dp.reset(), hfp.reset(), hid.reset()]);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0018',
        '#5 assert ' + "expect(a2dp.getOperationRecords().length).assertEqual(1)");
      expect(a2dp.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0018',
        '#6 assert ' + "expect(hfp.getOperationRecords().length).assertEqual(1)");
      expect(hfp.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0018',
        '#7 assert ' + "expect(hid.getOperationRecords().length).assertEqual(1)");
      expect(hid.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0018',
        '#8 assert ' + "expect(a2dp.getOperationRecords()[0].operationName).assertEqual('reset')");
      expect(a2dp.getOperationRecords()[0].operationName).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0018',
        '#9 assert ' + "expect(hfp.getOperationRecords()[0].details).assertEqual('Manager reset')");
      expect(hfp.getOperationRecords()[0].details).assertEqual('Manager reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0018',
        '#10 assert ' + "expect(hid.getOperationRecords()[0].success).assertTrue()");
      expect(hid.getOperationRecords()[0].success).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0018',
        '#11 assert ' + "expect(a2dp.getService().getOperationHistory().length).assertEqual(1)");
      expect(a2dp.getService().getOperationHistory().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0018',
        '#12 assert ' + "expect(hfp.getService().getOperationHistory().length).assertEqual(1)");
      expect(hfp.getService().getOperationHistory().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0018',
        '#13 assert ' + "expect(hid.getService().getOperationHistory().length).assertEqual(1)");
      expect(hid.getService().getOperationHistory().length).assertEqual(1);

      const a2dpStats = a2dp.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0018',
        '#14 ' + "a2dpStats.totalConnectionAttempts" + ' = ' + JSON.stringify(a2dpStats.totalConnectionAttempts));
      expect(a2dpStats.totalConnectionAttempts).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0018',
        '#15 ' + "a2dpStats.failedConnections" + ' = ' + JSON.stringify(a2dpStats.failedConnections));
      expect(a2dpStats.failedConnections).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0018',
        '#16 ' + "a2dpStats.totalOperations" + ' = ' + JSON.stringify(a2dpStats.totalOperations));
      expect(a2dpStats.totalOperations).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0018',
        '#17 ' + "a2dpStats.failedOperations" + ' = ' + JSON.stringify(a2dpStats.failedOperations));
      expect(a2dpStats.failedOperations).assertEqual(2);
      const hfpStats = hfp.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0018',
        '#18 ' + "hfpStats.successfulConnections" + ' = ' + JSON.stringify(hfpStats.successfulConnections));
      expect(hfpStats.successfulConnections).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0018',
        '#19 ' + "hfpStats.disconnectionEvents" + ' = ' + JSON.stringify(hfpStats.disconnectionEvents));
      expect(hfpStats.disconnectionEvents).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0018',
        '#20 ' + "hfpStats.totalOperations" + ' = ' + JSON.stringify(hfpStats.totalOperations));
      expect(hfpStats.totalOperations).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0018',
        '#21 ' + "hfpStats.failedOperations" + ' = ' + JSON.stringify(hfpStats.failedOperations));
      expect(hfpStats.failedOperations).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0018',
        '#22 ' + "hfpStats.healthScore" + ' = ' + JSON.stringify(hfpStats.healthScore));
      expect(hfpStats.healthScore).assertEqual(HEALTHY_SCORE);
      const hidStats = hid.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0018',
        '#23 ' + "hidStats.totalConnectionAttempts" + ' = ' + JSON.stringify(hidStats.totalConnectionAttempts));
      expect(hidStats.totalConnectionAttempts).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0018',
        '#24 ' + "hidStats.totalOperations" + ' = ' + JSON.stringify(hidStats.totalOperations));
      expect(hidStats.totalOperations).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0018',
        '#25 ' + "hidStats.failedOperations" + ' = ' + JSON.stringify(hidStats.failedOperations));
      expect(hidStats.failedOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0018',
        '#26 ' + "hidStats.errorRate" + ' = ' + JSON.stringify(hidStats.errorRate));
      expect(hidStats.errorRate).assertEqual(1 / 3 * 100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0018',
        '#27 ' + "hidStats.healthScore" + ' = ' + JSON.stringify(hidStats.healthScore));
      expect(hidStats.healthScore).assertEqual(20);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0018',
        '#28 assert ' + "expect(a2dp.isConnected()).assertFalse()");
      expect(a2dp.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0018',
        '#29 assert ' + "expect(hfp.isConnected()).assertFalse()");
      expect(hfp.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0018',
        '#30 assert ' + "expect(hid.isConnected()).assertFalse()");
      expect(hid.isConnected()).assertFalse();

      await a2dp.destroy();
      await hfp.destroy();
      await hid.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0018', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0019', 'begin');
      const a2dp = await initA2dp();
      const hfp = await initHfp();
      const hid = await initHid();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0019',
        '#1 assert ' + "expect(await a2dp.connect('')).assertFalse()");
      expect(await a2dp.connect('')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0019',
        '#2 assert ' + "expect(await hfp.connect('')).assertFalse()");
      expect(await hfp.connect('')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0019',
        '#3 assert ' + "expect(await hid.connect('')).assertFalse()");
      expect(await hid.connect('')).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0019',
        '#4 assert ' + "expect(a2dp.getOperationRecords().length).assertEqual(2)");
      expect(a2dp.getOperationRecords().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0019',
        '#5 assert ' + "expect(hfp.getOperationRecords().length).assertEqual(2)");
      expect(hfp.getOperationRecords().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0019',
        '#6 assert ' + "expect(hid.getOperationRecords().length).assertEqual(2)");
      expect(hid.getOperationRecords().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0019',
        '#7 assert ' + "expect(a2dp.getOperationRecords()[1].operationId).assertEqual('mgr_op_2')");
      expect(a2dp.getOperationRecords()[1].operationId).assertEqual('mgr_op_2');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0019',
        '#8 assert ' + "expect(hfp.getOperationRecords()[1].errorMessage).assertEqual('Connection failed')");
      expect(hfp.getOperationRecords()[1].errorMessage).assertEqual('Connection failed');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0019',
        '#9 assert ' + "expect(hid.getOperationRecords()[1].details).assertEqual('Failed to connect to ')");
      expect(hid.getOperationRecords()[1].details).assertEqual('Failed to connect to ');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0019',
        '#10 assert ' + "expect(a2dp.getStatistics().failedOperations).assertEqual(1)");
      expect(a2dp.getStatistics().failedOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0019',
        '#11 assert ' + "expect(hfp.getStatistics().totalOperations).assertEqual(2)");
      expect(hfp.getStatistics().totalOperations).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0019',
        '#12 assert ' + "expect(hid.getStatistics().errorRate).assertEqual(50)");
      expect(hid.getStatistics().errorRate).assertEqual(50);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0019',
        '#13 assert ' + "expect(await a2dp.disconnect(GHOST_DEVICE)).assertFalse()");
      expect(await a2dp.disconnect(GHOST_DEVICE)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0019',
        '#14 assert ' + "expect(await a2dp.disconnect(GHOST_DEVICE)).assertFalse()");
      expect(await a2dp.disconnect(GHOST_DEVICE)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0019',
        '#15 assert ' + "expect(a2dp.getOperationRecords().length).assertEqual(4)");
      expect(a2dp.getOperationRecords().length).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0019',
        '#16 assert ' + "expect(hfp.getOperationRecords().length).assertEqual(2)");
      expect(hfp.getOperationRecords().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0019',
        '#17 assert ' + "expect(hid.getOperationRecords().length).assertEqual(2)");
      expect(hid.getOperationRecords().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0019',
        '#18 assert ' + "expect(a2dp.getOperationRecords()[3].operationId).assertEqual('mgr_op_4')");
      expect(a2dp.getOperationRecords()[3].operationId).assertEqual('mgr_op_4');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0019',
        '#19 assert ' + "expect(a2dp.getOperationRecords()[2].errorMessage).assertEqual('Not managed')");
      expect(a2dp.getOperationRecords()[2].errorMessage).assertEqual('Not managed');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0019',
        '#20 assert ' + "expect(a2dp.getStatistics().failedOperations).assertEqual(3)");
      expect(a2dp.getStatistics().failedOperations).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0019',
        '#21 assert ' + "expect(a2dp.getStatistics().totalOperations).assertEqual(4)");
      expect(a2dp.getStatistics().totalOperations).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0019',
        '#22 assert ' + "expect(hfp.getStatistics().failedOperations).assertEqual(1)");
      expect(hfp.getStatistics().failedOperations).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0019',
        '#23 assert ' + "expect(hid.getStatistics().totalOperations).assertEqual(2)");
      expect(hid.getStatistics().totalOperations).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0019',
        '#24 assert ' + "expect(hid.getService().getOperationHistory().length).assertEqual(2)");
      expect(hid.getService().getOperationHistory().length).assertEqual(2);

      await a2dp.destroy();
      await hfp.destroy();
      await hid.destroy();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0019', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0020', 'begin');
      const a2dp: A2dpProfileManager = new A2dpProfileManager();
      const hfp: HfpProfileManager = new HfpProfileManager();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0020',
        '#1 assert ' + "expect(await a2dp.connect(DEVICE_MAIN)).assertFalse()");
      expect(await a2dp.connect(DEVICE_MAIN)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0020',
        '#2 assert ' + "expect(a2dp.getOperationRecords().length).assertEqual(1)");
      expect(a2dp.getOperationRecords().length).assertEqual(1);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0020',
        '#3 assert ' + "expect(await a2dp.initialize()).assertTrue()");
      expect(await a2dp.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0020',
        '#4 assert ' + "expect(await hfp.initialize()).assertTrue()");
      expect(await hfp.initialize()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0020',
        '#5 assert ' + "expect(a2dp.getOperationRecords().length).assertEqual(1)");
      expect(a2dp.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0020',
        '#6 assert ' + "expect(a2dp.getOperationRecords()[0].operationName).assertEqual('initialize')");
      expect(a2dp.getOperationRecords()[0].operationName).assertEqual('initialize');

      const flags: boolean[] = await Promise.all([a2dp.connect(DEVICE_MAIN), hfp.connect(DEVICE_MAIN)]);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0020',
        '#7 ' + "flags[0]" + ' = ' + JSON.stringify(flags[0]));
      expect(flags[0]).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0020',
        '#8 ' + "flags[1]" + ' = ' + JSON.stringify(flags[1]));
      expect(flags[1]).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0020',
        '#9 assert ' + "expect(a2dp.isConnected()).assertTrue()");
      expect(a2dp.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0020',
        '#10 assert ' + "expect(hfp.isConnected()).assertTrue()");
      expect(hfp.isConnected()).assertTrue();

      await a2dp.reset();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0020',
        '#11 assert ' + "expect(a2dp.isConnected()).assertFalse()");
      expect(a2dp.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0020',
        '#12 assert ' + "expect(hfp.isConnected()).assertTrue()");
      expect(hfp.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0020',
        '#13 assert ' + "expect(await a2dp.connect(DEVICE_OTHER)).assertTrue()");
      expect(await a2dp.connect(DEVICE_OTHER)).assertTrue();
      const recovered = a2dp.getStatistics();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0020',
        '#14 ' + "recovered.totalConnectionAttempts" + ' = ' + JSON.stringify(recovered.totalConnectionAttempts));
      expect(recovered.totalConnectionAttempts).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0020',
        '#15 ' + "recovered.successfulConnections" + ' = ' + JSON.stringify(recovered.successfulConnections));
      expect(recovered.successfulConnections).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0020',
        '#16 ' + "recovered.failedOperations" + ' = ' + JSON.stringify(recovered.failedOperations));
      expect(recovered.failedOperations).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0020',
        '#17 ' + "recovered.totalOperations" + ' = ' + JSON.stringify(recovered.totalOperations));
      expect(recovered.totalOperations).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0020',
        '#18 ' + "recovered.healthScore" + ' = ' + JSON.stringify(recovered.healthScore));
      expect(recovered.healthScore).assertEqual(HEALTHY_SCORE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0020',
        '#19 ' + "recovered.connectionSuccessRate" + ' = ' + JSON.stringify(recovered.connectionSuccessRate));
      expect(recovered.connectionSuccessRate).assertEqual(100);

      await a2dp.destroy();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0020',
        '#20 assert ' + "expect(await a2dp.connect(DEVICE_THIRD)).assertFalse()");
      expect(await a2dp.connect(DEVICE_THIRD)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0020',
        '#21 assert ' + "expect(a2dp.getOperationRecords().length).assertEqual(2)");
      expect(a2dp.getOperationRecords().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0020',
        '#22 assert ' + "expect(a2dp.getOperationRecords()[1].errorMessage).assertEqual('Not ready')");
      expect(a2dp.getOperationRecords()[1].errorMessage).assertEqual('Not ready');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0020',
        '#23 assert ' + "expect(a2dp.isConnected()).assertFalse()");
      expect(a2dp.isConnected()).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0020',
        '#24 assert ' + "expect(await hfp.connect(DEVICE_OTHER)).assertTrue()");
      expect(await hfp.connect(DEVICE_OTHER)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0020',
        '#25 assert ' + "expect(hfp.getManagedDeviceCount()).assertEqual(2)");
      expect(hfp.getManagedDeviceCount()).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0020',
        '#26 assert ' + "expect(hfp.getStatistics().totalConnectionAttempts).assertEqual(2)");
      expect(hfp.getStatistics().totalConnectionAttempts).assertEqual(2);
      await hfp.disconnect(DEVICE_OTHER);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0020',
        '#27 assert ' + "expect(hfp.getConnectedDeviceIds()[0]).assertEqual(DEVICE_MAIN)");
      expect(hfp.getConnectedDeviceIds()[0]).assertEqual(DEVICE_MAIN);
      await hfp.destroy();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0020',
        '#28 assert ' + "expect(hfp.isConnected()).assertFalse()");
      expect(hfp.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0020',
        '#29 assert ' + "expect(hfp.getStatistics().disconnectionEvents).assertEqual(2)");
      expect(hfp.getStatistics().disconnectionEvents).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0020',
        '#30 assert ' + "expect(hfp.getOperationRecords().length).assertEqual(1)");
      expect(hfp.getOperationRecords().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0020',
        '#31 assert ' + "expect(hfp.getOperationRecords()[0].operationName).assertEqual('reset')");
      expect(hfp.getOperationRecords()[0].operationName).assertEqual('reset');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0020',
        '#32 assert ' + "expect(hfp.getStatistics().successfulConnections).assertEqual(2)");
      expect(hfp.getStatistics().successfulConnections).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMultiProfile0020',
        '#33 assert ' + "expect(hfp.getProfileType()).assertEqual(BluetoothProfileType.HFP)");
      expect(hfp.getProfileType()).assertEqual(BluetoothProfileType.HFP);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMultiProfile0020', 'end');
    });
  });
}
