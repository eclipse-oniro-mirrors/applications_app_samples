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

/**
 * 快照的状态与字段交叉矩阵。
 *
 * 快照是不可变对象，页面每一次刷新都会派生新实例，因此每个派生用例都成对断言
 * 「新实例的字段变了」与「来源实例的字段没变」，并把状态、设备数、连接态、订阅态四组组合分开写。
 */

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { ProfileKind } from '../../../main/ets/model/ProfileCatalog';
import { ProfileSnapshot } from '../../../main/ets/model/ProfileSnapshot';
import { ProbeStatus } from '../../../main/ets/model/ProfileState';

/** 以状态三元组构造快照 */
function snapshotOf(status: ProbeStatus, code: number, message: string): ProfileSnapshot {
  return new ProfileSnapshot(ProfileKind.HFP, { status: status, code: code, message: message });
}

/** 以设备清单、当前设备与连接态构造快照 */
function snapshotWith(devices: string[], currentDeviceId: string, currentState: number): ProfileSnapshot {
  return new ProfileSnapshot(ProfileKind.HFP, {
    devices: devices,
    currentDeviceId: currentDeviceId,
    currentState: currentState
  });
}

/** 生成 count 个连续尾号的设备地址 */
function devicesOf(count: number, start: number = 0): string[] {
  const list: string[] = [];
  for (let index = 0; index < count; index++) {
    list.push('A1:B2:C3:D4:E5:F' + (start + index));
  }
  return list;
}

