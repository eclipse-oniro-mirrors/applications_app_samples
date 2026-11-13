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
 * 错误码的双视角矩阵。
 *
 * 同一个错误码要同时决定两件事：会话用它选探测状态，页面用它选提示文案。
 * 这一组用例对每个码分别断言「分类 + 谓词」与「文案 + 错误信息封装」，
 * 两个视角各自独立，避免只改文案或只改分类时被漏掉。
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
import {
  ErrorInfo,
  bluetoothErrorHint,
  errorInfo,
  formatError,
  isKnownBluetoothCode
} from '../../../main/ets/utils/ErrorUtil';

export default function bluetoothProfileCodeCrossTest() {
  describe('BluetoothProfileCodeCrossTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0001
     * @tc.name codeCross0001
     * @tc.desc Verify code 201 is classified as PERMISSION_DENIED and drives the readiness predicate.
     */
    it('codeCross0001', 0, () => {
      const status: ProbeStatus = classifyErrorCode(201);
      expect(status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(probeStatusName(status)).assertEqual('缺少权限');
      expect(probeStatusHint(status).length).assertEqual(47);
      expect(isReadyStatus(status)).assertEqual(false);
      expect(isKnownBluetoothCode(201)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0002
     * @tc.name codeCross0002
     * @tc.desc Verify code 201 maps to its documented hint text and keeps it inside ErrorInfo.
     */
    it('codeCross0002', 0, () => {
      const hint: string = bluetoothErrorHint(201);
      expect(hint).assertEqual('缺少 ohos.permission.ACCESS_BLUETOOTH 授权，请先申请权限再重试');
      expect(hint.length).assertEqual(48);
      const info: ErrorInfo = errorInfo(201, 'detail');
      expect(info.status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(info.hint).assertEqual(hint);
      expect(info.describe()).assertEqual('[201] detail');
      expect(formatError('探测', 201, 'detail')).assertEqual('探测失败（201）：detail');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0003
     * @tc.name codeCross0003
     * @tc.desc Verify code 401 is classified as FAILED and drives the readiness predicate.
     */
    it('codeCross0003', 0, () => {
      const status: ProbeStatus = classifyErrorCode(401);
      expect(status).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(status)).assertEqual('操作失败');
      expect(probeStatusHint(status).length).assertEqual(16);
      expect(isReadyStatus(status)).assertEqual(false);
      expect(isKnownBluetoothCode(401)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0004
     * @tc.name codeCross0004
     * @tc.desc Verify code 401 maps to its documented hint text and keeps it inside ErrorInfo.
     */
    it('codeCross0004', 0, () => {
      const hint: string = bluetoothErrorHint(401);
      expect(hint).assertEqual('入参无效，请检查 deviceId 是否为 AA:BB:CC:DD:EE:FF 形式');
      expect(hint.length).assertEqual(42);
      const info: ErrorInfo = errorInfo(401, 'detail');
      expect(info.status).assertEqual(ProbeStatus.FAILED);
      expect(info.hint).assertEqual(hint);
      expect(info.describe()).assertEqual('[401] detail');
      expect(formatError('探测', 401, 'detail')).assertEqual('探测失败（401）：detail');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0005
     * @tc.name codeCross0005
     * @tc.desc Verify code 801 is classified as CAPABILITY_UNSUPPORTED and drives the readiness predicate.
     */
    it('codeCross0005', 0, () => {
      const status: ProbeStatus = classifyErrorCode(801);
      expect(status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(probeStatusName(status)).assertEqual('设备不支持');
      expect(probeStatusHint(status).length).assertEqual(43);
      expect(isReadyStatus(status)).assertEqual(false);
      expect(isKnownBluetoothCode(801)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0006
     * @tc.name codeCross0006
     * @tc.desc Verify code 801 maps to its documented hint text and keeps it inside ErrorInfo.
     */
    it('codeCross0006', 0, () => {
      const hint: string = bluetoothErrorHint(801);
      expect(hint).assertEqual('当前设备未支持该 Profile 能力（常见于模拟器或精简镜像），需换用支持该能力的设备');
      expect(hint.length).assertEqual(44);
      const info: ErrorInfo = errorInfo(801, 'detail');
      expect(info.status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(info.hint).assertEqual(hint);
      expect(info.describe()).assertEqual('[801] detail');
      expect(formatError('探测', 801, 'detail')).assertEqual('探测失败（801）：detail');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0007
     * @tc.name codeCross0007
     * @tc.desc Verify code 2900001 is classified as SERVICE_STOPPED and drives the readiness predicate.
     */
    it('codeCross0007', 0, () => {
      const status: ProbeStatus = classifyErrorCode(2900001);
      expect(status).assertEqual(ProbeStatus.SERVICE_STOPPED);
      expect(probeStatusName(status)).assertEqual('蓝牙服务已停止');
      expect(probeStatusHint(status).length).assertEqual(20);
      expect(isReadyStatus(status)).assertEqual(false);
      expect(isKnownBluetoothCode(2900001)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0008
     * @tc.name codeCross0008
     * @tc.desc Verify code 2900001 maps to its documented hint text and keeps it inside ErrorInfo.
     */
    it('codeCross0008', 0, () => {
      const hint: string = bluetoothErrorHint(2900001);
      expect(hint).assertEqual('蓝牙服务已停止，可关闭蓝牙再重新打开后重试');
      expect(hint.length).assertEqual(21);
      const info: ErrorInfo = errorInfo(2900001, 'detail');
      expect(info.status).assertEqual(ProbeStatus.SERVICE_STOPPED);
      expect(info.hint).assertEqual(hint);
      expect(info.describe()).assertEqual('[2900001] detail');
      expect(formatError('探测', 2900001, 'detail')).assertEqual('探测失败（2900001）：detail');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0009
     * @tc.name codeCross0009
     * @tc.desc Verify code 2900003 is classified as BLUETOOTH_DISABLED and drives the readiness predicate.
     */
    it('codeCross0009', 0, () => {
      const status: ProbeStatus = classifyErrorCode(2900003);
      expect(status).assertEqual(ProbeStatus.BLUETOOTH_DISABLED);
      expect(probeStatusName(status)).assertEqual('蓝牙未开启');
      expect(probeStatusHint(status).length).assertEqual(16);
      expect(isReadyStatus(status)).assertEqual(false);
      expect(isKnownBluetoothCode(2900003)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0010
     * @tc.name codeCross0010
     * @tc.desc Verify code 2900003 maps to its documented hint text and keeps it inside ErrorInfo.
     */
    it('codeCross0010', 0, () => {
      const hint: string = bluetoothErrorHint(2900003);
      expect(hint).assertEqual('蓝牙未开启，请先打开系统蓝牙开关');
      expect(hint.length).assertEqual(16);
      const info: ErrorInfo = errorInfo(2900003, 'detail');
      expect(info.status).assertEqual(ProbeStatus.BLUETOOTH_DISABLED);
      expect(info.hint).assertEqual(hint);
      expect(info.describe()).assertEqual('[2900003] detail');
      expect(formatError('探测', 2900003, 'detail')).assertEqual('探测失败（2900003）：detail');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0011
     * @tc.name codeCross0011
     * @tc.desc Verify code 2900004 is classified as PROFILE_UNSUPPORTED and drives the readiness predicate.
     */
    it('codeCross0011', 0, () => {
      const status: ProbeStatus = classifyErrorCode(2900004);
      expect(status).assertEqual(ProbeStatus.PROFILE_UNSUPPORTED);
      expect(probeStatusName(status)).assertEqual('Profile 不支持');
      expect(probeStatusHint(status).length).assertEqual(25);
      expect(isReadyStatus(status)).assertEqual(false);
      expect(isKnownBluetoothCode(2900004)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0012
     * @tc.name codeCross0012
     * @tc.desc Verify code 2900004 maps to its documented hint text and keeps it inside ErrorInfo.
     */
    it('codeCross0012', 0, () => {
      const hint: string = bluetoothErrorHint(2900004);
      expect(hint).assertEqual('系统未编译该 Profile，属于设备能力缺失，请更换设备镜像');
      expect(hint.length).assertEqual(31);
      const info: ErrorInfo = errorInfo(2900004, 'detail');
      expect(info.status).assertEqual(ProbeStatus.PROFILE_UNSUPPORTED);
      expect(info.hint).assertEqual(hint);
      expect(info.describe()).assertEqual('[2900004] detail');
      expect(formatError('探测', 2900004, 'detail')).assertEqual('探测失败（2900004）：detail');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0013
     * @tc.name codeCross0013
     * @tc.desc Verify code 2900099 is classified as FAILED and drives the readiness predicate.
     */
    it('codeCross0013', 0, () => {
      const status: ProbeStatus = classifyErrorCode(2900099);
      expect(status).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(status)).assertEqual('操作失败');
      expect(probeStatusHint(status).length).assertEqual(16);
      expect(isReadyStatus(status)).assertEqual(false);
      expect(isKnownBluetoothCode(2900099)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0014
     * @tc.name codeCross0014
     * @tc.desc Verify code 2900099 maps to its documented hint text and keeps it inside ErrorInfo.
     */
    it('codeCross0014', 0, () => {
      const hint: string = bluetoothErrorHint(2900099);
      expect(hint).assertEqual('蓝牙服务内部操作失败，可稍后重试或查看 hilog');
      expect(hint.length).assertEqual(25);
      const info: ErrorInfo = errorInfo(2900099, 'detail');
      expect(info.status).assertEqual(ProbeStatus.FAILED);
      expect(info.hint).assertEqual(hint);
      expect(info.describe()).assertEqual('[2900099] detail');
      expect(formatError('探测', 2900099, 'detail')).assertEqual('探测失败（2900099）：detail');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0015
     * @tc.name codeCross0015
     * @tc.desc Verify code 0 is classified as IDLE and drives the readiness predicate.
     */
    it('codeCross0015', 0, () => {
      const status: ProbeStatus = classifyErrorCode(0);
      expect(status).assertEqual(ProbeStatus.IDLE);
      expect(probeStatusName(status)).assertEqual('未探测');
      expect(probeStatusHint(status).length).assertEqual(16);
      expect(isReadyStatus(status)).assertEqual(false);
      expect(isKnownBluetoothCode(0)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0016
     * @tc.name codeCross0016
     * @tc.desc Verify code 0 maps to its documented hint text and keeps it inside ErrorInfo.
     */
    it('codeCross0016', 0, () => {
      const hint: string = bluetoothErrorHint(0);
      expect(hint).assertEqual('操作已正常完成');
      expect(hint.length).assertEqual(7);
      const info: ErrorInfo = errorInfo(0, 'detail');
      expect(info.status).assertEqual(ProbeStatus.IDLE);
      expect(info.hint).assertEqual(hint);
      expect(info.describe()).assertEqual('detail');
      expect(formatError('探测', 0, 'detail')).assertEqual('探测失败：detail');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0017
     * @tc.name codeCross0017
     * @tc.desc Verify code -1 is classified as IDLE and drives the readiness predicate.
     */
    it('codeCross0017', 0, () => {
      const status: ProbeStatus = classifyErrorCode(-1);
      expect(status).assertEqual(ProbeStatus.IDLE);
      expect(probeStatusName(status)).assertEqual('未探测');
      expect(probeStatusHint(status).length).assertEqual(16);
      expect(isReadyStatus(status)).assertEqual(false);
      expect(isKnownBluetoothCode(-1)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0018
     * @tc.name codeCross0018
     * @tc.desc Verify code -1 maps to its documented hint text and keeps it inside ErrorInfo.
     */
    it('codeCross0018', 0, () => {
      const hint: string = bluetoothErrorHint(-1);
      expect(hint).assertEqual('操作已正常完成');
      expect(hint.length).assertEqual(7);
      const info: ErrorInfo = errorInfo(-1, 'detail');
      expect(info.status).assertEqual(ProbeStatus.IDLE);
      expect(info.hint).assertEqual(hint);
      expect(info.describe()).assertEqual('detail');
      expect(formatError('探测', -1, 'detail')).assertEqual('探测失败：detail');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0019
     * @tc.name codeCross0019
     * @tc.desc Verify code -7 is classified as IDLE and drives the readiness predicate.
     */
    it('codeCross0019', 0, () => {
      const status: ProbeStatus = classifyErrorCode(-7);
      expect(status).assertEqual(ProbeStatus.IDLE);
      expect(probeStatusName(status)).assertEqual('未探测');
      expect(probeStatusHint(status).length).assertEqual(16);
      expect(isReadyStatus(status)).assertEqual(false);
      expect(isKnownBluetoothCode(-7)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0020
     * @tc.name codeCross0020
     * @tc.desc Verify code -7 maps to its documented hint text and keeps it inside ErrorInfo.
     */
    it('codeCross0020', 0, () => {
      const hint: string = bluetoothErrorHint(-7);
      expect(hint).assertEqual('操作已正常完成');
      expect(hint.length).assertEqual(7);
      const info: ErrorInfo = errorInfo(-7, 'detail');
      expect(info.status).assertEqual(ProbeStatus.IDLE);
      expect(info.hint).assertEqual(hint);
      expect(info.describe()).assertEqual('detail');
      expect(formatError('探测', -7, 'detail')).assertEqual('探测失败：detail');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0021
     * @tc.name codeCross0021
     * @tc.desc Verify code 1 is classified as FAILED and drives the readiness predicate.
     */
    it('codeCross0021', 0, () => {
      const status: ProbeStatus = classifyErrorCode(1);
      expect(status).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(status)).assertEqual('操作失败');
      expect(probeStatusHint(status).length).assertEqual(16);
      expect(isReadyStatus(status)).assertEqual(false);
      expect(isKnownBluetoothCode(1)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0022
     * @tc.name codeCross0022
     * @tc.desc Verify code 1 maps to its documented hint text and keeps it inside ErrorInfo.
     */
    it('codeCross0022', 0, () => {
      const hint: string = bluetoothErrorHint(1);
      expect(hint).assertEqual('查看日志面板中的错误码与详细信息');
      expect(hint.length).assertEqual(16);
      const info: ErrorInfo = errorInfo(1, 'detail');
      expect(info.status).assertEqual(ProbeStatus.FAILED);
      expect(info.hint).assertEqual(hint);
      expect(info.describe()).assertEqual('[1] detail');
      expect(formatError('探测', 1, 'detail')).assertEqual('探测失败（1）：detail');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0023
     * @tc.name codeCross0023
     * @tc.desc Verify code 2 is classified as FAILED and drives the readiness predicate.
     */
    it('codeCross0023', 0, () => {
      const status: ProbeStatus = classifyErrorCode(2);
      expect(status).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(status)).assertEqual('操作失败');
      expect(probeStatusHint(status).length).assertEqual(16);
      expect(isReadyStatus(status)).assertEqual(false);
      expect(isKnownBluetoothCode(2)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0024
     * @tc.name codeCross0024
     * @tc.desc Verify code 2 maps to its documented hint text and keeps it inside ErrorInfo.
     */
    it('codeCross0024', 0, () => {
      const hint: string = bluetoothErrorHint(2);
      expect(hint).assertEqual('查看日志面板中的错误码与详细信息');
      expect(hint.length).assertEqual(16);
      const info: ErrorInfo = errorInfo(2, 'detail');
      expect(info.status).assertEqual(ProbeStatus.FAILED);
      expect(info.hint).assertEqual(hint);
      expect(info.describe()).assertEqual('[2] detail');
      expect(formatError('探测', 2, 'detail')).assertEqual('探测失败（2）：detail');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0025
     * @tc.name codeCross0025
     * @tc.desc Verify code 100 is classified as FAILED and drives the readiness predicate.
     */
    it('codeCross0025', 0, () => {
      const status: ProbeStatus = classifyErrorCode(100);
      expect(status).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(status)).assertEqual('操作失败');
      expect(probeStatusHint(status).length).assertEqual(16);
      expect(isReadyStatus(status)).assertEqual(false);
      expect(isKnownBluetoothCode(100)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0026
     * @tc.name codeCross0026
     * @tc.desc Verify code 100 maps to its documented hint text and keeps it inside ErrorInfo.
     */
    it('codeCross0026', 0, () => {
      const hint: string = bluetoothErrorHint(100);
      expect(hint).assertEqual('查看日志面板中的错误码与详细信息');
      expect(hint.length).assertEqual(16);
      const info: ErrorInfo = errorInfo(100, 'detail');
      expect(info.status).assertEqual(ProbeStatus.FAILED);
      expect(info.hint).assertEqual(hint);
      expect(info.describe()).assertEqual('[100] detail');
      expect(formatError('探测', 100, 'detail')).assertEqual('探测失败（100）：detail');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0027
     * @tc.name codeCross0027
     * @tc.desc Verify code 200 is classified as FAILED and drives the readiness predicate.
     */
    it('codeCross0027', 0, () => {
      const status: ProbeStatus = classifyErrorCode(200);
      expect(status).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(status)).assertEqual('操作失败');
      expect(probeStatusHint(status).length).assertEqual(16);
      expect(isReadyStatus(status)).assertEqual(false);
      expect(isKnownBluetoothCode(200)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0028
     * @tc.name codeCross0028
     * @tc.desc Verify code 200 maps to its documented hint text and keeps it inside ErrorInfo.
     */
    it('codeCross0028', 0, () => {
      const hint: string = bluetoothErrorHint(200);
      expect(hint).assertEqual('查看日志面板中的错误码与详细信息');
      expect(hint.length).assertEqual(16);
      const info: ErrorInfo = errorInfo(200, 'detail');
      expect(info.status).assertEqual(ProbeStatus.FAILED);
      expect(info.hint).assertEqual(hint);
      expect(info.describe()).assertEqual('[200] detail');
      expect(formatError('探测', 200, 'detail')).assertEqual('探测失败（200）：detail');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0029
     * @tc.name codeCross0029
     * @tc.desc Verify code 202 is classified as FAILED and drives the readiness predicate.
     */
    it('codeCross0029', 0, () => {
      const status: ProbeStatus = classifyErrorCode(202);
      expect(status).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(status)).assertEqual('操作失败');
      expect(probeStatusHint(status).length).assertEqual(16);
      expect(isReadyStatus(status)).assertEqual(false);
      expect(isKnownBluetoothCode(202)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0030
     * @tc.name codeCross0030
     * @tc.desc Verify code 202 maps to its documented hint text and keeps it inside ErrorInfo.
     */
    it('codeCross0030', 0, () => {
      const hint: string = bluetoothErrorHint(202);
      expect(hint).assertEqual('查看日志面板中的错误码与详细信息');
      expect(hint.length).assertEqual(16);
      const info: ErrorInfo = errorInfo(202, 'detail');
      expect(info.status).assertEqual(ProbeStatus.FAILED);
      expect(info.hint).assertEqual(hint);
      expect(info.describe()).assertEqual('[202] detail');
      expect(formatError('探测', 202, 'detail')).assertEqual('探测失败（202）：detail');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0031
     * @tc.name codeCross0031
     * @tc.desc Verify code 400 is classified as FAILED and drives the readiness predicate.
     */
    it('codeCross0031', 0, () => {
      const status: ProbeStatus = classifyErrorCode(400);
      expect(status).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(status)).assertEqual('操作失败');
      expect(probeStatusHint(status).length).assertEqual(16);
      expect(isReadyStatus(status)).assertEqual(false);
      expect(isKnownBluetoothCode(400)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0032
     * @tc.name codeCross0032
     * @tc.desc Verify code 400 maps to its documented hint text and keeps it inside ErrorInfo.
     */
    it('codeCross0032', 0, () => {
      const hint: string = bluetoothErrorHint(400);
      expect(hint).assertEqual('查看日志面板中的错误码与详细信息');
      expect(hint.length).assertEqual(16);
      const info: ErrorInfo = errorInfo(400, 'detail');
      expect(info.status).assertEqual(ProbeStatus.FAILED);
      expect(info.hint).assertEqual(hint);
      expect(info.describe()).assertEqual('[400] detail');
      expect(formatError('探测', 400, 'detail')).assertEqual('探测失败（400）：detail');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0033
     * @tc.name codeCross0033
     * @tc.desc Verify code 402 is classified as FAILED and drives the readiness predicate.
     */
    it('codeCross0033', 0, () => {
      const status: ProbeStatus = classifyErrorCode(402);
      expect(status).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(status)).assertEqual('操作失败');
      expect(probeStatusHint(status).length).assertEqual(16);
      expect(isReadyStatus(status)).assertEqual(false);
      expect(isKnownBluetoothCode(402)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0034
     * @tc.name codeCross0034
     * @tc.desc Verify code 402 maps to its documented hint text and keeps it inside ErrorInfo.
     */
    it('codeCross0034', 0, () => {
      const hint: string = bluetoothErrorHint(402);
      expect(hint).assertEqual('查看日志面板中的错误码与详细信息');
      expect(hint.length).assertEqual(16);
      const info: ErrorInfo = errorInfo(402, 'detail');
      expect(info.status).assertEqual(ProbeStatus.FAILED);
      expect(info.hint).assertEqual(hint);
      expect(info.describe()).assertEqual('[402] detail');
      expect(formatError('探测', 402, 'detail')).assertEqual('探测失败（402）：detail');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0035
     * @tc.name codeCross0035
     * @tc.desc Verify code 500 is classified as FAILED and drives the readiness predicate.
     */
    it('codeCross0035', 0, () => {
      const status: ProbeStatus = classifyErrorCode(500);
      expect(status).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(status)).assertEqual('操作失败');
      expect(probeStatusHint(status).length).assertEqual(16);
      expect(isReadyStatus(status)).assertEqual(false);
      expect(isKnownBluetoothCode(500)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0036
     * @tc.name codeCross0036
     * @tc.desc Verify code 500 maps to its documented hint text and keeps it inside ErrorInfo.
     */
    it('codeCross0036', 0, () => {
      const hint: string = bluetoothErrorHint(500);
      expect(hint).assertEqual('查看日志面板中的错误码与详细信息');
      expect(hint.length).assertEqual(16);
      const info: ErrorInfo = errorInfo(500, 'detail');
      expect(info.status).assertEqual(ProbeStatus.FAILED);
      expect(info.hint).assertEqual(hint);
      expect(info.describe()).assertEqual('[500] detail');
      expect(formatError('探测', 500, 'detail')).assertEqual('探测失败（500）：detail');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0037
     * @tc.name codeCross0037
     * @tc.desc Verify code 800 is classified as FAILED and drives the readiness predicate.
     */
    it('codeCross0037', 0, () => {
      const status: ProbeStatus = classifyErrorCode(800);
      expect(status).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(status)).assertEqual('操作失败');
      expect(probeStatusHint(status).length).assertEqual(16);
      expect(isReadyStatus(status)).assertEqual(false);
      expect(isKnownBluetoothCode(800)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0038
     * @tc.name codeCross0038
     * @tc.desc Verify code 800 maps to its documented hint text and keeps it inside ErrorInfo.
     */
    it('codeCross0038', 0, () => {
      const hint: string = bluetoothErrorHint(800);
      expect(hint).assertEqual('查看日志面板中的错误码与详细信息');
      expect(hint.length).assertEqual(16);
      const info: ErrorInfo = errorInfo(800, 'detail');
      expect(info.status).assertEqual(ProbeStatus.FAILED);
      expect(info.hint).assertEqual(hint);
      expect(info.describe()).assertEqual('[800] detail');
      expect(formatError('探测', 800, 'detail')).assertEqual('探测失败（800）：detail');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0039
     * @tc.name codeCross0039
     * @tc.desc Verify code 802 is classified as FAILED and drives the readiness predicate.
     */
    it('codeCross0039', 0, () => {
      const status: ProbeStatus = classifyErrorCode(802);
      expect(status).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(status)).assertEqual('操作失败');
      expect(probeStatusHint(status).length).assertEqual(16);
      expect(isReadyStatus(status)).assertEqual(false);
      expect(isKnownBluetoothCode(802)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0040
     * @tc.name codeCross0040
     * @tc.desc Verify code 802 maps to its documented hint text and keeps it inside ErrorInfo.
     */
    it('codeCross0040', 0, () => {
      const hint: string = bluetoothErrorHint(802);
      expect(hint).assertEqual('查看日志面板中的错误码与详细信息');
      expect(hint.length).assertEqual(16);
      const info: ErrorInfo = errorInfo(802, 'detail');
      expect(info.status).assertEqual(ProbeStatus.FAILED);
      expect(info.hint).assertEqual(hint);
      expect(info.describe()).assertEqual('[802] detail');
      expect(formatError('探测', 802, 'detail')).assertEqual('探测失败（802）：detail');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0041
     * @tc.name codeCross0041
     * @tc.desc Verify code 2900000 is classified as FAILED and drives the readiness predicate.
     */
    it('codeCross0041', 0, () => {
      const status: ProbeStatus = classifyErrorCode(2900000);
      expect(status).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(status)).assertEqual('操作失败');
      expect(probeStatusHint(status).length).assertEqual(16);
      expect(isReadyStatus(status)).assertEqual(false);
      expect(isKnownBluetoothCode(2900000)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0042
     * @tc.name codeCross0042
     * @tc.desc Verify code 2900000 maps to its documented hint text and keeps it inside ErrorInfo.
     */
    it('codeCross0042', 0, () => {
      const hint: string = bluetoothErrorHint(2900000);
      expect(hint).assertEqual('查看日志面板中的错误码与详细信息');
      expect(hint.length).assertEqual(16);
      const info: ErrorInfo = errorInfo(2900000, 'detail');
      expect(info.status).assertEqual(ProbeStatus.FAILED);
      expect(info.hint).assertEqual(hint);
      expect(info.describe()).assertEqual('[2900000] detail');
      expect(formatError('探测', 2900000, 'detail')).assertEqual('探测失败（2900000）：detail');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0043
     * @tc.name codeCross0043
     * @tc.desc Verify code 2900002 is classified as FAILED and drives the readiness predicate.
     */
    it('codeCross0043', 0, () => {
      const status: ProbeStatus = classifyErrorCode(2900002);
      expect(status).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(status)).assertEqual('操作失败');
      expect(probeStatusHint(status).length).assertEqual(16);
      expect(isReadyStatus(status)).assertEqual(false);
      expect(isKnownBluetoothCode(2900002)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0044
     * @tc.name codeCross0044
     * @tc.desc Verify code 2900002 maps to its documented hint text and keeps it inside ErrorInfo.
     */
    it('codeCross0044', 0, () => {
      const hint: string = bluetoothErrorHint(2900002);
      expect(hint).assertEqual('查看日志面板中的错误码与详细信息');
      expect(hint.length).assertEqual(16);
      const info: ErrorInfo = errorInfo(2900002, 'detail');
      expect(info.status).assertEqual(ProbeStatus.FAILED);
      expect(info.hint).assertEqual(hint);
      expect(info.describe()).assertEqual('[2900002] detail');
      expect(formatError('探测', 2900002, 'detail')).assertEqual('探测失败（2900002）：detail');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0045
     * @tc.name codeCross0045
     * @tc.desc Verify code 2900005 is classified as FAILED and drives the readiness predicate.
     */
    it('codeCross0045', 0, () => {
      const status: ProbeStatus = classifyErrorCode(2900005);
      expect(status).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(status)).assertEqual('操作失败');
      expect(probeStatusHint(status).length).assertEqual(16);
      expect(isReadyStatus(status)).assertEqual(false);
      expect(isKnownBluetoothCode(2900005)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0046
     * @tc.name codeCross0046
     * @tc.desc Verify code 2900005 maps to its documented hint text and keeps it inside ErrorInfo.
     */
    it('codeCross0046', 0, () => {
      const hint: string = bluetoothErrorHint(2900005);
      expect(hint).assertEqual('查看日志面板中的错误码与详细信息');
      expect(hint.length).assertEqual(16);
      const info: ErrorInfo = errorInfo(2900005, 'detail');
      expect(info.status).assertEqual(ProbeStatus.FAILED);
      expect(info.hint).assertEqual(hint);
      expect(info.describe()).assertEqual('[2900005] detail');
      expect(formatError('探测', 2900005, 'detail')).assertEqual('探测失败（2900005）：detail');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0047
     * @tc.name codeCross0047
     * @tc.desc Verify code 2900098 is classified as FAILED and drives the readiness predicate.
     */
    it('codeCross0047', 0, () => {
      const status: ProbeStatus = classifyErrorCode(2900098);
      expect(status).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(status)).assertEqual('操作失败');
      expect(probeStatusHint(status).length).assertEqual(16);
      expect(isReadyStatus(status)).assertEqual(false);
      expect(isKnownBluetoothCode(2900098)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0048
     * @tc.name codeCross0048
     * @tc.desc Verify code 2900098 maps to its documented hint text and keeps it inside ErrorInfo.
     */
    it('codeCross0048', 0, () => {
      const hint: string = bluetoothErrorHint(2900098);
      expect(hint).assertEqual('查看日志面板中的错误码与详细信息');
      expect(hint.length).assertEqual(16);
      const info: ErrorInfo = errorInfo(2900098, 'detail');
      expect(info.status).assertEqual(ProbeStatus.FAILED);
      expect(info.hint).assertEqual(hint);
      expect(info.describe()).assertEqual('[2900098] detail');
      expect(formatError('探测', 2900098, 'detail')).assertEqual('探测失败（2900098）：detail');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0049
     * @tc.name codeCross0049
     * @tc.desc Verify code 2900100 is classified as FAILED and drives the readiness predicate.
     */
    it('codeCross0049', 0, () => {
      const status: ProbeStatus = classifyErrorCode(2900100);
      expect(status).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(status)).assertEqual('操作失败');
      expect(probeStatusHint(status).length).assertEqual(16);
      expect(isReadyStatus(status)).assertEqual(false);
      expect(isKnownBluetoothCode(2900100)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0050
     * @tc.name codeCross0050
     * @tc.desc Verify code 2900100 maps to its documented hint text and keeps it inside ErrorInfo.
     */
    it('codeCross0050', 0, () => {
      const hint: string = bluetoothErrorHint(2900100);
      expect(hint).assertEqual('查看日志面板中的错误码与详细信息');
      expect(hint.length).assertEqual(16);
      const info: ErrorInfo = errorInfo(2900100, 'detail');
      expect(info.status).assertEqual(ProbeStatus.FAILED);
      expect(info.hint).assertEqual(hint);
      expect(info.describe()).assertEqual('[2900100] detail');
      expect(formatError('探测', 2900100, 'detail')).assertEqual('探测失败（2900100）：detail');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0051
     * @tc.name codeCross0051
     * @tc.desc Verify code 16000001 is classified as FAILED and drives the readiness predicate.
     */
    it('codeCross0051', 0, () => {
      const status: ProbeStatus = classifyErrorCode(16000001);
      expect(status).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(status)).assertEqual('操作失败');
      expect(probeStatusHint(status).length).assertEqual(16);
      expect(isReadyStatus(status)).assertEqual(false);
      expect(isKnownBluetoothCode(16000001)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CODE_CROSS_0052
     * @tc.name codeCross0052
     * @tc.desc Verify code 16000001 maps to its documented hint text and keeps it inside ErrorInfo.
     */
    it('codeCross0052', 0, () => {
      const hint: string = bluetoothErrorHint(16000001);
      expect(hint).assertEqual('查看日志面板中的错误码与详细信息');
      expect(hint.length).assertEqual(16);
      const info: ErrorInfo = errorInfo(16000001, 'detail');
      expect(info.status).assertEqual(ProbeStatus.FAILED);
      expect(info.hint).assertEqual(hint);
      expect(info.describe()).assertEqual('[16000001] detail');
      expect(formatError('探测', 16000001, 'detail')).assertEqual('探测失败（16000001）：detail');
    });
  });
}
