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
 * 状态快照的派生矩阵。
 *
 * ProfileSnapshot 是不可变对象，页面依赖「旧快照不被改写」来避免渲染抖动，
 * 因此每个 withXxx 用例都同时断言新值生效与旧值保持，并专门覆盖数组入参的防御性拷贝。
 */

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { ProfileKind } from '../../../main/ets/model/ProfileCatalog';
import { ProfileSnapshot, ProfileViewState } from '../../../main/ets/model/ProfileSnapshot';
import { ProbeStatus } from '../../../main/ets/model/ProfileState';

/** 以状态三元组构造快照，避免在用例里写超长对象字面量 */
function snapshotOf(status: ProbeStatus, code: number, message: string): ProfileSnapshot {
  return new ProfileSnapshot(ProfileKind.HFP, { status: status, code: code, message: message });
}

/** 只关心状态与错误码时使用，message 走构造函数的默认值 */
function statusSnapshot(status: ProbeStatus, code: number): ProfileSnapshot {
  return new ProfileSnapshot(ProfileKind.HFP, { status: status, code: code });
}

/** 以设备清单、当前设备与连接态构造快照 */
function snapshotWith(devices: string[], currentDeviceId: string, currentState: number): ProfileSnapshot {
  return new ProfileSnapshot(ProfileKind.HFP, {
    devices: devices,
    currentDeviceId: currentDeviceId,
    currentState: currentState
  });
}

/** 生成 count 个连续尾号的设备地址，避免用例里出现超长数组字面量 */
function devicesOf(count: number, start: number = 0): string[] {
  const list: string[] = [];
  for (let index = 0; index < count; index++) {
    list.push('A1:B2:C3:D4:E5:F' + (start + index));
  }
  return list;
}

/** 由设备清单直接生成视图状态，供 fromSnapshot 用例使用 */
function viewOf(devices: string[], currentDeviceId: string): ProfileViewState {
  return ProfileViewState.fromSnapshot(snapshotWith(devices, currentDeviceId, 0), null);
}

