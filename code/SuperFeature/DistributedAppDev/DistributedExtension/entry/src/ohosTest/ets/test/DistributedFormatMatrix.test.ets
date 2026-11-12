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

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { formatDateTime, formatDuration, formatTime, pad2, truncateMiddle } from '../../../main/ets/utils/FormatUtil';

/**
 * 时间与文本格式化：日志条纹的时间戳、探测耗时与设备地址都经过这几个函数。
 * 补零漏掉会让同一列时间宽度不一致，耗时分段写错会把 60 s 显示成 0 min，因此逐段验证。
 */
export default function distributedFormatMatrixTest() {
  describe('DistributedFormatMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FORMAT_0100
     * @tc.name testFormat0001
     * @tc.desc Verify pad2 pads single digits and leaves wider values alone.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormat0001', 0, () => {
      expect(pad2(0)).assertEqual('00');
      expect(pad2(5)).assertEqual('05');
      expect(pad2(9)).assertEqual('09');
      expect(pad2(10)).assertEqual('10');
      expect(pad2(59)).assertEqual('59');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FORMAT_0200
     * @tc.name testFormat0002
     * @tc.desc Verify pad2 does not truncate three digit or negative values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testFormat0002', 0, () => {
      expect(pad2(100)).assertEqual('100');
      expect(pad2(-1)).assertEqual('0-1');
      expect(pad2(-1).length).assertEqual(3);
      expect(pad2(100).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FORMAT_0300
     * @tc.name testFormat0003
     * @tc.desc Verify formatTime renders a fixed clock as HH:mm:ss.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormat0003', 0, () => {
      expect(formatTime(new Date(2026, 0, 2, 3, 4, 5))).assertEqual('03:04:05');
      expect(formatTime(new Date(2026, 0, 2, 0, 0, 0))).assertEqual('00:00:00');
      expect(formatTime(new Date(2026, 0, 2, 23, 59, 59))).assertEqual('23:59:59');
      expect(formatTime(new Date(2026, 0, 2, 12, 30, 45)).length).assertEqual(8);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FORMAT_0400
     * @tc.name testFormat0004
     * @tc.desc Verify formatDateTime renders a zero padded date followed by the clock.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormat0004', 0, () => {
      expect(formatDateTime(new Date(2026, 0, 2, 3, 4, 5))).assertEqual('2026-01-02 03:04:05');
      expect(formatDateTime(new Date(2026, 11, 31, 23, 59, 59))).assertEqual('2026-12-31 23:59:59');
      expect(formatDateTime(new Date(2026, 0, 2, 3, 4, 5)).length).assertEqual(19);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FORMAT_0500
     * @tc.name testFormat0005
     * @tc.desc Verify formatDateTime keeps the month stable across the year boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testFormat0005', 0, () => {
      expect(formatDateTime(new Date(2026, 8, 9, 0, 0, 0))).assertEqual('2026-09-09 00:00:00');
      expect(formatDateTime(new Date(2026, 9, 10, 0, 0, 0))).assertEqual('2026-10-10 00:00:00');
      expect(formatDateTime(new Date(2026, 9, 10, 0, 0, 0)).includes('/')).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FORMAT_0600
     * @tc.name testFormat0006
     * @tc.desc Verify a negative duration is clamped to zero milliseconds.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormat0006', 0, () => {
      expect(formatDuration(-1)).assertEqual('0 ms');
      expect(formatDuration(-9001)).assertEqual('0 ms');
      expect(formatDuration(-1) === formatDuration(0)).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FORMAT_0700
     * @tc.name testFormat0007
     * @tc.desc Verify durations under one second are rendered in milliseconds.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormat0007', 0, () => {
      expect(formatDuration(0)).assertEqual('0 ms');
      expect(formatDuration(1)).assertEqual('1 ms');
      expect(formatDuration(999)).assertEqual('999 ms');
      expect(formatDuration(999).includes(' s')).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FORMAT_0800
     * @tc.name testFormat0008
     * @tc.desc Verify durations from one second to one minute keep one decimal place.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormat0008', 0, () => {
      expect(formatDuration(1000)).assertEqual('1.0 s');
      expect(formatDuration(1500)).assertEqual('1.5 s');
      expect(formatDuration(59999)).assertEqual('60.0 s');
      expect(formatDuration(1500).endsWith(' s')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FORMAT_0900
     * @tc.name testFormat0009
     * @tc.desc Verify the one minute boundary switches to the minute unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormat0009', 0, () => {
      expect(formatDuration(60000)).assertEqual('1 min 0 s');
      expect(formatDuration(61000)).assertEqual('1 min 1 s');
      expect(formatDuration(3599000)).assertEqual('59 min 59 s');
      expect(formatDuration(60000).includes('min')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FORMAT_1000
     * @tc.name testFormat0010
     * @tc.desc Verify long durations keep counting minutes instead of rolling into hours.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testFormat0010', 0, () => {
      expect(formatDuration(3600000)).assertEqual('60 min 0 s');
      expect(formatDuration(90061000)).assertEqual('1501 min 1 s');
      expect(formatDuration(90061000).includes('h')).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FORMAT_1100
     * @tc.name testFormat0011
     * @tc.desc Verify short text is returned unchanged without an ellipsis.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormat0011', 0, () => {
      expect(truncateMiddle('abc', 10)).assertEqual('abc');
      expect(truncateMiddle('', 10)).assertEqual('');
      expect(truncateMiddle('abc', 10).includes('…')).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FORMAT_1200
     * @tc.name testFormat0012
     * @tc.desc Verify a limit of three or less disables truncation entirely.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testFormat0012', 0, () => {
      expect(truncateMiddle('ABCDEFGHIJ', 3)).assertEqual('ABCDEFGHIJ');
      expect(truncateMiddle('ABCDEFGHIJ', 0)).assertEqual('ABCDEFGHIJ');
      expect(truncateMiddle('ABCDEFGHIJ', -5)).assertEqual('ABCDEFGHIJ');
      expect(truncateMiddle('ABCDEFGHIJ', 3).length).assertEqual(10);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FORMAT_1300
     * @tc.name testFormat0013
     * @tc.desc Verify text whose length equals the limit is returned unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testFormat0013', 0, () => {
      expect(truncateMiddle('ABCDE', 5)).assertEqual('ABCDE');
      expect(truncateMiddle('ABCDEF', 6)).assertEqual('ABCDEF');
      expect(truncateMiddle('ABCDEF', 5)).assertEqual('AB…EF');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FORMAT_1400
     * @tc.name testFormat0014
     * @tc.desc Verify the ellipsis form keeps the head longer for odd budgets.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormat0014', 0, () => {
      expect(truncateMiddle('ABCDEFGHIJ', 4)).assertEqual('AB…J');
      expect(truncateMiddle('ABCDEFGHIJ', 5)).assertEqual('AB…IJ');
      expect(truncateMiddle('ABCDEFGHIJ', 6)).assertEqual('ABC…IJ');
      expect(truncateMiddle('ABCDEFGHIJ', 7)).assertEqual('ABC…HIJ');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FORMAT_1500
     * @tc.name testFormat0015
     * @tc.desc Verify the truncated text never exceeds the requested length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormat0015', 0, () => {
      const long = '12:34:56:78:9A:BC-0000A002-0000-1000-8000-00805F9B34FB';
      const limits: number[] = [4, 5, 8, 12, 20];
      for (let i = 0; i < limits.length; i++) {
        expect(truncateMiddle(long, limits[i]).length).assertEqual(limits[i]);
      }
      expect(truncateMiddle(long, 100)).assertEqual(long);
      // 省略号只出现一次，且头尾都取自原文两端：4 字节留「12…尾字」，8 字节时省略号在第 4 位
      expect(truncateMiddle(long, 4)).assertEqual('12…B');
      expect(truncateMiddle(long, 8).indexOf('…')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FORMAT_1600
     * @tc.name testFormat0016
     * @tc.desc Verify the surviving head and tail characters come from both ends of the input.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testFormat0016', 0, () => {
      const device = '2f011130375330303010f32adcf65c00';
      const shown = truncateMiddle(device, 9);
      expect(shown.startsWith('2f01')).assertTrue();
      expect(shown.endsWith('c00')).assertTrue();
      expect(shown.includes('…')).assertTrue();
      expect(device.includes(shown)).assertFalse();
    });
  });
}
