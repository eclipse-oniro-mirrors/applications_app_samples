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
 * 页面视图状态的映射矩阵。
 *
 * 视图状态负责把快照翻译成界面文本：状态文案、提示、设备摘要、脱敏地址与连接行。
 * 另外单独覆盖「刷新后仍保留用户选择」的三段回退顺序，这是消息面板最容易回归的地方。
 */

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { ProfileKind } from '../../../main/ets/model/ProfileCatalog';
import {
  ProfileSnapshot,
  ProfileViewState,
  pickSelectedDevice
} from '../../../main/ets/model/ProfileSnapshot';
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

/** 构造一个带选中设备的视图状态，供 pickSelectedDevice 用例使用 */
function makeView(selected: string): ProfileViewState {
  const view: ProfileViewState = new ProfileViewState();
  view.selectedDevice = selected;
  return view;
}

export default function bluetoothProfileViewStateMatrixTest() {
  describe('BluetoothProfileViewStateMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_0001
     * @tc.name viewMatrix0001
     * @tc.desc Verify the view state exposes idle defaults before any snapshot arrives.
     */
    it('viewMatrix0001', 0, () => {
      const view: ProfileViewState = new ProfileViewState();
      expect(view.status).assertEqual(ProbeStatus.IDLE);
      expect(view.statusText).assertEqual('未探测');
      expect(view.updatedAt).assertEqual('--:--:--');
      expect(view.connectionText).assertEqual('尚未查询连接状态');
      expect(view.hasDevices()).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_0002
     * @tc.name viewMatrix0002
     * @tc.desc Verify fromSnapshot maps every display field from a ready snapshot with one device.
     */
    it('viewMatrix0002', 0, () => {
      const snapshot: ProfileSnapshot = new ProfileSnapshot(ProfileKind.HFP, {
        status: ProbeStatus.READY,
        message: 'ok',
        devices: ['A1:B2:C3:D4:E5:F6'],
        currentDeviceId: 'A1:B2:C3:D4:E5:F6',
        currentState: 2,
        subscribed: true,
        date: new Date(2026, 0, 2, 3, 4, 5)
      });
      const view: ProfileViewState = ProfileViewState.fromSnapshot(snapshot, null);
      expect(view.status).assertEqual(ProbeStatus.READY);
      expect(view.statusText).assertEqual('可用');
      expect(view.deviceSummary).assertEqual('1 台已连接设备');
      expect(view.updatedAt).assertEqual('03:04:05');
      expect(view.subscribed).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_0003
     * @tc.name viewMatrix0003
     * @tc.desc Verify fromSnapshot masks every device address for on screen display.
     */
    it('viewMatrix0003', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(2, 6), '', 0);
      const view: ProfileViewState = ProfileViewState.fromSnapshot(snapshot, null);
      expect(view.maskedDevices[0]).assertEqual('A1:B2:**:**:**:F6');
      expect(view.maskedDevices[1]).assertEqual('A1:B2:**:**:**:F7');
      expect(view.devices.length).assertEqual(2);
      expect(view.maskedDevices.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_0004
     * @tc.name viewMatrix0004
     * @tc.desc Verify fromSnapshot renders the connection line only when a device was queried.
     */
    it('viewMatrix0004', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(0), 'A1:B2:C3:D4:E5:F6', 2);
      const view: ProfileViewState = ProfileViewState.fromSnapshot(snapshot, null);
      expect(view.connectionText).assertEqual('A1:B2:**:**:**:F6 · 已连接');
      expect(view.connectionText.indexOf('已连接') >= 0).assertTrue();
      expect(view.currentState).assertEqual(2);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_0005
     * @tc.name viewMatrix0005
     * @tc.desc Verify fromSnapshot falls back to the idle connection text when no device was queried.
     */
    it('viewMatrix0005', 0, () => {
      const snapshot: ProfileSnapshot = new ProfileSnapshot(ProfileKind.HFP, {});
      const view: ProfileViewState = ProfileViewState.fromSnapshot(snapshot, null);
      expect(view.connectionText).assertEqual('尚未查询连接状态');
      expect(view.maskedDevices.length).assertEqual(0);
      expect(view.deviceSummary).assertEqual('暂无已连接设备');
      expect(view.selectedDevice).assertEqual('');
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_0006
     * @tc.name viewMatrix0006
     * @tc.desc Verify fromSnapshot copies the hint text that belongs to the snapshot status.
     */
    it('viewMatrix0006', 0, () => {
      const snapshot: ProfileSnapshot = statusSnapshot(ProbeStatus.PERMISSION_DENIED, 201);
      const view: ProfileViewState = ProfileViewState.fromSnapshot(snapshot, null);
      expect(view.statusText).assertEqual('缺少权限');
      expect(view.hintText.indexOf('ACCESS_BLUETOOTH') >= 0).assertTrue();
      expect(view.code).assertEqual(201);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_0007
     * @tc.name viewMatrix0007
     * @tc.desc Verify pickSelectedDevice when current device wins.
     */
    it('viewMatrix0007', 0, () => {
      const ids: string[] = ['A1:B2:C3:D4:E5:F6'];
      const snapshot: ProfileSnapshot = snapshotWith(ids, 'A1:B2:C3:D4:E5:F6', 0);
      expect(pickSelectedDevice(snapshot, null)).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(snapshot.devices.length).assertEqual(1);
      expect(pickSelectedDevice(snapshot, null).length).assertEqual(17);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_0008
     * @tc.name viewMatrix0008
     * @tc.desc Verify pickSelectedDevice when current missing falls back to first.
     */
    it('viewMatrix0008', 0, () => {
      const ids: string[] = ['A1:B2:C3:D4:E5:F6'];
      const snapshot: ProfileSnapshot = snapshotWith(ids, 'A1:B2:C3:D4:E5:F9', 0);
      expect(pickSelectedDevice(snapshot, null)).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(snapshot.devices.length).assertEqual(1);
      expect(pickSelectedDevice(snapshot, null).length).assertEqual(17);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_0009
     * @tc.name viewMatrix0009
     * @tc.desc Verify pickSelectedDevice when no current picks first.
     */
    it('viewMatrix0009', 0, () => {
      const ids: string[] = ['A1:B2:C3:D4:E5:F6', 'A1:B2:C3:D4:E5:F7'];
      const snapshot: ProfileSnapshot = snapshotWith(ids, '', 0);
      expect(pickSelectedDevice(snapshot, null)).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(snapshot.devices.length).assertEqual(2);
      expect(pickSelectedDevice(snapshot, null).length).assertEqual(17);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_0010
     * @tc.name viewMatrix0010
     * @tc.desc Verify pickSelectedDevice when previous keeps first.
     */
    it('viewMatrix0010', 0, () => {
      const ids: string[] = ['A1:B2:C3:D4:E5:F6', 'A1:B2:C3:D4:E5:F7'];
      const snapshot: ProfileSnapshot = snapshotWith(ids, '', 0);
      expect(pickSelectedDevice(snapshot, makeView('A1:B2:C3:D4:E5:F6'))).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(snapshot.devices.length).assertEqual(2);
      expect(pickSelectedDevice(snapshot, makeView('A1:B2:C3:D4:E5:F6')).length).assertEqual(17);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_0011
     * @tc.name viewMatrix0011
     * @tc.desc Verify pickSelectedDevice when previous keeps second.
     */
    it('viewMatrix0011', 0, () => {
      const ids: string[] = ['A1:B2:C3:D4:E5:F6', 'A1:B2:C3:D4:E5:F7'];
      const snapshot: ProfileSnapshot = snapshotWith(ids, '', 0);
      expect(pickSelectedDevice(snapshot, makeView('A1:B2:C3:D4:E5:F7'))).assertEqual('A1:B2:C3:D4:E5:F7');
      expect(snapshot.devices.length).assertEqual(2);
      expect(pickSelectedDevice(snapshot, makeView('A1:B2:C3:D4:E5:F7')).length).assertEqual(17);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_0012
     * @tc.name viewMatrix0012
     * @tc.desc Verify pickSelectedDevice when stale previous ignored.
     */
    it('viewMatrix0012', 0, () => {
      const ids: string[] = ['A1:B2:C3:D4:E5:F6'];
      const snapshot: ProfileSnapshot = snapshotWith(ids, '', 0);
      expect(pickSelectedDevice(snapshot, makeView('A1:B2:C3:D4:E5:F9'))).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(snapshot.devices.length).assertEqual(1);
      expect(pickSelectedDevice(snapshot, makeView('A1:B2:C3:D4:E5:F9')).length).assertEqual(17);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_0013
     * @tc.name viewMatrix0013
     * @tc.desc Verify pickSelectedDevice when empty list clears selection.
     */
    it('viewMatrix0013', 0, () => {
      const ids: string[] = [];
      const snapshot: ProfileSnapshot = snapshotWith(ids, '', 0);
      expect(pickSelectedDevice(snapshot, makeView('A1:B2:C3:D4:E5:F6'))).assertEqual('');
      expect(snapshot.devices.length).assertEqual(0);
      expect(pickSelectedDevice(snapshot, makeView('A1:B2:C3:D4:E5:F6')).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_0014
     * @tc.name viewMatrix0014
     * @tc.desc Verify pickSelectedDevice when current beats previous.
     */
    it('viewMatrix0014', 0, () => {
      const ids: string[] = ['A1:B2:C3:D4:E5:F6', 'A1:B2:C3:D4:E5:F7'];
      const snapshot: ProfileSnapshot = snapshotWith(ids, 'A1:B2:C3:D4:E5:F7', 0);
      expect(pickSelectedDevice(snapshot, makeView('A1:B2:C3:D4:E5:F6'))).assertEqual('A1:B2:C3:D4:E5:F7');
      expect(snapshot.devices.length).assertEqual(2);
      expect(pickSelectedDevice(snapshot, makeView('A1:B2:C3:D4:E5:F6')).length).assertEqual(17);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_0015
     * @tc.name viewMatrix0015
     * @tc.desc Verify pickSelectedDevice when nothing to select.
     */
    it('viewMatrix0015', 0, () => {
      const ids: string[] = [];
      const snapshot: ProfileSnapshot = snapshotWith(ids, '', 0);
      expect(pickSelectedDevice(snapshot, null)).assertEqual('');
      expect(snapshot.devices.length).assertEqual(0);
      expect(pickSelectedDevice(snapshot, null).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_0016
     * @tc.name viewMatrix0016
     * @tc.desc Verify hasDevices switches on the device list length only.
     */
    it('viewMatrix0016', 0, () => {
      const empty: ProfileViewState = viewOf(devicesOf(0), '');
      const filled: ProfileViewState = viewOf(devicesOf(1, 6), '');
      expect(empty.hasDevices()).assertFalse();
      expect(filled.hasDevices()).assertTrue();
      expect(filled.devices.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_0017
     * @tc.name viewMatrix0017
     * @tc.desc Verify the device summary text follows the list length in the view state.
     */
    it('viewMatrix0017', 0, () => {
      const two: ProfileViewState = viewOf(devicesOf(2, 6), '');
      expect(two.deviceSummary).assertEqual('2 台已连接设备');
      const one: ProfileViewState = viewOf(devicesOf(1, 6), '');
      expect(one.deviceSummary).assertEqual('1 台已连接设备');
      expect(two.devices.length).assertEqual(2);
    });
  });
}
