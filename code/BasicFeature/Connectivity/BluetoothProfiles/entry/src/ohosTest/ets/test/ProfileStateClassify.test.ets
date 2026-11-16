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
 * 错误码到探测状态的分类矩阵。
 *
 * 覆盖文档登记的七个错误码、零与负数、以及围绕每个错误码的相邻值，
 * 用例同时断言「分类结果 / 状态文案 / 处理提示 / 可用性判定」四个相互独立的投影，
 * 避免只断言一个字段而在其余字段回归时漏判。
 */

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import {
  ProbeStatus,
  classifyErrorCode,
  isReadyStatus,
  probeStatusHint,
  probeStatusName
} from '../../../main/ets/model/ProfileState';

export default function bluetoothProfileStateClassifyTest() {
  describe('BluetoothProfileStateClassifyTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0001
     * @tc.name stateClassify0001
     * @tc.desc Verify code 201 maps to PERMISSION_DENIED with name, hint and readiness.
     */
    it('stateClassify0001', 0, () => {
      expect(classifyErrorCode(201)).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(probeStatusName(classifyErrorCode(201))).assertEqual('缺少权限');
      expect(probeStatusHint(classifyErrorCode(201))).assertEqual('请先授予 ohos.permission.ACCESS_BLUETOOTH（演示页可一键申请）');
      expect(isReadyStatus(classifyErrorCode(201))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0002
     * @tc.name stateClassify0002
     * @tc.desc Verify code 401 maps to FAILED with name, hint and readiness.
     */
    it('stateClassify0002', 0, () => {
      expect(classifyErrorCode(401)).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(classifyErrorCode(401))).assertEqual('操作失败');
      expect(probeStatusHint(classifyErrorCode(401))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(401))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0003
     * @tc.name stateClassify0003
     * @tc.desc Verify code 801 maps to CAPABILITY_UNSUPPORTED with name, hint and readiness.
     */
    it('stateClassify0003', 0, () => {
      expect(classifyErrorCode(801)).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(probeStatusName(classifyErrorCode(801))).assertEqual('设备不支持');
      expect(probeStatusHint(classifyErrorCode(801))).assertEqual('当前设备未支持该 Profile 能力，可换用支持该能力的设备（模拟器或精简镜像常见）');
      expect(isReadyStatus(classifyErrorCode(801))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0004
     * @tc.name stateClassify0004
     * @tc.desc Verify code 2900001 maps to SERVICE_STOPPED with name, hint and readiness.
     */
    it('stateClassify0004', 0, () => {
      expect(classifyErrorCode(2900001)).assertEqual(ProbeStatus.SERVICE_STOPPED);
      expect(probeStatusName(classifyErrorCode(2900001))).assertEqual('蓝牙服务已停止');
      expect(probeStatusHint(classifyErrorCode(2900001))).assertEqual('蓝牙服务异常退出，可关闭再打开蓝牙后重试');
      expect(isReadyStatus(classifyErrorCode(2900001))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0005
     * @tc.name stateClassify0005
     * @tc.desc Verify code 2900003 maps to BLUETOOTH_DISABLED with name, hint and readiness.
     */
    it('stateClassify0005', 0, () => {
      expect(classifyErrorCode(2900003)).assertEqual(ProbeStatus.BLUETOOTH_DISABLED);
      expect(probeStatusName(classifyErrorCode(2900003))).assertEqual('蓝牙未开启');
      expect(probeStatusHint(classifyErrorCode(2900003))).assertEqual('请先打开系统蓝牙开关，再重新探测');
      expect(isReadyStatus(classifyErrorCode(2900003))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0006
     * @tc.name stateClassify0006
     * @tc.desc Verify code 2900004 maps to PROFILE_UNSUPPORTED with name, hint and readiness.
     */
    it('stateClassify0006', 0, () => {
      expect(classifyErrorCode(2900004)).assertEqual(ProbeStatus.PROFILE_UNSUPPORTED);
      expect(probeStatusName(classifyErrorCode(2900004))).assertEqual('Profile 不支持');
      expect(probeStatusHint(classifyErrorCode(2900004))).assertEqual('系统镜像未编译该 Profile，属于设备能力缺失');
      expect(isReadyStatus(classifyErrorCode(2900004))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0007
     * @tc.name stateClassify0007
     * @tc.desc Verify code 2900099 maps to FAILED with name, hint and readiness.
     */
    it('stateClassify0007', 0, () => {
      expect(classifyErrorCode(2900099)).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(classifyErrorCode(2900099))).assertEqual('操作失败');
      expect(probeStatusHint(classifyErrorCode(2900099))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(2900099))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0008
     * @tc.name stateClassify0008
     * @tc.desc Verify code 0 maps to IDLE with name, hint and readiness.
     */
    it('stateClassify0008', 0, () => {
      expect(classifyErrorCode(0)).assertEqual(ProbeStatus.IDLE);
      expect(probeStatusName(classifyErrorCode(0))).assertEqual('未探测');
      expect(probeStatusHint(classifyErrorCode(0))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(0))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0009
     * @tc.name stateClassify0009
     * @tc.desc Verify code -1 maps to IDLE with name, hint and readiness.
     */
    it('stateClassify0009', 0, () => {
      expect(classifyErrorCode(-1)).assertEqual(ProbeStatus.IDLE);
      expect(probeStatusName(classifyErrorCode(-1))).assertEqual('未探测');
      expect(probeStatusHint(classifyErrorCode(-1))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(-1))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0010
     * @tc.name stateClassify0010
     * @tc.desc Verify code -201 maps to IDLE with name, hint and readiness.
     */
    it('stateClassify0010', 0, () => {
      expect(classifyErrorCode(-201)).assertEqual(ProbeStatus.IDLE);
      expect(probeStatusName(classifyErrorCode(-201))).assertEqual('未探测');
      expect(probeStatusHint(classifyErrorCode(-201))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(-201))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0011
     * @tc.name stateClassify0011
     * @tc.desc Verify code -801 maps to IDLE with name, hint and readiness.
     */
    it('stateClassify0011', 0, () => {
      expect(classifyErrorCode(-801)).assertEqual(ProbeStatus.IDLE);
      expect(probeStatusName(classifyErrorCode(-801))).assertEqual('未探测');
      expect(probeStatusHint(classifyErrorCode(-801))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(-801))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0012
     * @tc.name stateClassify0012
     * @tc.desc Verify code 1 maps to FAILED with name, hint and readiness.
     */
    it('stateClassify0012', 0, () => {
      expect(classifyErrorCode(1)).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(classifyErrorCode(1))).assertEqual('操作失败');
      expect(probeStatusHint(classifyErrorCode(1))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(1))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0013
     * @tc.name stateClassify0013
     * @tc.desc Verify code 2 maps to FAILED with name, hint and readiness.
     */
    it('stateClassify0013', 0, () => {
      expect(classifyErrorCode(2)).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(classifyErrorCode(2))).assertEqual('操作失败');
      expect(probeStatusHint(classifyErrorCode(2))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(2))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0014
     * @tc.name stateClassify0014
     * @tc.desc Verify code 3 maps to FAILED with name, hint and readiness.
     */
    it('stateClassify0014', 0, () => {
      expect(classifyErrorCode(3)).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(classifyErrorCode(3))).assertEqual('操作失败');
      expect(probeStatusHint(classifyErrorCode(3))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(3))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0015
     * @tc.name stateClassify0015
     * @tc.desc Verify code 5 maps to FAILED with name, hint and readiness.
     */
    it('stateClassify0015', 0, () => {
      expect(classifyErrorCode(5)).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(classifyErrorCode(5))).assertEqual('操作失败');
      expect(probeStatusHint(classifyErrorCode(5))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(5))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0016
     * @tc.name stateClassify0016
     * @tc.desc Verify code 10 maps to FAILED with name, hint and readiness.
     */
    it('stateClassify0016', 0, () => {
      expect(classifyErrorCode(10)).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(classifyErrorCode(10))).assertEqual('操作失败');
      expect(probeStatusHint(classifyErrorCode(10))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(10))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0017
     * @tc.name stateClassify0017
     * @tc.desc Verify code 42 maps to FAILED with name, hint and readiness.
     */
    it('stateClassify0017', 0, () => {
      expect(classifyErrorCode(42)).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(classifyErrorCode(42))).assertEqual('操作失败');
      expect(probeStatusHint(classifyErrorCode(42))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(42))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0018
     * @tc.name stateClassify0018
     * @tc.desc Verify code 100 maps to FAILED with name, hint and readiness.
     */
    it('stateClassify0018', 0, () => {
      expect(classifyErrorCode(100)).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(classifyErrorCode(100))).assertEqual('操作失败');
      expect(probeStatusHint(classifyErrorCode(100))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(100))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0019
     * @tc.name stateClassify0019
     * @tc.desc Verify code 200 maps to FAILED with name, hint and readiness.
     */
    it('stateClassify0019', 0, () => {
      expect(classifyErrorCode(200)).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(classifyErrorCode(200))).assertEqual('操作失败');
      expect(probeStatusHint(classifyErrorCode(200))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(200))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0020
     * @tc.name stateClassify0020
     * @tc.desc Verify code 202 maps to FAILED with name, hint and readiness.
     */
    it('stateClassify0020', 0, () => {
      expect(classifyErrorCode(202)).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(classifyErrorCode(202))).assertEqual('操作失败');
      expect(probeStatusHint(classifyErrorCode(202))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(202))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0021
     * @tc.name stateClassify0021
     * @tc.desc Verify code 255 maps to FAILED with name, hint and readiness.
     */
    it('stateClassify0021', 0, () => {
      expect(classifyErrorCode(255)).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(classifyErrorCode(255))).assertEqual('操作失败');
      expect(probeStatusHint(classifyErrorCode(255))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(255))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0022
     * @tc.name stateClassify0022
     * @tc.desc Verify code 400 maps to FAILED with name, hint and readiness.
     */
    it('stateClassify0022', 0, () => {
      expect(classifyErrorCode(400)).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(classifyErrorCode(400))).assertEqual('操作失败');
      expect(probeStatusHint(classifyErrorCode(400))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(400))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0023
     * @tc.name stateClassify0023
     * @tc.desc Verify code 402 maps to FAILED with name, hint and readiness.
     */
    it('stateClassify0023', 0, () => {
      expect(classifyErrorCode(402)).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(classifyErrorCode(402))).assertEqual('操作失败');
      expect(probeStatusHint(classifyErrorCode(402))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(402))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0024
     * @tc.name stateClassify0024
     * @tc.desc Verify code 500 maps to FAILED with name, hint and readiness.
     */
    it('stateClassify0024', 0, () => {
      expect(classifyErrorCode(500)).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(classifyErrorCode(500))).assertEqual('操作失败');
      expect(probeStatusHint(classifyErrorCode(500))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(500))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0025
     * @tc.name stateClassify0025
     * @tc.desc Verify code 800 maps to FAILED with name, hint and readiness.
     */
    it('stateClassify0025', 0, () => {
      expect(classifyErrorCode(800)).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(classifyErrorCode(800))).assertEqual('操作失败');
      expect(probeStatusHint(classifyErrorCode(800))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(800))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0026
     * @tc.name stateClassify0026
     * @tc.desc Verify code 802 maps to FAILED with name, hint and readiness.
     */
    it('stateClassify0026', 0, () => {
      expect(classifyErrorCode(802)).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(classifyErrorCode(802))).assertEqual('操作失败');
      expect(probeStatusHint(classifyErrorCode(802))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(802))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0027
     * @tc.name stateClassify0027
     * @tc.desc Verify code 1000 maps to FAILED with name, hint and readiness.
     */
    it('stateClassify0027', 0, () => {
      expect(classifyErrorCode(1000)).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(classifyErrorCode(1000))).assertEqual('操作失败');
      expect(probeStatusHint(classifyErrorCode(1000))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(1000))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0028
     * @tc.name stateClassify0028
     * @tc.desc Verify code 1234 maps to FAILED with name, hint and readiness.
     */
    it('stateClassify0028', 0, () => {
      expect(classifyErrorCode(1234)).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(classifyErrorCode(1234))).assertEqual('操作失败');
      expect(probeStatusHint(classifyErrorCode(1234))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(1234))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0029
     * @tc.name stateClassify0029
     * @tc.desc Verify code 5000 maps to FAILED with name, hint and readiness.
     */
    it('stateClassify0029', 0, () => {
      expect(classifyErrorCode(5000)).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(classifyErrorCode(5000))).assertEqual('操作失败');
      expect(probeStatusHint(classifyErrorCode(5000))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(5000))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0030
     * @tc.name stateClassify0030
     * @tc.desc Verify code 9999 maps to FAILED with name, hint and readiness.
     */
    it('stateClassify0030', 0, () => {
      expect(classifyErrorCode(9999)).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(classifyErrorCode(9999))).assertEqual('操作失败');
      expect(probeStatusHint(classifyErrorCode(9999))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(9999))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0031
     * @tc.name stateClassify0031
     * @tc.desc Verify code 10000 maps to FAILED with name, hint and readiness.
     */
    it('stateClassify0031', 0, () => {
      expect(classifyErrorCode(10000)).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(classifyErrorCode(10000))).assertEqual('操作失败');
      expect(probeStatusHint(classifyErrorCode(10000))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(10000))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0032
     * @tc.name stateClassify0032
     * @tc.desc Verify code 65535 maps to FAILED with name, hint and readiness.
     */
    it('stateClassify0032', 0, () => {
      expect(classifyErrorCode(65535)).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(classifyErrorCode(65535))).assertEqual('操作失败');
      expect(probeStatusHint(classifyErrorCode(65535))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(65535))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0033
     * @tc.name stateClassify0033
     * @tc.desc Verify code 2900000 maps to FAILED with name, hint and readiness.
     */
    it('stateClassify0033', 0, () => {
      expect(classifyErrorCode(2900000)).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(classifyErrorCode(2900000))).assertEqual('操作失败');
      expect(probeStatusHint(classifyErrorCode(2900000))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(2900000))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0034
     * @tc.name stateClassify0034
     * @tc.desc Verify code 2900002 maps to FAILED with name, hint and readiness.
     */
    it('stateClassify0034', 0, () => {
      expect(classifyErrorCode(2900002)).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(classifyErrorCode(2900002))).assertEqual('操作失败');
      expect(probeStatusHint(classifyErrorCode(2900002))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(2900002))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0035
     * @tc.name stateClassify0035
     * @tc.desc Verify code 2900005 maps to FAILED with name, hint and readiness.
     */
    it('stateClassify0035', 0, () => {
      expect(classifyErrorCode(2900005)).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(classifyErrorCode(2900005))).assertEqual('操作失败');
      expect(probeStatusHint(classifyErrorCode(2900005))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(2900005))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0036
     * @tc.name stateClassify0036
     * @tc.desc Verify code 2900098 maps to FAILED with name, hint and readiness.
     */
    it('stateClassify0036', 0, () => {
      expect(classifyErrorCode(2900098)).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(classifyErrorCode(2900098))).assertEqual('操作失败');
      expect(probeStatusHint(classifyErrorCode(2900098))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(2900098))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0037
     * @tc.name stateClassify0037
     * @tc.desc Verify code 2900100 maps to FAILED with name, hint and readiness.
     */
    it('stateClassify0037', 0, () => {
      expect(classifyErrorCode(2900100)).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(classifyErrorCode(2900100))).assertEqual('操作失败');
      expect(probeStatusHint(classifyErrorCode(2900100))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(2900100))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0038
     * @tc.name stateClassify0038
     * @tc.desc Verify code 3000000 maps to FAILED with name, hint and readiness.
     */
    it('stateClassify0038', 0, () => {
      expect(classifyErrorCode(3000000)).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(classifyErrorCode(3000000))).assertEqual('操作失败');
      expect(probeStatusHint(classifyErrorCode(3000000))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(3000000))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0039
     * @tc.name stateClassify0039
     * @tc.desc Verify code 1000000 maps to FAILED with name, hint and readiness.
     */
    it('stateClassify0039', 0, () => {
      expect(classifyErrorCode(1000000)).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(classifyErrorCode(1000000))).assertEqual('操作失败');
      expect(probeStatusHint(classifyErrorCode(1000000))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(1000000))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0040
     * @tc.name stateClassify0040
     * @tc.desc Verify code 2147483647 maps to FAILED with name, hint and readiness.
     */
    it('stateClassify0040', 0, () => {
      expect(classifyErrorCode(2147483647)).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(classifyErrorCode(2147483647))).assertEqual('操作失败');
      expect(probeStatusHint(classifyErrorCode(2147483647))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(2147483647))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_STATE_CLASSIFY_0041
     * @tc.name stateClassify0041
     * @tc.desc Verify code 4294967295 maps to FAILED with name, hint and readiness.
     */
    it('stateClassify0041', 0, () => {
      expect(classifyErrorCode(4294967295)).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(classifyErrorCode(4294967295))).assertEqual('操作失败');
      expect(probeStatusHint(classifyErrorCode(4294967295))).assertEqual('查看日志面板中的错误码与详细信息');
      expect(isReadyStatus(classifyErrorCode(4294967295))).assertEqual(false);
    });
  });
}