export default function bluetoothProfileSnapshotCrossTest() {
  describe('BluetoothProfileSnapshotCrossTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0001
     * @tc.name snapshotCross0001
     * @tc.desc Verify the describe line of status IDLE joins the name, the code and the message.
     */
    it('snapshotCross0001', 0, () => {
      const snapshot: ProfileSnapshot = snapshotOf(ProbeStatus.IDLE, 0, 'detail');
      expect(snapshot.status).assertEqual(ProbeStatus.IDLE);
      expect(snapshot.code).assertEqual(0);
      expect(snapshot.describe()).assertEqual('未探测（0）detail');
      expect(snapshot.describe().length).assertEqual(12);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0002
     * @tc.name snapshotCross0002
     * @tc.desc Verify withStatus derives status IDLE without touching the snapshot it came from.
     */
    it('snapshotCross0002', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.IDLE, 0, 'base');
      const next: ProfileSnapshot = base.withStatus(ProbeStatus.IDLE, 0, 'next');
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(next.code).assertEqual(0);
      expect(base.status).assertEqual(ProbeStatus.IDLE);
      expect(base.message).assertEqual('base');
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0003
     * @tc.name snapshotCross0003
     * @tc.desc Verify the describe line of status READY joins the name, the code and the message.
     */
    it('snapshotCross0003', 0, () => {
      const snapshot: ProfileSnapshot = snapshotOf(ProbeStatus.READY, 0, 'detail');
      expect(snapshot.status).assertEqual(ProbeStatus.READY);
      expect(snapshot.code).assertEqual(0);
      expect(snapshot.describe()).assertEqual('可用（0）detail');
      expect(snapshot.describe().length).assertEqual(11);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0004
     * @tc.name snapshotCross0004
     * @tc.desc Verify withStatus derives status READY without touching the snapshot it came from.
     */
    it('snapshotCross0004', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.IDLE, 0, 'base');
      const next: ProfileSnapshot = base.withStatus(ProbeStatus.READY, 0, 'next');
      expect(next.status).assertEqual(ProbeStatus.READY);
      expect(next.code).assertEqual(0);
      expect(base.status).assertEqual(ProbeStatus.IDLE);
      expect(base.message).assertEqual('base');
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0005
     * @tc.name snapshotCross0005
     * @tc.desc Verify the describe line of status NO_DEVICE joins the name, the code and the message.
     */
    it('snapshotCross0005', 0, () => {
      const snapshot: ProfileSnapshot = snapshotOf(ProbeStatus.NO_DEVICE, 0, 'detail');
      expect(snapshot.status).assertEqual(ProbeStatus.NO_DEVICE);
      expect(snapshot.code).assertEqual(0);
      expect(snapshot.describe()).assertEqual('无已连接设备（0）detail');
      expect(snapshot.describe().length).assertEqual(15);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0006
     * @tc.name snapshotCross0006
     * @tc.desc Verify withStatus derives status NO_DEVICE without touching the snapshot it came from.
     */
    it('snapshotCross0006', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.IDLE, 0, 'base');
      const next: ProfileSnapshot = base.withStatus(ProbeStatus.NO_DEVICE, 0, 'next');
      expect(next.status).assertEqual(ProbeStatus.NO_DEVICE);
      expect(next.code).assertEqual(0);
      expect(base.status).assertEqual(ProbeStatus.IDLE);
      expect(base.message).assertEqual('base');
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0007
     * @tc.name snapshotCross0007
     * @tc.desc Verify the describe line of status PERMISSION_DENIED joins the name, the code and the message.
     */
    it('snapshotCross0007', 0, () => {
      const snapshot: ProfileSnapshot = snapshotOf(ProbeStatus.PERMISSION_DENIED, 201, 'detail');
      expect(snapshot.status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(snapshot.code).assertEqual(201);
      expect(snapshot.describe()).assertEqual('缺少权限（201）detail');
      expect(snapshot.describe().length).assertEqual(15);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0008
     * @tc.name snapshotCross0008
     * @tc.desc Verify withStatus derives status PERMISSION_DENIED without touching the snapshot it came from.
     */
    it('snapshotCross0008', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.IDLE, 0, 'base');
      const next: ProfileSnapshot = base.withStatus(ProbeStatus.PERMISSION_DENIED, 201, 'next');
      expect(next.status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(next.code).assertEqual(201);
      expect(base.status).assertEqual(ProbeStatus.IDLE);
      expect(base.message).assertEqual('base');
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0009
     * @tc.name snapshotCross0009
     * @tc.desc Verify the describe line of status CAPABILITY_UNSUPPORTED joins the name, the code and the message.
     */
    it('snapshotCross0009', 0, () => {
      const snapshot: ProfileSnapshot = snapshotOf(ProbeStatus.CAPABILITY_UNSUPPORTED, 801, 'detail');
      expect(snapshot.status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(snapshot.code).assertEqual(801);
      expect(snapshot.describe()).assertEqual('设备不支持（801）detail');
      expect(snapshot.describe().length).assertEqual(16);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0010
     * @tc.name snapshotCross0010
     * @tc.desc Verify withStatus derives status CAPABILITY_UNSUPPORTED without touching the snapshot it came from.
     */
    it('snapshotCross0010', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.IDLE, 0, 'base');
      const next: ProfileSnapshot = base.withStatus(ProbeStatus.CAPABILITY_UNSUPPORTED, 801, 'next');
      expect(next.status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(next.code).assertEqual(801);
      expect(base.status).assertEqual(ProbeStatus.IDLE);
      expect(base.message).assertEqual('base');
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0011
     * @tc.name snapshotCross0011
     * @tc.desc Verify the describe line of status BLUETOOTH_DISABLED joins the name, the code and the message.
     */
    it('snapshotCross0011', 0, () => {
      const snapshot: ProfileSnapshot = snapshotOf(ProbeStatus.BLUETOOTH_DISABLED, 2900003, 'detail');
      expect(snapshot.status).assertEqual(ProbeStatus.BLUETOOTH_DISABLED);
      expect(snapshot.code).assertEqual(2900003);
      expect(snapshot.describe()).assertEqual('蓝牙未开启（2900003）detail');
      expect(snapshot.describe().length).assertEqual(20);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0012
     * @tc.name snapshotCross0012
     * @tc.desc Verify withStatus derives status BLUETOOTH_DISABLED without touching the snapshot it came from.
     */
    it('snapshotCross0012', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.IDLE, 0, 'base');
      const next: ProfileSnapshot = base.withStatus(ProbeStatus.BLUETOOTH_DISABLED, 2900003, 'next');
      expect(next.status).assertEqual(ProbeStatus.BLUETOOTH_DISABLED);
      expect(next.code).assertEqual(2900003);
      expect(base.status).assertEqual(ProbeStatus.IDLE);
      expect(base.message).assertEqual('base');
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0013
     * @tc.name snapshotCross0013
     * @tc.desc Verify the describe line of status SERVICE_STOPPED joins the name, the code and the message.
     */
    it('snapshotCross0013', 0, () => {
      const snapshot: ProfileSnapshot = snapshotOf(ProbeStatus.SERVICE_STOPPED, 2900001, 'detail');
      expect(snapshot.status).assertEqual(ProbeStatus.SERVICE_STOPPED);
      expect(snapshot.code).assertEqual(2900001);
      expect(snapshot.describe()).assertEqual('蓝牙服务已停止（2900001）detail');
      expect(snapshot.describe().length).assertEqual(22);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0014
     * @tc.name snapshotCross0014
     * @tc.desc Verify withStatus derives status SERVICE_STOPPED without touching the snapshot it came from.
     */
    it('snapshotCross0014', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.IDLE, 0, 'base');
      const next: ProfileSnapshot = base.withStatus(ProbeStatus.SERVICE_STOPPED, 2900001, 'next');
      expect(next.status).assertEqual(ProbeStatus.SERVICE_STOPPED);
      expect(next.code).assertEqual(2900001);
      expect(base.status).assertEqual(ProbeStatus.IDLE);
      expect(base.message).assertEqual('base');
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0015
     * @tc.name snapshotCross0015
     * @tc.desc Verify the describe line of status PROFILE_UNSUPPORTED joins the name, the code and the message.
     */
    it('snapshotCross0015', 0, () => {
      const snapshot: ProfileSnapshot = snapshotOf(ProbeStatus.PROFILE_UNSUPPORTED, 2900004, 'detail');
      expect(snapshot.status).assertEqual(ProbeStatus.PROFILE_UNSUPPORTED);
      expect(snapshot.code).assertEqual(2900004);
      expect(snapshot.describe()).assertEqual('Profile 不支持（2900004）detail');
      expect(snapshot.describe().length).assertEqual(26);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0016
     * @tc.name snapshotCross0016
     * @tc.desc Verify withStatus derives status PROFILE_UNSUPPORTED without touching the snapshot it came from.
     */
    it('snapshotCross0016', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.IDLE, 0, 'base');
      const next: ProfileSnapshot = base.withStatus(ProbeStatus.PROFILE_UNSUPPORTED, 2900004, 'next');
      expect(next.status).assertEqual(ProbeStatus.PROFILE_UNSUPPORTED);
      expect(next.code).assertEqual(2900004);
      expect(base.status).assertEqual(ProbeStatus.IDLE);
      expect(base.message).assertEqual('base');
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0017
     * @tc.name snapshotCross0017
     * @tc.desc Verify the describe line of status FAILED joins the name, the code and the message.
     */
    it('snapshotCross0017', 0, () => {
      const snapshot: ProfileSnapshot = snapshotOf(ProbeStatus.FAILED, 401, 'detail');
      expect(snapshot.status).assertEqual(ProbeStatus.FAILED);
      expect(snapshot.code).assertEqual(401);
      expect(snapshot.describe()).assertEqual('操作失败（401）detail');
      expect(snapshot.describe().length).assertEqual(15);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0018
     * @tc.name snapshotCross0018
     * @tc.desc Verify withStatus derives status FAILED without touching the snapshot it came from.
     */
    it('snapshotCross0018', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.IDLE, 0, 'base');
      const next: ProfileSnapshot = base.withStatus(ProbeStatus.FAILED, 401, 'next');
      expect(next.status).assertEqual(ProbeStatus.FAILED);
      expect(next.code).assertEqual(401);
      expect(base.status).assertEqual(ProbeStatus.IDLE);
      expect(base.message).assertEqual('base');
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0019
     * @tc.name snapshotCross0019
     * @tc.desc Verify a snapshot holding 0 devices reports the same count from both getters.
     */
    it('snapshotCross0019', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(0), '', 0);
      expect(snapshot.deviceCount()).assertEqual(0);
      expect(snapshot.devices.length).assertEqual(0);
      expect(snapshot.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0020
     * @tc.name snapshotCross0020
     * @tc.desc Verify withDevices replaces the list with 0 entries and keeps the source intact.
     */
    it('snapshotCross0020', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(1), '', 0);
      const next: ProfileSnapshot = base.withDevices(devicesOf(0));
      expect(next.deviceCount()).assertEqual(0);
      expect(base.deviceCount()).assertEqual(1);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0021
     * @tc.name snapshotCross0021
     * @tc.desc Verify a snapshot holding 1 devices reports the same count from both getters.
     */
    it('snapshotCross0021', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(1), '', 0);
      expect(snapshot.deviceCount()).assertEqual(1);
      expect(snapshot.devices.length).assertEqual(1);
      expect(snapshot.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0022
     * @tc.name snapshotCross0022
     * @tc.desc Verify withDevices replaces the list with 1 entries and keeps the source intact.
     */
    it('snapshotCross0022', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(1), '', 0);
      const next: ProfileSnapshot = base.withDevices(devicesOf(1));
      expect(next.deviceCount()).assertEqual(1);
      expect(base.deviceCount()).assertEqual(1);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0023
     * @tc.name snapshotCross0023
     * @tc.desc Verify a snapshot holding 2 devices reports the same count from both getters.
     */
    it('snapshotCross0023', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(2), '', 0);
      expect(snapshot.deviceCount()).assertEqual(2);
      expect(snapshot.devices.length).assertEqual(2);
      expect(snapshot.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0024
     * @tc.name snapshotCross0024
     * @tc.desc Verify withDevices replaces the list with 2 entries and keeps the source intact.
     */
    it('snapshotCross0024', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(1), '', 0);
      const next: ProfileSnapshot = base.withDevices(devicesOf(2));
      expect(next.deviceCount()).assertEqual(2);
      expect(base.deviceCount()).assertEqual(1);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0025
     * @tc.name snapshotCross0025
     * @tc.desc Verify a snapshot holding 3 devices reports the same count from both getters.
     */
    it('snapshotCross0025', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(3), '', 0);
      expect(snapshot.deviceCount()).assertEqual(3);
      expect(snapshot.devices.length).assertEqual(3);
      expect(snapshot.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0026
     * @tc.name snapshotCross0026
     * @tc.desc Verify withDevices replaces the list with 3 entries and keeps the source intact.
     */
    it('snapshotCross0026', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(1), '', 0);
      const next: ProfileSnapshot = base.withDevices(devicesOf(3));
      expect(next.deviceCount()).assertEqual(3);
      expect(base.deviceCount()).assertEqual(1);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0027
     * @tc.name snapshotCross0027
     * @tc.desc Verify a snapshot holding 4 devices reports the same count from both getters.
     */
    it('snapshotCross0027', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(4), '', 0);
      expect(snapshot.deviceCount()).assertEqual(4);
      expect(snapshot.devices.length).assertEqual(4);
      expect(snapshot.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0028
     * @tc.name snapshotCross0028
     * @tc.desc Verify withDevices replaces the list with 4 entries and keeps the source intact.
     */
    it('snapshotCross0028', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(1), '', 0);
      const next: ProfileSnapshot = base.withDevices(devicesOf(4));
      expect(next.deviceCount()).assertEqual(4);
      expect(base.deviceCount()).assertEqual(1);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0029
     * @tc.name snapshotCross0029
     * @tc.desc Verify a snapshot holding 5 devices reports the same count from both getters.
     */
    it('snapshotCross0029', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(5), '', 0);
      expect(snapshot.deviceCount()).assertEqual(5);
      expect(snapshot.devices.length).assertEqual(5);
      expect(snapshot.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0030
     * @tc.name snapshotCross0030
     * @tc.desc Verify withDevices replaces the list with 5 entries and keeps the source intact.
     */
    it('snapshotCross0030', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(1), '', 0);
      const next: ProfileSnapshot = base.withDevices(devicesOf(5));
      expect(next.deviceCount()).assertEqual(5);
      expect(base.deviceCount()).assertEqual(1);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0031
     * @tc.name snapshotCross0031
     * @tc.desc Verify a snapshot holding 6 devices reports the same count from both getters.
     */
    it('snapshotCross0031', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(6), '', 0);
      expect(snapshot.deviceCount()).assertEqual(6);
      expect(snapshot.devices.length).assertEqual(6);
      expect(snapshot.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0032
     * @tc.name snapshotCross0032
     * @tc.desc Verify withDevices replaces the list with 6 entries and keeps the source intact.
     */
    it('snapshotCross0032', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(1), '', 0);
      const next: ProfileSnapshot = base.withDevices(devicesOf(6));
      expect(next.deviceCount()).assertEqual(6);
      expect(base.deviceCount()).assertEqual(1);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0033
     * @tc.name snapshotCross0033
     * @tc.desc Verify a snapshot holding 8 devices reports the same count from both getters.
     */
    it('snapshotCross0033', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(8), '', 0);
      expect(snapshot.deviceCount()).assertEqual(8);
      expect(snapshot.devices.length).assertEqual(8);
      expect(snapshot.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0034
     * @tc.name snapshotCross0034
     * @tc.desc Verify withDevices replaces the list with 8 entries and keeps the source intact.
     */
    it('snapshotCross0034', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(1), '', 0);
      const next: ProfileSnapshot = base.withDevices(devicesOf(8));
      expect(next.deviceCount()).assertEqual(8);
      expect(base.deviceCount()).assertEqual(1);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0035
     * @tc.name snapshotCross0035
     * @tc.desc Verify a snapshot holding 10 devices reports the same count from both getters.
     */
    it('snapshotCross0035', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(10), '', 0);
      expect(snapshot.deviceCount()).assertEqual(10);
      expect(snapshot.devices.length).assertEqual(10);
      expect(snapshot.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0036
     * @tc.name snapshotCross0036
     * @tc.desc Verify withDevices replaces the list with 10 entries and keeps the source intact.
     */
    it('snapshotCross0036', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(1), '', 0);
      const next: ProfileSnapshot = base.withDevices(devicesOf(10));
      expect(next.deviceCount()).assertEqual(10);
      expect(base.deviceCount()).assertEqual(1);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0037
     * @tc.name snapshotCross0037
     * @tc.desc Verify withConnection stores the raw connection state 0 without translating it.
     */
    it('snapshotCross0037', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(1, 6), '', 0);
      const next: ProfileSnapshot = base.withConnection('A1:B2:C3:D4:E5:F6', 0);
      expect(next.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(next.currentState).assertEqual(0);
      expect(base.currentDeviceId).assertEqual('');
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0038
     * @tc.name snapshotCross0038
     * @tc.desc Verify withConnection stores the raw connection state 1 without translating it.
     */
    it('snapshotCross0038', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(1, 6), '', 0);
      const next: ProfileSnapshot = base.withConnection('A1:B2:C3:D4:E5:F6', 1);
      expect(next.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(next.currentState).assertEqual(1);
      expect(base.currentDeviceId).assertEqual('');
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0039
     * @tc.name snapshotCross0039
     * @tc.desc Verify withConnection stores the raw connection state 2 without translating it.
     */
    it('snapshotCross0039', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(1, 6), '', 0);
      const next: ProfileSnapshot = base.withConnection('A1:B2:C3:D4:E5:F6', 2);
      expect(next.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(next.currentState).assertEqual(2);
      expect(base.currentDeviceId).assertEqual('');
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0040
     * @tc.name snapshotCross0040
     * @tc.desc Verify withConnection stores the raw connection state 3 without translating it.
     */
    it('snapshotCross0040', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(1, 6), '', 0);
      const next: ProfileSnapshot = base.withConnection('A1:B2:C3:D4:E5:F6', 3);
      expect(next.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(next.currentState).assertEqual(3);
      expect(base.currentDeviceId).assertEqual('');
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0041
     * @tc.name snapshotCross0041
     * @tc.desc Verify withConnection stores the raw connection state 4 without translating it.
     */
    it('snapshotCross0041', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(1, 6), '', 0);
      const next: ProfileSnapshot = base.withConnection('A1:B2:C3:D4:E5:F6', 4);
      expect(next.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(next.currentState).assertEqual(4);
      expect(base.currentDeviceId).assertEqual('');
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0042
     * @tc.name snapshotCross0042
     * @tc.desc Verify withConnection stores the raw connection state -1 without translating it.
     */
    it('snapshotCross0042', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(1, 6), '', 0);
      const next: ProfileSnapshot = base.withConnection('A1:B2:C3:D4:E5:F6', -1);
      expect(next.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(next.currentState).assertEqual(-1);
      expect(base.currentDeviceId).assertEqual('');
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0043
     * @tc.name snapshotCross0043
     * @tc.desc Verify withSubscription handles the subscribe then unsubscribe order without losing the flag.
     */
    it('snapshotCross0043', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(1), '', 0);
      const one: ProfileSnapshot = base.withSubscription(true);
      const two: ProfileSnapshot = one.withSubscription(false);
      expect(one.subscribed).assertEqual(true);
      expect(two.subscribed).assertEqual(false);
      expect(base.subscribed).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0044
     * @tc.name snapshotCross0044
     * @tc.desc Verify withSubscription handles the unsubscribe before subscribe order without losing the flag.
     */
    it('snapshotCross0044', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(1), '', 0);
      const one: ProfileSnapshot = base.withSubscription(false);
      const two: ProfileSnapshot = one.withSubscription(true);
      expect(one.subscribed).assertEqual(false);
      expect(two.subscribed).assertEqual(true);
      expect(base.subscribed).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0045
     * @tc.name snapshotCross0045
     * @tc.desc Verify withSubscription handles the double subscribe order without losing the flag.
     */
    it('snapshotCross0045', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(1), '', 0);
      const one: ProfileSnapshot = base.withSubscription(true);
      const two: ProfileSnapshot = one.withSubscription(true);
      expect(one.subscribed).assertEqual(true);
      expect(two.subscribed).assertEqual(true);
      expect(base.subscribed).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0046
     * @tc.name snapshotCross0046
     * @tc.desc Verify withSubscription handles the double unsubscribe order without losing the flag.
     */
    it('snapshotCross0046', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(1), '', 0);
      const one: ProfileSnapshot = base.withSubscription(false);
      const two: ProfileSnapshot = one.withSubscription(false);
      expect(one.subscribed).assertEqual(false);
      expect(two.subscribed).assertEqual(false);
      expect(base.subscribed).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0047
     * @tc.name snapshotCross0047
     * @tc.desc Verify derive rewrites only the code field and keeps the rest of the snapshot.
     */
    it('snapshotCross0047', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.READY, 0, 'base');
      const next: ProfileSnapshot = base.derive({ code: 401 });
      expect(next.code).assertEqual(401);
      expect(base.code === next.code).assertFalse();
      expect(next.status).assertEqual(ProbeStatus.READY);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0048
     * @tc.name snapshotCross0048
     * @tc.desc Verify derive rewrites only the message field and keeps the rest of the snapshot.
     */
    it('snapshotCross0048', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.READY, 0, 'base');
      const next: ProfileSnapshot = base.derive({ message: 'derived' });
      expect(next.message).assertEqual('derived');
      expect(base.message === next.message).assertFalse();
      expect(next.message.length).assertEqual(7);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0049
     * @tc.name snapshotCross0049
     * @tc.desc Verify derive rewrites only the currentState field and keeps the rest of the snapshot.
     */
    it('snapshotCross0049', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.READY, 0, 'base');
      const next: ProfileSnapshot = base.derive({ currentState: 2 });
      expect(next.currentState).assertEqual(2);
      expect(base.currentState === next.currentState).assertFalse();
      expect(next.status).assertEqual(ProbeStatus.READY);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0050
     * @tc.name snapshotCross0050
     * @tc.desc Verify derive rewrites only the currentDeviceId field and keeps the rest of the snapshot.
     */
    it('snapshotCross0050', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.READY, 0, 'base');
      const next: ProfileSnapshot = base.derive({ currentDeviceId: 'A1:B2:C3:D4:E5:F6' });
      expect(next.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(base.currentDeviceId === next.currentDeviceId).assertFalse();
      expect(next.currentDeviceId.length).assertEqual(17);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0051
     * @tc.name snapshotCross0051
     * @tc.desc Verify derive rewrites only the devices field and keeps the rest of the snapshot.
     */
    it('snapshotCross0051', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.READY, 0, 'base');
      const next: ProfileSnapshot = base.derive({ devices: devicesOf(2, 1) });
      expect(next.deviceCount()).assertEqual(2);
      expect(base.deviceCount()).assertEqual(0);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F2')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAP_CROSS_0052
     * @tc.name snapshotCross0052
     * @tc.desc Verify derive rewrites only the subscribed field and keeps the rest of the snapshot.
     */
    it('snapshotCross0052', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.READY, 0, 'base');
      const next: ProfileSnapshot = base.derive({ subscribed: true });
      expect(next.subscribed).assertEqual(true);
      expect(base.subscribed === next.subscribed).assertFalse();
      expect(next.status).assertEqual(ProbeStatus.READY);
    });
  });
}
