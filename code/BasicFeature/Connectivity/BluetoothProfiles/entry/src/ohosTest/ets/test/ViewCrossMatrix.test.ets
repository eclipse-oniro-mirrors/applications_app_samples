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
 * 视图状态的组合矩阵。
 *
 * 视图状态把快照翻译成界面文本，最容易出问题的是「刷新后选中项跳变」与「连接行随状态变化」。
 * 这一组把三段回退顺序铺成十二种组合，再把五种连接态分别配上「有设备」与「无设备」。
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

/** 由快照生成视图状态，避免用例里重复写 fromSnapshot */
function viewFrom(snapshot: ProfileSnapshot): ProfileViewState {
  return ProfileViewState.fromSnapshot(snapshot, null);
}

/** 构造一个带选中设备的视图状态，供 pickSelectedDevice 用例使用 */
function viewOf(selected: string): ProfileViewState {
  const view: ProfileViewState = new ProfileViewState();
  view.selectedDevice = selected;
  return view;
}

export default function bluetoothProfileViewCrossTest() {
  describe('BluetoothProfileViewCrossTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0001
     * @tc.name viewCross0001
     * @tc.desc Verify pickSelectedDevice when current device wins.
     */
    it('viewCross0001', 0, () => {
      const ids: string[] = devicesOf(1, 6);
      const snapshot: ProfileSnapshot = snapshotWith(ids, 'A1:B2:C3:D4:E5:F6', 0);
      expect(pickSelectedDevice(snapshot, null)).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(snapshot.devices.length).assertEqual(1);
      expect(pickSelectedDevice(snapshot, null).length).assertEqual(17);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0002
     * @tc.name viewCross0002
     * @tc.desc Verify pickSelectedDevice when current missing falls back to first.
     */
    it('viewCross0002', 0, () => {
      const ids: string[] = devicesOf(1, 6);
      const snapshot: ProfileSnapshot = snapshotWith(ids, 'A1:B2:C3:D4:E5:F9', 0);
      expect(pickSelectedDevice(snapshot, null)).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(snapshot.devices.length).assertEqual(1);
      expect(pickSelectedDevice(snapshot, null).length).assertEqual(17);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0003
     * @tc.name viewCross0003
     * @tc.desc Verify pickSelectedDevice when no current picks first.
     */
    it('viewCross0003', 0, () => {
      const ids: string[] = devicesOf(2, 6);
      const snapshot: ProfileSnapshot = snapshotWith(ids, '', 0);
      expect(pickSelectedDevice(snapshot, null)).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(snapshot.devices.length).assertEqual(2);
      expect(pickSelectedDevice(snapshot, null).length).assertEqual(17);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0004
     * @tc.name viewCross0004
     * @tc.desc Verify pickSelectedDevice when previous keeps first.
     */
    it('viewCross0004', 0, () => {
      const ids: string[] = devicesOf(2, 6);
      const snapshot: ProfileSnapshot = snapshotWith(ids, '', 0);
      expect(pickSelectedDevice(snapshot, viewOf('A1:B2:C3:D4:E5:F6'))).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(snapshot.devices.length).assertEqual(2);
      expect(pickSelectedDevice(snapshot, viewOf('A1:B2:C3:D4:E5:F6')).length).assertEqual(17);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0005
     * @tc.name viewCross0005
     * @tc.desc Verify pickSelectedDevice when previous keeps second.
     */
    it('viewCross0005', 0, () => {
      const ids: string[] = devicesOf(2, 6);
      const snapshot: ProfileSnapshot = snapshotWith(ids, '', 0);
      expect(pickSelectedDevice(snapshot, viewOf('A1:B2:C3:D4:E5:F7'))).assertEqual('A1:B2:C3:D4:E5:F7');
      expect(snapshot.devices.length).assertEqual(2);
      expect(pickSelectedDevice(snapshot, viewOf('A1:B2:C3:D4:E5:F7')).length).assertEqual(17);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0006
     * @tc.name viewCross0006
     * @tc.desc Verify pickSelectedDevice when stale previous is ignored.
     */
    it('viewCross0006', 0, () => {
      const ids: string[] = devicesOf(1, 6);
      const snapshot: ProfileSnapshot = snapshotWith(ids, '', 0);
      expect(pickSelectedDevice(snapshot, viewOf('A1:B2:C3:D4:E5:F9'))).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(snapshot.devices.length).assertEqual(1);
      expect(pickSelectedDevice(snapshot, viewOf('A1:B2:C3:D4:E5:F9')).length).assertEqual(17);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0007
     * @tc.name viewCross0007
     * @tc.desc Verify pickSelectedDevice when previous picks the tail device.
     */
    it('viewCross0007', 0, () => {
      const ids: string[] = devicesOf(3, 6);
      const snapshot: ProfileSnapshot = snapshotWith(ids, '', 0);
      expect(pickSelectedDevice(snapshot, viewOf('A1:B2:C3:D4:E5:F8'))).assertEqual('A1:B2:C3:D4:E5:F8');
      expect(snapshot.devices.length).assertEqual(3);
      expect(pickSelectedDevice(snapshot, viewOf('A1:B2:C3:D4:E5:F8')).length).assertEqual(17);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0008
     * @tc.name viewCross0008
     * @tc.desc Verify pickSelectedDevice when current beats previous.
     */
    it('viewCross0008', 0, () => {
      const ids: string[] = devicesOf(2, 6);
      const snapshot: ProfileSnapshot = snapshotWith(ids, 'A1:B2:C3:D4:E5:F7', 0);
      expect(pickSelectedDevice(snapshot, viewOf('A1:B2:C3:D4:E5:F6'))).assertEqual('A1:B2:C3:D4:E5:F7');
      expect(snapshot.devices.length).assertEqual(2);
      expect(pickSelectedDevice(snapshot, viewOf('A1:B2:C3:D4:E5:F6')).length).assertEqual(17);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0009
     * @tc.name viewCross0009
     * @tc.desc Verify pickSelectedDevice when empty list clears the selection.
     */
    it('viewCross0009', 0, () => {
      const ids: string[] = devicesOf(0);
      const snapshot: ProfileSnapshot = snapshotWith(ids, '', 0);
      expect(pickSelectedDevice(snapshot, viewOf('A1:B2:C3:D4:E5:F6'))).assertEqual('');
      expect(snapshot.devices.length).assertEqual(0);
      expect(pickSelectedDevice(snapshot, viewOf('A1:B2:C3:D4:E5:F6')).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0010
     * @tc.name viewCross0010
     * @tc.desc Verify pickSelectedDevice when nothing to select.
     */
    it('viewCross0010', 0, () => {
      const ids: string[] = devicesOf(0);
      const snapshot: ProfileSnapshot = snapshotWith(ids, '', 0);
      expect(pickSelectedDevice(snapshot, null)).assertEqual('');
      expect(snapshot.devices.length).assertEqual(0);
      expect(pickSelectedDevice(snapshot, null).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0011
     * @tc.name viewCross0011
     * @tc.desc Verify pickSelectedDevice when previous keeps the head device.
     */
    it('viewCross0011', 0, () => {
      const ids: string[] = devicesOf(3, 6);
      const snapshot: ProfileSnapshot = snapshotWith(ids, '', 0);
      expect(pickSelectedDevice(snapshot, viewOf('A1:B2:C3:D4:E5:F6'))).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(snapshot.devices.length).assertEqual(3);
      expect(pickSelectedDevice(snapshot, viewOf('A1:B2:C3:D4:E5:F6')).length).assertEqual(17);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0012
     * @tc.name viewCross0012
     * @tc.desc Verify pickSelectedDevice when current picks the tail device.
     */
    it('viewCross0012', 0, () => {
      const ids: string[] = devicesOf(3, 6);
      const snapshot: ProfileSnapshot = snapshotWith(ids, 'A1:B2:C3:D4:E5:F8', 0);
      expect(pickSelectedDevice(snapshot, null)).assertEqual('A1:B2:C3:D4:E5:F8');
      expect(snapshot.devices.length).assertEqual(3);
      expect(pickSelectedDevice(snapshot, null).length).assertEqual(17);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0013
     * @tc.name viewCross0013
     * @tc.desc Verify fromSnapshot copies the status IDLE into the three display fields.
     */
    it('viewCross0013', 0, () => {
      const snapshot: ProfileSnapshot = snapshotOf(ProbeStatus.IDLE, 0, 'detail');
      const view: ProfileViewState = viewFrom(snapshot);
      expect(view.statusText).assertEqual('未探测');
      expect(view.code).assertEqual(0);
      expect(view.hintText).assertEqual('查看日志面板中的错误码与详细信息');
      expect(view.message).assertEqual('detail');
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0014
     * @tc.name viewCross0014
     * @tc.desc Verify fromSnapshot copies the status READY into the three display fields.
     */
    it('viewCross0014', 0, () => {
      const snapshot: ProfileSnapshot = snapshotOf(ProbeStatus.READY, 0, 'detail');
      const view: ProfileViewState = viewFrom(snapshot);
      expect(view.statusText).assertEqual('可用');
      expect(view.code).assertEqual(0);
      expect(view.hintText).assertEqual('Profile 实例已创建，可继续查询连接状态');
      expect(view.message).assertEqual('detail');
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0015
     * @tc.name viewCross0015
     * @tc.desc Verify fromSnapshot copies the status NO_DEVICE into the three display fields.
     */
    it('viewCross0015', 0, () => {
      const snapshot: ProfileSnapshot = snapshotOf(ProbeStatus.NO_DEVICE, 0, 'detail');
      const view: ProfileViewState = viewFrom(snapshot);
      expect(view.statusText).assertEqual('无已连接设备');
      expect(view.code).assertEqual(0);
      expect(view.hintText).assertEqual('实例正常，但当前没有对端设备连接到该 Profile');
      expect(view.message).assertEqual('detail');
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0016
     * @tc.name viewCross0016
     * @tc.desc Verify fromSnapshot copies the status PERMISSION_DENIED into the three display fields.
     */
    it('viewCross0016', 0, () => {
      const snapshot: ProfileSnapshot = snapshotOf(ProbeStatus.PERMISSION_DENIED, 201, 'detail');
      const view: ProfileViewState = viewFrom(snapshot);
      expect(view.statusText).assertEqual('缺少权限');
      expect(view.code).assertEqual(201);
      expect(view.hintText).assertEqual('请先授予 ohos.permission.ACCESS_BLUETOOTH（演示页可一键申请）');
      expect(view.message).assertEqual('detail');
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0017
     * @tc.name viewCross0017
     * @tc.desc Verify fromSnapshot copies the status CAPABILITY_UNSUPPORTED into the three display fields.
     */
    it('viewCross0017', 0, () => {
      const snapshot: ProfileSnapshot = snapshotOf(ProbeStatus.CAPABILITY_UNSUPPORTED, 801, 'detail');
      const view: ProfileViewState = viewFrom(snapshot);
      expect(view.statusText).assertEqual('设备不支持');
      expect(view.code).assertEqual(801);
      expect(view.hintText).assertEqual('当前设备未支持该 Profile 能力，可换用支持该能力的设备（模拟器或精简镜像常见）');
      expect(view.message).assertEqual('detail');
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0018
     * @tc.name viewCross0018
     * @tc.desc Verify fromSnapshot copies the status BLUETOOTH_DISABLED into the three display fields.
     */
    it('viewCross0018', 0, () => {
      const snapshot: ProfileSnapshot = snapshotOf(ProbeStatus.BLUETOOTH_DISABLED, 2900003, 'detail');
      const view: ProfileViewState = viewFrom(snapshot);
      expect(view.statusText).assertEqual('蓝牙未开启');
      expect(view.code).assertEqual(2900003);
      expect(view.hintText).assertEqual('请先打开系统蓝牙开关，再重新探测');
      expect(view.message).assertEqual('detail');
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0019
     * @tc.name viewCross0019
     * @tc.desc Verify fromSnapshot copies the status SERVICE_STOPPED into the three display fields.
     */
    it('viewCross0019', 0, () => {
      const snapshot: ProfileSnapshot = snapshotOf(ProbeStatus.SERVICE_STOPPED, 2900001, 'detail');
      const view: ProfileViewState = viewFrom(snapshot);
      expect(view.statusText).assertEqual('蓝牙服务已停止');
      expect(view.code).assertEqual(2900001);
      expect(view.hintText).assertEqual('蓝牙服务异常退出，可关闭再打开蓝牙后重试');
      expect(view.message).assertEqual('detail');
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0020
     * @tc.name viewCross0020
     * @tc.desc Verify fromSnapshot copies the status PROFILE_UNSUPPORTED into the three display fields.
     */
    it('viewCross0020', 0, () => {
      const snapshot: ProfileSnapshot = snapshotOf(ProbeStatus.PROFILE_UNSUPPORTED, 2900004, 'detail');
      const view: ProfileViewState = viewFrom(snapshot);
      expect(view.statusText).assertEqual('Profile 不支持');
      expect(view.code).assertEqual(2900004);
      expect(view.hintText).assertEqual('系统镜像未编译该 Profile，属于设备能力缺失');
      expect(view.message).assertEqual('detail');
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0021
     * @tc.name viewCross0021
     * @tc.desc Verify fromSnapshot copies the status FAILED into the three display fields.
     */
    it('viewCross0021', 0, () => {
      const snapshot: ProfileSnapshot = snapshotOf(ProbeStatus.FAILED, 401, 'detail');
      const view: ProfileViewState = viewFrom(snapshot);
      expect(view.statusText).assertEqual('操作失败');
      expect(view.code).assertEqual(401);
      expect(view.hintText).assertEqual('查看日志面板中的错误码与详细信息');
      expect(view.message).assertEqual('detail');
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0022
     * @tc.name viewCross0022
     * @tc.desc Verify the connection line shows the masked address and the text of state 0.
     */
    it('viewCross0022', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(1, 6), 'A1:B2:C3:D4:E5:F6', 0);
      const view: ProfileViewState = viewFrom(snapshot);
      expect(view.connectionText).assertEqual('A1:B2:**:**:**:F6 · 已断开');
      expect(view.currentState).assertEqual(0);
      expect(view.connectionText.indexOf('·') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0023
     * @tc.name viewCross0023
     * @tc.desc Verify the connection line shows the masked address and the text of state 1.
     */
    it('viewCross0023', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(1, 6), 'A1:B2:C3:D4:E5:F6', 1);
      const view: ProfileViewState = viewFrom(snapshot);
      expect(view.connectionText).assertEqual('A1:B2:**:**:**:F6 · 正在连接');
      expect(view.currentState).assertEqual(1);
      expect(view.connectionText.indexOf('·') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0024
     * @tc.name viewCross0024
     * @tc.desc Verify the connection line shows the masked address and the text of state 2.
     */
    it('viewCross0024', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(1, 6), 'A1:B2:C3:D4:E5:F6', 2);
      const view: ProfileViewState = viewFrom(snapshot);
      expect(view.connectionText).assertEqual('A1:B2:**:**:**:F6 · 已连接');
      expect(view.currentState).assertEqual(2);
      expect(view.connectionText.indexOf('·') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0025
     * @tc.name viewCross0025
     * @tc.desc Verify the connection line shows the masked address and the text of state 3.
     */
    it('viewCross0025', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(1, 6), 'A1:B2:C3:D4:E5:F6', 3);
      const view: ProfileViewState = viewFrom(snapshot);
      expect(view.connectionText).assertEqual('A1:B2:**:**:**:F6 · 正在断开');
      expect(view.currentState).assertEqual(3);
      expect(view.connectionText.indexOf('·') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0026
     * @tc.name viewCross0026
     * @tc.desc Verify the connection line shows the masked address and the text of state 4.
     */
    it('viewCross0026', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(1, 6), 'A1:B2:C3:D4:E5:F6', 4);
      const view: ProfileViewState = viewFrom(snapshot);
      expect(view.connectionText).assertEqual('A1:B2:**:**:**:F6 · 未知状态');
      expect(view.currentState).assertEqual(4);
      expect(view.connectionText.indexOf('·') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0027
     * @tc.name viewCross0027
     * @tc.desc Verify the connection line falls back to the idle text for state 0 without a device.
     */
    it('viewCross0027', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(0), '', 0);
      const view: ProfileViewState = viewFrom(snapshot);
      expect(view.connectionText).assertEqual('尚未查询连接状态');
      expect(view.currentState).assertEqual(0);
      expect(view.connectionText.indexOf('·')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0028
     * @tc.name viewCross0028
     * @tc.desc Verify the connection line falls back to the idle text for state 1 without a device.
     */
    it('viewCross0028', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(0), '', 1);
      const view: ProfileViewState = viewFrom(snapshot);
      expect(view.connectionText).assertEqual('尚未查询连接状态');
      expect(view.currentState).assertEqual(1);
      expect(view.connectionText.indexOf('·')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0029
     * @tc.name viewCross0029
     * @tc.desc Verify the connection line falls back to the idle text for state 2 without a device.
     */
    it('viewCross0029', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(0), '', 2);
      const view: ProfileViewState = viewFrom(snapshot);
      expect(view.connectionText).assertEqual('尚未查询连接状态');
      expect(view.currentState).assertEqual(2);
      expect(view.connectionText.indexOf('·')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0030
     * @tc.name viewCross0030
     * @tc.desc Verify the connection line falls back to the idle text for state 3 without a device.
     */
    it('viewCross0030', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(0), '', 3);
      const view: ProfileViewState = viewFrom(snapshot);
      expect(view.connectionText).assertEqual('尚未查询连接状态');
      expect(view.currentState).assertEqual(3);
      expect(view.connectionText.indexOf('·')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0031
     * @tc.name viewCross0031
     * @tc.desc Verify the connection line falls back to the idle text for state 4 without a device.
     */
    it('viewCross0031', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(0), '', 4);
      const view: ProfileViewState = viewFrom(snapshot);
      expect(view.connectionText).assertEqual('尚未查询连接状态');
      expect(view.currentState).assertEqual(4);
      expect(view.connectionText.indexOf('·')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0032
     * @tc.name viewCross0032
     * @tc.desc Verify the view masks all 1 addresses and keeps the raw list for the panel.
     */
    it('viewCross0032', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(1), '', 0);
      const view: ProfileViewState = viewFrom(snapshot);
      expect(view.maskedDevices.length).assertEqual(1);
      expect(view.maskedDevices[0]).assertEqual('A1:B2:**:**:**:F0');
      expect(view.devices.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0033
     * @tc.name viewCross0033
     * @tc.desc Verify the view masks all 2 addresses and keeps the raw list for the panel.
     */
    it('viewCross0033', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(2), '', 0);
      const view: ProfileViewState = viewFrom(snapshot);
      expect(view.maskedDevices.length).assertEqual(2);
      expect(view.maskedDevices[0]).assertEqual('A1:B2:**:**:**:F0');
      expect(view.devices.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0034
     * @tc.name viewCross0034
     * @tc.desc Verify the view masks all 3 addresses and keeps the raw list for the panel.
     */
    it('viewCross0034', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(3), '', 0);
      const view: ProfileViewState = viewFrom(snapshot);
      expect(view.maskedDevices.length).assertEqual(3);
      expect(view.maskedDevices[0]).assertEqual('A1:B2:**:**:**:F0');
      expect(view.devices.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0035
     * @tc.name viewCross0035
     * @tc.desc Verify the view masks all 4 addresses and keeps the raw list for the panel.
     */
    it('viewCross0035', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(4), '', 0);
      const view: ProfileViewState = viewFrom(snapshot);
      expect(view.maskedDevices.length).assertEqual(4);
      expect(view.maskedDevices[0]).assertEqual('A1:B2:**:**:**:F0');
      expect(view.devices.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0036
     * @tc.name viewCross0036
     * @tc.desc Verify the view masks all 5 addresses and keeps the raw list for the panel.
     */
    it('viewCross0036', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(5), '', 0);
      const view: ProfileViewState = viewFrom(snapshot);
      expect(view.maskedDevices.length).assertEqual(5);
      expect(view.maskedDevices[0]).assertEqual('A1:B2:**:**:**:F0');
      expect(view.devices.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0037
     * @tc.name viewCross0037
     * @tc.desc Verify the view masks all 6 addresses and keeps the raw list for the panel.
     */
    it('viewCross0037', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(6), '', 0);
      const view: ProfileViewState = viewFrom(snapshot);
      expect(view.maskedDevices.length).assertEqual(6);
      expect(view.maskedDevices[0]).assertEqual('A1:B2:**:**:**:F0');
      expect(view.devices.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0038
     * @tc.name viewCross0038
     * @tc.desc Verify the summary text for 0 devices matches the shared wording helper.
     */
    it('viewCross0038', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(0), '', 0);
      const view: ProfileViewState = viewFrom(snapshot);
      expect(view.deviceSummary).assertEqual('暂无已连接设备');
      expect(view.hasDevices()).assertEqual(false);
      expect(view.deviceSummary.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0039
     * @tc.name viewCross0039
     * @tc.desc Verify the summary text for 1 devices matches the shared wording helper.
     */
    it('viewCross0039', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(1), '', 0);
      const view: ProfileViewState = viewFrom(snapshot);
      expect(view.deviceSummary).assertEqual('1 台已连接设备');
      expect(view.hasDevices()).assertEqual(true);
      expect(view.deviceSummary.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0040
     * @tc.name viewCross0040
     * @tc.desc Verify the summary text for 2 devices matches the shared wording helper.
     */
    it('viewCross0040', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(2), '', 0);
      const view: ProfileViewState = viewFrom(snapshot);
      expect(view.deviceSummary).assertEqual('2 台已连接设备');
      expect(view.hasDevices()).assertEqual(true);
      expect(view.deviceSummary.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0041
     * @tc.name viewCross0041
     * @tc.desc Verify the summary text for 3 devices matches the shared wording helper.
     */
    it('viewCross0041', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(3), '', 0);
      const view: ProfileViewState = viewFrom(snapshot);
      expect(view.deviceSummary).assertEqual('3 台已连接设备');
      expect(view.hasDevices()).assertEqual(true);
      expect(view.deviceSummary.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0042
     * @tc.name viewCross0042
     * @tc.desc Verify the summary text for 6 devices matches the shared wording helper.
     */
    it('viewCross0042', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(6), '', 0);
      const view: ProfileViewState = viewFrom(snapshot);
      expect(view.deviceSummary).assertEqual('6 台已连接设备');
      expect(view.hasDevices()).assertEqual(true);
      expect(view.deviceSummary.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_VIEW_CROSS_0043
     * @tc.name viewCross0043
     * @tc.desc Verify the summary text for 9 devices matches the shared wording helper.
     */
    it('viewCross0043', 0, () => {
      const snapshot: ProfileSnapshot = snapshotWith(devicesOf(9), '', 0);
      const view: ProfileViewState = viewFrom(snapshot);
      expect(view.deviceSummary).assertEqual('9 台已连接设备');
      expect(view.hasDevices()).assertEqual(true);
      expect(view.deviceSummary.length > 0).assertTrue();
    });
  });
}
