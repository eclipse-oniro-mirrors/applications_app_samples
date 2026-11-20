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
 * 快照的二维立方矩阵。
 *
 * 状态与设备数、连接态与设备数各自铺开，重点是「派生只改目标字段」：
 * 带九个设备的状态快照，其状态与错误码必须与来源快照完全一致；
 * 带四个设备的连接快照，其设备清单也必须原样保留。
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
function devicesOf(count: number): string[] {
  const list: string[] = [];
  for (let index = 0; index < count; index++) {
    list.push('A1:B2:C3:D4:E5:F' + index);
  }
  return list;
}

export default function bluetoothProfileSnapshotCubeTest() {
  describe('BluetoothProfileSnapshotCubeTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0001
     * @tc.name snapshotCube0001
     * @tc.desc Verify status IDLE keeps its own code after carrying 0 devices.
     */
    it('snapshotCube0001', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.IDLE, 0, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(0));
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(next.code).assertEqual(0);
      expect(next.deviceCount()).assertEqual(0);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(false);
      expect(next.describe()).assertEqual('未探测（0）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0002
     * @tc.name snapshotCube0002
     * @tc.desc Verify status IDLE keeps its own code after carrying 1 devices.
     */
    it('snapshotCube0002', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.IDLE, 0, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(1));
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(next.code).assertEqual(0);
      expect(next.deviceCount()).assertEqual(1);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('未探测（0）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0003
     * @tc.name snapshotCube0003
     * @tc.desc Verify status IDLE keeps its own code after carrying 2 devices.
     */
    it('snapshotCube0003', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.IDLE, 0, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(2));
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(next.code).assertEqual(0);
      expect(next.deviceCount()).assertEqual(2);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('未探测（0）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0004
     * @tc.name snapshotCube0004
     * @tc.desc Verify status IDLE keeps its own code after carrying 3 devices.
     */
    it('snapshotCube0004', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.IDLE, 0, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(3));
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(next.code).assertEqual(0);
      expect(next.deviceCount()).assertEqual(3);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('未探测（0）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0005
     * @tc.name snapshotCube0005
     * @tc.desc Verify status IDLE keeps its own code after carrying 4 devices.
     */
    it('snapshotCube0005', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.IDLE, 0, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(4));
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(next.code).assertEqual(0);
      expect(next.deviceCount()).assertEqual(4);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('未探测（0）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0006
     * @tc.name snapshotCube0006
     * @tc.desc Verify status IDLE keeps its own code after carrying 5 devices.
     */
    it('snapshotCube0006', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.IDLE, 0, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(5));
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(next.code).assertEqual(0);
      expect(next.deviceCount()).assertEqual(5);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('未探测（0）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0007
     * @tc.name snapshotCube0007
     * @tc.desc Verify status IDLE keeps its own code after carrying 6 devices.
     */
    it('snapshotCube0007', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.IDLE, 0, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(6));
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(next.code).assertEqual(0);
      expect(next.deviceCount()).assertEqual(6);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('未探测（0）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0008
     * @tc.name snapshotCube0008
     * @tc.desc Verify status IDLE keeps its own code after carrying 8 devices.
     */
    it('snapshotCube0008', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.IDLE, 0, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(8));
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(next.code).assertEqual(0);
      expect(next.deviceCount()).assertEqual(8);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('未探测（0）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0009
     * @tc.name snapshotCube0009
     * @tc.desc Verify status IDLE keeps its own code after carrying 9 devices.
     */
    it('snapshotCube0009', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.IDLE, 0, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(9));
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(next.code).assertEqual(0);
      expect(next.deviceCount()).assertEqual(9);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('未探测（0）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0010
     * @tc.name snapshotCube0010
     * @tc.desc Verify status IDLE keeps its own code after carrying 12 devices.
     */
    it('snapshotCube0010', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.IDLE, 0, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(12));
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(next.code).assertEqual(0);
      expect(next.deviceCount()).assertEqual(12);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('未探测（0）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0011
     * @tc.name snapshotCube0011
     * @tc.desc Verify status READY keeps its own code after carrying 0 devices.
     */
    it('snapshotCube0011', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.READY, 0, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(0));
      expect(next.status).assertEqual(ProbeStatus.READY);
      expect(next.code).assertEqual(0);
      expect(next.deviceCount()).assertEqual(0);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(false);
      expect(next.describe()).assertEqual('可用（0）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0012
     * @tc.name snapshotCube0012
     * @tc.desc Verify status READY keeps its own code after carrying 1 devices.
     */
    it('snapshotCube0012', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.READY, 0, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(1));
      expect(next.status).assertEqual(ProbeStatus.READY);
      expect(next.code).assertEqual(0);
      expect(next.deviceCount()).assertEqual(1);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('可用（0）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0013
     * @tc.name snapshotCube0013
     * @tc.desc Verify status READY keeps its own code after carrying 2 devices.
     */
    it('snapshotCube0013', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.READY, 0, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(2));
      expect(next.status).assertEqual(ProbeStatus.READY);
      expect(next.code).assertEqual(0);
      expect(next.deviceCount()).assertEqual(2);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('可用（0）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0014
     * @tc.name snapshotCube0014
     * @tc.desc Verify status READY keeps its own code after carrying 3 devices.
     */
    it('snapshotCube0014', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.READY, 0, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(3));
      expect(next.status).assertEqual(ProbeStatus.READY);
      expect(next.code).assertEqual(0);
      expect(next.deviceCount()).assertEqual(3);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('可用（0）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0015
     * @tc.name snapshotCube0015
     * @tc.desc Verify status READY keeps its own code after carrying 4 devices.
     */
    it('snapshotCube0015', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.READY, 0, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(4));
      expect(next.status).assertEqual(ProbeStatus.READY);
      expect(next.code).assertEqual(0);
      expect(next.deviceCount()).assertEqual(4);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('可用（0）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0016
     * @tc.name snapshotCube0016
     * @tc.desc Verify status READY keeps its own code after carrying 5 devices.
     */
    it('snapshotCube0016', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.READY, 0, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(5));
      expect(next.status).assertEqual(ProbeStatus.READY);
      expect(next.code).assertEqual(0);
      expect(next.deviceCount()).assertEqual(5);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('可用（0）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0017
     * @tc.name snapshotCube0017
     * @tc.desc Verify status READY keeps its own code after carrying 6 devices.
     */
    it('snapshotCube0017', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.READY, 0, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(6));
      expect(next.status).assertEqual(ProbeStatus.READY);
      expect(next.code).assertEqual(0);
      expect(next.deviceCount()).assertEqual(6);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('可用（0）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0018
     * @tc.name snapshotCube0018
     * @tc.desc Verify status READY keeps its own code after carrying 8 devices.
     */
    it('snapshotCube0018', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.READY, 0, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(8));
      expect(next.status).assertEqual(ProbeStatus.READY);
      expect(next.code).assertEqual(0);
      expect(next.deviceCount()).assertEqual(8);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('可用（0）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0019
     * @tc.name snapshotCube0019
     * @tc.desc Verify status READY keeps its own code after carrying 9 devices.
     */
    it('snapshotCube0019', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.READY, 0, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(9));
      expect(next.status).assertEqual(ProbeStatus.READY);
      expect(next.code).assertEqual(0);
      expect(next.deviceCount()).assertEqual(9);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('可用（0）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0020
     * @tc.name snapshotCube0020
     * @tc.desc Verify status READY keeps its own code after carrying 12 devices.
     */
    it('snapshotCube0020', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.READY, 0, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(12));
      expect(next.status).assertEqual(ProbeStatus.READY);
      expect(next.code).assertEqual(0);
      expect(next.deviceCount()).assertEqual(12);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('可用（0）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0021
     * @tc.name snapshotCube0021
     * @tc.desc Verify status NO_DEVICE keeps its own code after carrying 0 devices.
     */
    it('snapshotCube0021', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.NO_DEVICE, 0, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(0));
      expect(next.status).assertEqual(ProbeStatus.NO_DEVICE);
      expect(next.code).assertEqual(0);
      expect(next.deviceCount()).assertEqual(0);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(false);
      expect(next.describe()).assertEqual('无已连接设备（0）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0022
     * @tc.name snapshotCube0022
     * @tc.desc Verify status NO_DEVICE keeps its own code after carrying 1 devices.
     */
    it('snapshotCube0022', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.NO_DEVICE, 0, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(1));
      expect(next.status).assertEqual(ProbeStatus.NO_DEVICE);
      expect(next.code).assertEqual(0);
      expect(next.deviceCount()).assertEqual(1);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('无已连接设备（0）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0023
     * @tc.name snapshotCube0023
     * @tc.desc Verify status NO_DEVICE keeps its own code after carrying 2 devices.
     */
    it('snapshotCube0023', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.NO_DEVICE, 0, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(2));
      expect(next.status).assertEqual(ProbeStatus.NO_DEVICE);
      expect(next.code).assertEqual(0);
      expect(next.deviceCount()).assertEqual(2);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('无已连接设备（0）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0024
     * @tc.name snapshotCube0024
     * @tc.desc Verify status NO_DEVICE keeps its own code after carrying 3 devices.
     */
    it('snapshotCube0024', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.NO_DEVICE, 0, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(3));
      expect(next.status).assertEqual(ProbeStatus.NO_DEVICE);
      expect(next.code).assertEqual(0);
      expect(next.deviceCount()).assertEqual(3);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('无已连接设备（0）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0025
     * @tc.name snapshotCube0025
     * @tc.desc Verify status NO_DEVICE keeps its own code after carrying 4 devices.
     */
    it('snapshotCube0025', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.NO_DEVICE, 0, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(4));
      expect(next.status).assertEqual(ProbeStatus.NO_DEVICE);
      expect(next.code).assertEqual(0);
      expect(next.deviceCount()).assertEqual(4);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('无已连接设备（0）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0026
     * @tc.name snapshotCube0026
     * @tc.desc Verify status NO_DEVICE keeps its own code after carrying 5 devices.
     */
    it('snapshotCube0026', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.NO_DEVICE, 0, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(5));
      expect(next.status).assertEqual(ProbeStatus.NO_DEVICE);
      expect(next.code).assertEqual(0);
      expect(next.deviceCount()).assertEqual(5);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('无已连接设备（0）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0027
     * @tc.name snapshotCube0027
     * @tc.desc Verify status NO_DEVICE keeps its own code after carrying 6 devices.
     */
    it('snapshotCube0027', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.NO_DEVICE, 0, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(6));
      expect(next.status).assertEqual(ProbeStatus.NO_DEVICE);
      expect(next.code).assertEqual(0);
      expect(next.deviceCount()).assertEqual(6);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('无已连接设备（0）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0028
     * @tc.name snapshotCube0028
     * @tc.desc Verify status NO_DEVICE keeps its own code after carrying 8 devices.
     */
    it('snapshotCube0028', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.NO_DEVICE, 0, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(8));
      expect(next.status).assertEqual(ProbeStatus.NO_DEVICE);
      expect(next.code).assertEqual(0);
      expect(next.deviceCount()).assertEqual(8);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('无已连接设备（0）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0029
     * @tc.name snapshotCube0029
     * @tc.desc Verify status NO_DEVICE keeps its own code after carrying 9 devices.
     */
    it('snapshotCube0029', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.NO_DEVICE, 0, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(9));
      expect(next.status).assertEqual(ProbeStatus.NO_DEVICE);
      expect(next.code).assertEqual(0);
      expect(next.deviceCount()).assertEqual(9);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('无已连接设备（0）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0030
     * @tc.name snapshotCube0030
     * @tc.desc Verify status NO_DEVICE keeps its own code after carrying 12 devices.
     */
    it('snapshotCube0030', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.NO_DEVICE, 0, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(12));
      expect(next.status).assertEqual(ProbeStatus.NO_DEVICE);
      expect(next.code).assertEqual(0);
      expect(next.deviceCount()).assertEqual(12);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('无已连接设备（0）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0031
     * @tc.name snapshotCube0031
     * @tc.desc Verify status PERMISSION_DENIED keeps its own code after carrying 0 devices.
     */
    it('snapshotCube0031', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.PERMISSION_DENIED, 201, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(0));
      expect(next.status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(next.code).assertEqual(201);
      expect(next.deviceCount()).assertEqual(0);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(false);
      expect(next.describe()).assertEqual('缺少权限（201）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0032
     * @tc.name snapshotCube0032
     * @tc.desc Verify status PERMISSION_DENIED keeps its own code after carrying 1 devices.
     */
    it('snapshotCube0032', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.PERMISSION_DENIED, 201, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(1));
      expect(next.status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(next.code).assertEqual(201);
      expect(next.deviceCount()).assertEqual(1);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('缺少权限（201）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0033
     * @tc.name snapshotCube0033
     * @tc.desc Verify status PERMISSION_DENIED keeps its own code after carrying 2 devices.
     */
    it('snapshotCube0033', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.PERMISSION_DENIED, 201, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(2));
      expect(next.status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(next.code).assertEqual(201);
      expect(next.deviceCount()).assertEqual(2);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('缺少权限（201）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0034
     * @tc.name snapshotCube0034
     * @tc.desc Verify status PERMISSION_DENIED keeps its own code after carrying 3 devices.
     */
    it('snapshotCube0034', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.PERMISSION_DENIED, 201, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(3));
      expect(next.status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(next.code).assertEqual(201);
      expect(next.deviceCount()).assertEqual(3);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('缺少权限（201）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0035
     * @tc.name snapshotCube0035
     * @tc.desc Verify status PERMISSION_DENIED keeps its own code after carrying 4 devices.
     */
    it('snapshotCube0035', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.PERMISSION_DENIED, 201, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(4));
      expect(next.status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(next.code).assertEqual(201);
      expect(next.deviceCount()).assertEqual(4);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('缺少权限（201）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0036
     * @tc.name snapshotCube0036
     * @tc.desc Verify status PERMISSION_DENIED keeps its own code after carrying 5 devices.
     */
    it('snapshotCube0036', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.PERMISSION_DENIED, 201, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(5));
      expect(next.status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(next.code).assertEqual(201);
      expect(next.deviceCount()).assertEqual(5);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('缺少权限（201）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0037
     * @tc.name snapshotCube0037
     * @tc.desc Verify status PERMISSION_DENIED keeps its own code after carrying 6 devices.
     */
    it('snapshotCube0037', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.PERMISSION_DENIED, 201, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(6));
      expect(next.status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(next.code).assertEqual(201);
      expect(next.deviceCount()).assertEqual(6);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('缺少权限（201）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0038
     * @tc.name snapshotCube0038
     * @tc.desc Verify status PERMISSION_DENIED keeps its own code after carrying 8 devices.
     */
    it('snapshotCube0038', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.PERMISSION_DENIED, 201, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(8));
      expect(next.status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(next.code).assertEqual(201);
      expect(next.deviceCount()).assertEqual(8);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('缺少权限（201）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0039
     * @tc.name snapshotCube0039
     * @tc.desc Verify status PERMISSION_DENIED keeps its own code after carrying 9 devices.
     */
    it('snapshotCube0039', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.PERMISSION_DENIED, 201, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(9));
      expect(next.status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(next.code).assertEqual(201);
      expect(next.deviceCount()).assertEqual(9);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('缺少权限（201）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0040
     * @tc.name snapshotCube0040
     * @tc.desc Verify status PERMISSION_DENIED keeps its own code after carrying 12 devices.
     */
    it('snapshotCube0040', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.PERMISSION_DENIED, 201, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(12));
      expect(next.status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(next.code).assertEqual(201);
      expect(next.deviceCount()).assertEqual(12);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('缺少权限（201）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0041
     * @tc.name snapshotCube0041
     * @tc.desc Verify status CAPABILITY_UNSUPPORTED keeps its own code after carrying 0 devices.
     */
    it('snapshotCube0041', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.CAPABILITY_UNSUPPORTED, 801, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(0));
      expect(next.status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(next.code).assertEqual(801);
      expect(next.deviceCount()).assertEqual(0);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(false);
      expect(next.describe()).assertEqual('设备不支持（801）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0042
     * @tc.name snapshotCube0042
     * @tc.desc Verify status CAPABILITY_UNSUPPORTED keeps its own code after carrying 1 devices.
     */
    it('snapshotCube0042', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.CAPABILITY_UNSUPPORTED, 801, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(1));
      expect(next.status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(next.code).assertEqual(801);
      expect(next.deviceCount()).assertEqual(1);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('设备不支持（801）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0043
     * @tc.name snapshotCube0043
     * @tc.desc Verify status CAPABILITY_UNSUPPORTED keeps its own code after carrying 2 devices.
     */
    it('snapshotCube0043', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.CAPABILITY_UNSUPPORTED, 801, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(2));
      expect(next.status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(next.code).assertEqual(801);
      expect(next.deviceCount()).assertEqual(2);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('设备不支持（801）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0044
     * @tc.name snapshotCube0044
     * @tc.desc Verify status CAPABILITY_UNSUPPORTED keeps its own code after carrying 3 devices.
     */
    it('snapshotCube0044', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.CAPABILITY_UNSUPPORTED, 801, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(3));
      expect(next.status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(next.code).assertEqual(801);
      expect(next.deviceCount()).assertEqual(3);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('设备不支持（801）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0045
     * @tc.name snapshotCube0045
     * @tc.desc Verify status CAPABILITY_UNSUPPORTED keeps its own code after carrying 4 devices.
     */
    it('snapshotCube0045', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.CAPABILITY_UNSUPPORTED, 801, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(4));
      expect(next.status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(next.code).assertEqual(801);
      expect(next.deviceCount()).assertEqual(4);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('设备不支持（801）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0046
     * @tc.name snapshotCube0046
     * @tc.desc Verify status CAPABILITY_UNSUPPORTED keeps its own code after carrying 5 devices.
     */
    it('snapshotCube0046', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.CAPABILITY_UNSUPPORTED, 801, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(5));
      expect(next.status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(next.code).assertEqual(801);
      expect(next.deviceCount()).assertEqual(5);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('设备不支持（801）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0047
     * @tc.name snapshotCube0047
     * @tc.desc Verify status CAPABILITY_UNSUPPORTED keeps its own code after carrying 6 devices.
     */
    it('snapshotCube0047', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.CAPABILITY_UNSUPPORTED, 801, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(6));
      expect(next.status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(next.code).assertEqual(801);
      expect(next.deviceCount()).assertEqual(6);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('设备不支持（801）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0048
     * @tc.name snapshotCube0048
     * @tc.desc Verify status CAPABILITY_UNSUPPORTED keeps its own code after carrying 8 devices.
     */
    it('snapshotCube0048', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.CAPABILITY_UNSUPPORTED, 801, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(8));
      expect(next.status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(next.code).assertEqual(801);
      expect(next.deviceCount()).assertEqual(8);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('设备不支持（801）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0049
     * @tc.name snapshotCube0049
     * @tc.desc Verify status CAPABILITY_UNSUPPORTED keeps its own code after carrying 9 devices.
     */
    it('snapshotCube0049', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.CAPABILITY_UNSUPPORTED, 801, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(9));
      expect(next.status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(next.code).assertEqual(801);
      expect(next.deviceCount()).assertEqual(9);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('设备不支持（801）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0050
     * @tc.name snapshotCube0050
     * @tc.desc Verify status CAPABILITY_UNSUPPORTED keeps its own code after carrying 12 devices.
     */
    it('snapshotCube0050', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.CAPABILITY_UNSUPPORTED, 801, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(12));
      expect(next.status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(next.code).assertEqual(801);
      expect(next.deviceCount()).assertEqual(12);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('设备不支持（801）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0051
     * @tc.name snapshotCube0051
     * @tc.desc Verify status BLUETOOTH_DISABLED keeps its own code after carrying 0 devices.
     */
    it('snapshotCube0051', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.BLUETOOTH_DISABLED, 2900003, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(0));
      expect(next.status).assertEqual(ProbeStatus.BLUETOOTH_DISABLED);
      expect(next.code).assertEqual(2900003);
      expect(next.deviceCount()).assertEqual(0);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(false);
      expect(next.describe()).assertEqual('蓝牙未开启（2900003）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0052
     * @tc.name snapshotCube0052
     * @tc.desc Verify status BLUETOOTH_DISABLED keeps its own code after carrying 1 devices.
     */
    it('snapshotCube0052', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.BLUETOOTH_DISABLED, 2900003, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(1));
      expect(next.status).assertEqual(ProbeStatus.BLUETOOTH_DISABLED);
      expect(next.code).assertEqual(2900003);
      expect(next.deviceCount()).assertEqual(1);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('蓝牙未开启（2900003）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0053
     * @tc.name snapshotCube0053
     * @tc.desc Verify status BLUETOOTH_DISABLED keeps its own code after carrying 2 devices.
     */
    it('snapshotCube0053', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.BLUETOOTH_DISABLED, 2900003, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(2));
      expect(next.status).assertEqual(ProbeStatus.BLUETOOTH_DISABLED);
      expect(next.code).assertEqual(2900003);
      expect(next.deviceCount()).assertEqual(2);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('蓝牙未开启（2900003）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0054
     * @tc.name snapshotCube0054
     * @tc.desc Verify status BLUETOOTH_DISABLED keeps its own code after carrying 3 devices.
     */
    it('snapshotCube0054', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.BLUETOOTH_DISABLED, 2900003, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(3));
      expect(next.status).assertEqual(ProbeStatus.BLUETOOTH_DISABLED);
      expect(next.code).assertEqual(2900003);
      expect(next.deviceCount()).assertEqual(3);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('蓝牙未开启（2900003）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0055
     * @tc.name snapshotCube0055
     * @tc.desc Verify status BLUETOOTH_DISABLED keeps its own code after carrying 4 devices.
     */
    it('snapshotCube0055', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.BLUETOOTH_DISABLED, 2900003, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(4));
      expect(next.status).assertEqual(ProbeStatus.BLUETOOTH_DISABLED);
      expect(next.code).assertEqual(2900003);
      expect(next.deviceCount()).assertEqual(4);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('蓝牙未开启（2900003）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0056
     * @tc.name snapshotCube0056
     * @tc.desc Verify status BLUETOOTH_DISABLED keeps its own code after carrying 5 devices.
     */
    it('snapshotCube0056', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.BLUETOOTH_DISABLED, 2900003, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(5));
      expect(next.status).assertEqual(ProbeStatus.BLUETOOTH_DISABLED);
      expect(next.code).assertEqual(2900003);
      expect(next.deviceCount()).assertEqual(5);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('蓝牙未开启（2900003）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0057
     * @tc.name snapshotCube0057
     * @tc.desc Verify status BLUETOOTH_DISABLED keeps its own code after carrying 6 devices.
     */
    it('snapshotCube0057', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.BLUETOOTH_DISABLED, 2900003, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(6));
      expect(next.status).assertEqual(ProbeStatus.BLUETOOTH_DISABLED);
      expect(next.code).assertEqual(2900003);
      expect(next.deviceCount()).assertEqual(6);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('蓝牙未开启（2900003）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0058
     * @tc.name snapshotCube0058
     * @tc.desc Verify status BLUETOOTH_DISABLED keeps its own code after carrying 8 devices.
     */
    it('snapshotCube0058', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.BLUETOOTH_DISABLED, 2900003, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(8));
      expect(next.status).assertEqual(ProbeStatus.BLUETOOTH_DISABLED);
      expect(next.code).assertEqual(2900003);
      expect(next.deviceCount()).assertEqual(8);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('蓝牙未开启（2900003）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0059
     * @tc.name snapshotCube0059
     * @tc.desc Verify status BLUETOOTH_DISABLED keeps its own code after carrying 9 devices.
     */
    it('snapshotCube0059', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.BLUETOOTH_DISABLED, 2900003, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(9));
      expect(next.status).assertEqual(ProbeStatus.BLUETOOTH_DISABLED);
      expect(next.code).assertEqual(2900003);
      expect(next.deviceCount()).assertEqual(9);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('蓝牙未开启（2900003）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0060
     * @tc.name snapshotCube0060
     * @tc.desc Verify status BLUETOOTH_DISABLED keeps its own code after carrying 12 devices.
     */
    it('snapshotCube0060', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.BLUETOOTH_DISABLED, 2900003, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(12));
      expect(next.status).assertEqual(ProbeStatus.BLUETOOTH_DISABLED);
      expect(next.code).assertEqual(2900003);
      expect(next.deviceCount()).assertEqual(12);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('蓝牙未开启（2900003）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0061
     * @tc.name snapshotCube0061
     * @tc.desc Verify status SERVICE_STOPPED keeps its own code after carrying 0 devices.
     */
    it('snapshotCube0061', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.SERVICE_STOPPED, 2900001, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(0));
      expect(next.status).assertEqual(ProbeStatus.SERVICE_STOPPED);
      expect(next.code).assertEqual(2900001);
      expect(next.deviceCount()).assertEqual(0);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(false);
      expect(next.describe()).assertEqual('蓝牙服务已停止（2900001）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0062
     * @tc.name snapshotCube0062
     * @tc.desc Verify status SERVICE_STOPPED keeps its own code after carrying 1 devices.
     */
    it('snapshotCube0062', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.SERVICE_STOPPED, 2900001, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(1));
      expect(next.status).assertEqual(ProbeStatus.SERVICE_STOPPED);
      expect(next.code).assertEqual(2900001);
      expect(next.deviceCount()).assertEqual(1);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('蓝牙服务已停止（2900001）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0063
     * @tc.name snapshotCube0063
     * @tc.desc Verify status SERVICE_STOPPED keeps its own code after carrying 2 devices.
     */
    it('snapshotCube0063', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.SERVICE_STOPPED, 2900001, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(2));
      expect(next.status).assertEqual(ProbeStatus.SERVICE_STOPPED);
      expect(next.code).assertEqual(2900001);
      expect(next.deviceCount()).assertEqual(2);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('蓝牙服务已停止（2900001）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0064
     * @tc.name snapshotCube0064
     * @tc.desc Verify status SERVICE_STOPPED keeps its own code after carrying 3 devices.
     */
    it('snapshotCube0064', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.SERVICE_STOPPED, 2900001, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(3));
      expect(next.status).assertEqual(ProbeStatus.SERVICE_STOPPED);
      expect(next.code).assertEqual(2900001);
      expect(next.deviceCount()).assertEqual(3);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('蓝牙服务已停止（2900001）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0065
     * @tc.name snapshotCube0065
     * @tc.desc Verify status SERVICE_STOPPED keeps its own code after carrying 4 devices.
     */
    it('snapshotCube0065', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.SERVICE_STOPPED, 2900001, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(4));
      expect(next.status).assertEqual(ProbeStatus.SERVICE_STOPPED);
      expect(next.code).assertEqual(2900001);
      expect(next.deviceCount()).assertEqual(4);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('蓝牙服务已停止（2900001）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0066
     * @tc.name snapshotCube0066
     * @tc.desc Verify status SERVICE_STOPPED keeps its own code after carrying 5 devices.
     */
    it('snapshotCube0066', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.SERVICE_STOPPED, 2900001, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(5));
      expect(next.status).assertEqual(ProbeStatus.SERVICE_STOPPED);
      expect(next.code).assertEqual(2900001);
      expect(next.deviceCount()).assertEqual(5);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('蓝牙服务已停止（2900001）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0067
     * @tc.name snapshotCube0067
     * @tc.desc Verify status SERVICE_STOPPED keeps its own code after carrying 6 devices.
     */
    it('snapshotCube0067', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.SERVICE_STOPPED, 2900001, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(6));
      expect(next.status).assertEqual(ProbeStatus.SERVICE_STOPPED);
      expect(next.code).assertEqual(2900001);
      expect(next.deviceCount()).assertEqual(6);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('蓝牙服务已停止（2900001）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0068
     * @tc.name snapshotCube0068
     * @tc.desc Verify status SERVICE_STOPPED keeps its own code after carrying 8 devices.
     */
    it('snapshotCube0068', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.SERVICE_STOPPED, 2900001, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(8));
      expect(next.status).assertEqual(ProbeStatus.SERVICE_STOPPED);
      expect(next.code).assertEqual(2900001);
      expect(next.deviceCount()).assertEqual(8);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('蓝牙服务已停止（2900001）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0069
     * @tc.name snapshotCube0069
     * @tc.desc Verify status SERVICE_STOPPED keeps its own code after carrying 9 devices.
     */
    it('snapshotCube0069', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.SERVICE_STOPPED, 2900001, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(9));
      expect(next.status).assertEqual(ProbeStatus.SERVICE_STOPPED);
      expect(next.code).assertEqual(2900001);
      expect(next.deviceCount()).assertEqual(9);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('蓝牙服务已停止（2900001）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0070
     * @tc.name snapshotCube0070
     * @tc.desc Verify status SERVICE_STOPPED keeps its own code after carrying 12 devices.
     */
    it('snapshotCube0070', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.SERVICE_STOPPED, 2900001, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(12));
      expect(next.status).assertEqual(ProbeStatus.SERVICE_STOPPED);
      expect(next.code).assertEqual(2900001);
      expect(next.deviceCount()).assertEqual(12);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('蓝牙服务已停止（2900001）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0071
     * @tc.name snapshotCube0071
     * @tc.desc Verify status PROFILE_UNSUPPORTED keeps its own code after carrying 0 devices.
     */
    it('snapshotCube0071', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.PROFILE_UNSUPPORTED, 2900004, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(0));
      expect(next.status).assertEqual(ProbeStatus.PROFILE_UNSUPPORTED);
      expect(next.code).assertEqual(2900004);
      expect(next.deviceCount()).assertEqual(0);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(false);
      expect(next.describe()).assertEqual('Profile 不支持（2900004）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0072
     * @tc.name snapshotCube0072
     * @tc.desc Verify status PROFILE_UNSUPPORTED keeps its own code after carrying 1 devices.
     */
    it('snapshotCube0072', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.PROFILE_UNSUPPORTED, 2900004, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(1));
      expect(next.status).assertEqual(ProbeStatus.PROFILE_UNSUPPORTED);
      expect(next.code).assertEqual(2900004);
      expect(next.deviceCount()).assertEqual(1);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('Profile 不支持（2900004）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0073
     * @tc.name snapshotCube0073
     * @tc.desc Verify status PROFILE_UNSUPPORTED keeps its own code after carrying 2 devices.
     */
    it('snapshotCube0073', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.PROFILE_UNSUPPORTED, 2900004, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(2));
      expect(next.status).assertEqual(ProbeStatus.PROFILE_UNSUPPORTED);
      expect(next.code).assertEqual(2900004);
      expect(next.deviceCount()).assertEqual(2);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('Profile 不支持（2900004）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0074
     * @tc.name snapshotCube0074
     * @tc.desc Verify status PROFILE_UNSUPPORTED keeps its own code after carrying 3 devices.
     */
    it('snapshotCube0074', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.PROFILE_UNSUPPORTED, 2900004, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(3));
      expect(next.status).assertEqual(ProbeStatus.PROFILE_UNSUPPORTED);
      expect(next.code).assertEqual(2900004);
      expect(next.deviceCount()).assertEqual(3);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('Profile 不支持（2900004）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0075
     * @tc.name snapshotCube0075
     * @tc.desc Verify status PROFILE_UNSUPPORTED keeps its own code after carrying 4 devices.
     */
    it('snapshotCube0075', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.PROFILE_UNSUPPORTED, 2900004, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(4));
      expect(next.status).assertEqual(ProbeStatus.PROFILE_UNSUPPORTED);
      expect(next.code).assertEqual(2900004);
      expect(next.deviceCount()).assertEqual(4);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('Profile 不支持（2900004）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0076
     * @tc.name snapshotCube0076
     * @tc.desc Verify status PROFILE_UNSUPPORTED keeps its own code after carrying 5 devices.
     */
    it('snapshotCube0076', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.PROFILE_UNSUPPORTED, 2900004, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(5));
      expect(next.status).assertEqual(ProbeStatus.PROFILE_UNSUPPORTED);
      expect(next.code).assertEqual(2900004);
      expect(next.deviceCount()).assertEqual(5);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('Profile 不支持（2900004）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0077
     * @tc.name snapshotCube0077
     * @tc.desc Verify status PROFILE_UNSUPPORTED keeps its own code after carrying 6 devices.
     */
    it('snapshotCube0077', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.PROFILE_UNSUPPORTED, 2900004, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(6));
      expect(next.status).assertEqual(ProbeStatus.PROFILE_UNSUPPORTED);
      expect(next.code).assertEqual(2900004);
      expect(next.deviceCount()).assertEqual(6);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('Profile 不支持（2900004）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0078
     * @tc.name snapshotCube0078
     * @tc.desc Verify status PROFILE_UNSUPPORTED keeps its own code after carrying 8 devices.
     */
    it('snapshotCube0078', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.PROFILE_UNSUPPORTED, 2900004, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(8));
      expect(next.status).assertEqual(ProbeStatus.PROFILE_UNSUPPORTED);
      expect(next.code).assertEqual(2900004);
      expect(next.deviceCount()).assertEqual(8);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('Profile 不支持（2900004）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0079
     * @tc.name snapshotCube0079
     * @tc.desc Verify status PROFILE_UNSUPPORTED keeps its own code after carrying 9 devices.
     */
    it('snapshotCube0079', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.PROFILE_UNSUPPORTED, 2900004, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(9));
      expect(next.status).assertEqual(ProbeStatus.PROFILE_UNSUPPORTED);
      expect(next.code).assertEqual(2900004);
      expect(next.deviceCount()).assertEqual(9);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('Profile 不支持（2900004）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0080
     * @tc.name snapshotCube0080
     * @tc.desc Verify status PROFILE_UNSUPPORTED keeps its own code after carrying 12 devices.
     */
    it('snapshotCube0080', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.PROFILE_UNSUPPORTED, 2900004, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(12));
      expect(next.status).assertEqual(ProbeStatus.PROFILE_UNSUPPORTED);
      expect(next.code).assertEqual(2900004);
      expect(next.deviceCount()).assertEqual(12);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('Profile 不支持（2900004）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0081
     * @tc.name snapshotCube0081
     * @tc.desc Verify status FAILED keeps its own code after carrying 0 devices.
     */
    it('snapshotCube0081', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.FAILED, 401, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(0));
      expect(next.status).assertEqual(ProbeStatus.FAILED);
      expect(next.code).assertEqual(401);
      expect(next.deviceCount()).assertEqual(0);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(false);
      expect(next.describe()).assertEqual('操作失败（401）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0082
     * @tc.name snapshotCube0082
     * @tc.desc Verify status FAILED keeps its own code after carrying 1 devices.
     */
    it('snapshotCube0082', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.FAILED, 401, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(1));
      expect(next.status).assertEqual(ProbeStatus.FAILED);
      expect(next.code).assertEqual(401);
      expect(next.deviceCount()).assertEqual(1);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('操作失败（401）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0083
     * @tc.name snapshotCube0083
     * @tc.desc Verify status FAILED keeps its own code after carrying 2 devices.
     */
    it('snapshotCube0083', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.FAILED, 401, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(2));
      expect(next.status).assertEqual(ProbeStatus.FAILED);
      expect(next.code).assertEqual(401);
      expect(next.deviceCount()).assertEqual(2);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('操作失败（401）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0084
     * @tc.name snapshotCube0084
     * @tc.desc Verify status FAILED keeps its own code after carrying 3 devices.
     */
    it('snapshotCube0084', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.FAILED, 401, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(3));
      expect(next.status).assertEqual(ProbeStatus.FAILED);
      expect(next.code).assertEqual(401);
      expect(next.deviceCount()).assertEqual(3);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('操作失败（401）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0085
     * @tc.name snapshotCube0085
     * @tc.desc Verify status FAILED keeps its own code after carrying 4 devices.
     */
    it('snapshotCube0085', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.FAILED, 401, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(4));
      expect(next.status).assertEqual(ProbeStatus.FAILED);
      expect(next.code).assertEqual(401);
      expect(next.deviceCount()).assertEqual(4);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('操作失败（401）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0086
     * @tc.name snapshotCube0086
     * @tc.desc Verify status FAILED keeps its own code after carrying 5 devices.
     */
    it('snapshotCube0086', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.FAILED, 401, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(5));
      expect(next.status).assertEqual(ProbeStatus.FAILED);
      expect(next.code).assertEqual(401);
      expect(next.deviceCount()).assertEqual(5);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('操作失败（401）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0087
     * @tc.name snapshotCube0087
     * @tc.desc Verify status FAILED keeps its own code after carrying 6 devices.
     */
    it('snapshotCube0087', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.FAILED, 401, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(6));
      expect(next.status).assertEqual(ProbeStatus.FAILED);
      expect(next.code).assertEqual(401);
      expect(next.deviceCount()).assertEqual(6);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('操作失败（401）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0088
     * @tc.name snapshotCube0088
     * @tc.desc Verify status FAILED keeps its own code after carrying 8 devices.
     */
    it('snapshotCube0088', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.FAILED, 401, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(8));
      expect(next.status).assertEqual(ProbeStatus.FAILED);
      expect(next.code).assertEqual(401);
      expect(next.deviceCount()).assertEqual(8);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('操作失败（401）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0089
     * @tc.name snapshotCube0089
     * @tc.desc Verify status FAILED keeps its own code after carrying 9 devices.
     */
    it('snapshotCube0089', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.FAILED, 401, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(9));
      expect(next.status).assertEqual(ProbeStatus.FAILED);
      expect(next.code).assertEqual(401);
      expect(next.deviceCount()).assertEqual(9);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('操作失败（401）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0090
     * @tc.name snapshotCube0090
     * @tc.desc Verify status FAILED keeps its own code after carrying 12 devices.
     */
    it('snapshotCube0090', 0, () => {
      const base: ProfileSnapshot = snapshotOf(ProbeStatus.FAILED, 401, 'cube');
      const next: ProfileSnapshot = base.withDevices(devicesOf(12));
      expect(next.status).assertEqual(ProbeStatus.FAILED);
      expect(next.code).assertEqual(401);
      expect(next.deviceCount()).assertEqual(12);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
      expect(next.describe()).assertEqual('操作失败（401）cube');
      expect(base.deviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0091
     * @tc.name snapshotCube0091
     * @tc.desc Verify connection state 0 survives a snapshot carrying 0 devices.
     */
    it('snapshotCube0091', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(0), '', 0);
      const next: ProfileSnapshot = base.withConnection('A1:B2:C3:D4:E5:F1', 0);
      expect(next.currentState).assertEqual(0);
      expect(next.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F1');
      expect(next.deviceCount()).assertEqual(0);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F1')).assertEqual(false);
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(base.currentState).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0092
     * @tc.name snapshotCube0092
     * @tc.desc Verify connection state 0 survives a snapshot carrying 1 devices.
     */
    it('snapshotCube0092', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(1), '', 0);
      const next: ProfileSnapshot = base.withConnection('A1:B2:C3:D4:E5:F1', 0);
      expect(next.currentState).assertEqual(0);
      expect(next.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F1');
      expect(next.deviceCount()).assertEqual(1);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F1')).assertEqual(false);
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(base.currentState).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0093
     * @tc.name snapshotCube0093
     * @tc.desc Verify connection state 0 survives a snapshot carrying 2 devices.
     */
    it('snapshotCube0093', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(2), '', 0);
      const next: ProfileSnapshot = base.withConnection('A1:B2:C3:D4:E5:F1', 0);
      expect(next.currentState).assertEqual(0);
      expect(next.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F1');
      expect(next.deviceCount()).assertEqual(2);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F1')).assertEqual(true);
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(base.currentState).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0094
     * @tc.name snapshotCube0094
     * @tc.desc Verify connection state 0 survives a snapshot carrying 4 devices.
     */
    it('snapshotCube0094', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(4), '', 0);
      const next: ProfileSnapshot = base.withConnection('A1:B2:C3:D4:E5:F1', 0);
      expect(next.currentState).assertEqual(0);
      expect(next.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F1');
      expect(next.deviceCount()).assertEqual(4);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F1')).assertEqual(true);
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(base.currentState).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0095
     * @tc.name snapshotCube0095
     * @tc.desc Verify connection state 1 survives a snapshot carrying 0 devices.
     */
    it('snapshotCube0095', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(0), '', 0);
      const next: ProfileSnapshot = base.withConnection('A1:B2:C3:D4:E5:F1', 1);
      expect(next.currentState).assertEqual(1);
      expect(next.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F1');
      expect(next.deviceCount()).assertEqual(0);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F1')).assertEqual(false);
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(base.currentState).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0096
     * @tc.name snapshotCube0096
     * @tc.desc Verify connection state 1 survives a snapshot carrying 1 devices.
     */
    it('snapshotCube0096', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(1), '', 0);
      const next: ProfileSnapshot = base.withConnection('A1:B2:C3:D4:E5:F1', 1);
      expect(next.currentState).assertEqual(1);
      expect(next.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F1');
      expect(next.deviceCount()).assertEqual(1);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F1')).assertEqual(false);
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(base.currentState).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0097
     * @tc.name snapshotCube0097
     * @tc.desc Verify connection state 1 survives a snapshot carrying 2 devices.
     */
    it('snapshotCube0097', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(2), '', 0);
      const next: ProfileSnapshot = base.withConnection('A1:B2:C3:D4:E5:F1', 1);
      expect(next.currentState).assertEqual(1);
      expect(next.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F1');
      expect(next.deviceCount()).assertEqual(2);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F1')).assertEqual(true);
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(base.currentState).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0098
     * @tc.name snapshotCube0098
     * @tc.desc Verify connection state 1 survives a snapshot carrying 4 devices.
     */
    it('snapshotCube0098', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(4), '', 0);
      const next: ProfileSnapshot = base.withConnection('A1:B2:C3:D4:E5:F1', 1);
      expect(next.currentState).assertEqual(1);
      expect(next.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F1');
      expect(next.deviceCount()).assertEqual(4);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F1')).assertEqual(true);
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(base.currentState).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0099
     * @tc.name snapshotCube0099
     * @tc.desc Verify connection state 2 survives a snapshot carrying 0 devices.
     */
    it('snapshotCube0099', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(0), '', 0);
      const next: ProfileSnapshot = base.withConnection('A1:B2:C3:D4:E5:F1', 2);
      expect(next.currentState).assertEqual(2);
      expect(next.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F1');
      expect(next.deviceCount()).assertEqual(0);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F1')).assertEqual(false);
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(base.currentState).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0100
     * @tc.name snapshotCube0100
     * @tc.desc Verify connection state 2 survives a snapshot carrying 1 devices.
     */
    it('snapshotCube0100', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(1), '', 0);
      const next: ProfileSnapshot = base.withConnection('A1:B2:C3:D4:E5:F1', 2);
      expect(next.currentState).assertEqual(2);
      expect(next.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F1');
      expect(next.deviceCount()).assertEqual(1);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F1')).assertEqual(false);
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(base.currentState).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0101
     * @tc.name snapshotCube0101
     * @tc.desc Verify connection state 2 survives a snapshot carrying 2 devices.
     */
    it('snapshotCube0101', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(2), '', 0);
      const next: ProfileSnapshot = base.withConnection('A1:B2:C3:D4:E5:F1', 2);
      expect(next.currentState).assertEqual(2);
      expect(next.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F1');
      expect(next.deviceCount()).assertEqual(2);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F1')).assertEqual(true);
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(base.currentState).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0102
     * @tc.name snapshotCube0102
     * @tc.desc Verify connection state 2 survives a snapshot carrying 4 devices.
     */
    it('snapshotCube0102', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(4), '', 0);
      const next: ProfileSnapshot = base.withConnection('A1:B2:C3:D4:E5:F1', 2);
      expect(next.currentState).assertEqual(2);
      expect(next.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F1');
      expect(next.deviceCount()).assertEqual(4);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F1')).assertEqual(true);
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(base.currentState).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0103
     * @tc.name snapshotCube0103
     * @tc.desc Verify connection state 3 survives a snapshot carrying 0 devices.
     */
    it('snapshotCube0103', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(0), '', 0);
      const next: ProfileSnapshot = base.withConnection('A1:B2:C3:D4:E5:F1', 3);
      expect(next.currentState).assertEqual(3);
      expect(next.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F1');
      expect(next.deviceCount()).assertEqual(0);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F1')).assertEqual(false);
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(base.currentState).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0104
     * @tc.name snapshotCube0104
     * @tc.desc Verify connection state 3 survives a snapshot carrying 1 devices.
     */
    it('snapshotCube0104', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(1), '', 0);
      const next: ProfileSnapshot = base.withConnection('A1:B2:C3:D4:E5:F1', 3);
      expect(next.currentState).assertEqual(3);
      expect(next.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F1');
      expect(next.deviceCount()).assertEqual(1);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F1')).assertEqual(false);
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(base.currentState).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0105
     * @tc.name snapshotCube0105
     * @tc.desc Verify connection state 3 survives a snapshot carrying 2 devices.
     */
    it('snapshotCube0105', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(2), '', 0);
      const next: ProfileSnapshot = base.withConnection('A1:B2:C3:D4:E5:F1', 3);
      expect(next.currentState).assertEqual(3);
      expect(next.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F1');
      expect(next.deviceCount()).assertEqual(2);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F1')).assertEqual(true);
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(base.currentState).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0106
     * @tc.name snapshotCube0106
     * @tc.desc Verify connection state 3 survives a snapshot carrying 4 devices.
     */
    it('snapshotCube0106', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(4), '', 0);
      const next: ProfileSnapshot = base.withConnection('A1:B2:C3:D4:E5:F1', 3);
      expect(next.currentState).assertEqual(3);
      expect(next.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F1');
      expect(next.deviceCount()).assertEqual(4);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F1')).assertEqual(true);
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(base.currentState).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0107
     * @tc.name snapshotCube0107
     * @tc.desc Verify connection state 4 survives a snapshot carrying 0 devices.
     */
    it('snapshotCube0107', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(0), '', 0);
      const next: ProfileSnapshot = base.withConnection('A1:B2:C3:D4:E5:F1', 4);
      expect(next.currentState).assertEqual(4);
      expect(next.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F1');
      expect(next.deviceCount()).assertEqual(0);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F1')).assertEqual(false);
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(base.currentState).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0108
     * @tc.name snapshotCube0108
     * @tc.desc Verify connection state 4 survives a snapshot carrying 1 devices.
     */
    it('snapshotCube0108', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(1), '', 0);
      const next: ProfileSnapshot = base.withConnection('A1:B2:C3:D4:E5:F1', 4);
      expect(next.currentState).assertEqual(4);
      expect(next.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F1');
      expect(next.deviceCount()).assertEqual(1);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F1')).assertEqual(false);
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(base.currentState).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0109
     * @tc.name snapshotCube0109
     * @tc.desc Verify connection state 4 survives a snapshot carrying 2 devices.
     */
    it('snapshotCube0109', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(2), '', 0);
      const next: ProfileSnapshot = base.withConnection('A1:B2:C3:D4:E5:F1', 4);
      expect(next.currentState).assertEqual(4);
      expect(next.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F1');
      expect(next.deviceCount()).assertEqual(2);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F1')).assertEqual(true);
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(base.currentState).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0110
     * @tc.name snapshotCube0110
     * @tc.desc Verify connection state 4 survives a snapshot carrying 4 devices.
     */
    it('snapshotCube0110', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(4), '', 0);
      const next: ProfileSnapshot = base.withConnection('A1:B2:C3:D4:E5:F1', 4);
      expect(next.currentState).assertEqual(4);
      expect(next.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F1');
      expect(next.deviceCount()).assertEqual(4);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F1')).assertEqual(true);
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(base.currentState).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0111
     * @tc.name snapshotCube0111
     * @tc.desc Verify connection state -1 survives a snapshot carrying 0 devices.
     */
    it('snapshotCube0111', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(0), '', 0);
      const next: ProfileSnapshot = base.withConnection('A1:B2:C3:D4:E5:F1', -1);
      expect(next.currentState).assertEqual(-1);
      expect(next.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F1');
      expect(next.deviceCount()).assertEqual(0);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F1')).assertEqual(false);
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(base.currentState).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0112
     * @tc.name snapshotCube0112
     * @tc.desc Verify connection state -1 survives a snapshot carrying 1 devices.
     */
    it('snapshotCube0112', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(1), '', 0);
      const next: ProfileSnapshot = base.withConnection('A1:B2:C3:D4:E5:F1', -1);
      expect(next.currentState).assertEqual(-1);
      expect(next.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F1');
      expect(next.deviceCount()).assertEqual(1);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F1')).assertEqual(false);
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(base.currentState).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0113
     * @tc.name snapshotCube0113
     * @tc.desc Verify connection state -1 survives a snapshot carrying 2 devices.
     */
    it('snapshotCube0113', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(2), '', 0);
      const next: ProfileSnapshot = base.withConnection('A1:B2:C3:D4:E5:F1', -1);
      expect(next.currentState).assertEqual(-1);
      expect(next.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F1');
      expect(next.deviceCount()).assertEqual(2);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F1')).assertEqual(true);
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(base.currentState).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CUBE_0114
     * @tc.name snapshotCube0114
     * @tc.desc Verify connection state -1 survives a snapshot carrying 4 devices.
     */
    it('snapshotCube0114', 0, () => {
      const base: ProfileSnapshot = snapshotWith(devicesOf(4), '', 0);
      const next: ProfileSnapshot = base.withConnection('A1:B2:C3:D4:E5:F1', -1);
      expect(next.currentState).assertEqual(-1);
      expect(next.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F1');
      expect(next.deviceCount()).assertEqual(4);
      expect(next.hasDevice('A1:B2:C3:D4:E5:F1')).assertEqual(true);
      expect(next.status).assertEqual(ProbeStatus.IDLE);
      expect(base.currentState).assertEqual(0);
    });
  });
}
