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
 * 枚举到中文文案的映射矩阵。
 *
 * 连接状态、断开原因、蓝牙开关状态与探测状态都是 number / enum 到字符串的映射，
 * 这里对每个合法取值及其前后相邻的非法取值各断言一次，
 * 并额外断言文案长度与「两张表不共用文案」，把文案被误改或两张表被合并写错都暴露出来。
 */

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import {
  ProbeStatus,
  bluetoothStateName,
  connectionStateName,
  disconnectCauseName,
  isBluetoothUsable,
  isConnected,
  isReadyStatus,
  isTransitionState,
  probeStatusHint,
  probeStatusName
} from '../../../main/ets/model/ProfileState';

export default function bluetoothProfileStateTextTest() {
  describe('BluetoothProfileStateTextTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0001
     * @tc.name stateText0001
     * @tc.desc Verify connection state -3 renders its name and keeps predicates exclusive.
     */
    it('stateText0001', 0, () => {
      expect(connectionStateName(-3)).assertEqual('未知状态');
      expect(connectionStateName(-3).length).assertEqual(4);
      expect(isConnected(-3)).assertEqual(false);
      expect(isTransitionState(-3)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0002
     * @tc.name stateText0002
     * @tc.desc Verify connection state -2 renders its name and keeps predicates exclusive.
     */
    it('stateText0002', 0, () => {
      expect(connectionStateName(-2)).assertEqual('未知状态');
      expect(connectionStateName(-2).length).assertEqual(4);
      expect(isConnected(-2)).assertEqual(false);
      expect(isTransitionState(-2)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0003
     * @tc.name stateText0003
     * @tc.desc Verify connection state -1 renders its name and keeps predicates exclusive.
     */
    it('stateText0003', 0, () => {
      expect(connectionStateName(-1)).assertEqual('未知状态');
      expect(connectionStateName(-1).length).assertEqual(4);
      expect(isConnected(-1)).assertEqual(false);
      expect(isTransitionState(-1)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0004
     * @tc.name stateText0004
     * @tc.desc Verify connection state 0 renders its name and keeps predicates exclusive.
     */
    it('stateText0004', 0, () => {
      expect(connectionStateName(0)).assertEqual('已断开');
      expect(connectionStateName(0).length).assertEqual(3);
      expect(isConnected(0)).assertEqual(false);
      expect(isTransitionState(0)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0005
     * @tc.name stateText0005
     * @tc.desc Verify connection state 1 renders its name and keeps predicates exclusive.
     */
    it('stateText0005', 0, () => {
      expect(connectionStateName(1)).assertEqual('正在连接');
      expect(connectionStateName(1).length).assertEqual(4);
      expect(isConnected(1)).assertEqual(false);
      expect(isTransitionState(1)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0006
     * @tc.name stateText0006
     * @tc.desc Verify connection state 2 renders its name and keeps predicates exclusive.
     */
    it('stateText0006', 0, () => {
      expect(connectionStateName(2)).assertEqual('已连接');
      expect(connectionStateName(2).length).assertEqual(3);
      expect(isConnected(2)).assertEqual(true);
      expect(isTransitionState(2)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0007
     * @tc.name stateText0007
     * @tc.desc Verify connection state 3 renders its name and keeps predicates exclusive.
     */
    it('stateText0007', 0, () => {
      expect(connectionStateName(3)).assertEqual('正在断开');
      expect(connectionStateName(3).length).assertEqual(4);
      expect(isConnected(3)).assertEqual(false);
      expect(isTransitionState(3)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0008
     * @tc.name stateText0008
     * @tc.desc Verify connection state 4 renders its name and keeps predicates exclusive.
     */
    it('stateText0008', 0, () => {
      expect(connectionStateName(4)).assertEqual('未知状态');
      expect(connectionStateName(4).length).assertEqual(4);
      expect(isConnected(4)).assertEqual(false);
      expect(isTransitionState(4)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0009
     * @tc.name stateText0009
     * @tc.desc Verify connection state 5 renders its name and keeps predicates exclusive.
     */
    it('stateText0009', 0, () => {
      expect(connectionStateName(5)).assertEqual('未知状态');
      expect(connectionStateName(5).length).assertEqual(4);
      expect(isConnected(5)).assertEqual(false);
      expect(isTransitionState(5)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0010
     * @tc.name stateText0010
     * @tc.desc Verify connection state 6 renders its name and keeps predicates exclusive.
     */
    it('stateText0010', 0, () => {
      expect(connectionStateName(6)).assertEqual('未知状态');
      expect(connectionStateName(6).length).assertEqual(4);
      expect(isConnected(6)).assertEqual(false);
      expect(isTransitionState(6)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0011
     * @tc.name stateText0011
     * @tc.desc Verify connection state 7 renders its name and keeps predicates exclusive.
     */
    it('stateText0011', 0, () => {
      expect(connectionStateName(7)).assertEqual('未知状态');
      expect(connectionStateName(7).length).assertEqual(4);
      expect(isConnected(7)).assertEqual(false);
      expect(isTransitionState(7)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0012
     * @tc.name stateText0012
     * @tc.desc Verify connection state 8 renders its name and keeps predicates exclusive.
     */
    it('stateText0012', 0, () => {
      expect(connectionStateName(8)).assertEqual('未知状态');
      expect(connectionStateName(8).length).assertEqual(4);
      expect(isConnected(8)).assertEqual(false);
      expect(isTransitionState(8)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0013
     * @tc.name stateText0013
     * @tc.desc Verify connection state 9 renders its name and keeps predicates exclusive.
     */
    it('stateText0013', 0, () => {
      expect(connectionStateName(9)).assertEqual('未知状态');
      expect(connectionStateName(9).length).assertEqual(4);
      expect(isConnected(9)).assertEqual(false);
      expect(isTransitionState(9)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0014
     * @tc.name stateText0014
     * @tc.desc Verify disconnect cause -3 renders a stable name and no state overlap.
     */
    it('stateText0014', 0, () => {
      expect(disconnectCauseName(-3)).assertEqual('未知原因');
      expect(disconnectCauseName(-3).length).assertEqual(4);
      expect(disconnectCauseName(-3) === connectionStateName(-3)).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0015
     * @tc.name stateText0015
     * @tc.desc Verify disconnect cause -2 renders a stable name and no state overlap.
     */
    it('stateText0015', 0, () => {
      expect(disconnectCauseName(-2)).assertEqual('未知原因');
      expect(disconnectCauseName(-2).length).assertEqual(4);
      expect(disconnectCauseName(-2) === connectionStateName(-2)).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0016
     * @tc.name stateText0016
     * @tc.desc Verify disconnect cause -1 renders a stable name and no state overlap.
     */
    it('stateText0016', 0, () => {
      expect(disconnectCauseName(-1)).assertEqual('未知原因');
      expect(disconnectCauseName(-1).length).assertEqual(4);
      expect(disconnectCauseName(-1) === connectionStateName(-1)).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0017
     * @tc.name stateText0017
     * @tc.desc Verify disconnect cause 0 renders a stable name and no state overlap.
     */
    it('stateText0017', 0, () => {
      expect(disconnectCauseName(0)).assertEqual('用户主动断开');
      expect(disconnectCauseName(0).length).assertEqual(6);
      expect(disconnectCauseName(0) === connectionStateName(0)).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0018
     * @tc.name stateText0018
     * @tc.desc Verify disconnect cause 1 renders a stable name and no state overlap.
     */
    it('stateText0018', 0, () => {
      expect(disconnectCauseName(1)).assertEqual('需要从键盘侧发起');
      expect(disconnectCauseName(1).length).assertEqual(8);
      expect(disconnectCauseName(1) === connectionStateName(1)).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0019
     * @tc.name stateText0019
     * @tc.desc Verify disconnect cause 2 renders a stable name and no state overlap.
     */
    it('stateText0019', 0, () => {
      expect(disconnectCauseName(2)).assertEqual('需要从鼠标侧发起');
      expect(disconnectCauseName(2).length).assertEqual(8);
      expect(disconnectCauseName(2) === connectionStateName(2)).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0020
     * @tc.name stateText0020
     * @tc.desc Verify disconnect cause 3 renders a stable name and no state overlap.
     */
    it('stateText0020', 0, () => {
      expect(disconnectCauseName(3)).assertEqual('需要从车机侧发起');
      expect(disconnectCauseName(3).length).assertEqual(8);
      expect(disconnectCauseName(3) === connectionStateName(3)).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0021
     * @tc.name stateText0021
     * @tc.desc Verify disconnect cause 4 renders a stable name and no state overlap.
     */
    it('stateText0021', 0, () => {
      expect(disconnectCauseName(4)).assertEqual('已连接设备数量超限');
      expect(disconnectCauseName(4).length).assertEqual(9);
      expect(disconnectCauseName(4) === connectionStateName(4)).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0022
     * @tc.name stateText0022
     * @tc.desc Verify disconnect cause 5 renders a stable name and no state overlap.
     */
    it('stateText0022', 0, () => {
      expect(disconnectCauseName(5)).assertEqual('内部错误导致连接失败');
      expect(disconnectCauseName(5).length).assertEqual(10);
      expect(disconnectCauseName(5) === connectionStateName(5)).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0023
     * @tc.name stateText0023
     * @tc.desc Verify disconnect cause 6 renders a stable name and no state overlap.
     */
    it('stateText0023', 0, () => {
      expect(disconnectCauseName(6)).assertEqual('未知原因');
      expect(disconnectCauseName(6).length).assertEqual(4);
      expect(disconnectCauseName(6) === connectionStateName(6)).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0024
     * @tc.name stateText0024
     * @tc.desc Verify disconnect cause 7 renders a stable name and no state overlap.
     */
    it('stateText0024', 0, () => {
      expect(disconnectCauseName(7)).assertEqual('未知原因');
      expect(disconnectCauseName(7).length).assertEqual(4);
      expect(disconnectCauseName(7) === connectionStateName(7)).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0025
     * @tc.name stateText0025
     * @tc.desc Verify bluetooth state -3 renders its own text table.
     */
    it('stateText0025', 0, () => {
      expect(bluetoothStateName(-3)).assertEqual('未知状态');
      expect(bluetoothStateName(-3).length).assertEqual(4);
      expect(isBluetoothUsable(-3)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0026
     * @tc.name stateText0026
     * @tc.desc Verify bluetooth state -2 renders its own text table.
     */
    it('stateText0026', 0, () => {
      expect(bluetoothStateName(-2)).assertEqual('未知状态');
      expect(bluetoothStateName(-2).length).assertEqual(4);
      expect(isBluetoothUsable(-2)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0027
     * @tc.name stateText0027
     * @tc.desc Verify bluetooth state -1 renders its own text table.
     */
    it('stateText0027', 0, () => {
      expect(bluetoothStateName(-1)).assertEqual('未知状态');
      expect(bluetoothStateName(-1).length).assertEqual(4);
      expect(isBluetoothUsable(-1)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0028
     * @tc.name stateText0028
     * @tc.desc Verify bluetooth state 0 renders its own text table.
     */
    it('stateText0028', 0, () => {
      expect(bluetoothStateName(0)).assertEqual('蓝牙已关闭');
      expect(bluetoothStateName(0).length).assertEqual(5);
      expect(isBluetoothUsable(0)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0029
     * @tc.name stateText0029
     * @tc.desc Verify bluetooth state 1 renders its own text table.
     */
    it('stateText0029', 0, () => {
      expect(bluetoothStateName(1)).assertEqual('蓝牙正在开启');
      expect(bluetoothStateName(1).length).assertEqual(6);
      expect(isBluetoothUsable(1)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0030
     * @tc.name stateText0030
     * @tc.desc Verify bluetooth state 2 renders its own text table.
     */
    it('stateText0030', 0, () => {
      expect(bluetoothStateName(2)).assertEqual('蓝牙已开启');
      expect(bluetoothStateName(2).length).assertEqual(5);
      expect(isBluetoothUsable(2)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0031
     * @tc.name stateText0031
     * @tc.desc Verify bluetooth state 3 renders its own text table.
     */
    it('stateText0031', 0, () => {
      expect(bluetoothStateName(3)).assertEqual('蓝牙正在关闭');
      expect(bluetoothStateName(3).length).assertEqual(6);
      expect(isBluetoothUsable(3)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0032
     * @tc.name stateText0032
     * @tc.desc Verify bluetooth state 4 renders its own text table.
     */
    it('stateText0032', 0, () => {
      expect(bluetoothStateName(4)).assertEqual('BLE 正在开启');
      expect(bluetoothStateName(4).length).assertEqual(8);
      expect(isBluetoothUsable(4)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0033
     * @tc.name stateText0033
     * @tc.desc Verify bluetooth state 5 renders its own text table.
     */
    it('stateText0033', 0, () => {
      expect(bluetoothStateName(5)).assertEqual('仅 BLE 模式');
      expect(bluetoothStateName(5).length).assertEqual(8);
      expect(isBluetoothUsable(5)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0034
     * @tc.name stateText0034
     * @tc.desc Verify bluetooth state 6 renders its own text table.
     */
    it('stateText0034', 0, () => {
      expect(bluetoothStateName(6)).assertEqual('BLE 正在关闭');
      expect(bluetoothStateName(6).length).assertEqual(8);
      expect(isBluetoothUsable(6)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0035
     * @tc.name stateText0035
     * @tc.desc Verify bluetooth state 7 renders its own text table.
     */
    it('stateText0035', 0, () => {
      expect(bluetoothStateName(7)).assertEqual('未知状态');
      expect(bluetoothStateName(7).length).assertEqual(4);
      expect(isBluetoothUsable(7)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0036
     * @tc.name stateText0036
     * @tc.desc Verify bluetooth state 8 renders its own text table.
     */
    it('stateText0036', 0, () => {
      expect(bluetoothStateName(8)).assertEqual('未知状态');
      expect(bluetoothStateName(8).length).assertEqual(4);
      expect(isBluetoothUsable(8)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0037
     * @tc.name stateText0037
     * @tc.desc Verify probe status IDLE renders its name, hint and readiness flag.
     */
    it('stateText0037', 0, () => {
      expect(probeStatusName(ProbeStatus.IDLE)).assertEqual('未探测');
      const hint: string = probeStatusHint(ProbeStatus.IDLE);
      expect(hint).assertEqual('查看日志面板中的错误码与详细信息');
      expect(hint.length).assertEqual(16);
      expect(isReadyStatus(ProbeStatus.IDLE)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0038
     * @tc.name stateText0038
     * @tc.desc Verify probe status READY renders its name, hint and readiness flag.
     */
    it('stateText0038', 0, () => {
      expect(probeStatusName(ProbeStatus.READY)).assertEqual('可用');
      const hint: string = probeStatusHint(ProbeStatus.READY);
      expect(hint).assertEqual('Profile 实例已创建，可继续查询连接状态');
      expect(hint.length).assertEqual(23);
      expect(isReadyStatus(ProbeStatus.READY)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0039
     * @tc.name stateText0039
     * @tc.desc Verify probe status NO_DEVICE renders its name, hint and readiness flag.
     */
    it('stateText0039', 0, () => {
      expect(probeStatusName(ProbeStatus.NO_DEVICE)).assertEqual('无已连接设备');
      const hint: string = probeStatusHint(ProbeStatus.NO_DEVICE);
      expect(hint).assertEqual('实例正常，但当前没有对端设备连接到该 Profile');
      expect(hint.length).assertEqual(26);
      expect(isReadyStatus(ProbeStatus.NO_DEVICE)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0040
     * @tc.name stateText0040
     * @tc.desc Verify probe status PERMISSION_DENIED renders its name, hint and readiness flag.
     */
    it('stateText0040', 0, () => {
      expect(probeStatusName(ProbeStatus.PERMISSION_DENIED)).assertEqual('缺少权限');
      const hint: string = probeStatusHint(ProbeStatus.PERMISSION_DENIED);
      expect(hint).assertEqual('请先授予 ohos.permission.ACCESS_BLUETOOTH（演示页可一键申请）');
      expect(hint.length).assertEqual(47);
      expect(isReadyStatus(ProbeStatus.PERMISSION_DENIED)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0041
     * @tc.name stateText0041
     * @tc.desc Verify probe status CAPABILITY_UNSUPPORTED renders its name, hint and readiness flag.
     */
    it('stateText0041', 0, () => {
      expect(probeStatusName(ProbeStatus.CAPABILITY_UNSUPPORTED)).assertEqual('设备不支持');
      const hint: string = probeStatusHint(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(hint).assertEqual('当前设备未支持该 Profile 能力，可换用支持该能力的设备（模拟器或精简镜像常见）');
      expect(hint.length).assertEqual(43);
      expect(isReadyStatus(ProbeStatus.CAPABILITY_UNSUPPORTED)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0042
     * @tc.name stateText0042
     * @tc.desc Verify probe status BLUETOOTH_DISABLED renders its name, hint and readiness flag.
     */
    it('stateText0042', 0, () => {
      expect(probeStatusName(ProbeStatus.BLUETOOTH_DISABLED)).assertEqual('蓝牙未开启');
      const hint: string = probeStatusHint(ProbeStatus.BLUETOOTH_DISABLED);
      expect(hint).assertEqual('请先打开系统蓝牙开关，再重新探测');
      expect(hint.length).assertEqual(16);
      expect(isReadyStatus(ProbeStatus.BLUETOOTH_DISABLED)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0043
     * @tc.name stateText0043
     * @tc.desc Verify probe status SERVICE_STOPPED renders its name, hint and readiness flag.
     */
    it('stateText0043', 0, () => {
      expect(probeStatusName(ProbeStatus.SERVICE_STOPPED)).assertEqual('蓝牙服务已停止');
      const hint: string = probeStatusHint(ProbeStatus.SERVICE_STOPPED);
      expect(hint).assertEqual('蓝牙服务异常退出，可关闭再打开蓝牙后重试');
      expect(hint.length).assertEqual(20);
      expect(isReadyStatus(ProbeStatus.SERVICE_STOPPED)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0044
     * @tc.name stateText0044
     * @tc.desc Verify probe status PROFILE_UNSUPPORTED renders its name, hint and readiness flag.
     */
    it('stateText0044', 0, () => {
      expect(probeStatusName(ProbeStatus.PROFILE_UNSUPPORTED)).assertEqual('Profile 不支持');
      const hint: string = probeStatusHint(ProbeStatus.PROFILE_UNSUPPORTED);
      expect(hint).assertEqual('系统镜像未编译该 Profile，属于设备能力缺失');
      expect(hint.length).assertEqual(25);
      expect(isReadyStatus(ProbeStatus.PROFILE_UNSUPPORTED)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_TEXT_0045
     * @tc.name stateText0045
     * @tc.desc Verify probe status FAILED renders its name, hint and readiness flag.
     */
    it('stateText0045', 0, () => {
      expect(probeStatusName(ProbeStatus.FAILED)).assertEqual('操作失败');
      const hint: string = probeStatusHint(ProbeStatus.FAILED);
      expect(hint).assertEqual('查看日志面板中的错误码与详细信息');
      expect(hint.length).assertEqual(16);
      expect(isReadyStatus(ProbeStatus.FAILED)).assertEqual(false);
    });
  });
}
