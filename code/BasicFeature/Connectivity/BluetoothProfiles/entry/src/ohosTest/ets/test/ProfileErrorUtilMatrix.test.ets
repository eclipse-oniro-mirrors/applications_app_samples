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
 * 蓝牙错误码封装的矩阵。
 *
 * 文档登记的七个错误码逐个锁定提示文案，未登记的错误码验证回退策略；
 * codeOfThrown 额外覆盖「异常对象只有 message」这条真实分支，
 * 因为系统接口在部分场景下抛出的对象没有数值型 code。
 */

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import {
  ErrorInfo,
  bluetoothErrorHint,
  codeOfThrown,
  describeThrown,
  errorInfo,
  formatError,
  isKnownBluetoothCode,
  messageOfThrown
} from '../../../main/ets/utils/ErrorUtil';
import { ProbeStatus, classifyErrorCode } from '../../../main/ets/model/ProfileState';
import { StubError } from './support/ProfileStub';

export default function bluetoothProfileErrorUtilMatrixTest() {
  describe('BluetoothProfileErrorUtilMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0001
     * @tc.name errorMatrix0001
     * @tc.desc Verify bluetoothErrorHint for code 201 returns the documented hint text.
     */
    it('errorMatrix0001', 0, () => {
      expect(bluetoothErrorHint(201)).assertEqual('缺少 ohos.permission.ACCESS_BLUETOOTH 授权，请先申请权限再重试');
      expect(bluetoothErrorHint(201).length).assertEqual(48);
      expect(isKnownBluetoothCode(201)).assertTrue();
      expect(classifyErrorCode(201)).assertEqual(ProbeStatus.PERMISSION_DENIED);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0002
     * @tc.name errorMatrix0002
     * @tc.desc Verify bluetoothErrorHint for code 401 returns the documented hint text.
     */
    it('errorMatrix0002', 0, () => {
      expect(bluetoothErrorHint(401)).assertEqual('入参无效，请检查 deviceId 是否为 AA:BB:CC:DD:EE:FF 形式');
      expect(bluetoothErrorHint(401).length).assertEqual(42);
      expect(isKnownBluetoothCode(401)).assertTrue();
      expect(classifyErrorCode(401)).assertEqual(ProbeStatus.FAILED);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0003
     * @tc.name errorMatrix0003
     * @tc.desc Verify bluetoothErrorHint for code 801 returns the documented hint text.
     */
    it('errorMatrix0003', 0, () => {
      expect(bluetoothErrorHint(801)).assertEqual('当前设备未支持该 Profile 能力（常见于模拟器或精简镜像），需换用支持该能力的设备');
      expect(bluetoothErrorHint(801).length).assertEqual(44);
      expect(isKnownBluetoothCode(801)).assertTrue();
      expect(classifyErrorCode(801)).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0004
     * @tc.name errorMatrix0004
     * @tc.desc Verify bluetoothErrorHint for code 2900001 returns the documented hint text.
     */
    it('errorMatrix0004', 0, () => {
      expect(bluetoothErrorHint(2900001)).assertEqual('蓝牙服务已停止，可关闭蓝牙再重新打开后重试');
      expect(bluetoothErrorHint(2900001).length).assertEqual(21);
      expect(isKnownBluetoothCode(2900001)).assertTrue();
      expect(classifyErrorCode(2900001)).assertEqual(ProbeStatus.SERVICE_STOPPED);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0005
     * @tc.name errorMatrix0005
     * @tc.desc Verify bluetoothErrorHint for code 2900003 returns the documented hint text.
     */
    it('errorMatrix0005', 0, () => {
      expect(bluetoothErrorHint(2900003)).assertEqual('蓝牙未开启，请先打开系统蓝牙开关');
      expect(bluetoothErrorHint(2900003).length).assertEqual(16);
      expect(isKnownBluetoothCode(2900003)).assertTrue();
      expect(classifyErrorCode(2900003)).assertEqual(ProbeStatus.BLUETOOTH_DISABLED);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0006
     * @tc.name errorMatrix0006
     * @tc.desc Verify bluetoothErrorHint for code 2900004 returns the documented hint text.
     */
    it('errorMatrix0006', 0, () => {
      expect(bluetoothErrorHint(2900004)).assertEqual('系统未编译该 Profile，属于设备能力缺失，请更换设备镜像');
      expect(bluetoothErrorHint(2900004).length).assertEqual(31);
      expect(isKnownBluetoothCode(2900004)).assertTrue();
      expect(classifyErrorCode(2900004)).assertEqual(ProbeStatus.PROFILE_UNSUPPORTED);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0007
     * @tc.name errorMatrix0007
     * @tc.desc Verify bluetoothErrorHint for code 2900099 returns the documented hint text.
     */
    it('errorMatrix0007', 0, () => {
      expect(bluetoothErrorHint(2900099)).assertEqual('蓝牙服务内部操作失败，可稍后重试或查看 hilog');
      expect(bluetoothErrorHint(2900099).length).assertEqual(25);
      expect(isKnownBluetoothCode(2900099)).assertTrue();
      expect(classifyErrorCode(2900099)).assertEqual(ProbeStatus.FAILED);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0008
     * @tc.name errorMatrix0008
     * @tc.desc Verify bluetoothErrorHint for the undocumented code 0 falls back safely.
     */
    it('errorMatrix0008', 0, () => {
      expect(isKnownBluetoothCode(0)).assertFalse();
      expect(bluetoothErrorHint(0).length > 0).assertTrue();
      expect(bluetoothErrorHint(0) === '').assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0009
     * @tc.name errorMatrix0009
     * @tc.desc Verify bluetoothErrorHint for the undocumented code -1 falls back safely.
     */
    it('errorMatrix0009', 0, () => {
      expect(isKnownBluetoothCode(-1)).assertFalse();
      expect(bluetoothErrorHint(-1).length > 0).assertTrue();
      expect(bluetoothErrorHint(-1) === '').assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0010
     * @tc.name errorMatrix0010
     * @tc.desc Verify bluetoothErrorHint for the undocumented code 1 falls back safely.
     */
    it('errorMatrix0010', 0, () => {
      expect(isKnownBluetoothCode(1)).assertFalse();
      expect(bluetoothErrorHint(1).length > 0).assertTrue();
      expect(bluetoothErrorHint(1) === '').assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0011
     * @tc.name errorMatrix0011
     * @tc.desc Verify bluetoothErrorHint for the undocumented code 100 falls back safely.
     */
    it('errorMatrix0011', 0, () => {
      expect(isKnownBluetoothCode(100)).assertFalse();
      expect(bluetoothErrorHint(100).length > 0).assertTrue();
      expect(bluetoothErrorHint(100) === '').assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0012
     * @tc.name errorMatrix0012
     * @tc.desc Verify bluetoothErrorHint for the undocumented code 500 falls back safely.
     */
    it('errorMatrix0012', 0, () => {
      expect(isKnownBluetoothCode(500)).assertFalse();
      expect(bluetoothErrorHint(500).length > 0).assertTrue();
      expect(bluetoothErrorHint(500) === '').assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0013
     * @tc.name errorMatrix0013
     * @tc.desc Verify bluetoothErrorHint for the undocumented code 802 falls back safely.
     */
    it('errorMatrix0013', 0, () => {
      expect(isKnownBluetoothCode(802)).assertFalse();
      expect(bluetoothErrorHint(802).length > 0).assertTrue();
      expect(bluetoothErrorHint(802) === '').assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0014
     * @tc.name errorMatrix0014
     * @tc.desc Verify bluetoothErrorHint for the undocumented code 2900100 falls back safely.
     */
    it('errorMatrix0014', 0, () => {
      expect(isKnownBluetoothCode(2900100)).assertFalse();
      expect(bluetoothErrorHint(2900100).length > 0).assertTrue();
      expect(bluetoothErrorHint(2900100) === '').assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0015
     * @tc.name errorMatrix0015
     * @tc.desc Verify a zero error code reports a successful operation instead of a failure hint.
     */
    it('errorMatrix0015', 0, () => {
      expect(bluetoothErrorHint(0)).assertEqual('操作已正常完成');
      expect(isKnownBluetoothCode(0)).assertFalse();
      expect(classifyErrorCode(0)).assertEqual(ProbeStatus.IDLE);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0016
     * @tc.name errorMatrix0016
     * @tc.desc Verify a negative error code is treated as no failure and never becomes FAILED.
     */
    it('errorMatrix0016', 0, () => {
      expect(classifyErrorCode(-7)).assertEqual(ProbeStatus.IDLE);
      expect(bluetoothErrorHint(-7)).assertEqual('操作已正常完成');
      expect(isKnownBluetoothCode(-7)).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0017
     * @tc.name errorMatrix0017
     * @tc.desc Verify formatError keeps the numeric code inside the parentheses when it is positive.
     */
    it('errorMatrix0017', 0, () => {
      expect(formatError('创建实例', 801, 'not supported')).assertEqual('创建实例失败（801）：not supported');
      expect(formatError('创建实例', 801, '').indexOf('未知错误') >= 0).assertTrue();
      expect(formatError('创建实例', 0, 'done')).assertEqual('创建实例失败：done');
      expect(formatError('创建实例', 0, 'done').indexOf('（')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0018
     * @tc.name errorMatrix0018
     * @tc.desc Verify errorInfo builds a display line prefixed by the numeric code.
     */
    it('errorMatrix0018', 0, () => {
      const info: ErrorInfo = errorInfo(201, 'Permission denied.');
      expect(info.code).assertEqual(201);
      expect(info.status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(info.describe()).assertEqual('[201] Permission denied.');
      expect(info.hint).assertEqual(bluetoothErrorHint(201));
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0019
     * @tc.name errorMatrix0019
     * @tc.desc Verify errorInfo replaces an empty message with the localized fallback text.
     */
    it('errorMatrix0019', 0, () => {
      const info: ErrorInfo = errorInfo(0, '');
      expect(info.message).assertEqual('未知错误');
      expect(info.describe()).assertEqual('未知错误');
      expect(info.status).assertEqual(ProbeStatus.IDLE);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0020
     * @tc.name errorMatrix0020
     * @tc.desc Verify describeThrown joins the action text and the hint with a separator.
     */
    it('errorMatrix0020', 0, () => {
      const text: string = describeThrown('创建实例', 801, 'not supported');
      expect(text.indexOf('失败（801）') >= 0).assertTrue();
      expect(text.indexOf('；') >= 0).assertTrue();
      expect(text.indexOf('模拟器') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0021
     * @tc.name errorMatrix0021
     * @tc.desc Verify codeOfThrown reads the numeric code straight from a business error object.
     */
    it('errorMatrix0021', 0, () => {
      const error: Object = new StubError(801, 'not supported');
      expect(codeOfThrown(error)).assertEqual(801);
      expect(messageOfThrown(error)).assertEqual('not supported');
      expect(codeOfThrown(error) === 0).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0022
     * @tc.name errorMatrix0022
     * @tc.desc Verify codeOfThrown falls back to the digits embedded in a plain error message.
     */
    it('errorMatrix0022', 0, () => {
      const error: Object = new Error('BussinessError 201: Permission denied.');
      expect(codeOfThrown(error)).assertEqual(201);
      expect(messageOfThrown(error).indexOf('Permission denied') >= 0).assertTrue();
      expect(codeOfThrown(error) === 201).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0023
     * @tc.name errorMatrix0023
     * @tc.desc Verify codeOfThrown returns zero when the thrown object carries no usable code.
     */
    it('errorMatrix0023', 0, () => {
      const error: Object = new Error();
      expect(codeOfThrown(error)).assertEqual(0);
      expect(messageOfThrown(error)).assertEqual('');
      expect(classifyErrorCode(codeOfThrown(error))).assertEqual(ProbeStatus.IDLE);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0024
     * @tc.name errorMatrix0024
     * @tc.desc Verify codeOfThrown reduces the message to the leading number 801.
     */
    it('errorMatrix0024', 0, () => {
      const error: Object = new Error('BussinessError 801: Capability not supported.');
      expect(codeOfThrown(error)).assertEqual(801);
      expect(messageOfThrown(error)).assertEqual('BussinessError 801: Capability not supported.');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0025
     * @tc.name errorMatrix0025
     * @tc.desc Verify codeOfThrown reduces the message to the leading number 2900001.
     */
    it('errorMatrix0025', 0, () => {
      const error: Object = new Error('error 2900001 happened');
      expect(codeOfThrown(error)).assertEqual(2900001);
      expect(messageOfThrown(error)).assertEqual('error 2900001 happened');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0026
     * @tc.name errorMatrix0026
     * @tc.desc Verify codeOfThrown reduces the message to the leading number 0.
     */
    it('errorMatrix0026', 0, () => {
      const error: Object = new Error('no digits here');
      expect(codeOfThrown(error)).assertEqual(0);
      expect(messageOfThrown(error)).assertEqual('no digits here');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0027
     * @tc.name errorMatrix0027
     * @tc.desc Verify codeOfThrown reduces the message to the leading number 0.
     */
    it('errorMatrix0027', 0, () => {
      const error: Object = new Error('ab1cd');
      expect(codeOfThrown(error)).assertEqual(0);
      expect(messageOfThrown(error)).assertEqual('ab1cd');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0028
     * @tc.name errorMatrix0028
     * @tc.desc Verify codeOfThrown reduces the message to the leading number 0.
     */
    it('errorMatrix0028', 0, () => {
      const error: Object = new Error('ab12cd');
      expect(codeOfThrown(error)).assertEqual(0);
      expect(messageOfThrown(error)).assertEqual('ab12cd');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0029
     * @tc.name errorMatrix0029
     * @tc.desc Verify codeOfThrown reduces the message to the leading number 123.
     */
    it('errorMatrix0029', 0, () => {
      const error: Object = new Error('ab123cd');
      expect(codeOfThrown(error)).assertEqual(123);
      expect(messageOfThrown(error)).assertEqual('ab123cd');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0030
     * @tc.name errorMatrix0030
     * @tc.desc Verify codeOfThrown reduces the message to the leading number 0.
     */
    it('errorMatrix0030', 0, () => {
      const error: Object = new Error('');
      expect(codeOfThrown(error)).assertEqual(0);
      expect(messageOfThrown(error)).assertEqual('');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0031
     * @tc.name errorMatrix0031
     * @tc.desc Verify codeOfThrown reduces the message to the leading number 123.
     */
    it('errorMatrix0031', 0, () => {
      const error: Object = new Error('123');
      expect(codeOfThrown(error)).assertEqual(123);
      expect(messageOfThrown(error)).assertEqual('123');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0032
     * @tc.name errorMatrix0032
     * @tc.desc Verify codeOfThrown reduces the message to the leading number 99999.
     */
    it('errorMatrix0032', 0, () => {
      const error: Object = new Error('x99999y');
      expect(codeOfThrown(error)).assertEqual(99999);
      expect(messageOfThrown(error)).assertEqual('x99999y');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0033
     * @tc.name errorMatrix0033
     * @tc.desc Verify codeOfThrown reduces the message to the leading number 201.
     */
    it('errorMatrix0033', 0, () => {
      const error: Object = new Error('BussinessError 201');
      expect(codeOfThrown(error)).assertEqual(201);
      expect(messageOfThrown(error)).assertEqual('BussinessError 201');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0034
     * @tc.name errorMatrix0034
     * @tc.desc Verify codeOfThrown reduces the message to the leading number 2900003.
     */
    it('errorMatrix0034', 0, () => {
      const error: Object = new Error('prefix 2900003 suffix 201');
      expect(codeOfThrown(error)).assertEqual(2900003);
      expect(messageOfThrown(error)).assertEqual('prefix 2900003 suffix 201');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0035
     * @tc.name errorMatrix0035
     * @tc.desc Verify codeOfThrown reduces the message to the leading number 345.
     */
    it('errorMatrix0035', 0, () => {
      const error: Object = new Error('12 345');
      expect(codeOfThrown(error)).assertEqual(345);
      expect(messageOfThrown(error)).assertEqual('12 345');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0036
     * @tc.name errorMatrix0036
     * @tc.desc Verify isKnownBluetoothCode returns true for the code 201.
     */
    it('errorMatrix0036', 0, () => {
      expect(isKnownBluetoothCode(201)).assertEqual(true);
      expect(classifyErrorCode(201)).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(bluetoothErrorHint(201).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0037
     * @tc.name errorMatrix0037
     * @tc.desc Verify isKnownBluetoothCode returns true for the code 401.
     */
    it('errorMatrix0037', 0, () => {
      expect(isKnownBluetoothCode(401)).assertEqual(true);
      expect(classifyErrorCode(401)).assertEqual(ProbeStatus.FAILED);
      expect(bluetoothErrorHint(401).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0038
     * @tc.name errorMatrix0038
     * @tc.desc Verify isKnownBluetoothCode returns true for the code 801.
     */
    it('errorMatrix0038', 0, () => {
      expect(isKnownBluetoothCode(801)).assertEqual(true);
      expect(classifyErrorCode(801)).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(bluetoothErrorHint(801).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0039
     * @tc.name errorMatrix0039
     * @tc.desc Verify isKnownBluetoothCode returns true for the code 2900001.
     */
    it('errorMatrix0039', 0, () => {
      expect(isKnownBluetoothCode(2900001)).assertEqual(true);
      expect(classifyErrorCode(2900001)).assertEqual(ProbeStatus.SERVICE_STOPPED);
      expect(bluetoothErrorHint(2900001).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0040
     * @tc.name errorMatrix0040
     * @tc.desc Verify isKnownBluetoothCode returns true for the code 2900003.
     */
    it('errorMatrix0040', 0, () => {
      expect(isKnownBluetoothCode(2900003)).assertEqual(true);
      expect(classifyErrorCode(2900003)).assertEqual(ProbeStatus.BLUETOOTH_DISABLED);
      expect(bluetoothErrorHint(2900003).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0041
     * @tc.name errorMatrix0041
     * @tc.desc Verify isKnownBluetoothCode returns true for the code 2900004.
     */
    it('errorMatrix0041', 0, () => {
      expect(isKnownBluetoothCode(2900004)).assertEqual(true);
      expect(classifyErrorCode(2900004)).assertEqual(ProbeStatus.PROFILE_UNSUPPORTED);
      expect(bluetoothErrorHint(2900004).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0042
     * @tc.name errorMatrix0042
     * @tc.desc Verify isKnownBluetoothCode returns true for the code 2900099.
     */
    it('errorMatrix0042', 0, () => {
      expect(isKnownBluetoothCode(2900099)).assertEqual(true);
      expect(classifyErrorCode(2900099)).assertEqual(ProbeStatus.FAILED);
      expect(bluetoothErrorHint(2900099).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0043
     * @tc.name errorMatrix0043
     * @tc.desc Verify isKnownBluetoothCode returns false for the code 0.
     */
    it('errorMatrix0043', 0, () => {
      expect(isKnownBluetoothCode(0)).assertEqual(false);
      expect(classifyErrorCode(0)).assertEqual(ProbeStatus.IDLE);
      expect(bluetoothErrorHint(0).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0044
     * @tc.name errorMatrix0044
     * @tc.desc Verify isKnownBluetoothCode returns false for the code 200.
     */
    it('errorMatrix0044', 0, () => {
      expect(isKnownBluetoothCode(200)).assertEqual(false);
      expect(classifyErrorCode(200)).assertEqual(ProbeStatus.FAILED);
      expect(bluetoothErrorHint(200).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0045
     * @tc.name errorMatrix0045
     * @tc.desc Verify isKnownBluetoothCode returns false for the code 802.
     */
    it('errorMatrix0045', 0, () => {
      expect(isKnownBluetoothCode(802)).assertEqual(false);
      expect(classifyErrorCode(802)).assertEqual(ProbeStatus.FAILED);
      expect(bluetoothErrorHint(802).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0046
     * @tc.name errorMatrix0046
     * @tc.desc Verify isKnownBluetoothCode returns false for the code 2900000.
     */
    it('errorMatrix0046', 0, () => {
      expect(isKnownBluetoothCode(2900000)).assertEqual(false);
      expect(classifyErrorCode(2900000)).assertEqual(ProbeStatus.FAILED);
      expect(bluetoothErrorHint(2900000).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0047
     * @tc.name errorMatrix0047
     * @tc.desc Verify isKnownBluetoothCode returns false for the code 2900002.
     */
    it('errorMatrix0047', 0, () => {
      expect(isKnownBluetoothCode(2900002)).assertEqual(false);
      expect(classifyErrorCode(2900002)).assertEqual(ProbeStatus.FAILED);
      expect(bluetoothErrorHint(2900002).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRORUTIL_0048
     * @tc.name errorMatrix0048
     * @tc.desc Verify isKnownBluetoothCode returns false for the code 2900005.
     */
    it('errorMatrix0048', 0, () => {
      expect(isKnownBluetoothCode(2900005)).assertEqual(false);
      expect(classifyErrorCode(2900005)).assertEqual(ProbeStatus.FAILED);
      expect(bluetoothErrorHint(2900005).length > 0).assertTrue();
    });
  });
}
