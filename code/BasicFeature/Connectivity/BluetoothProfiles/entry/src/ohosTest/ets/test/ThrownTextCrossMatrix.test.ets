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
 * 异常文本的组合矩阵。
 *
 * 系统接口抛出的对象有三种真实形态：带数值 code、只有 message、message 里没有数字。
 * 这一组用纯文本构造覆盖三种形态，重点验证「从文本里取第一段不少于三位的数字」这条回退规则。
 */

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import {
  ErrorInfo,
  codeOfThrown,
  describeThrown,
  errorInfo,
  formatError,
  messageOfThrown
} from '../../../main/ets/utils/ErrorUtil';
import { ProbeStatus } from '../../../main/ets/model/ProfileState';

export default function bluetoothProfileThrownTextCrossTest() {
  describe('BluetoothProfileThrownTextCrossTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0001
     * @tc.name thrownCross0001
     * @tc.desc Verify codeOfThrown reads 0 out of the message empty text.
     */
    it('thrownCross0001', 0, () => {
      const error: Object = new Error('');
      expect(codeOfThrown(error)).assertEqual(0);
      expect(messageOfThrown(error)).assertEqual('');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0002
     * @tc.name thrownCross0002
     * @tc.desc Verify codeOfThrown reads 123 out of the message '123'.
     */
    it('thrownCross0002', 0, () => {
      const error: Object = new Error('123');
      expect(codeOfThrown(error)).assertEqual(123);
      expect(messageOfThrown(error)).assertEqual('123');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0003
     * @tc.name thrownCross0003
     * @tc.desc Verify codeOfThrown reads 0 out of the message '12'.
     */
    it('thrownCross0003', 0, () => {
      const error: Object = new Error('12');
      expect(codeOfThrown(error)).assertEqual(0);
      expect(messageOfThrown(error)).assertEqual('12');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0004
     * @tc.name thrownCross0004
     * @tc.desc Verify codeOfThrown reads 123 out of the message 'ab123cd'.
     */
    it('thrownCross0004', 0, () => {
      const error: Object = new Error('ab123cd');
      expect(codeOfThrown(error)).assertEqual(123);
      expect(messageOfThrown(error)).assertEqual('ab123cd');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0005
     * @tc.name thrownCross0005
     * @tc.desc Verify codeOfThrown reads 0 out of the message 'ab1cd'.
     */
    it('thrownCross0005', 0, () => {
      const error: Object = new Error('ab1cd');
      expect(codeOfThrown(error)).assertEqual(0);
      expect(messageOfThrown(error)).assertEqual('ab1cd');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0006
     * @tc.name thrownCross0006
     * @tc.desc Verify codeOfThrown reads 0 out of the message 'ab12cd'.
     */
    it('thrownCross0006', 0, () => {
      const error: Object = new Error('ab12cd');
      expect(codeOfThrown(error)).assertEqual(0);
      expect(messageOfThrown(error)).assertEqual('ab12cd');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0007
     * @tc.name thrownCross0007
     * @tc.desc Verify codeOfThrown reads 801 out of the message 'BussinessError 801: Capability not supported.'.
     */
    it('thrownCross0007', 0, () => {
      const error: Object = new Error('BussinessError 801: Capability not supported.');
      expect(codeOfThrown(error)).assertEqual(801);
      expect(messageOfThrown(error)).assertEqual('BussinessError 801: Capability not supported.');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0008
     * @tc.name thrownCross0008
     * @tc.desc Verify codeOfThrown reads 2900001 out of the message 'error 2900001 happened'.
     */
    it('thrownCross0008', 0, () => {
      const error: Object = new Error('error 2900001 happened');
      expect(codeOfThrown(error)).assertEqual(2900001);
      expect(messageOfThrown(error)).assertEqual('error 2900001 happened');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0009
     * @tc.name thrownCross0009
     * @tc.desc Verify codeOfThrown reads 2900003 out of the message 'prefix 2900003 suffix 201'.
     */
    it('thrownCross0009', 0, () => {
      const error: Object = new Error('prefix 2900003 suffix 201');
      expect(codeOfThrown(error)).assertEqual(2900003);
      expect(messageOfThrown(error)).assertEqual('prefix 2900003 suffix 201');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0010
     * @tc.name thrownCross0010
     * @tc.desc Verify codeOfThrown reads 345 out of the message '12 345'.
     */
    it('thrownCross0010', 0, () => {
      const error: Object = new Error('12 345');
      expect(codeOfThrown(error)).assertEqual(345);
      expect(messageOfThrown(error)).assertEqual('12 345');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0011
     * @tc.name thrownCross0011
     * @tc.desc Verify codeOfThrown reads 99999 out of the message 'x99999y'.
     */
    it('thrownCross0011', 0, () => {
      const error: Object = new Error('x99999y');
      expect(codeOfThrown(error)).assertEqual(99999);
      expect(messageOfThrown(error)).assertEqual('x99999y');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0012
     * @tc.name thrownCross0012
     * @tc.desc Verify codeOfThrown reads 201 out of the message 'BussinessError 201'.
     */
    it('thrownCross0012', 0, () => {
      const error: Object = new Error('BussinessError 201');
      expect(codeOfThrown(error)).assertEqual(201);
      expect(messageOfThrown(error)).assertEqual('BussinessError 201');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0013
     * @tc.name thrownCross0013
     * @tc.desc Verify codeOfThrown reads 0 out of the message '0'.
     */
    it('thrownCross0013', 0, () => {
      const error: Object = new Error('0');
      expect(codeOfThrown(error)).assertEqual(0);
      expect(messageOfThrown(error)).assertEqual('0');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0014
     * @tc.name thrownCross0014
     * @tc.desc Verify codeOfThrown reads 0 out of the message '000'.
     */
    it('thrownCross0014', 0, () => {
      const error: Object = new Error('000');
      expect(codeOfThrown(error)).assertEqual(0);
      expect(messageOfThrown(error)).assertEqual('000');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0015
     * @tc.name thrownCross0015
     * @tc.desc Verify codeOfThrown reads 1 out of the message '0001'.
     */
    it('thrownCross0015', 0, () => {
      const error: Object = new Error('0001');
      expect(codeOfThrown(error)).assertEqual(1);
      expect(messageOfThrown(error)).assertEqual('0001');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0016
     * @tc.name thrownCross0016
     * @tc.desc Verify codeOfThrown reads 0 out of the message 'abc'.
     */
    it('thrownCross0016', 0, () => {
      const error: Object = new Error('abc');
      expect(codeOfThrown(error)).assertEqual(0);
      expect(messageOfThrown(error)).assertEqual('abc');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0017
     * @tc.name thrownCross0017
     * @tc.desc Verify codeOfThrown reads 201 out of the message '201abc'.
     */
    it('thrownCross0017', 0, () => {
      const error: Object = new Error('201abc');
      expect(codeOfThrown(error)).assertEqual(201);
      expect(messageOfThrown(error)).assertEqual('201abc');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0018
     * @tc.name thrownCross0018
     * @tc.desc Verify codeOfThrown reads 201 out of the message 'abc201'.
     */
    it('thrownCross0018', 0, () => {
      const error: Object = new Error('abc201');
      expect(codeOfThrown(error)).assertEqual(201);
      expect(messageOfThrown(error)).assertEqual('abc201');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0019
     * @tc.name thrownCross0019
     * @tc.desc Verify codeOfThrown reads 201 out of the message '201abc801'.
     */
    it('thrownCross0019', 0, () => {
      const error: Object = new Error('201abc801');
      expect(codeOfThrown(error)).assertEqual(201);
      expect(messageOfThrown(error)).assertEqual('201abc801');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0020
     * @tc.name thrownCross0020
     * @tc.desc Verify codeOfThrown reads 0 out of the message 'a1b2c3'.
     */
    it('thrownCross0020', 0, () => {
      const error: Object = new Error('a1b2c3');
      expect(codeOfThrown(error)).assertEqual(0);
      expect(messageOfThrown(error)).assertEqual('a1b2c3');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0021
     * @tc.name thrownCross0021
     * @tc.desc Verify codeOfThrown reads 123456789 out of the message '123456789'.
     */
    it('thrownCross0021', 0, () => {
      const error: Object = new Error('123456789');
      expect(codeOfThrown(error)).assertEqual(123456789);
      expect(messageOfThrown(error)).assertEqual('123456789');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0022
     * @tc.name thrownCross0022
     * @tc.desc Verify codeOfThrown reads 0 out of the message '9'.
     */
    it('thrownCross0022', 0, () => {
      const error: Object = new Error('9');
      expect(codeOfThrown(error)).assertEqual(0);
      expect(messageOfThrown(error)).assertEqual('9');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0023
     * @tc.name thrownCross0023
     * @tc.desc Verify codeOfThrown reads 0 out of the message '99'.
     */
    it('thrownCross0023', 0, () => {
      const error: Object = new Error('99');
      expect(codeOfThrown(error)).assertEqual(0);
      expect(messageOfThrown(error)).assertEqual('99');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0024
     * @tc.name thrownCross0024
     * @tc.desc Verify codeOfThrown reads 999 out of the message '999'.
     */
    it('thrownCross0024', 0, () => {
      const error: Object = new Error('999');
      expect(codeOfThrown(error)).assertEqual(999);
      expect(messageOfThrown(error)).assertEqual('999');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0025
     * @tc.name thrownCross0025
     * @tc.desc Verify codeOfThrown reads 1000 out of the message '1000'.
     */
    it('thrownCross0025', 0, () => {
      const error: Object = new Error('1000');
      expect(codeOfThrown(error)).assertEqual(1000);
      expect(messageOfThrown(error)).assertEqual('1000');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0026
     * @tc.name thrownCross0026
     * @tc.desc Verify codeOfThrown reads 201 out of the message '-201'.
     */
    it('thrownCross0026', 0, () => {
      const error: Object = new Error('-201');
      expect(codeOfThrown(error)).assertEqual(201);
      expect(messageOfThrown(error)).assertEqual('-201');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0027
     * @tc.name thrownCross0027
     * @tc.desc Verify codeOfThrown reads 0 out of the message 'v1.2.3'.
     */
    it('thrownCross0027', 0, () => {
      const error: Object = new Error('v1.2.3');
      expect(codeOfThrown(error)).assertEqual(0);
      expect(messageOfThrown(error)).assertEqual('v1.2.3');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0028
     * @tc.name thrownCross0028
     * @tc.desc Verify codeOfThrown reads 333 out of the message 'v1.22.333'.
     */
    it('thrownCross0028', 0, () => {
      const error: Object = new Error('v1.22.333');
      expect(codeOfThrown(error)).assertEqual(333);
      expect(messageOfThrown(error)).assertEqual('v1.22.333');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0029
     * @tc.name thrownCross0029
     * @tc.desc Verify codeOfThrown reads 456 out of the message 'abc 0456xyz'.
     */
    it('thrownCross0029', 0, () => {
      const error: Object = new Error('abc 0456xyz');
      expect(codeOfThrown(error)).assertEqual(456);
      expect(messageOfThrown(error)).assertEqual('abc 0456xyz');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0030
     * @tc.name thrownCross0030
     * @tc.desc Verify codeOfThrown reads 3000 out of the message 'timeout after 3000 ms'.
     */
    it('thrownCross0030', 0, () => {
      const error: Object = new Error('timeout after 3000 ms');
      expect(codeOfThrown(error)).assertEqual(3000);
      expect(messageOfThrown(error)).assertEqual('timeout after 3000 ms');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0031
     * @tc.name thrownCross0031
     * @tc.desc Verify codeOfThrown reads 0 out of the message 'fail code=0x1F'.
     */
    it('thrownCross0031', 0, () => {
      const error: Object = new Error('fail code=0x1F');
      expect(codeOfThrown(error)).assertEqual(0);
      expect(messageOfThrown(error)).assertEqual('fail code=0x1F');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0032
     * @tc.name thrownCross0032
     * @tc.desc Verify codeOfThrown reads 345 out of the message ' 12 abc 345 '.
     */
    it('thrownCross0032', 0, () => {
      const error: Object = new Error(' 12 abc 345 ');
      expect(codeOfThrown(error)).assertEqual(345);
      expect(messageOfThrown(error)).assertEqual(' 12 abc 345 ');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0033
     * @tc.name thrownCross0033
     * @tc.desc Verify codeOfThrown reads 201 out of the message '你好 201 失败'.
     */
    it('thrownCross0033', 0, () => {
      const error: Object = new Error('你好 201 失败');
      expect(codeOfThrown(error)).assertEqual(201);
      expect(messageOfThrown(error)).assertEqual('你好 201 失败');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0034
     * @tc.name thrownCross0034
     * @tc.desc Verify codeOfThrown reads 201 out of the message 'v201'.
     */
    it('thrownCross0034', 0, () => {
      const error: Object = new Error('v201');
      expect(codeOfThrown(error)).assertEqual(201);
      expect(messageOfThrown(error)).assertEqual('v201');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0035
     * @tc.name thrownCross0035
     * @tc.desc Verify codeOfThrown reads 201 out of the message '201,801'.
     */
    it('thrownCross0035', 0, () => {
      const error: Object = new Error('201,801');
      expect(codeOfThrown(error)).assertEqual(201);
      expect(messageOfThrown(error)).assertEqual('201,801');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0036
     * @tc.name thrownCross0036
     * @tc.desc Verify codeOfThrown reads 500 out of the message '500 内部错误'.
     */
    it('thrownCross0036', 0, () => {
      const error: Object = new Error('500 内部错误');
      expect(codeOfThrown(error)).assertEqual(500);
      expect(messageOfThrown(error)).assertEqual('500 内部错误');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0037
     * @tc.name thrownCross0037
     * @tc.desc Verify codeOfThrown reads 0 out of the message 'permission denied'.
     */
    it('thrownCross0037', 0, () => {
      const error: Object = new Error('permission denied');
      expect(codeOfThrown(error)).assertEqual(0);
      expect(messageOfThrown(error)).assertEqual('permission denied');
      expect(codeOfThrown(error) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0038
     * @tc.name thrownCross0038
     * @tc.desc Verify formatError keeps the code in parentheses for 创建实例.
     */
    it('thrownCross0038', 0, () => {
      const text: string = formatError('创建实例', 801, 'not supported');
      expect(text).assertEqual('创建实例失败（801）：not supported');
      expect(text.length).assertEqual(25);
      expect(text.indexOf('（')).assertEqual(6);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0039
     * @tc.name thrownCross0039
     * @tc.desc Verify formatError keeps the code in parentheses for 查询设备.
     */
    it('thrownCross0039', 0, () => {
      const text: string = formatError('查询设备', 201, 'Permission denied.');
      expect(text).assertEqual('查询设备失败（201）：Permission denied.');
      expect(text.length).assertEqual(30);
      expect(text.indexOf('（')).assertEqual(6);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0040
     * @tc.name thrownCross0040
     * @tc.desc Verify formatError keeps the code in parentheses for 订阅变化.
     */
    it('thrownCross0040', 0, () => {
      const text: string = formatError('订阅变化', 2900001, 'service stopped');
      expect(text).assertEqual('订阅变化失败（2900001）：service stopped');
      expect(text.length).assertEqual(31);
      expect(text.indexOf('（')).assertEqual(6);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0041
     * @tc.name thrownCross0041
     * @tc.desc Verify formatError keeps the code in parentheses for 取消订阅.
     */
    it('thrownCross0041', 0, () => {
      const text: string = formatError('取消订阅', 2900003, 'bt off');
      expect(text).assertEqual('取消订阅失败（2900003）：bt off');
      expect(text.length).assertEqual(22);
      expect(text.indexOf('（')).assertEqual(6);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0042
     * @tc.name thrownCross0042
     * @tc.desc Verify formatError keeps the code in parentheses for 刷新状态.
     */
    it('thrownCross0042', 0, () => {
      const text: string = formatError('刷新状态', 401, 'bad param');
      expect(text).assertEqual('刷新状态失败（401）：bad param');
      expect(text.length).assertEqual(21);
      expect(text.indexOf('（')).assertEqual(6);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0043
     * @tc.name thrownCross0043
     * @tc.desc Verify formatError keeps no parentheses for 创建实例.
     */
    it('thrownCross0043', 0, () => {
      const text: string = formatError('创建实例', 0, 'done');
      expect(text).assertEqual('创建实例失败：done');
      expect(text.length).assertEqual(11);
      expect(text.indexOf('（')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0044
     * @tc.name thrownCross0044
     * @tc.desc Verify formatError keeps no parentheses for 创建实例.
     */
    it('thrownCross0044', 0, () => {
      const text: string = formatError('创建实例', 0, '');
      expect(text).assertEqual('创建实例失败：未知错误');
      expect(text.length).assertEqual(11);
      expect(text.indexOf('（')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0045
     * @tc.name thrownCross0045
     * @tc.desc Verify formatError keeps the code in parentheses for 创建实例.
     */
    it('thrownCross0045', 0, () => {
      const text: string = formatError('创建实例', 801, '');
      expect(text).assertEqual('创建实例失败（801）：未知错误');
      expect(text.length).assertEqual(16);
      expect(text.indexOf('（')).assertEqual(6);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0046
     * @tc.name thrownCross0046
     * @tc.desc Verify formatError keeps no parentheses for 探测.
     */
    it('thrownCross0046', 0, () => {
      const text: string = formatError('探测', -1, 'negative');
      expect(text).assertEqual('探测失败：negative');
      expect(text.length).assertEqual(13);
      expect(text.indexOf('（')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0047
     * @tc.name thrownCross0047
     * @tc.desc Verify formatError keeps the code in parentheses for 探测.
     */
    it('thrownCross0047', 0, () => {
      const text: string = formatError('探测', 2900004, 'not compiled');
      expect(text).assertEqual('探测失败（2900004）：not compiled');
      expect(text.length).assertEqual(26);
      expect(text.indexOf('（')).assertEqual(4);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0048
     * @tc.name thrownCross0048
     * @tc.desc Verify formatError keeps the code in parentheses for 探测.
     */
    it('thrownCross0048', 0, () => {
      const text: string = formatError('探测', 2900099, 'internal');
      expect(text).assertEqual('探测失败（2900099）：internal');
      expect(text.length).assertEqual(22);
      expect(text.indexOf('（')).assertEqual(4);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0049
     * @tc.name thrownCross0049
     * @tc.desc Verify formatError keeps the code in parentheses for 探测.
     */
    it('thrownCross0049', 0, () => {
      const text: string = formatError('探测', 16000001, 'unknown positive');
      expect(text).assertEqual('探测失败（16000001）：unknown positive');
      expect(text.length).assertEqual(31);
      expect(text.indexOf('（')).assertEqual(4);
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0050
     * @tc.name thrownCross0050
     * @tc.desc Verify describeThrown joins the action line and the hint for code 201.
     */
    it('thrownCross0050', 0, () => {
      const text: string = describeThrown('探测', 201, '8201');
      expect(text).assertEqual('探测失败（201）：8201；缺少 ohos.permission.ACCESS_BLUETOOTH 授权，请先申请权限再重试');
      expect(text.length).assertEqual(63);
      expect(text.indexOf('；') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0051
     * @tc.name thrownCross0051
     * @tc.desc Verify describeThrown joins the action line and the hint for code 401.
     */
    it('thrownCross0051', 0, () => {
      const text: string = describeThrown('探测', 401, '8401');
      expect(text).assertEqual('探测失败（401）：8401；入参无效，请检查 deviceId 是否为 AA:BB:CC:DD:EE:FF 形式');
      expect(text.length).assertEqual(57);
      expect(text.indexOf('；') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0052
     * @tc.name thrownCross0052
     * @tc.desc Verify describeThrown joins the action line and the hint for code 801.
     */
    it('thrownCross0052', 0, () => {
      const text: string = describeThrown('探测', 801, '8801');
      expect(text).assertEqual('探测失败（801）：8801；当前设备未支持该 Profile 能力（常见于模拟器或精简镜像），需换用支持该能力的设备');
      expect(text.length).assertEqual(59);
      expect(text.indexOf('；') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0053
     * @tc.name thrownCross0053
     * @tc.desc Verify describeThrown joins the action line and the hint for code 2900001.
     */
    it('thrownCross0053', 0, () => {
      const text: string = describeThrown('探测', 2900001, '82900001');
      expect(text).assertEqual('探测失败（2900001）：82900001；蓝牙服务已停止，可关闭蓝牙再重新打开后重试');
      expect(text.length).assertEqual(44);
      expect(text.indexOf('；') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0054
     * @tc.name thrownCross0054
     * @tc.desc Verify describeThrown joins the action line and the hint for code 2900003.
     */
    it('thrownCross0054', 0, () => {
      const text: string = describeThrown('探测', 2900003, '82900003');
      expect(text).assertEqual('探测失败（2900003）：82900003；蓝牙未开启，请先打开系统蓝牙开关');
      expect(text.length).assertEqual(39);
      expect(text.indexOf('；') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0055
     * @tc.name thrownCross0055
     * @tc.desc Verify describeThrown joins the action line and the hint for code 2900004.
     */
    it('thrownCross0055', 0, () => {
      const text: string = describeThrown('探测', 2900004, '82900004');
      expect(text).assertEqual('探测失败（2900004）：82900004；系统未编译该 Profile，属于设备能力缺失，请更换设备镜像');
      expect(text.length).assertEqual(54);
      expect(text.indexOf('；') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0056
     * @tc.name thrownCross0056
     * @tc.desc Verify describeThrown joins the action line and the hint for code 2900099.
     */
    it('thrownCross0056', 0, () => {
      const text: string = describeThrown('探测', 2900099, '82900099');
      expect(text).assertEqual('探测失败（2900099）：82900099；蓝牙服务内部操作失败，可稍后重试或查看 hilog');
      expect(text.length).assertEqual(48);
      expect(text.indexOf('；') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0057
     * @tc.name thrownCross0057
     * @tc.desc Verify describeThrown joins the action line and the hint for code 0.
     */
    it('thrownCross0057', 0, () => {
      const text: string = describeThrown('探测', 0, '8');
      expect(text).assertEqual('探测失败：8；操作已正常完成');
      expect(text.length).assertEqual(14);
      expect(text.indexOf('；') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0058
     * @tc.name thrownCross0058
     * @tc.desc Verify describeThrown joins the action line and the hint for code -1.
     */
    it('thrownCross0058', 0, () => {
      const text: string = describeThrown('探测', -1, '8');
      expect(text).assertEqual('探测失败：8；操作已正常完成');
      expect(text.length).assertEqual(14);
      expect(text.indexOf('；') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0059
     * @tc.name thrownCross0059
     * @tc.desc Verify errorInfo builds the display line and the hint for code 201.
     */
    it('thrownCross0059', 0, () => {
      const info: ErrorInfo = errorInfo(201, 'Permission denied.');
      expect(info.status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(info.describe()).assertEqual('[201] Permission denied.');
      expect(info.hint).assertEqual('缺少 ohos.permission.ACCESS_BLUETOOTH 授权，请先申请权限再重试');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0060
     * @tc.name thrownCross0060
     * @tc.desc Verify errorInfo builds the display line and the hint for code 801.
     */
    it('thrownCross0060', 0, () => {
      const info: ErrorInfo = errorInfo(801, '');
      expect(info.status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(info.describe()).assertEqual('[801] 未知错误');
      expect(info.hint).assertEqual('当前设备未支持该 Profile 能力（常见于模拟器或精简镜像），需换用支持该能力的设备');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0061
     * @tc.name thrownCross0061
     * @tc.desc Verify errorInfo builds the display line and the hint for code 0.
     */
    it('thrownCross0061', 0, () => {
      const info: ErrorInfo = errorInfo(0, '');
      expect(info.status).assertEqual(ProbeStatus.IDLE);
      expect(info.describe()).assertEqual('未知错误');
      expect(info.hint).assertEqual('操作已正常完成');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0062
     * @tc.name thrownCross0062
     * @tc.desc Verify errorInfo builds the display line and the hint for code -3.
     */
    it('thrownCross0062', 0, () => {
      const info: ErrorInfo = errorInfo(-3, 'idle');
      expect(info.status).assertEqual(ProbeStatus.IDLE);
      expect(info.describe()).assertEqual('idle');
      expect(info.hint).assertEqual('操作已正常完成');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0063
     * @tc.name thrownCross0063
     * @tc.desc Verify errorInfo builds the display line and the hint for code 401.
     */
    it('thrownCross0063', 0, () => {
      const info: ErrorInfo = errorInfo(401, 'bad param');
      expect(info.status).assertEqual(ProbeStatus.FAILED);
      expect(info.describe()).assertEqual('[401] bad param');
      expect(info.hint).assertEqual('入参无效，请检查 deviceId 是否为 AA:BB:CC:DD:EE:FF 形式');
    });

    /**
     * @tc.number SUB_BLUETOOTH_ERRTEXT_CROSS_0064
     * @tc.name thrownCross0064
     * @tc.desc Verify errorInfo builds the display line and the hint for code 2900099.
     */
    it('thrownCross0064', 0, () => {
      const info: ErrorInfo = errorInfo(2900099, 'internal');
      expect(info.status).assertEqual(ProbeStatus.FAILED);
      expect(info.describe()).assertEqual('[2900099] internal');
      expect(info.hint).assertEqual('蓝牙服务内部操作失败，可稍后重试或查看 hilog');
    });
  });
}
