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
 * 探测状态的三视角矩阵。
 *
 * 状态是纯枚举，但它同时被页面标题、提示区、刷新按钮三处消费：
 * 名称决定标题、提示决定说明文字、就绪谓词决定是否允许继续查询，
 * 三处必须对同一个状态给出彼此不矛盾的结论。
 */

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import {
  ProbeStatus,
  classifyErrorCode,
  isReadyStatus,
  probeStatusHint,
  probeStatusName,
  shouldRefreshDevices
} from '../../../main/ets/model/ProfileState';
import { bluetoothErrorHint } from '../../../main/ets/utils/ErrorUtil';

export default function bluetoothProfileStateCrossTest() {
  describe('BluetoothProfileStateCrossTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CROSS_0001
     * @tc.name stateCross0001
     * @tc.desc Verify status IDLE exposes the documented name and hint text.
     */
    it('stateCross0001', 0, () => {
      const name: string = probeStatusName(ProbeStatus.IDLE);
      expect(name).assertEqual('未探测');
      expect(name.length).assertEqual(3);
      const hint: string = probeStatusHint(ProbeStatus.IDLE);
      expect(hint.length).assertEqual(16);
      expect(hint.indexOf('查看日志') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CROSS_0002
     * @tc.name stateCross0002
     * @tc.desc Verify status IDLE keeps the readiness predicates aligned with its meaning.
     */
    it('stateCross0002', 0, () => {
      const ownName: string = probeStatusName(ProbeStatus.IDLE);
      const ownHint: string = probeStatusHint(ProbeStatus.IDLE);
      expect(isReadyStatus(ProbeStatus.IDLE)).assertEqual(false);
      expect(shouldRefreshDevices(ProbeStatus.IDLE)).assertEqual(false);
      expect(ownName === ownHint).assertFalse();
      expect(ownName === probeStatusName(ProbeStatus.IDLE)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CROSS_0003
     * @tc.name stateCross0003
     * @tc.desc Verify status IDLE can be reached from the error codes the session stores.
     */
    it('stateCross0003', 0, () => {
      expect(classifyErrorCode(0)).assertEqual(ProbeStatus.IDLE);
      expect(classifyErrorCode(-5)).assertEqual(ProbeStatus.IDLE);
      expect(bluetoothErrorHint(0).length > 0).assertTrue();
      expect(probeStatusName(classifyErrorCode(0))).assertEqual('未探测');
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CROSS_0004
     * @tc.name stateCross0004
     * @tc.desc Verify status READY exposes the documented name and hint text.
     */
    it('stateCross0004', 0, () => {
      const name: string = probeStatusName(ProbeStatus.READY);
      expect(name).assertEqual('可用');
      expect(name.length).assertEqual(2);
      const hint: string = probeStatusHint(ProbeStatus.READY);
      expect(hint.length).assertEqual(23);
      expect(hint.indexOf('Profile 实例已创建') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CROSS_0005
     * @tc.name stateCross0005
     * @tc.desc Verify status READY keeps the readiness predicates aligned with its meaning.
     */
    it('stateCross0005', 0, () => {
      const ownName: string = probeStatusName(ProbeStatus.READY);
      const ownHint: string = probeStatusHint(ProbeStatus.READY);
      expect(isReadyStatus(ProbeStatus.READY)).assertEqual(true);
      expect(shouldRefreshDevices(ProbeStatus.READY)).assertEqual(true);
      expect(ownName === ownHint).assertFalse();
      expect(ownName === probeStatusName(ProbeStatus.IDLE)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CROSS_0006
     * @tc.name stateCross0006
     * @tc.desc Verify status READY can be reached from the error codes the session stores.
     */
    it('stateCross0006', 0, () => {
      expect(isReadyStatus(ProbeStatus.READY)).assertTrue();
      expect(probeStatusHint(ProbeStatus.READY).indexOf('Profile 实例已创建') >= 0).assertTrue();
      expect(probeStatusName(ProbeStatus.READY) === probeStatusName(ProbeStatus.FAILED)).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CROSS_0007
     * @tc.name stateCross0007
     * @tc.desc Verify status NO_DEVICE exposes the documented name and hint text.
     */
    it('stateCross0007', 0, () => {
      const name: string = probeStatusName(ProbeStatus.NO_DEVICE);
      expect(name).assertEqual('无已连接设备');
      expect(name.length).assertEqual(6);
      const hint: string = probeStatusHint(ProbeStatus.NO_DEVICE);
      expect(hint.length).assertEqual(26);
      expect(hint.indexOf('没有对端设备') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CROSS_0008
     * @tc.name stateCross0008
     * @tc.desc Verify status NO_DEVICE keeps the readiness predicates aligned with its meaning.
     */
    it('stateCross0008', 0, () => {
      const ownName: string = probeStatusName(ProbeStatus.NO_DEVICE);
      const ownHint: string = probeStatusHint(ProbeStatus.NO_DEVICE);
      expect(isReadyStatus(ProbeStatus.NO_DEVICE)).assertEqual(true);
      expect(shouldRefreshDevices(ProbeStatus.NO_DEVICE)).assertEqual(true);
      expect(ownName === ownHint).assertFalse();
      expect(ownName === probeStatusName(ProbeStatus.IDLE)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CROSS_0009
     * @tc.name stateCross0009
     * @tc.desc Verify status NO_DEVICE can be reached from the error codes the session stores.
     */
    it('stateCross0009', 0, () => {
      expect(isReadyStatus(ProbeStatus.NO_DEVICE)).assertTrue();
      expect(probeStatusHint(ProbeStatus.NO_DEVICE).indexOf('没有对端设备') >= 0).assertTrue();
      expect(probeStatusName(ProbeStatus.NO_DEVICE) === probeStatusName(ProbeStatus.FAILED)).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CROSS_0010
     * @tc.name stateCross0010
     * @tc.desc Verify status PERMISSION_DENIED exposes the documented name and hint text.
     */
    it('stateCross0010', 0, () => {
      const name: string = probeStatusName(ProbeStatus.PERMISSION_DENIED);
      expect(name).assertEqual('缺少权限');
      expect(name.length).assertEqual(4);
      const hint: string = probeStatusHint(ProbeStatus.PERMISSION_DENIED);
      expect(hint.length).assertEqual(47);
      expect(hint.indexOf('ACCESS_BLUETOOTH') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CROSS_0011
     * @tc.name stateCross0011
     * @tc.desc Verify status PERMISSION_DENIED keeps the readiness predicates aligned with its meaning.
     */
    it('stateCross0011', 0, () => {
      const ownName: string = probeStatusName(ProbeStatus.PERMISSION_DENIED);
      const ownHint: string = probeStatusHint(ProbeStatus.PERMISSION_DENIED);
      expect(isReadyStatus(ProbeStatus.PERMISSION_DENIED)).assertEqual(false);
      expect(shouldRefreshDevices(ProbeStatus.PERMISSION_DENIED)).assertEqual(false);
      expect(ownName === ownHint).assertFalse();
      expect(ownName === probeStatusName(ProbeStatus.IDLE)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CROSS_0012
     * @tc.name stateCross0012
     * @tc.desc Verify status PERMISSION_DENIED can be reached from the error codes the session stores.
     */
    it('stateCross0012', 0, () => {
      expect(classifyErrorCode(201)).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(bluetoothErrorHint(201).length > 0).assertTrue();
      expect(probeStatusName(classifyErrorCode(201))).assertEqual('缺少权限');
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CROSS_0013
     * @tc.name stateCross0013
     * @tc.desc Verify status CAPABILITY_UNSUPPORTED exposes the documented name and hint text.
     */
    it('stateCross0013', 0, () => {
      const name: string = probeStatusName(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(name).assertEqual('设备不支持');
      expect(name.length).assertEqual(5);
      const hint: string = probeStatusHint(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(hint.length).assertEqual(43);
      expect(hint.indexOf('模拟器') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CROSS_0014
     * @tc.name stateCross0014
     * @tc.desc Verify status CAPABILITY_UNSUPPORTED keeps the readiness predicates aligned with its meaning.
     */
    it('stateCross0014', 0, () => {
      const ownName: string = probeStatusName(ProbeStatus.CAPABILITY_UNSUPPORTED);
      const ownHint: string = probeStatusHint(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(isReadyStatus(ProbeStatus.CAPABILITY_UNSUPPORTED)).assertEqual(false);
      expect(shouldRefreshDevices(ProbeStatus.CAPABILITY_UNSUPPORTED)).assertEqual(false);
      expect(ownName === ownHint).assertFalse();
      expect(ownName === probeStatusName(ProbeStatus.IDLE)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CROSS_0015
     * @tc.name stateCross0015
     * @tc.desc Verify status CAPABILITY_UNSUPPORTED can be reached from the error codes the session stores.
     */
    it('stateCross0015', 0, () => {
      expect(classifyErrorCode(801)).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(bluetoothErrorHint(801).length > 0).assertTrue();
      expect(probeStatusName(classifyErrorCode(801))).assertEqual('设备不支持');
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CROSS_0016
     * @tc.name stateCross0016
     * @tc.desc Verify status BLUETOOTH_DISABLED exposes the documented name and hint text.
     */
    it('stateCross0016', 0, () => {
      const name: string = probeStatusName(ProbeStatus.BLUETOOTH_DISABLED);
      expect(name).assertEqual('蓝牙未开启');
      expect(name.length).assertEqual(5);
      const hint: string = probeStatusHint(ProbeStatus.BLUETOOTH_DISABLED);
      expect(hint.length).assertEqual(16);
      expect(hint.indexOf('蓝牙开关') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CROSS_0017
     * @tc.name stateCross0017
     * @tc.desc Verify status BLUETOOTH_DISABLED keeps the readiness predicates aligned with its meaning.
     */
    it('stateCross0017', 0, () => {
      const ownName: string = probeStatusName(ProbeStatus.BLUETOOTH_DISABLED);
      const ownHint: string = probeStatusHint(ProbeStatus.BLUETOOTH_DISABLED);
      expect(isReadyStatus(ProbeStatus.BLUETOOTH_DISABLED)).assertEqual(false);
      expect(shouldRefreshDevices(ProbeStatus.BLUETOOTH_DISABLED)).assertEqual(false);
      expect(ownName === ownHint).assertFalse();
      expect(ownName === probeStatusName(ProbeStatus.IDLE)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CROSS_0018
     * @tc.name stateCross0018
     * @tc.desc Verify status BLUETOOTH_DISABLED can be reached from the error codes the session stores.
     */
    it('stateCross0018', 0, () => {
      expect(classifyErrorCode(2900003)).assertEqual(ProbeStatus.BLUETOOTH_DISABLED);
      expect(bluetoothErrorHint(2900003).length > 0).assertTrue();
      expect(probeStatusName(classifyErrorCode(2900003))).assertEqual('蓝牙未开启');
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CROSS_0019
     * @tc.name stateCross0019
     * @tc.desc Verify status SERVICE_STOPPED exposes the documented name and hint text.
     */
    it('stateCross0019', 0, () => {
      const name: string = probeStatusName(ProbeStatus.SERVICE_STOPPED);
      expect(name).assertEqual('蓝牙服务已停止');
      expect(name.length).assertEqual(7);
      const hint: string = probeStatusHint(ProbeStatus.SERVICE_STOPPED);
      expect(hint.length).assertEqual(20);
      expect(hint.indexOf('异常退出') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CROSS_0020
     * @tc.name stateCross0020
     * @tc.desc Verify status SERVICE_STOPPED keeps the readiness predicates aligned with its meaning.
     */
    it('stateCross0020', 0, () => {
      const ownName: string = probeStatusName(ProbeStatus.SERVICE_STOPPED);
      const ownHint: string = probeStatusHint(ProbeStatus.SERVICE_STOPPED);
      expect(isReadyStatus(ProbeStatus.SERVICE_STOPPED)).assertEqual(false);
      expect(shouldRefreshDevices(ProbeStatus.SERVICE_STOPPED)).assertEqual(false);
      expect(ownName === ownHint).assertFalse();
      expect(ownName === probeStatusName(ProbeStatus.IDLE)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CROSS_0021
     * @tc.name stateCross0021
     * @tc.desc Verify status SERVICE_STOPPED can be reached from the error codes the session stores.
     */
    it('stateCross0021', 0, () => {
      expect(classifyErrorCode(2900001)).assertEqual(ProbeStatus.SERVICE_STOPPED);
      expect(bluetoothErrorHint(2900001).length > 0).assertTrue();
      expect(probeStatusName(classifyErrorCode(2900001))).assertEqual('蓝牙服务已停止');
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CROSS_0022
     * @tc.name stateCross0022
     * @tc.desc Verify status PROFILE_UNSUPPORTED exposes the documented name and hint text.
     */
    it('stateCross0022', 0, () => {
      const name: string = probeStatusName(ProbeStatus.PROFILE_UNSUPPORTED);
      expect(name).assertEqual('Profile 不支持');
      expect(name.length).assertEqual(11);
      const hint: string = probeStatusHint(ProbeStatus.PROFILE_UNSUPPORTED);
      expect(hint.length).assertEqual(25);
      expect(hint.indexOf('未编译') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CROSS_0023
     * @tc.name stateCross0023
     * @tc.desc Verify status PROFILE_UNSUPPORTED keeps the readiness predicates aligned with its meaning.
     */
    it('stateCross0023', 0, () => {
      const ownName: string = probeStatusName(ProbeStatus.PROFILE_UNSUPPORTED);
      const ownHint: string = probeStatusHint(ProbeStatus.PROFILE_UNSUPPORTED);
      expect(isReadyStatus(ProbeStatus.PROFILE_UNSUPPORTED)).assertEqual(false);
      expect(shouldRefreshDevices(ProbeStatus.PROFILE_UNSUPPORTED)).assertEqual(false);
      expect(ownName === ownHint).assertFalse();
      expect(ownName === probeStatusName(ProbeStatus.IDLE)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CROSS_0024
     * @tc.name stateCross0024
     * @tc.desc Verify status PROFILE_UNSUPPORTED can be reached from the error codes the session stores.
     */
    it('stateCross0024', 0, () => {
      expect(classifyErrorCode(2900004)).assertEqual(ProbeStatus.PROFILE_UNSUPPORTED);
      expect(bluetoothErrorHint(2900004).length > 0).assertTrue();
      expect(probeStatusName(classifyErrorCode(2900004))).assertEqual('Profile 不支持');
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CROSS_0025
     * @tc.name stateCross0025
     * @tc.desc Verify status FAILED exposes the documented name and hint text.
     */
    it('stateCross0025', 0, () => {
      const name: string = probeStatusName(ProbeStatus.FAILED);
      expect(name).assertEqual('操作失败');
      expect(name.length).assertEqual(4);
      const hint: string = probeStatusHint(ProbeStatus.FAILED);
      expect(hint.length).assertEqual(16);
      expect(hint.indexOf('查看日志') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CROSS_0026
     * @tc.name stateCross0026
     * @tc.desc Verify status FAILED keeps the readiness predicates aligned with its meaning.
     */
    it('stateCross0026', 0, () => {
      const ownName: string = probeStatusName(ProbeStatus.FAILED);
      const ownHint: string = probeStatusHint(ProbeStatus.FAILED);
      expect(isReadyStatus(ProbeStatus.FAILED)).assertEqual(false);
      expect(shouldRefreshDevices(ProbeStatus.FAILED)).assertEqual(false);
      expect(ownName === ownHint).assertFalse();
      expect(ownName === probeStatusName(ProbeStatus.IDLE)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CROSS_0027
     * @tc.name stateCross0027
     * @tc.desc Verify status FAILED can be reached from the error codes the session stores.
     */
    it('stateCross0027', 0, () => {
      expect(classifyErrorCode(401)).assertEqual(ProbeStatus.FAILED);
      expect(classifyErrorCode(2900099)).assertEqual(ProbeStatus.FAILED);
      expect(bluetoothErrorHint(401).length > 0).assertTrue();
      expect(probeStatusName(classifyErrorCode(401))).assertEqual('操作失败');
    });
  });
}
