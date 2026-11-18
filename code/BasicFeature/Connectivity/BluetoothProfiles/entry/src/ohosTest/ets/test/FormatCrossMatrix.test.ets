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
 * 格式化函数的取值交叉矩阵。
 *
 * pad2 的边界直接决定两个时间函数是否定长，因此先按两位数字边界铺开，
 * 再覆盖毫秒换单位、截断可用宽度这两条容易越界的路径。
 * 每条用例都同时断言文案、长度与结构，避免只比较一处就放过格式错误。
 *
 * 截断（truncateMiddle）的 112 条按实现分成 FormatTruncateCrossMatrix，
 * 用例编号沿用 SUB_BLUETOOTH_FMT_CROSS_0121~0232，与 @tc.name 一一对应。
 */

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import {
  formatDateTime,
  formatDuration,
  formatTime,
  pad2
} from '../../../main/ets/utils/FormatUtil';

export default function bluetoothProfileFormatCrossTest() {
  describe('BluetoothProfileFormatCrossTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0001
     * @tc.name formatCross0001
     * @tc.desc Verify pad2 keeps the digits of -999 and pads below the ten boundary only.
     */
    it('formatCross0001', 0, () => {
      const text: string = pad2(-999);
      expect(text).assertEqual('0-999');
      expect(text.length).assertEqual(5);
      expect(text.indexOf(String(-999)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0002
     * @tc.name formatCross0002
     * @tc.desc Verify pad2 keeps the digits of -100 and pads below the ten boundary only.
     */
    it('formatCross0002', 0, () => {
      const text: string = pad2(-100);
      expect(text).assertEqual('0-100');
      expect(text.length).assertEqual(5);
      expect(text.indexOf(String(-100)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0003
     * @tc.name formatCross0003
     * @tc.desc Verify pad2 keeps the digits of -99 and pads below the ten boundary only.
     */
    it('formatCross0003', 0, () => {
      const text: string = pad2(-99);
      expect(text).assertEqual('0-99');
      expect(text.length).assertEqual(4);
      expect(text.indexOf(String(-99)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0004
     * @tc.name formatCross0004
     * @tc.desc Verify pad2 keeps the digits of -10 and pads below the ten boundary only.
     */
    it('formatCross0004', 0, () => {
      const text: string = pad2(-10);
      expect(text).assertEqual('0-10');
      expect(text.length).assertEqual(4);
      expect(text.indexOf(String(-10)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0005
     * @tc.name formatCross0005
     * @tc.desc Verify pad2 keeps the digits of -1 and pads below the ten boundary only.
     */
    it('formatCross0005', 0, () => {
      const text: string = pad2(-1);
      expect(text).assertEqual('0-1');
      expect(text.length).assertEqual(3);
      expect(text.indexOf(String(-1)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0006
     * @tc.name formatCross0006
     * @tc.desc Verify pad2 keeps the digits of 0 and pads below the ten boundary only.
     */
    it('formatCross0006', 0, () => {
      const text: string = pad2(0);
      expect(text).assertEqual('00');
      expect(text.length).assertEqual(2);
      expect(text.indexOf(String(0)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0007
     * @tc.name formatCross0007
     * @tc.desc Verify pad2 keeps the digits of 1 and pads below the ten boundary only.
     */
    it('formatCross0007', 0, () => {
      const text: string = pad2(1);
      expect(text).assertEqual('01');
      expect(text.length).assertEqual(2);
      expect(text.indexOf(String(1)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0008
     * @tc.name formatCross0008
     * @tc.desc Verify pad2 keeps the digits of 2 and pads below the ten boundary only.
     */
    it('formatCross0008', 0, () => {
      const text: string = pad2(2);
      expect(text).assertEqual('02');
      expect(text.length).assertEqual(2);
      expect(text.indexOf(String(2)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0009
     * @tc.name formatCross0009
     * @tc.desc Verify pad2 keeps the digits of 3 and pads below the ten boundary only.
     */
    it('formatCross0009', 0, () => {
      const text: string = pad2(3);
      expect(text).assertEqual('03');
      expect(text.length).assertEqual(2);
      expect(text.indexOf(String(3)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0010
     * @tc.name formatCross0010
     * @tc.desc Verify pad2 keeps the digits of 4 and pads below the ten boundary only.
     */
    it('formatCross0010', 0, () => {
      const text: string = pad2(4);
      expect(text).assertEqual('04');
      expect(text.length).assertEqual(2);
      expect(text.indexOf(String(4)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0011
     * @tc.name formatCross0011
     * @tc.desc Verify pad2 keeps the digits of 5 and pads below the ten boundary only.
     */
    it('formatCross0011', 0, () => {
      const text: string = pad2(5);
      expect(text).assertEqual('05');
      expect(text.length).assertEqual(2);
      expect(text.indexOf(String(5)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0012
     * @tc.name formatCross0012
     * @tc.desc Verify pad2 keeps the digits of 6 and pads below the ten boundary only.
     */
    it('formatCross0012', 0, () => {
      const text: string = pad2(6);
      expect(text).assertEqual('06');
      expect(text.length).assertEqual(2);
      expect(text.indexOf(String(6)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0013
     * @tc.name formatCross0013
     * @tc.desc Verify pad2 keeps the digits of 7 and pads below the ten boundary only.
     */
    it('formatCross0013', 0, () => {
      const text: string = pad2(7);
      expect(text).assertEqual('07');
      expect(text.length).assertEqual(2);
      expect(text.indexOf(String(7)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0014
     * @tc.name formatCross0014
     * @tc.desc Verify pad2 keeps the digits of 8 and pads below the ten boundary only.
     */
    it('formatCross0014', 0, () => {
      const text: string = pad2(8);
      expect(text).assertEqual('08');
      expect(text.length).assertEqual(2);
      expect(text.indexOf(String(8)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0015
     * @tc.name formatCross0015
     * @tc.desc Verify pad2 keeps the digits of 9 and pads below the ten boundary only.
     */
    it('formatCross0015', 0, () => {
      const text: string = pad2(9);
      expect(text).assertEqual('09');
      expect(text.length).assertEqual(2);
      expect(text.indexOf(String(9)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0016
     * @tc.name formatCross0016
     * @tc.desc Verify pad2 keeps the digits of 10 and pads below the ten boundary only.
     */
    it('formatCross0016', 0, () => {
      const text: string = pad2(10);
      expect(text).assertEqual('10');
      expect(text.length).assertEqual(2);
      expect(text.indexOf(String(10)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0017
     * @tc.name formatCross0017
     * @tc.desc Verify pad2 keeps the digits of 11 and pads below the ten boundary only.
     */
    it('formatCross0017', 0, () => {
      const text: string = pad2(11);
      expect(text).assertEqual('11');
      expect(text.length).assertEqual(2);
      expect(text.indexOf(String(11)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0018
     * @tc.name formatCross0018
     * @tc.desc Verify pad2 keeps the digits of 12 and pads below the ten boundary only.
     */
    it('formatCross0018', 0, () => {
      const text: string = pad2(12);
      expect(text).assertEqual('12');
      expect(text.length).assertEqual(2);
      expect(text.indexOf(String(12)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0019
     * @tc.name formatCross0019
     * @tc.desc Verify pad2 keeps the digits of 13 and pads below the ten boundary only.
     */
    it('formatCross0019', 0, () => {
      const text: string = pad2(13);
      expect(text).assertEqual('13');
      expect(text.length).assertEqual(2);
      expect(text.indexOf(String(13)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0020
     * @tc.name formatCross0020
     * @tc.desc Verify pad2 keeps the digits of 17 and pads below the ten boundary only.
     */
    it('formatCross0020', 0, () => {
      const text: string = pad2(17);
      expect(text).assertEqual('17');
      expect(text.length).assertEqual(2);
      expect(text.indexOf(String(17)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0021
     * @tc.name formatCross0021
     * @tc.desc Verify pad2 keeps the digits of 19 and pads below the ten boundary only.
     */
    it('formatCross0021', 0, () => {
      const text: string = pad2(19);
      expect(text).assertEqual('19');
      expect(text.length).assertEqual(2);
      expect(text.indexOf(String(19)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0022
     * @tc.name formatCross0022
     * @tc.desc Verify pad2 keeps the digits of 20 and pads below the ten boundary only.
     */
    it('formatCross0022', 0, () => {
      const text: string = pad2(20);
      expect(text).assertEqual('20');
      expect(text.length).assertEqual(2);
      expect(text.indexOf(String(20)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0023
     * @tc.name formatCross0023
     * @tc.desc Verify pad2 keeps the digits of 23 and pads below the ten boundary only.
     */
    it('formatCross0023', 0, () => {
      const text: string = pad2(23);
      expect(text).assertEqual('23');
      expect(text.length).assertEqual(2);
      expect(text.indexOf(String(23)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0024
     * @tc.name formatCross0024
     * @tc.desc Verify pad2 keeps the digits of 42 and pads below the ten boundary only.
     */
    it('formatCross0024', 0, () => {
      const text: string = pad2(42);
      expect(text).assertEqual('42');
      expect(text.length).assertEqual(2);
      expect(text.indexOf(String(42)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0025
     * @tc.name formatCross0025
     * @tc.desc Verify pad2 keeps the digits of 50 and pads below the ten boundary only.
     */
    it('formatCross0025', 0, () => {
      const text: string = pad2(50);
      expect(text).assertEqual('50');
      expect(text.length).assertEqual(2);
      expect(text.indexOf(String(50)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0026
     * @tc.name formatCross0026
     * @tc.desc Verify pad2 keeps the digits of 59 and pads below the ten boundary only.
     */
    it('formatCross0026', 0, () => {
      const text: string = pad2(59);
      expect(text).assertEqual('59');
      expect(text.length).assertEqual(2);
      expect(text.indexOf(String(59)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0027
     * @tc.name formatCross0027
     * @tc.desc Verify pad2 keeps the digits of 60 and pads below the ten boundary only.
     */
    it('formatCross0027', 0, () => {
      const text: string = pad2(60);
      expect(text).assertEqual('60');
      expect(text.length).assertEqual(2);
      expect(text.indexOf(String(60)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0028
     * @tc.name formatCross0028
     * @tc.desc Verify pad2 keeps the digits of 61 and pads below the ten boundary only.
     */
    it('formatCross0028', 0, () => {
      const text: string = pad2(61);
      expect(text).assertEqual('61');
      expect(text.length).assertEqual(2);
      expect(text.indexOf(String(61)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0029
     * @tc.name formatCross0029
     * @tc.desc Verify pad2 keeps the digits of 70 and pads below the ten boundary only.
     */
    it('formatCross0029', 0, () => {
      const text: string = pad2(70);
      expect(text).assertEqual('70');
      expect(text.length).assertEqual(2);
      expect(text.indexOf(String(70)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0030
     * @tc.name formatCross0030
     * @tc.desc Verify pad2 keeps the digits of 80 and pads below the ten boundary only.
     */
    it('formatCross0030', 0, () => {
      const text: string = pad2(80);
      expect(text).assertEqual('80');
      expect(text.length).assertEqual(2);
      expect(text.indexOf(String(80)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0031
     * @tc.name formatCross0031
     * @tc.desc Verify pad2 keeps the digits of 90 and pads below the ten boundary only.
     */
    it('formatCross0031', 0, () => {
      const text: string = pad2(90);
      expect(text).assertEqual('90');
      expect(text.length).assertEqual(2);
      expect(text.indexOf(String(90)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0032
     * @tc.name formatCross0032
     * @tc.desc Verify pad2 keeps the digits of 95 and pads below the ten boundary only.
     */
    it('formatCross0032', 0, () => {
      const text: string = pad2(95);
      expect(text).assertEqual('95');
      expect(text.length).assertEqual(2);
      expect(text.indexOf(String(95)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0033
     * @tc.name formatCross0033
     * @tc.desc Verify pad2 keeps the digits of 96 and pads below the ten boundary only.
     */
    it('formatCross0033', 0, () => {
      const text: string = pad2(96);
      expect(text).assertEqual('96');
      expect(text.length).assertEqual(2);
      expect(text.indexOf(String(96)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0034
     * @tc.name formatCross0034
     * @tc.desc Verify pad2 keeps the digits of 98 and pads below the ten boundary only.
     */
    it('formatCross0034', 0, () => {
      const text: string = pad2(98);
      expect(text).assertEqual('98');
      expect(text.length).assertEqual(2);
      expect(text.indexOf(String(98)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0035
     * @tc.name formatCross0035
     * @tc.desc Verify pad2 keeps the digits of 99 and pads below the ten boundary only.
     */
    it('formatCross0035', 0, () => {
      const text: string = pad2(99);
      expect(text).assertEqual('99');
      expect(text.length).assertEqual(2);
      expect(text.indexOf(String(99)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0036
     * @tc.name formatCross0036
     * @tc.desc Verify pad2 keeps the digits of 100 and pads below the ten boundary only.
     */
    it('formatCross0036', 0, () => {
      const text: string = pad2(100);
      expect(text).assertEqual('100');
      expect(text.length).assertEqual(3);
      expect(text.indexOf(String(100)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0037
     * @tc.name formatCross0037
     * @tc.desc Verify pad2 keeps the digits of 101 and pads below the ten boundary only.
     */
    it('formatCross0037', 0, () => {
      const text: string = pad2(101);
      expect(text).assertEqual('101');
      expect(text.length).assertEqual(3);
      expect(text.indexOf(String(101)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0038
     * @tc.name formatCross0038
     * @tc.desc Verify pad2 keeps the digits of 120 and pads below the ten boundary only.
     */
    it('formatCross0038', 0, () => {
      const text: string = pad2(120);
      expect(text).assertEqual('120');
      expect(text.length).assertEqual(3);
      expect(text.indexOf(String(120)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0039
     * @tc.name formatCross0039
     * @tc.desc Verify pad2 keeps the digits of 999 and pads below the ten boundary only.
     */
    it('formatCross0039', 0, () => {
      const text: string = pad2(999);
      expect(text).assertEqual('999');
      expect(text.length).assertEqual(3);
      expect(text.indexOf(String(999)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0040
     * @tc.name formatCross0040
     * @tc.desc Verify pad2 keeps the digits of 1000 and pads below the ten boundary only.
     */
    it('formatCross0040', 0, () => {
      const text: string = pad2(1000);
      expect(text).assertEqual('1000');
      expect(text.length).assertEqual(4);
      expect(text.indexOf(String(1000)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0041
     * @tc.name formatCross0041
     * @tc.desc Verify pad2 keeps the digits of 2026 and pads below the ten boundary only.
     */
    it('formatCross0041', 0, () => {
      const text: string = pad2(2026);
      expect(text).assertEqual('2026');
      expect(text.length).assertEqual(4);
      expect(text.indexOf(String(2026)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0042
     * @tc.name formatCross0042
     * @tc.desc Verify pad2 keeps the digits of 65535 and pads below the ten boundary only.
     */
    it('formatCross0042', 0, () => {
      const text: string = pad2(65535);
      expect(text).assertEqual('65535');
      expect(text.length).assertEqual(5);
      expect(text.indexOf(String(65535)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0043
     * @tc.name formatCross0043
     * @tc.desc Verify pad2 keeps the digits of -2026 and pads below the ten boundary only.
     */
    it('formatCross0043', 0, () => {
      const text: string = pad2(-2026);
      expect(text).assertEqual('0-2026');
      expect(text.length).assertEqual(6);
      expect(text.indexOf(String(-2026)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0044
     * @tc.name formatCross0044
     * @tc.desc Verify pad2 keeps the digits of 7 and pads below the ten boundary only.
     */
    it('formatCross0044', 0, () => {
      const text: string = pad2(7);
      expect(text).assertEqual('07');
      expect(text.length).assertEqual(2);
      expect(text.indexOf(String(7)) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0045
     * @tc.name formatCross0045
     * @tc.desc Verify formatTime renders 3:4:5 as a fixed width clock.
     */
    it('formatCross0045', 0, () => {
      const text: string = formatTime(new Date(2026, 0, 2, 3, 4, 5));
      expect(text).assertEqual('03:04:05');
      expect(text.length).assertEqual(8);
      expect(text.indexOf(':')).assertEqual(2);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0046
     * @tc.name formatCross0046
     * @tc.desc Verify formatTime renders 23:59:59 as a fixed width clock.
     */
    it('formatCross0046', 0, () => {
      const text: string = formatTime(new Date(2026, 11, 31, 23, 59, 59));
      expect(text).assertEqual('23:59:59');
      expect(text.length).assertEqual(8);
      expect(text.indexOf(':')).assertEqual(2);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0047
     * @tc.name formatCross0047
     * @tc.desc Verify formatTime renders 0:0:0 as a fixed width clock.
     */
    it('formatCross0047', 0, () => {
      const text: string = formatTime(new Date(2026, 5, 15, 0, 0, 0));
      expect(text).assertEqual('00:00:00');
      expect(text.length).assertEqual(8);
      expect(text.indexOf(':')).assertEqual(2);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0048
     * @tc.name formatCross0048
     * @tc.desc Verify formatTime renders 9:8:7 as a fixed width clock.
     */
    it('formatCross0048', 0, () => {
      const text: string = formatTime(new Date(2026, 5, 15, 9, 8, 7));
      expect(text).assertEqual('09:08:07');
      expect(text.length).assertEqual(8);
      expect(text.indexOf(':')).assertEqual(2);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0049
     * @tc.name formatCross0049
     * @tc.desc Verify formatTime renders 12:0:0 as a fixed width clock.
     */
    it('formatCross0049', 0, () => {
      const text: string = formatTime(new Date(2026, 5, 15, 12, 0, 0));
      expect(text).assertEqual('12:00:00');
      expect(text.length).assertEqual(8);
      expect(text.indexOf(':')).assertEqual(2);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0050
     * @tc.name formatCross0050
     * @tc.desc Verify formatTime renders 10:30:45 as a fixed width clock.
     */
    it('formatCross0050', 0, () => {
      const text: string = formatTime(new Date(2026, 5, 15, 10, 30, 45));
      expect(text).assertEqual('10:30:45');
      expect(text.length).assertEqual(8);
      expect(text.indexOf(':')).assertEqual(2);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0051
     * @tc.name formatCross0051
     * @tc.desc Verify formatTime renders 1:1:1 as a fixed width clock.
     */
    it('formatCross0051', 0, () => {
      const text: string = formatTime(new Date(2000, 0, 1, 1, 1, 1));
      expect(text).assertEqual('01:01:01');
      expect(text.length).assertEqual(8);
      expect(text.indexOf(':')).assertEqual(2);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0052
     * @tc.name formatCross0052
     * @tc.desc Verify formatTime renders 22:22:22 as a fixed width clock.
     */
    it('formatCross0052', 0, () => {
      const text: string = formatTime(new Date(1999, 11, 31, 22, 22, 22));
      expect(text).assertEqual('22:22:22');
      expect(text.length).assertEqual(8);
      expect(text.indexOf(':')).assertEqual(2);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0053
     * @tc.name formatCross0053
     * @tc.desc Verify formatTime renders 4:5:6 as a fixed width clock.
     */
    it('formatCross0053', 0, () => {
      const text: string = formatTime(new Date(2026, 2, 3, 4, 5, 6));
      expect(text).assertEqual('04:05:06');
      expect(text.length).assertEqual(8);
      expect(text.indexOf(':')).assertEqual(2);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0054
     * @tc.name formatCross0054
     * @tc.desc Verify formatTime renders 8:9:10 as a fixed width clock.
     */
    it('formatCross0054', 0, () => {
      const text: string = formatTime(new Date(2026, 6, 7, 8, 9, 10));
      expect(text).assertEqual('08:09:10');
      expect(text.length).assertEqual(8);
      expect(text.indexOf(':')).assertEqual(2);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0055
     * @tc.name formatCross0055
     * @tc.desc Verify formatTime renders 10:11:12 as a fixed width clock.
     */
    it('formatCross0055', 0, () => {
      const text: string = formatTime(new Date(2026, 8, 9, 10, 11, 12));
      expect(text).assertEqual('10:11:12');
      expect(text.length).assertEqual(8);
      expect(text.indexOf(':')).assertEqual(2);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0056
     * @tc.name formatCross0056
     * @tc.desc Verify formatTime renders 11:12:13 as a fixed width clock.
     */
    it('formatCross0056', 0, () => {
      const text: string = formatTime(new Date(2026, 9, 10, 11, 12, 13));
      expect(text).assertEqual('11:12:13');
      expect(text.length).assertEqual(8);
      expect(text.indexOf(':')).assertEqual(2);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0057
     * @tc.name formatCross0057
     * @tc.desc Verify formatTime renders 5:6:7 as a fixed width clock.
     */
    it('formatCross0057', 0, () => {
      const text: string = formatTime(new Date(2026, 3, 4, 5, 6, 7));
      expect(text).assertEqual('05:06:07');
      expect(text.length).assertEqual(8);
      expect(text.indexOf(':')).assertEqual(2);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0058
     * @tc.name formatCross0058
     * @tc.desc Verify formatTime renders 16:17:18 as a fixed width clock.
     */
    it('formatCross0058', 0, () => {
      const text: string = formatTime(new Date(2026, 4, 5, 16, 17, 18));
      expect(text).assertEqual('16:17:18');
      expect(text.length).assertEqual(8);
      expect(text.indexOf(':')).assertEqual(2);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0059
     * @tc.name formatCross0059
     * @tc.desc Verify formatTime renders 19:20:21 as a fixed width clock.
     */
    it('formatCross0059', 0, () => {
      const text: string = formatTime(new Date(2026, 7, 8, 19, 20, 21));
      expect(text).assertEqual('19:20:21');
      expect(text.length).assertEqual(8);
      expect(text.indexOf(':')).assertEqual(2);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0060
     * @tc.name formatCross0060
     * @tc.desc Verify formatTime renders 0:59:30 as a fixed width clock.
     */
    it('formatCross0060', 0, () => {
      const text: string = formatTime(new Date(2026, 10, 11, 0, 59, 30));
      expect(text).assertEqual('00:59:30');
      expect(text.length).assertEqual(8);
      expect(text.indexOf(':')).assertEqual(2);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0061
     * @tc.name formatCross0061
     * @tc.desc Verify formatDateTime joins the date 2026-1-2 and the clock.
     */
    it('formatCross0061', 0, () => {
      const text: string = formatDateTime(new Date(2026, 0, 2, 3, 4, 5));
      expect(text).assertEqual('2026-01-02 03:04:05');
      expect(text.length).assertEqual(19);
      expect(text.indexOf(' ')).assertEqual(10);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0062
     * @tc.name formatCross0062
     * @tc.desc Verify formatDateTime joins the date 2026-12-31 and the clock.
     */
    it('formatCross0062', 0, () => {
      const text: string = formatDateTime(new Date(2026, 11, 31, 23, 59, 59));
      expect(text).assertEqual('2026-12-31 23:59:59');
      expect(text.length).assertEqual(19);
      expect(text.indexOf(' ')).assertEqual(10);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0063
     * @tc.name formatCross0063
     * @tc.desc Verify formatDateTime joins the date 2026-6-15 and the clock.
     */
    it('formatCross0063', 0, () => {
      const text: string = formatDateTime(new Date(2026, 5, 15, 0, 0, 0));
      expect(text).assertEqual('2026-06-15 00:00:00');
      expect(text.length).assertEqual(19);
      expect(text.indexOf(' ')).assertEqual(10);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0064
     * @tc.name formatCross0064
     * @tc.desc Verify formatDateTime joins the date 2026-6-15 and the clock.
     */
    it('formatCross0064', 0, () => {
      const text: string = formatDateTime(new Date(2026, 5, 15, 9, 8, 7));
      expect(text).assertEqual('2026-06-15 09:08:07');
      expect(text.length).assertEqual(19);
      expect(text.indexOf(' ')).assertEqual(10);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0065
     * @tc.name formatCross0065
     * @tc.desc Verify formatDateTime joins the date 2026-6-15 and the clock.
     */
    it('formatCross0065', 0, () => {
      const text: string = formatDateTime(new Date(2026, 5, 15, 12, 0, 0));
      expect(text).assertEqual('2026-06-15 12:00:00');
      expect(text.length).assertEqual(19);
      expect(text.indexOf(' ')).assertEqual(10);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0066
     * @tc.name formatCross0066
     * @tc.desc Verify formatDateTime joins the date 2026-6-15 and the clock.
     */
    it('formatCross0066', 0, () => {
      const text: string = formatDateTime(new Date(2026, 5, 15, 10, 30, 45));
      expect(text).assertEqual('2026-06-15 10:30:45');
      expect(text.length).assertEqual(19);
      expect(text.indexOf(' ')).assertEqual(10);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0067
     * @tc.name formatCross0067
     * @tc.desc Verify formatDateTime joins the date 2000-1-1 and the clock.
     */
    it('formatCross0067', 0, () => {
      const text: string = formatDateTime(new Date(2000, 0, 1, 1, 1, 1));
      expect(text).assertEqual('2000-01-01 01:01:01');
      expect(text.length).assertEqual(19);
      expect(text.indexOf(' ')).assertEqual(10);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0068
     * @tc.name formatCross0068
     * @tc.desc Verify formatDateTime joins the date 1999-12-31 and the clock.
     */
    it('formatCross0068', 0, () => {
      const text: string = formatDateTime(new Date(1999, 11, 31, 22, 22, 22));
      expect(text).assertEqual('1999-12-31 22:22:22');
      expect(text.length).assertEqual(19);
      expect(text.indexOf(' ')).assertEqual(10);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0069
     * @tc.name formatCross0069
     * @tc.desc Verify formatDateTime joins the date 2026-3-3 and the clock.
     */
    it('formatCross0069', 0, () => {
      const text: string = formatDateTime(new Date(2026, 2, 3, 4, 5, 6));
      expect(text).assertEqual('2026-03-03 04:05:06');
      expect(text.length).assertEqual(19);
      expect(text.indexOf(' ')).assertEqual(10);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0070
     * @tc.name formatCross0070
     * @tc.desc Verify formatDateTime joins the date 2026-7-7 and the clock.
     */
    it('formatCross0070', 0, () => {
      const text: string = formatDateTime(new Date(2026, 6, 7, 8, 9, 10));
      expect(text).assertEqual('2026-07-07 08:09:10');
      expect(text.length).assertEqual(19);
      expect(text.indexOf(' ')).assertEqual(10);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0071
     * @tc.name formatCross0071
     * @tc.desc Verify formatDateTime joins the date 2026-9-9 and the clock.
     */
    it('formatCross0071', 0, () => {
      const text: string = formatDateTime(new Date(2026, 8, 9, 10, 11, 12));
      expect(text).assertEqual('2026-09-09 10:11:12');
      expect(text.length).assertEqual(19);
      expect(text.indexOf(' ')).assertEqual(10);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0072
     * @tc.name formatCross0072
     * @tc.desc Verify formatDateTime joins the date 2026-10-10 and the clock.
     */
    it('formatCross0072', 0, () => {
      const text: string = formatDateTime(new Date(2026, 9, 10, 11, 12, 13));
      expect(text).assertEqual('2026-10-10 11:12:13');
      expect(text.length).assertEqual(19);
      expect(text.indexOf(' ')).assertEqual(10);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0073
     * @tc.name formatCross0073
     * @tc.desc Verify formatDateTime joins the date 2026-4-4 and the clock.
     */
    it('formatCross0073', 0, () => {
      const text: string = formatDateTime(new Date(2026, 3, 4, 5, 6, 7));
      expect(text).assertEqual('2026-04-04 05:06:07');
      expect(text.length).assertEqual(19);
      expect(text.indexOf(' ')).assertEqual(10);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0074
     * @tc.name formatCross0074
     * @tc.desc Verify formatDateTime joins the date 2026-5-5 and the clock.
     */
    it('formatCross0074', 0, () => {
      const text: string = formatDateTime(new Date(2026, 4, 5, 16, 17, 18));
      expect(text).assertEqual('2026-05-05 16:17:18');
      expect(text.length).assertEqual(19);
      expect(text.indexOf(' ')).assertEqual(10);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0075
     * @tc.name formatCross0075
     * @tc.desc Verify formatDateTime joins the date 2026-8-8 and the clock.
     */
    it('formatCross0075', 0, () => {
      const text: string = formatDateTime(new Date(2026, 7, 8, 19, 20, 21));
      expect(text).assertEqual('2026-08-08 19:20:21');
      expect(text.length).assertEqual(19);
      expect(text.indexOf(' ')).assertEqual(10);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0076
     * @tc.name formatCross0076
     * @tc.desc Verify formatDateTime joins the date 2026-11-11 and the clock.
     */
    it('formatCross0076', 0, () => {
      const text: string = formatDateTime(new Date(2026, 10, 11, 0, 59, 30));
      expect(text).assertEqual('2026-11-11 00:59:30');
      expect(text.length).assertEqual(19);
      expect(text.indexOf(' ')).assertEqual(10);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0077
     * @tc.name formatCross0077
     * @tc.desc Verify formatDuration renders -1 ms with the unit that matches its magnitude.
     */
    it('formatCross0077', 0, () => {
      const text: string = formatDuration(-1);
      expect(text).assertEqual('0 ms');
      expect(text.length).assertEqual(4);
      expect(text.indexOf('ms') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0078
     * @tc.name formatCross0078
     * @tc.desc Verify formatDuration renders -1000 ms with the unit that matches its magnitude.
     */
    it('formatCross0078', 0, () => {
      const text: string = formatDuration(-1000);
      expect(text).assertEqual('0 ms');
      expect(text.length).assertEqual(4);
      expect(text.indexOf('ms') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0079
     * @tc.name formatCross0079
     * @tc.desc Verify formatDuration renders -3600000 ms with the unit that matches its magnitude.
     */
    it('formatCross0079', 0, () => {
      const text: string = formatDuration(-3600000);
      expect(text).assertEqual('0 ms');
      expect(text.length).assertEqual(4);
      expect(text.indexOf('ms') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0080
     * @tc.name formatCross0080
     * @tc.desc Verify formatDuration renders 0 ms with the unit that matches its magnitude.
     */
    it('formatCross0080', 0, () => {
      const text: string = formatDuration(0);
      expect(text).assertEqual('0 ms');
      expect(text.length).assertEqual(4);
      expect(text.indexOf('ms') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0081
     * @tc.name formatCross0081
     * @tc.desc Verify formatDuration renders 1 ms with the unit that matches its magnitude.
     */
    it('formatCross0081', 0, () => {
      const text: string = formatDuration(1);
      expect(text).assertEqual('1 ms');
      expect(text.length).assertEqual(4);
      expect(text.indexOf('ms') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0082
     * @tc.name formatCross0082
     * @tc.desc Verify formatDuration renders 9 ms with the unit that matches its magnitude.
     */
    it('formatCross0082', 0, () => {
      const text: string = formatDuration(9);
      expect(text).assertEqual('9 ms');
      expect(text.length).assertEqual(4);
      expect(text.indexOf('ms') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0083
     * @tc.name formatCross0083
     * @tc.desc Verify formatDuration renders 10 ms with the unit that matches its magnitude.
     */
    it('formatCross0083', 0, () => {
      const text: string = formatDuration(10);
      expect(text).assertEqual('10 ms');
      expect(text.length).assertEqual(5);
      expect(text.indexOf('ms') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0084
     * @tc.name formatCross0084
     * @tc.desc Verify formatDuration renders 99 ms with the unit that matches its magnitude.
     */
    it('formatCross0084', 0, () => {
      const text: string = formatDuration(99);
      expect(text).assertEqual('99 ms');
      expect(text.length).assertEqual(5);
      expect(text.indexOf('ms') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0085
     * @tc.name formatCross0085
     * @tc.desc Verify formatDuration renders 100 ms with the unit that matches its magnitude.
     */
    it('formatCross0085', 0, () => {
      const text: string = formatDuration(100);
      expect(text).assertEqual('100 ms');
      expect(text.length).assertEqual(6);
      expect(text.indexOf('ms') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0086
     * @tc.name formatCross0086
     * @tc.desc Verify formatDuration renders 500 ms with the unit that matches its magnitude.
     */
    it('formatCross0086', 0, () => {
      const text: string = formatDuration(500);
      expect(text).assertEqual('500 ms');
      expect(text.length).assertEqual(6);
      expect(text.indexOf('ms') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0087
     * @tc.name formatCross0087
     * @tc.desc Verify formatDuration renders 999 ms with the unit that matches its magnitude.
     */
    it('formatCross0087', 0, () => {
      const text: string = formatDuration(999);
      expect(text).assertEqual('999 ms');
      expect(text.length).assertEqual(6);
      expect(text.indexOf('ms') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0088
     * @tc.name formatCross0088
     * @tc.desc Verify formatDuration renders 1000 ms with the unit that matches its magnitude.
     */
    it('formatCross0088', 0, () => {
      const text: string = formatDuration(1000);
      expect(text).assertEqual('1.0 s');
      expect(text.length).assertEqual(5);
      expect(text.indexOf(' s') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0089
     * @tc.name formatCross0089
     * @tc.desc Verify formatDuration renders 1100 ms with the unit that matches its magnitude.
     */
    it('formatCross0089', 0, () => {
      const text: string = formatDuration(1100);
      expect(text).assertEqual('1.1 s');
      expect(text.length).assertEqual(5);
      expect(text.indexOf(' s') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0090
     * @tc.name formatCross0090
     * @tc.desc Verify formatDuration renders 1200 ms with the unit that matches its magnitude.
     */
    it('formatCross0090', 0, () => {
      const text: string = formatDuration(1200);
      expect(text).assertEqual('1.2 s');
      expect(text.length).assertEqual(5);
      expect(text.indexOf(' s') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0091
     * @tc.name formatCross0091
     * @tc.desc Verify formatDuration renders 1500 ms with the unit that matches its magnitude.
     */
    it('formatCross0091', 0, () => {
      const text: string = formatDuration(1500);
      expect(text).assertEqual('1.5 s');
      expect(text.length).assertEqual(5);
      expect(text.indexOf(' s') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0092
     * @tc.name formatCross0092
     * @tc.desc Verify formatDuration renders 1900 ms with the unit that matches its magnitude.
     */
    it('formatCross0092', 0, () => {
      const text: string = formatDuration(1900);
      expect(text).assertEqual('1.9 s');
      expect(text.length).assertEqual(5);
      expect(text.indexOf(' s') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0093
     * @tc.name formatCross0093
     * @tc.desc Verify formatDuration renders 2000 ms with the unit that matches its magnitude.
     */
    it('formatCross0093', 0, () => {
      const text: string = formatDuration(2000);
      expect(text).assertEqual('2.0 s');
      expect(text.length).assertEqual(5);
      expect(text.indexOf(' s') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0094
     * @tc.name formatCross0094
     * @tc.desc Verify formatDuration renders 2500 ms with the unit that matches its magnitude.
     */
    it('formatCross0094', 0, () => {
      const text: string = formatDuration(2500);
      expect(text).assertEqual('2.5 s');
      expect(text.length).assertEqual(5);
      expect(text.indexOf(' s') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0095
     * @tc.name formatCross0095
     * @tc.desc Verify formatDuration renders 3000 ms with the unit that matches its magnitude.
     */
    it('formatCross0095', 0, () => {
      const text: string = formatDuration(3000);
      expect(text).assertEqual('3.0 s');
      expect(text.length).assertEqual(5);
      expect(text.indexOf(' s') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0096
     * @tc.name formatCross0096
     * @tc.desc Verify formatDuration renders 5000 ms with the unit that matches its magnitude.
     */
    it('formatCross0096', 0, () => {
      const text: string = formatDuration(5000);
      expect(text).assertEqual('5.0 s');
      expect(text.length).assertEqual(5);
      expect(text.indexOf(' s') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0097
     * @tc.name formatCross0097
     * @tc.desc Verify formatDuration renders 9500 ms with the unit that matches its magnitude.
     */
    it('formatCross0097', 0, () => {
      const text: string = formatDuration(9500);
      expect(text).assertEqual('9.5 s');
      expect(text.length).assertEqual(5);
      expect(text.indexOf(' s') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0098
     * @tc.name formatCross0098
     * @tc.desc Verify formatDuration renders 10000 ms with the unit that matches its magnitude.
     */
    it('formatCross0098', 0, () => {
      const text: string = formatDuration(10000);
      expect(text).assertEqual('10.0 s');
      expect(text.length).assertEqual(6);
      expect(text.indexOf(' s') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0099
     * @tc.name formatCross0099
     * @tc.desc Verify formatDuration renders 15000 ms with the unit that matches its magnitude.
     */
    it('formatCross0099', 0, () => {
      const text: string = formatDuration(15000);
      expect(text).assertEqual('15.0 s');
      expect(text.length).assertEqual(6);
      expect(text.indexOf(' s') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0100
     * @tc.name formatCross0100
     * @tc.desc Verify formatDuration renders 30000 ms with the unit that matches its magnitude.
     */
    it('formatCross0100', 0, () => {
      const text: string = formatDuration(30000);
      expect(text).assertEqual('30.0 s');
      expect(text.length).assertEqual(6);
      expect(text.indexOf(' s') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0101
     * @tc.name formatCross0101
     * @tc.desc Verify formatDuration renders 59800 ms with the unit that matches its magnitude.
     */
    it('formatCross0101', 0, () => {
      const text: string = formatDuration(59800);
      expect(text).assertEqual('59.8 s');
      expect(text.length).assertEqual(6);
      expect(text.indexOf(' s') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0102
     * @tc.name formatCross0102
     * @tc.desc Verify formatDuration renders 60000 ms with the unit that matches its magnitude.
     */
    it('formatCross0102', 0, () => {
      const text: string = formatDuration(60000);
      expect(text).assertEqual('1 min 0 s');
      expect(text.length).assertEqual(9);
      expect(text.indexOf(' s') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0103
     * @tc.name formatCross0103
     * @tc.desc Verify formatDuration renders 60001 ms with the unit that matches its magnitude.
     */
    it('formatCross0103', 0, () => {
      const text: string = formatDuration(60001);
      expect(text).assertEqual('1 min 0 s');
      expect(text.length).assertEqual(9);
      expect(text.indexOf(' s') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0104
     * @tc.name formatCross0104
     * @tc.desc Verify formatDuration renders 61000 ms with the unit that matches its magnitude.
     */
    it('formatCross0104', 0, () => {
      const text: string = formatDuration(61000);
      expect(text).assertEqual('1 min 1 s');
      expect(text.length).assertEqual(9);
      expect(text.indexOf(' s') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0105
     * @tc.name formatCross0105
     * @tc.desc Verify formatDuration renders 65000 ms with the unit that matches its magnitude.
     */
    it('formatCross0105', 0, () => {
      const text: string = formatDuration(65000);
      expect(text).assertEqual('1 min 5 s');
      expect(text.length).assertEqual(9);
      expect(text.indexOf(' s') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0106
     * @tc.name formatCross0106
     * @tc.desc Verify formatDuration renders 90000 ms with the unit that matches its magnitude.
     */
    it('formatCross0106', 0, () => {
      const text: string = formatDuration(90000);
      expect(text).assertEqual('1 min 30 s');
      expect(text.length).assertEqual(10);
      expect(text.indexOf(' s') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0107
     * @tc.name formatCross0107
     * @tc.desc Verify formatDuration renders 119000 ms with the unit that matches its magnitude.
     */
    it('formatCross0107', 0, () => {
      const text: string = formatDuration(119000);
      expect(text).assertEqual('1 min 59 s');
      expect(text.length).assertEqual(10);
      expect(text.indexOf(' s') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0108
     * @tc.name formatCross0108
     * @tc.desc Verify formatDuration renders 120000 ms with the unit that matches its magnitude.
     */
    it('formatCross0108', 0, () => {
      const text: string = formatDuration(120000);
      expect(text).assertEqual('2 min 0 s');
      expect(text.length).assertEqual(9);
      expect(text.indexOf(' s') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0109
     * @tc.name formatCross0109
     * @tc.desc Verify formatDuration renders 121000 ms with the unit that matches its magnitude.
     */
    it('formatCross0109', 0, () => {
      const text: string = formatDuration(121000);
      expect(text).assertEqual('2 min 1 s');
      expect(text.length).assertEqual(9);
      expect(text.indexOf(' s') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0110
     * @tc.name formatCross0110
     * @tc.desc Verify formatDuration renders 125000 ms with the unit that matches its magnitude.
     */
    it('formatCross0110', 0, () => {
      const text: string = formatDuration(125000);
      expect(text).assertEqual('2 min 5 s');
      expect(text.length).assertEqual(9);
      expect(text.indexOf(' s') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0111
     * @tc.name formatCross0111
     * @tc.desc Verify formatDuration renders 600000 ms with the unit that matches its magnitude.
     */
    it('formatCross0111', 0, () => {
      const text: string = formatDuration(600000);
      expect(text).assertEqual('10 min 0 s');
      expect(text.length).assertEqual(10);
      expect(text.indexOf(' s') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0112
     * @tc.name formatCross0112
     * @tc.desc Verify formatDuration renders 601000 ms with the unit that matches its magnitude.
     */
    it('formatCross0112', 0, () => {
      const text: string = formatDuration(601000);
      expect(text).assertEqual('10 min 1 s');
      expect(text.length).assertEqual(10);
      expect(text.indexOf(' s') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0113
     * @tc.name formatCross0113
     * @tc.desc Verify formatDuration renders 1800000 ms with the unit that matches its magnitude.
     */
    it('formatCross0113', 0, () => {
      const text: string = formatDuration(1800000);
      expect(text).assertEqual('30 min 0 s');
      expect(text.length).assertEqual(10);
      expect(text.indexOf(' s') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0114
     * @tc.name formatCross0114
     * @tc.desc Verify formatDuration renders 3599000 ms with the unit that matches its magnitude.
     */
    it('formatCross0114', 0, () => {
      const text: string = formatDuration(3599000);
      expect(text).assertEqual('59 min 59 s');
      expect(text.length).assertEqual(11);
      expect(text.indexOf(' s') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0115
     * @tc.name formatCross0115
     * @tc.desc Verify formatDuration renders 3600000 ms with the unit that matches its magnitude.
     */
    it('formatCross0115', 0, () => {
      const text: string = formatDuration(3600000);
      expect(text).assertEqual('60 min 0 s');
      expect(text.length).assertEqual(10);
      expect(text.indexOf(' s') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0116
     * @tc.name formatCross0116
     * @tc.desc Verify formatDuration renders 3601000 ms with the unit that matches its magnitude.
     */
    it('formatCross0116', 0, () => {
      const text: string = formatDuration(3601000);
      expect(text).assertEqual('60 min 1 s');
      expect(text.length).assertEqual(10);
      expect(text.indexOf(' s') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0117
     * @tc.name formatCross0117
     * @tc.desc Verify formatDuration renders 7265000 ms with the unit that matches its magnitude.
     */
    it('formatCross0117', 0, () => {
      const text: string = formatDuration(7265000);
      expect(text).assertEqual('121 min 5 s');
      expect(text.length).assertEqual(11);
      expect(text.indexOf(' s') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0118
     * @tc.name formatCross0118
     * @tc.desc Verify formatDuration renders 86400000 ms with the unit that matches its magnitude.
     */
    it('formatCross0118', 0, () => {
      const text: string = formatDuration(86400000);
      expect(text).assertEqual('1440 min 0 s');
      expect(text.length).assertEqual(12);
      expect(text.indexOf(' s') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0119
     * @tc.name formatCross0119
     * @tc.desc Verify formatDuration renders 90061000 ms with the unit that matches its magnitude.
     */
    it('formatCross0119', 0, () => {
      const text: string = formatDuration(90061000);
      expect(text).assertEqual('1501 min 1 s');
      expect(text.length).assertEqual(12);
      expect(text.indexOf(' s') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0120
     * @tc.name formatCross0120
     * @tc.desc Verify formatDuration renders 90059999 ms with the unit that matches its magnitude.
     */
    it('formatCross0120', 0, () => {
      const text: string = formatDuration(90059999);
      expect(text).assertEqual('1500 min 59 s');
      expect(text.length).assertEqual(13);
      expect(text.indexOf(' s') >= 0).assertTrue();
    });

  });
}