export default function bluetoothProfileSnapshotMatrixTest() {
  describe('BluetoothProfileSnapshotMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAPSHOT_0001
     * @tc.name snapshotMatrix0001
     * @tc.desc Verify the default snapshot starts idle with no device, no subscription and an empty message slot.
     */
    it('snapshotMatrix0001', 0, () => {
      const snapshot: ProfileSnapshot = new ProfileSnapshot(ProfileKind.HFP, {});
      expect(snapshot.status).assertEqual(ProbeStatus.IDLE);
      expect(snapshot.code).assertEqual(0);
      expect(snapshot.message).assertEqual('尚未创建 Profile 实例');
      expect(snapshot.devices.length).assertEqual(0);
      expect(snapshot.subscribed).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAPSHOT_0002
     * @tc.name snapshotMatrix0002
     * @tc.desc Verify the default snapshot keeps the disconnected connection state and an eight char clock.
     */
    it('snapshotMatrix0002', 0, () => {
      const snapshot: ProfileSnapshot = new ProfileSnapshot(ProfileKind.HFP, {});
      expect(snapshot.currentState).assertEqual(0);
      expect(snapshot.currentDeviceId).assertEqual('');
      expect(snapshot.updatedAt.length).assertEqual(8);
      expect(snapshot.updatedAt.indexOf(':')).assertEqual(2);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAPSHOT_0003
     * @tc.name snapshotMatrix0003
     * @tc.desc Verify the constructor honours every explicit option at once.
     */
    it('snapshotMatrix0003', 0, () => {
      const snapshot: ProfileSnapshot = new ProfileSnapshot(ProfileKind.HFP, {
        status: ProbeStatus.READY,
        code: 0,
        message: 'ready',
        devices: ['A1:B2:C3:D4:E5:F6'],
        currentDeviceId: 'A1:B2:C3:D4:E5:F6',
        currentState: 2,
        subscribed: true,
        date: new Date(2026, 0, 2, 3, 4, 5)
      });
      expect(snapshot.status).assertEqual(ProbeStatus.READY);
      expect(snapshot.deviceCount()).assertEqual(1);
      expect(snapshot.updatedAt).assertEqual('03:04:05');
      expect(snapshot.subscribed).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAPSHOT_0004
     * @tc.name snapshotMatrix0004
     * @tc.desc Verify the constructor copies the device array instead of keeping the caller reference.
     */
    it('snapshotMatrix0004', 0, () => {
      const devices: string[] = ['A1:B2:C3:D4:E5:F6'];
      const snapshot: ProfileSnapshot = new ProfileSnapshot(ProfileKind.HFP, { devices: devices });
      devices.push('A1:B2:C3:D4:E5:F7');
      expect(snapshot.deviceCount()).assertEqual(1);
      expect(snapshot.hasDevice('A1:B2:C3:D4:E5:F7')).assertFalse();
      expect(snapshot.hasDevice('A1:B2:C3:D4:E5:F6')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAPSHOT_0005
     * @tc.name snapshotMatrix0005
     * @tc.desc Verify derive keeps every field that the caller does not override.
     */
    it('snapshotMatrix0005', 0, () => {
      const base: ProfileSnapshot = new ProfileSnapshot(ProfileKind.HFP, {
        status: ProbeStatus.READY,
        code: 0,
        message: 'base',
        devices: ['A1:B2:C3:D4:E5:F6'],
        subscribed: true
      });
      const derived: ProfileSnapshot = base.derive({ message: 'changed' });
      expect(derived.message).assertEqual('changed');
      expect(derived.status).assertEqual(ProbeStatus.READY);
      expect(derived.deviceCount()).assertEqual(1);
      expect(derived.subscribed).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAPSHOT_0006
     * @tc.name snapshotMatrix0006
     * @tc.desc Verify withStatus only rewrites the status trio and leaves devices untouched.
     */
    it('snapshotMatrix0006', 0, () => {
      const base: ProfileSnapshot = new ProfileSnapshot(ProfileKind.HFP, { devices: ['A1:B2:C3:D4:E5:F6'] });
      const next: ProfileSnapshot = base.withStatus(ProbeStatus.FAILED, 401, 'bad param');
      expect(next.status).assertEqual(ProbeStatus.FAILED);
      expect(next.code).assertEqual(401);
      expect(next.message).assertEqual('bad param');
      expect(next.deviceCount()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAPSHOT_0007
     * @tc.name snapshotMatrix0007
     * @tc.desc Verify withDevices replaces the list and reports the new count.
     */
    it('snapshotMatrix0007', 0, () => {
      const base: ProfileSnapshot = new ProfileSnapshot(ProfileKind.HFP, {});
      const next: ProfileSnapshot = base.withDevices(['A1:B2:C3:D4:E5:F6', 'A1:B2:C3:D4:E5:F7']);
      expect(next.deviceCount()).assertEqual(2);
      expect(base.deviceCount()).assertEqual(0);
      expect(next.devices[1]).assertEqual('A1:B2:C3:D4:E5:F7');
      expect(next.devices === base.devices).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAPSHOT_0008
     * @tc.name snapshotMatrix0008
     * @tc.desc Verify withDevices receives an empty list and clears the previous devices.
     */
    it('snapshotMatrix0008', 0, () => {
      const base: ProfileSnapshot = new ProfileSnapshot(ProfileKind.HFP, { devices: ['A1:B2:C3:D4:E5:F6'] });
      const next: ProfileSnapshot = base.withDevices([]);
      expect(next.deviceCount()).assertEqual(0);
      expect(next.devices.length).assertEqual(0);
      expect(base.deviceCount()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAPSHOT_0009
     * @tc.name snapshotMatrix0009
     * @tc.desc Verify withConnection records the device and the raw state without translating it.
     */
    it('snapshotMatrix0009', 0, () => {
      const base: ProfileSnapshot = new ProfileSnapshot(ProfileKind.HFP, {});
      const next: ProfileSnapshot = base.withConnection('A1:B2:C3:D4:E5:F6', 2);
      expect(next.currentDeviceId).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(next.currentState).assertEqual(2);
      expect(base.currentDeviceId).assertEqual('');
      expect(base.currentState).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAPSHOT_0010
     * @tc.name snapshotMatrix0010
     * @tc.desc Verify withSubscription flips only the subscription flag.
     */
    it('snapshotMatrix0010', 0, () => {
      const base: ProfileSnapshot = new ProfileSnapshot(ProfileKind.HFP, {});
      const on: ProfileSnapshot = base.withSubscription(true);
      const off: ProfileSnapshot = on.withSubscription(false);
      expect(on.subscribed).assertTrue();
      expect(off.subscribed).assertFalse();
      expect(base.subscribed).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAPSHOT_0011
     * @tc.name snapshotMatrix0011
     * @tc.desc Verify the derive chain keeps immutability so earlier snapshots never change.
     */
    it('snapshotMatrix0011', 0, () => {
      const first: ProfileSnapshot = new ProfileSnapshot(ProfileKind.HFP, {});
      const second: ProfileSnapshot = first.withStatus(ProbeStatus.READY, 0, 'a');
      const third: ProfileSnapshot = second.withStatus(ProbeStatus.NO_DEVICE, 0, 'b');
      expect(first.status).assertEqual(ProbeStatus.IDLE);
      expect(second.status).assertEqual(ProbeStatus.READY);
      expect(third.status).assertEqual(ProbeStatus.NO_DEVICE);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAPSHOT_0012
     * @tc.name snapshotMatrix0012
     * @tc.desc Verify hasDevice matches the exact address and rejects the case variant.
     */
    it('snapshotMatrix0012', 0, () => {
      const snapshot: ProfileSnapshot = new ProfileSnapshot(ProfileKind.HFP, { devices: ['A1:B2:C3:D4:E5:F6'] });
      expect(snapshot.hasDevice('A1:B2:C3:D4:E5:F6')).assertTrue();
      expect(snapshot.hasDevice('a1:b2:c3:d4:e5:f6')).assertFalse();
      expect(snapshot.hasDevice('A1:B2:C3:D4:E5:F7')).assertFalse();
      expect(snapshot.hasDevice('')).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAPSHOT_0013
     * @tc.name snapshotMatrix0013
     * @tc.desc Verify describe concatenates the status name, the code and the message.
     */
    it('snapshotMatrix0013', 0, () => {
      const snapshot: ProfileSnapshot = snapshotOf(ProbeStatus.FAILED, 401, 'bad param');
      const expected: string = '操作失败（401）bad param';
      expect(snapshot.describe()).assertEqual(expected);
      expect(snapshot.describe().length).assertEqual(expected.length);
      expect(snapshot.describe().indexOf('bad param')).assertEqual(expected.indexOf('bad param'));
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAPSHOT_0014
     * @tc.name snapshotMatrix0014
     * @tc.desc Verify describe for probe status IDLE keeps the documented text shape.
     */
    it('snapshotMatrix0014', 0, () => {
      const snapshot: ProfileSnapshot = snapshotOf(ProbeStatus.IDLE, 7, 'detail');
      expect(snapshot.describe()).assertEqual('未探测（7）detail');
      expect(snapshot.describe().length).assertEqual(12);
      expect(snapshot.describe().indexOf('（7）')).assertEqual(3);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAPSHOT_0015
     * @tc.name snapshotMatrix0015
     * @tc.desc Verify describe for probe status READY keeps the documented text shape.
     */
    it('snapshotMatrix0015', 0, () => {
      const snapshot: ProfileSnapshot = snapshotOf(ProbeStatus.READY, 7, 'detail');
      expect(snapshot.describe()).assertEqual('可用（7）detail');
      expect(snapshot.describe().length).assertEqual(11);
      expect(snapshot.describe().indexOf('（7）')).assertEqual(2);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAPSHOT_0016
     * @tc.name snapshotMatrix0016
     * @tc.desc Verify describe for probe status NO_DEVICE keeps the documented text shape.
     */
    it('snapshotMatrix0016', 0, () => {
      const snapshot: ProfileSnapshot = snapshotOf(ProbeStatus.NO_DEVICE, 7, 'detail');
      expect(snapshot.describe()).assertEqual('无已连接设备（7）detail');
      expect(snapshot.describe().length).assertEqual(15);
      expect(snapshot.describe().indexOf('（7）')).assertEqual(6);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAPSHOT_0017
     * @tc.name snapshotMatrix0017
     * @tc.desc Verify describe for probe status PERMISSION_DENIED keeps the documented text shape.
     */
    it('snapshotMatrix0017', 0, () => {
      const snapshot: ProfileSnapshot = snapshotOf(ProbeStatus.PERMISSION_DENIED, 7, 'detail');
      expect(snapshot.describe()).assertEqual('缺少权限（7）detail');
      expect(snapshot.describe().length).assertEqual(13);
      expect(snapshot.describe().indexOf('（7）')).assertEqual(4);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAPSHOT_0018
     * @tc.name snapshotMatrix0018
     * @tc.desc Verify describe for probe status FAILED keeps the documented text shape.
     */
    it('snapshotMatrix0018', 0, () => {
      const snapshot: ProfileSnapshot = snapshotOf(ProbeStatus.FAILED, 7, 'detail');
      expect(snapshot.describe()).assertEqual('操作失败（7）detail');
      expect(snapshot.describe().length).assertEqual(13);
      expect(snapshot.describe().indexOf('（7）')).assertEqual(4);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAPSHOT_0019
     * @tc.name snapshotMatrix0019
     * @tc.desc Verify deviceCount and hasDevice agree for a snapshot holding 0 devices.
     */
    it('snapshotMatrix0019', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(0), '', 0);
      expect(snapshot.deviceCount()).assertEqual(0);
      expect(snapshot.devices.length).assertEqual(0);
      expect(snapshot.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAPSHOT_0020
     * @tc.name snapshotMatrix0020
     * @tc.desc Verify deviceCount and hasDevice agree for a snapshot holding 1 devices.
     */
    it('snapshotMatrix0020', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(1), '', 0);
      expect(snapshot.deviceCount()).assertEqual(1);
      expect(snapshot.devices.length).assertEqual(1);
      expect(snapshot.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAPSHOT_0021
     * @tc.name snapshotMatrix0021
     * @tc.desc Verify deviceCount and hasDevice agree for a snapshot holding 2 devices.
     */
    it('snapshotMatrix0021', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(2), '', 0);
      expect(snapshot.deviceCount()).assertEqual(2);
      expect(snapshot.devices.length).assertEqual(2);
      expect(snapshot.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_SNAPSHOT_0022
     * @tc.name snapshotMatrix0022
     * @tc.desc Verify deviceCount and hasDevice agree for a snapshot holding 5 devices.
     */
    it('snapshotMatrix0022', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(5), '', 0);
      expect(snapshot.deviceCount()).assertEqual(5);
      expect(snapshot.devices.length).assertEqual(5);
      expect(snapshot.hasDevice('A1:B2:C3:D4:E5:F0')).assertEqual(true);
    });
  });
}
