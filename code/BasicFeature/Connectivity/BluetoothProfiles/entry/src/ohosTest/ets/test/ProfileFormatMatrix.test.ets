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
 * 时间与文本格式化矩阵。
 *
 * pad2 是另外三个格式化函数的公共底座，因此单独覆盖两位边界与负数；
 * formatTime / formatDateTime 断言定长输出，formatDuration 覆盖四个单位区间，
 * truncateMiddle 覆盖「最大长度过小」「无需截断」「需要截断」三类分支。
 */

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import {
  formatDateTime,
  formatDuration,
  formatTime,
  pad2,
  truncateMiddle
} from '../../../main/ets/utils/FormatUtil';

export default function bluetoothProfileFormatMatrixTest() {
  describe('BluetoothProfileFormatMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0001
     * @tc.name formatMatrix0001
     * @tc.desc Verify pad2 for 0 returns "00" with a stable width for two digit values.
     */
    it('formatMatrix0001', 0, () => {
      expect(pad2(0)).assertEqual('00');
      expect(pad2(0).length).assertEqual(2);
      expect(pad2(100)).assertEqual('100');
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0002
     * @tc.name formatMatrix0002
     * @tc.desc Verify pad2 for 1 returns "01" with a stable width for two digit values.
     */
    it('formatMatrix0002', 0, () => {
      expect(pad2(1)).assertEqual('01');
      expect(pad2(1).length).assertEqual(2);
      expect(pad2(101)).assertEqual('101');
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0003
     * @tc.name formatMatrix0003
     * @tc.desc Verify pad2 for 5 returns "05" with a stable width for two digit values.
     */
    it('formatMatrix0003', 0, () => {
      expect(pad2(5)).assertEqual('05');
      expect(pad2(5).length).assertEqual(2);
      expect(pad2(105)).assertEqual('105');
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0004
     * @tc.name formatMatrix0004
     * @tc.desc Verify pad2 for 9 returns "09" with a stable width for two digit values.
     */
    it('formatMatrix0004', 0, () => {
      expect(pad2(9)).assertEqual('09');
      expect(pad2(9).length).assertEqual(2);
      expect(pad2(109)).assertEqual('109');
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0005
     * @tc.name formatMatrix0005
     * @tc.desc Verify pad2 for 10 returns "10" with a stable width for two digit values.
     */
    it('formatMatrix0005', 0, () => {
      expect(pad2(10)).assertEqual('10');
      expect(pad2(10).length).assertEqual(2);
      expect(pad2(110)).assertEqual('110');
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0006
     * @tc.name formatMatrix0006
     * @tc.desc Verify pad2 for 11 returns "11" with a stable width for two digit values.
     */
    it('formatMatrix0006', 0, () => {
      expect(pad2(11)).assertEqual('11');
      expect(pad2(11).length).assertEqual(2);
      expect(pad2(111)).assertEqual('111');
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0007
     * @tc.name formatMatrix0007
     * @tc.desc Verify pad2 for 59 returns "59" with a stable width for two digit values.
     */
    it('formatMatrix0007', 0, () => {
      expect(pad2(59)).assertEqual('59');
      expect(pad2(59).length).assertEqual(2);
      expect(pad2(159)).assertEqual('159');
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0008
     * @tc.name formatMatrix0008
     * @tc.desc Verify pad2 for 99 returns "99" with a stable width for two digit values.
     */
    it('formatMatrix0008', 0, () => {
      expect(pad2(99)).assertEqual('99');
      expect(pad2(99).length).assertEqual(2);
      expect(pad2(199)).assertEqual('199');
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0009
     * @tc.name formatMatrix0009
     * @tc.desc Verify pad2 for 100 returns "100" with a stable width for two digit values.
     */
    it('formatMatrix0009', 0, () => {
      expect(pad2(100)).assertEqual('100');
      expect(pad2(100).length).assertEqual(3);
      expect(pad2(200)).assertEqual('200');
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0010
     * @tc.name formatMatrix0010
     * @tc.desc Verify pad2 for -1 returns "0-1" with a stable width for two digit values.
     */
    it('formatMatrix0010', 0, () => {
      expect(pad2(-1)).assertEqual('0-1');
      expect(pad2(-1).length).assertEqual(3);
      expect(pad2(99)).assertEqual('99');
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0011
     * @tc.name formatMatrix0011
     * @tc.desc Verify formatTime for 0:0:0 returns "00:00:00".
     */
    it('formatMatrix0011', 0, () => {
      const value: Date = new Date(2026, 0, 2, 0, 0, 0);
      expect(formatTime(value)).assertEqual('00:00:00');
      expect(formatTime(value).length).assertEqual(8);
      expect(formatTime(value).indexOf(':')).assertEqual(2);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0012
     * @tc.name formatMatrix0012
     * @tc.desc Verify formatTime for 23:59:59 returns "23:59:59".
     */
    it('formatMatrix0012', 0, () => {
      const value: Date = new Date(2026, 0, 2, 23, 59, 59);
      expect(formatTime(value)).assertEqual('23:59:59');
      expect(formatTime(value).length).assertEqual(8);
      expect(formatTime(value).indexOf(':')).assertEqual(2);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0013
     * @tc.name formatMatrix0013
     * @tc.desc Verify formatTime for 1:2:3 returns "01:02:03".
     */
    it('formatMatrix0013', 0, () => {
      const value: Date = new Date(2026, 0, 2, 1, 2, 3);
      expect(formatTime(value)).assertEqual('01:02:03');
      expect(formatTime(value).length).assertEqual(8);
      expect(formatTime(value).indexOf(':')).assertEqual(2);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0014
     * @tc.name formatMatrix0014
     * @tc.desc Verify formatTime for 9:9:9 returns "09:09:09".
     */
    it('formatMatrix0014', 0, () => {
      const value: Date = new Date(2026, 0, 2, 9, 9, 9);
      expect(formatTime(value)).assertEqual('09:09:09');
      expect(formatTime(value).length).assertEqual(8);
      expect(formatTime(value).indexOf(':')).assertEqual(2);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0015
     * @tc.name formatMatrix0015
     * @tc.desc Verify formatTime for 10:10:10 returns "10:10:10".
     */
    it('formatMatrix0015', 0, () => {
      const value: Date = new Date(2026, 0, 2, 10, 10, 10);
      expect(formatTime(value)).assertEqual('10:10:10');
      expect(formatTime(value).length).assertEqual(8);
      expect(formatTime(value).indexOf(':')).assertEqual(2);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0016
     * @tc.name formatMatrix0016
     * @tc.desc Verify formatTime for 12:30:45 returns "12:30:45".
     */
    it('formatMatrix0016', 0, () => {
      const value: Date = new Date(2026, 0, 2, 12, 30, 45);
      expect(formatTime(value)).assertEqual('12:30:45');
      expect(formatTime(value).length).assertEqual(8);
      expect(formatTime(value).indexOf(':')).assertEqual(2);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0017
     * @tc.name formatMatrix0017
     * @tc.desc Verify formatTime for 5:15:25 returns "05:15:25".
     */
    it('formatMatrix0017', 0, () => {
      const value: Date = new Date(2026, 0, 2, 5, 15, 25);
      expect(formatTime(value)).assertEqual('05:15:25');
      expect(formatTime(value).length).assertEqual(8);
      expect(formatTime(value).indexOf(':')).assertEqual(2);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0018
     * @tc.name formatMatrix0018
     * @tc.desc Verify formatTime for 20:4:7 returns "20:04:07".
     */
    it('formatMatrix0018', 0, () => {
      const value: Date = new Date(2026, 0, 2, 20, 4, 7);
      expect(formatTime(value)).assertEqual('20:04:07');
      expect(formatTime(value).length).assertEqual(8);
      expect(formatTime(value).indexOf(':')).assertEqual(2);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0019
     * @tc.name formatMatrix0019
     * @tc.desc Verify formatDateTime renders 2026-01-02 with the zero padded clock part.
     */
    it('formatMatrix0019', 0, () => {
      const value: Date = new Date(2026, 0, 2, 3, 4, 5);
      expect(formatDateTime(value)).assertEqual('2026-01-02 03:04:05');
      expect(formatDateTime(value).length).assertEqual(19);
      expect(formatDateTime(value).charAt(4)).assertEqual('-');
      expect(formatDateTime(value).charAt(7)).assertEqual('-');
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0020
     * @tc.name formatMatrix0020
     * @tc.desc Verify formatDateTime renders 2026-12-31 with the zero padded clock part.
     */
    it('formatMatrix0020', 0, () => {
      const value: Date = new Date(2026, 11, 31, 23, 59, 59);
      expect(formatDateTime(value)).assertEqual('2026-12-31 23:59:59');
      expect(formatDateTime(value).length).assertEqual(19);
      expect(formatDateTime(value).charAt(4)).assertEqual('-');
      expect(formatDateTime(value).charAt(7)).assertEqual('-');
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0021
     * @tc.name formatMatrix0021
     * @tc.desc Verify formatDateTime renders 2000-06-15 with the zero padded clock part.
     */
    it('formatMatrix0021', 0, () => {
      const value: Date = new Date(2000, 5, 15, 0, 0, 0);
      expect(formatDateTime(value)).assertEqual('2000-06-15 00:00:00');
      expect(formatDateTime(value).length).assertEqual(19);
      expect(formatDateTime(value).charAt(4)).assertEqual('-');
      expect(formatDateTime(value).charAt(7)).assertEqual('-');
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0022
     * @tc.name formatMatrix0022
     * @tc.desc Verify formatDateTime renders 1999-12-09 with the zero padded clock part.
     */
    it('formatMatrix0022', 0, () => {
      const value: Date = new Date(1999, 11, 9, 9, 8, 7);
      expect(formatDateTime(value)).assertEqual('1999-12-09 09:08:07');
      expect(formatDateTime(value).length).assertEqual(19);
      expect(formatDateTime(value).charAt(4)).assertEqual('-');
      expect(formatDateTime(value).charAt(7)).assertEqual('-');
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0023
     * @tc.name formatMatrix0023
     * @tc.desc Verify formatDateTime renders 2100-01-01 with the zero padded clock part.
     */
    it('formatMatrix0023', 0, () => {
      const value: Date = new Date(2100, 0, 1, 12, 0, 0);
      expect(formatDateTime(value)).assertEqual('2100-01-01 12:00:00');
      expect(formatDateTime(value).length).assertEqual(19);
      expect(formatDateTime(value).charAt(4)).assertEqual('-');
      expect(formatDateTime(value).charAt(7)).assertEqual('-');
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0024
     * @tc.name formatMatrix0024
     * @tc.desc Verify formatDateTime renders 2024-02-29 with the zero padded clock part.
     */
    it('formatMatrix0024', 0, () => {
      const value: Date = new Date(2024, 1, 29, 18, 30, 45);
      expect(formatDateTime(value)).assertEqual('2024-02-29 18:30:45');
      expect(formatDateTime(value).length).assertEqual(19);
      expect(formatDateTime(value).charAt(4)).assertEqual('-');
      expect(formatDateTime(value).charAt(7)).assertEqual('-');
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0025
     * @tc.name formatMatrix0025
     * @tc.desc Verify formatDuration for -5000 ms returns "0 ms" in the matching unit.
     */
    it('formatMatrix0025', 0, () => {
      expect(formatDuration(-5000)).assertEqual('0 ms');
      expect(formatDuration(-5000).length).assertEqual(4);
      expect(formatDuration(-5000) === formatDuration(-4999)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0026
     * @tc.name formatMatrix0026
     * @tc.desc Verify formatDuration for -1 ms returns "0 ms" in the matching unit.
     */
    it('formatMatrix0026', 0, () => {
      expect(formatDuration(-1)).assertEqual('0 ms');
      expect(formatDuration(-1).length).assertEqual(4);
      expect(formatDuration(-1) === formatDuration(0)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0027
     * @tc.name formatMatrix0027
     * @tc.desc Verify formatDuration for 0 ms returns "0 ms" in the matching unit.
     */
    it('formatMatrix0027', 0, () => {
      expect(formatDuration(0)).assertEqual('0 ms');
      expect(formatDuration(0).length).assertEqual(4);
      expect(formatDuration(0) === formatDuration(1)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0028
     * @tc.name formatMatrix0028
     * @tc.desc Verify formatDuration for 1 ms returns "1 ms" in the matching unit.
     */
    it('formatMatrix0028', 0, () => {
      expect(formatDuration(1)).assertEqual('1 ms');
      expect(formatDuration(1).length).assertEqual(4);
      expect(formatDuration(1) === formatDuration(2)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0029
     * @tc.name formatMatrix0029
     * @tc.desc Verify formatDuration for 500 ms returns "500 ms" in the matching unit.
     */
    it('formatMatrix0029', 0, () => {
      expect(formatDuration(500)).assertEqual('500 ms');
      expect(formatDuration(500).length).assertEqual(6);
      expect(formatDuration(500) === formatDuration(501)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0030
     * @tc.name formatMatrix0030
     * @tc.desc Verify formatDuration for 999 ms returns "999 ms" in the matching unit.
     */
    it('formatMatrix0030', 0, () => {
      expect(formatDuration(999)).assertEqual('999 ms');
      expect(formatDuration(999).length).assertEqual(6);
      expect(formatDuration(999) === formatDuration(1000)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0031
     * @tc.name formatMatrix0031
     * @tc.desc Verify formatDuration for 1000 ms returns "1.0 s" in the matching unit.
     */
    it('formatMatrix0031', 0, () => {
      expect(formatDuration(1000)).assertEqual('1.0 s');
      expect(formatDuration(1000).length).assertEqual(5);
      expect(formatDuration(1000) === formatDuration(1001)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0032
     * @tc.name formatMatrix0032
     * @tc.desc Verify formatDuration for 1500 ms returns "1.5 s" in the matching unit.
     */
    it('formatMatrix0032', 0, () => {
      expect(formatDuration(1500)).assertEqual('1.5 s');
      expect(formatDuration(1500).length).assertEqual(5);
      expect(formatDuration(1500) === formatDuration(1501)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0033
     * @tc.name formatMatrix0033
     * @tc.desc Verify formatDuration for 59999 ms returns "60.0 s" in the matching unit.
     */
    it('formatMatrix0033', 0, () => {
      expect(formatDuration(59999)).assertEqual('60.0 s');
      expect(formatDuration(59999).length).assertEqual(6);
      expect(formatDuration(59999) === formatDuration(60000)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0034
     * @tc.name formatMatrix0034
     * @tc.desc Verify formatDuration for 60000 ms returns "1 min 0 s" in the matching unit.
     */
    it('formatMatrix0034', 0, () => {
      expect(formatDuration(60000)).assertEqual('1 min 0 s');
      expect(formatDuration(60000).length).assertEqual(9);
      expect(formatDuration(60000) === formatDuration(60001)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0035
     * @tc.name formatMatrix0035
     * @tc.desc Verify formatDuration for 61000 ms returns "1 min 1 s" in the matching unit.
     */
    it('formatMatrix0035', 0, () => {
      expect(formatDuration(61000)).assertEqual('1 min 1 s');
      expect(formatDuration(61000).length).assertEqual(9);
      expect(formatDuration(61000) === formatDuration(61001)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0036
     * @tc.name formatMatrix0036
     * @tc.desc Verify formatDuration for 125000 ms returns "2 min 5 s" in the matching unit.
     */
    it('formatMatrix0036', 0, () => {
      expect(formatDuration(125000)).assertEqual('2 min 5 s');
      expect(formatDuration(125000).length).assertEqual(9);
      expect(formatDuration(125000) === formatDuration(125001)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0037
     * @tc.name formatMatrix0037
     * @tc.desc Verify formatDuration for 3599999 ms returns "59 min 59 s" in the matching unit.
     */
    it('formatMatrix0037', 0, () => {
      expect(formatDuration(3599999)).assertEqual('59 min 59 s');
      expect(formatDuration(3599999).length).assertEqual(11);
      expect(formatDuration(3599999) === formatDuration(3600000)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0038
     * @tc.name formatMatrix0038
     * @tc.desc Verify formatDuration for 3600000 ms returns "60 min 0 s" in the matching unit.
     */
    it('formatMatrix0038', 0, () => {
      expect(formatDuration(3600000)).assertEqual('60 min 0 s');
      expect(formatDuration(3600000).length).assertEqual(10);
      expect(formatDuration(3600000) === formatDuration(3600001)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0039
     * @tc.name formatMatrix0039
     * @tc.desc Verify truncateMiddle with max 0 keeps the requested shape for a 10 char text.
     */
    it('formatMatrix0039', 0, () => {
      expect(truncateMiddle('ABCDEFGHIJ', 0)).assertEqual('ABCDEFGHIJ');
      expect(truncateMiddle('ABCDEFGHIJ', 0).length).assertEqual(10);
      expect(truncateMiddle('ABCDEFGHIJ', 0) === 'ABCDEFGHIJ').assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0040
     * @tc.name formatMatrix0040
     * @tc.desc Verify truncateMiddle with max 1 keeps the requested shape for a 10 char text.
     */
    it('formatMatrix0040', 0, () => {
      expect(truncateMiddle('ABCDEFGHIJ', 1)).assertEqual('ABCDEFGHIJ');
      expect(truncateMiddle('ABCDEFGHIJ', 1).length).assertEqual(10);
      expect(truncateMiddle('ABCDEFGHIJ', 1) === 'ABCDEFGHIJ').assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0041
     * @tc.name formatMatrix0041
     * @tc.desc Verify truncateMiddle with max 3 keeps the requested shape for a 10 char text.
     */
    it('formatMatrix0041', 0, () => {
      expect(truncateMiddle('ABCDEFGHIJ', 3)).assertEqual('ABCDEFGHIJ');
      expect(truncateMiddle('ABCDEFGHIJ', 3).length).assertEqual(10);
      expect(truncateMiddle('ABCDEFGHIJ', 3) === 'ABCDEFGHIJ').assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0042
     * @tc.name formatMatrix0042
     * @tc.desc Verify truncateMiddle with max 4 keeps the requested shape for a 10 char text.
     */
    it('formatMatrix0042', 0, () => {
      expect(truncateMiddle('ABCDEFGHIJ', 4)).assertEqual('AB…J');
      expect(truncateMiddle('ABCDEFGHIJ', 4).length).assertEqual(4);
      expect(truncateMiddle('ABCDEFGHIJ', 4) === 'ABCDEFGHIJ').assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0043
     * @tc.name formatMatrix0043
     * @tc.desc Verify truncateMiddle with max 5 keeps the requested shape for a 10 char text.
     */
    it('formatMatrix0043', 0, () => {
      expect(truncateMiddle('ABCDEFGHIJ', 5)).assertEqual('AB…IJ');
      expect(truncateMiddle('ABCDEFGHIJ', 5).length).assertEqual(5);
      expect(truncateMiddle('ABCDEFGHIJ', 5) === 'ABCDEFGHIJ').assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0044
     * @tc.name formatMatrix0044
     * @tc.desc Verify truncateMiddle with max 6 keeps the requested shape for a 10 char text.
     */
    it('formatMatrix0044', 0, () => {
      expect(truncateMiddle('ABCDEFGHIJ', 6)).assertEqual('ABC…IJ');
      expect(truncateMiddle('ABCDEFGHIJ', 6).length).assertEqual(6);
      expect(truncateMiddle('ABCDEFGHIJ', 6) === 'ABCDEFGHIJ').assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0045
     * @tc.name formatMatrix0045
     * @tc.desc Verify truncateMiddle with max 9 keeps the requested shape for a 10 char text.
     */
    it('formatMatrix0045', 0, () => {
      expect(truncateMiddle('ABCDEFGHIJ', 9)).assertEqual('ABCD…GHIJ');
      expect(truncateMiddle('ABCDEFGHIJ', 9).length).assertEqual(9);
      expect(truncateMiddle('ABCDEFGHIJ', 9) === 'ABCDEFGHIJ').assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0046
     * @tc.name formatMatrix0046
     * @tc.desc Verify truncateMiddle with max 10 keeps the requested shape for a 10 char text.
     */
    it('formatMatrix0046', 0, () => {
      expect(truncateMiddle('ABCDEFGHIJ', 10)).assertEqual('ABCDEFGHIJ');
      expect(truncateMiddle('ABCDEFGHIJ', 10).length).assertEqual(10);
      expect(truncateMiddle('ABCDEFGHIJ', 10) === 'ABCDEFGHIJ').assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0047
     * @tc.name formatMatrix0047
     * @tc.desc Verify truncateMiddle with max 11 keeps the requested shape for a 10 char text.
     */
    it('formatMatrix0047', 0, () => {
      expect(truncateMiddle('ABCDEFGHIJ', 11)).assertEqual('ABCDEFGHIJ');
      expect(truncateMiddle('ABCDEFGHIJ', 11).length).assertEqual(10);
      expect(truncateMiddle('ABCDEFGHIJ', 11) === 'ABCDEFGHIJ').assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0048
     * @tc.name formatMatrix0048
     * @tc.desc Verify truncateMiddle with max 5 keeps the requested shape for a 1 char text.
     */
    it('formatMatrix0048', 0, () => {
      expect(truncateMiddle('A', 5)).assertEqual('A');
      expect(truncateMiddle('A', 5).length).assertEqual(1);
      expect(truncateMiddle('A', 5) === 'A').assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0049
     * @tc.name formatMatrix0049
     * @tc.desc Verify truncateMiddle with max 5 keeps the requested shape for a 0 char text.
     */
    it('formatMatrix0049', 0, () => {
      expect(truncateMiddle('', 5)).assertEqual('');
      expect(truncateMiddle('', 5).length).assertEqual(0);
      expect(truncateMiddle('', 5) === '').assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0050
     * @tc.name formatMatrix0050
     * @tc.desc Verify truncateMiddle with max 20 keeps the requested shape for a 17 char text.
     */
    it('formatMatrix0050', 0, () => {
      expect(truncateMiddle('A1:B2:C3:D4:E5:F6', 20)).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(truncateMiddle('A1:B2:C3:D4:E5:F6', 20).length).assertEqual(17);
      expect(truncateMiddle('A1:B2:C3:D4:E5:F6', 20) === 'A1:B2:C3:D4:E5:F6').assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0051
     * @tc.name formatMatrix0051
     * @tc.desc Verify truncateMiddle with max 12 keeps the requested shape for a 17 char text.
     */
    it('formatMatrix0051', 0, () => {
      expect(truncateMiddle('A1:B2:C3:D4:E5:F6', 12)).assertEqual('A1:B2:…E5:F6');
      expect(truncateMiddle('A1:B2:C3:D4:E5:F6', 12).length).assertEqual(12);
      expect(truncateMiddle('A1:B2:C3:D4:E5:F6', 12) === 'A1:B2:C3:D4:E5:F6').assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0052
     * @tc.name formatMatrix0052
     * @tc.desc Verify truncateMiddle with max 8 keeps the requested shape for a 17 char text.
     */
    it('formatMatrix0052', 0, () => {
      expect(truncateMiddle('A1:B2:C3:D4:E5:F6', 8)).assertEqual('A1:B…:F6');
      expect(truncateMiddle('A1:B2:C3:D4:E5:F6', 8).length).assertEqual(8);
      expect(truncateMiddle('A1:B2:C3:D4:E5:F6', 8) === 'A1:B2:C3:D4:E5:F6').assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0053
     * @tc.name formatMatrix0053
     * @tc.desc Verify truncateMiddle with max 10 keeps the requested shape for a 18 char text.
     */
    it('formatMatrix0053', 0, () => {
      expect(truncateMiddle('ag profile created', 10)).assertEqual('ag pr…ated');
      expect(truncateMiddle('ag profile created', 10).length).assertEqual(10);
      expect(truncateMiddle('ag profile created', 10) === 'ag profile created').assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FORMAT_0054
     * @tc.name formatMatrix0054
     * @tc.desc Verify truncateMiddle with max 4 keeps the requested shape for a 18 char text.
     */
    it('formatMatrix0054', 0, () => {
      expect(truncateMiddle('ag profile created', 4)).assertEqual('ag…d');
      expect(truncateMiddle('ag profile created', 4).length).assertEqual(4);
      expect(truncateMiddle('ag profile created', 4) === 'ag profile created').assertEqual(false);
    });
  });
}
