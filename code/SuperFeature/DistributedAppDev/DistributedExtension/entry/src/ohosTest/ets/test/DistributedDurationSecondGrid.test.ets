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
import { formatDuration } from '../../../main/ets/utils/FormatUtil';

/**
 * 时长文案网格的秒段：1000 → 59500 按步长 900 全扫，走 toFixed(1) 的 ".x s" 形态。
 * 毫秒段见 DistributedDurationGrid.test.ets，分钟段与进位边界见 DistributedDurationMinuteGrid.test.ets。
 */
export default function distributedDurationSecondGridTest() {
  describe('DistributedDurationSecondGridTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0092
     * @tc.name testDuration0092
     * @tc.desc Verify 1000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0092', 0, () => {
      expect(formatDuration(1000)).assertEqual('1.0 s');
      expect(formatDuration(1000).length).assertEqual(5);
      expect(formatDuration(1000).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0093
     * @tc.name testDuration0093
     * @tc.desc Verify 1900 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0093', 0, () => {
      expect(formatDuration(1900)).assertEqual('1.9 s');
      expect(formatDuration(1900).length).assertEqual(5);
      expect(formatDuration(1900).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0094
     * @tc.name testDuration0094
     * @tc.desc Verify 2800 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0094', 0, () => {
      expect(formatDuration(2800)).assertEqual('2.8 s');
      expect(formatDuration(2800).length).assertEqual(5);
      expect(formatDuration(2800).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0095
     * @tc.name testDuration0095
     * @tc.desc Verify 3700 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0095', 0, () => {
      expect(formatDuration(3700)).assertEqual('3.7 s');
      expect(formatDuration(3700).length).assertEqual(5);
      expect(formatDuration(3700).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0096
     * @tc.name testDuration0096
     * @tc.desc Verify 4600 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0096', 0, () => {
      expect(formatDuration(4600)).assertEqual('4.6 s');
      expect(formatDuration(4600).length).assertEqual(5);
      expect(formatDuration(4600).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0097
     * @tc.name testDuration0097
     * @tc.desc Verify 5500 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0097', 0, () => {
      expect(formatDuration(5500)).assertEqual('5.5 s');
      expect(formatDuration(5500).length).assertEqual(5);
      expect(formatDuration(5500).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0098
     * @tc.name testDuration0098
     * @tc.desc Verify 6400 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0098', 0, () => {
      expect(formatDuration(6400)).assertEqual('6.4 s');
      expect(formatDuration(6400).length).assertEqual(5);
      expect(formatDuration(6400).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0099
     * @tc.name testDuration0099
     * @tc.desc Verify 7300 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0099', 0, () => {
      expect(formatDuration(7300)).assertEqual('7.3 s');
      expect(formatDuration(7300).length).assertEqual(5);
      expect(formatDuration(7300).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0100
     * @tc.name testDuration0100
     * @tc.desc Verify 8200 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0100', 0, () => {
      expect(formatDuration(8200)).assertEqual('8.2 s');
      expect(formatDuration(8200).length).assertEqual(5);
      expect(formatDuration(8200).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0101
     * @tc.name testDuration0101
     * @tc.desc Verify 9100 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0101', 0, () => {
      expect(formatDuration(9100)).assertEqual('9.1 s');
      expect(formatDuration(9100).length).assertEqual(5);
      expect(formatDuration(9100).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0102
     * @tc.name testDuration0102
     * @tc.desc Verify 10000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0102', 0, () => {
      expect(formatDuration(10000)).assertEqual('10.0 s');
      expect(formatDuration(10000).length).assertEqual(6);
      expect(formatDuration(10000).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0103
     * @tc.name testDuration0103
     * @tc.desc Verify 10900 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0103', 0, () => {
      expect(formatDuration(10900)).assertEqual('10.9 s');
      expect(formatDuration(10900).length).assertEqual(6);
      expect(formatDuration(10900).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0104
     * @tc.name testDuration0104
     * @tc.desc Verify 11800 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0104', 0, () => {
      expect(formatDuration(11800)).assertEqual('11.8 s');
      expect(formatDuration(11800).length).assertEqual(6);
      expect(formatDuration(11800).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0105
     * @tc.name testDuration0105
     * @tc.desc Verify 12700 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0105', 0, () => {
      expect(formatDuration(12700)).assertEqual('12.7 s');
      expect(formatDuration(12700).length).assertEqual(6);
      expect(formatDuration(12700).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0106
     * @tc.name testDuration0106
     * @tc.desc Verify 13600 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0106', 0, () => {
      expect(formatDuration(13600)).assertEqual('13.6 s');
      expect(formatDuration(13600).length).assertEqual(6);
      expect(formatDuration(13600).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0107
     * @tc.name testDuration0107
     * @tc.desc Verify 14500 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0107', 0, () => {
      expect(formatDuration(14500)).assertEqual('14.5 s');
      expect(formatDuration(14500).length).assertEqual(6);
      expect(formatDuration(14500).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0108
     * @tc.name testDuration0108
     * @tc.desc Verify 15400 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0108', 0, () => {
      expect(formatDuration(15400)).assertEqual('15.4 s');
      expect(formatDuration(15400).length).assertEqual(6);
      expect(formatDuration(15400).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0109
     * @tc.name testDuration0109
     * @tc.desc Verify 16300 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0109', 0, () => {
      expect(formatDuration(16300)).assertEqual('16.3 s');
      expect(formatDuration(16300).length).assertEqual(6);
      expect(formatDuration(16300).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0110
     * @tc.name testDuration0110
     * @tc.desc Verify 17200 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0110', 0, () => {
      expect(formatDuration(17200)).assertEqual('17.2 s');
      expect(formatDuration(17200).length).assertEqual(6);
      expect(formatDuration(17200).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0111
     * @tc.name testDuration0111
     * @tc.desc Verify 18100 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0111', 0, () => {
      expect(formatDuration(18100)).assertEqual('18.1 s');
      expect(formatDuration(18100).length).assertEqual(6);
      expect(formatDuration(18100).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0112
     * @tc.name testDuration0112
     * @tc.desc Verify 19000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0112', 0, () => {
      expect(formatDuration(19000)).assertEqual('19.0 s');
      expect(formatDuration(19000).length).assertEqual(6);
      expect(formatDuration(19000).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0113
     * @tc.name testDuration0113
     * @tc.desc Verify 19900 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0113', 0, () => {
      expect(formatDuration(19900)).assertEqual('19.9 s');
      expect(formatDuration(19900).length).assertEqual(6);
      expect(formatDuration(19900).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0114
     * @tc.name testDuration0114
     * @tc.desc Verify 20800 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0114', 0, () => {
      expect(formatDuration(20800)).assertEqual('20.8 s');
      expect(formatDuration(20800).length).assertEqual(6);
      expect(formatDuration(20800).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0115
     * @tc.name testDuration0115
     * @tc.desc Verify 21700 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0115', 0, () => {
      expect(formatDuration(21700)).assertEqual('21.7 s');
      expect(formatDuration(21700).length).assertEqual(6);
      expect(formatDuration(21700).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0116
     * @tc.name testDuration0116
     * @tc.desc Verify 22600 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0116', 0, () => {
      expect(formatDuration(22600)).assertEqual('22.6 s');
      expect(formatDuration(22600).length).assertEqual(6);
      expect(formatDuration(22600).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0117
     * @tc.name testDuration0117
     * @tc.desc Verify 23500 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0117', 0, () => {
      expect(formatDuration(23500)).assertEqual('23.5 s');
      expect(formatDuration(23500).length).assertEqual(6);
      expect(formatDuration(23500).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0118
     * @tc.name testDuration0118
     * @tc.desc Verify 24400 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0118', 0, () => {
      expect(formatDuration(24400)).assertEqual('24.4 s');
      expect(formatDuration(24400).length).assertEqual(6);
      expect(formatDuration(24400).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0119
     * @tc.name testDuration0119
     * @tc.desc Verify 25300 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0119', 0, () => {
      expect(formatDuration(25300)).assertEqual('25.3 s');
      expect(formatDuration(25300).length).assertEqual(6);
      expect(formatDuration(25300).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0120
     * @tc.name testDuration0120
     * @tc.desc Verify 26200 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0120', 0, () => {
      expect(formatDuration(26200)).assertEqual('26.2 s');
      expect(formatDuration(26200).length).assertEqual(6);
      expect(formatDuration(26200).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0121
     * @tc.name testDuration0121
     * @tc.desc Verify 27100 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0121', 0, () => {
      expect(formatDuration(27100)).assertEqual('27.1 s');
      expect(formatDuration(27100).length).assertEqual(6);
      expect(formatDuration(27100).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0122
     * @tc.name testDuration0122
     * @tc.desc Verify 28000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0122', 0, () => {
      expect(formatDuration(28000)).assertEqual('28.0 s');
      expect(formatDuration(28000).length).assertEqual(6);
      expect(formatDuration(28000).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0123
     * @tc.name testDuration0123
     * @tc.desc Verify 28900 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0123', 0, () => {
      expect(formatDuration(28900)).assertEqual('28.9 s');
      expect(formatDuration(28900).length).assertEqual(6);
      expect(formatDuration(28900).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0124
     * @tc.name testDuration0124
     * @tc.desc Verify 29800 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0124', 0, () => {
      expect(formatDuration(29800)).assertEqual('29.8 s');
      expect(formatDuration(29800).length).assertEqual(6);
      expect(formatDuration(29800).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0125
     * @tc.name testDuration0125
     * @tc.desc Verify 30700 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0125', 0, () => {
      expect(formatDuration(30700)).assertEqual('30.7 s');
      expect(formatDuration(30700).length).assertEqual(6);
      expect(formatDuration(30700).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0126
     * @tc.name testDuration0126
     * @tc.desc Verify 31600 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0126', 0, () => {
      expect(formatDuration(31600)).assertEqual('31.6 s');
      expect(formatDuration(31600).length).assertEqual(6);
      expect(formatDuration(31600).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0127
     * @tc.name testDuration0127
     * @tc.desc Verify 32500 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0127', 0, () => {
      expect(formatDuration(32500)).assertEqual('32.5 s');
      expect(formatDuration(32500).length).assertEqual(6);
      expect(formatDuration(32500).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0128
     * @tc.name testDuration0128
     * @tc.desc Verify 33400 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0128', 0, () => {
      expect(formatDuration(33400)).assertEqual('33.4 s');
      expect(formatDuration(33400).length).assertEqual(6);
      expect(formatDuration(33400).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0129
     * @tc.name testDuration0129
     * @tc.desc Verify 34300 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0129', 0, () => {
      expect(formatDuration(34300)).assertEqual('34.3 s');
      expect(formatDuration(34300).length).assertEqual(6);
      expect(formatDuration(34300).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0130
     * @tc.name testDuration0130
     * @tc.desc Verify 35200 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0130', 0, () => {
      expect(formatDuration(35200)).assertEqual('35.2 s');
      expect(formatDuration(35200).length).assertEqual(6);
      expect(formatDuration(35200).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0131
     * @tc.name testDuration0131
     * @tc.desc Verify 36100 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0131', 0, () => {
      expect(formatDuration(36100)).assertEqual('36.1 s');
      expect(formatDuration(36100).length).assertEqual(6);
      expect(formatDuration(36100).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0132
     * @tc.name testDuration0132
     * @tc.desc Verify 37000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0132', 0, () => {
      expect(formatDuration(37000)).assertEqual('37.0 s');
      expect(formatDuration(37000).length).assertEqual(6);
      expect(formatDuration(37000).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0133
     * @tc.name testDuration0133
     * @tc.desc Verify 37900 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0133', 0, () => {
      expect(formatDuration(37900)).assertEqual('37.9 s');
      expect(formatDuration(37900).length).assertEqual(6);
      expect(formatDuration(37900).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0134
     * @tc.name testDuration0134
     * @tc.desc Verify 38800 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0134', 0, () => {
      expect(formatDuration(38800)).assertEqual('38.8 s');
      expect(formatDuration(38800).length).assertEqual(6);
      expect(formatDuration(38800).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0135
     * @tc.name testDuration0135
     * @tc.desc Verify 39700 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0135', 0, () => {
      expect(formatDuration(39700)).assertEqual('39.7 s');
      expect(formatDuration(39700).length).assertEqual(6);
      expect(formatDuration(39700).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0136
     * @tc.name testDuration0136
     * @tc.desc Verify 40600 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0136', 0, () => {
      expect(formatDuration(40600)).assertEqual('40.6 s');
      expect(formatDuration(40600).length).assertEqual(6);
      expect(formatDuration(40600).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0137
     * @tc.name testDuration0137
     * @tc.desc Verify 41500 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0137', 0, () => {
      expect(formatDuration(41500)).assertEqual('41.5 s');
      expect(formatDuration(41500).length).assertEqual(6);
      expect(formatDuration(41500).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0138
     * @tc.name testDuration0138
     * @tc.desc Verify 42400 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0138', 0, () => {
      expect(formatDuration(42400)).assertEqual('42.4 s');
      expect(formatDuration(42400).length).assertEqual(6);
      expect(formatDuration(42400).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0139
     * @tc.name testDuration0139
     * @tc.desc Verify 43300 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0139', 0, () => {
      expect(formatDuration(43300)).assertEqual('43.3 s');
      expect(formatDuration(43300).length).assertEqual(6);
      expect(formatDuration(43300).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0140
     * @tc.name testDuration0140
     * @tc.desc Verify 44200 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0140', 0, () => {
      expect(formatDuration(44200)).assertEqual('44.2 s');
      expect(formatDuration(44200).length).assertEqual(6);
      expect(formatDuration(44200).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0141
     * @tc.name testDuration0141
     * @tc.desc Verify 45100 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0141', 0, () => {
      expect(formatDuration(45100)).assertEqual('45.1 s');
      expect(formatDuration(45100).length).assertEqual(6);
      expect(formatDuration(45100).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0142
     * @tc.name testDuration0142
     * @tc.desc Verify 46000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0142', 0, () => {
      expect(formatDuration(46000)).assertEqual('46.0 s');
      expect(formatDuration(46000).length).assertEqual(6);
      expect(formatDuration(46000).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0143
     * @tc.name testDuration0143
     * @tc.desc Verify 46900 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0143', 0, () => {
      expect(formatDuration(46900)).assertEqual('46.9 s');
      expect(formatDuration(46900).length).assertEqual(6);
      expect(formatDuration(46900).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0144
     * @tc.name testDuration0144
     * @tc.desc Verify 47800 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0144', 0, () => {
      expect(formatDuration(47800)).assertEqual('47.8 s');
      expect(formatDuration(47800).length).assertEqual(6);
      expect(formatDuration(47800).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0145
     * @tc.name testDuration0145
     * @tc.desc Verify 48700 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0145', 0, () => {
      expect(formatDuration(48700)).assertEqual('48.7 s');
      expect(formatDuration(48700).length).assertEqual(6);
      expect(formatDuration(48700).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0146
     * @tc.name testDuration0146
     * @tc.desc Verify 49600 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0146', 0, () => {
      expect(formatDuration(49600)).assertEqual('49.6 s');
      expect(formatDuration(49600).length).assertEqual(6);
      expect(formatDuration(49600).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0147
     * @tc.name testDuration0147
     * @tc.desc Verify 50500 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0147', 0, () => {
      expect(formatDuration(50500)).assertEqual('50.5 s');
      expect(formatDuration(50500).length).assertEqual(6);
      expect(formatDuration(50500).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0148
     * @tc.name testDuration0148
     * @tc.desc Verify 51400 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0148', 0, () => {
      expect(formatDuration(51400)).assertEqual('51.4 s');
      expect(formatDuration(51400).length).assertEqual(6);
      expect(formatDuration(51400).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0149
     * @tc.name testDuration0149
     * @tc.desc Verify 52300 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0149', 0, () => {
      expect(formatDuration(52300)).assertEqual('52.3 s');
      expect(formatDuration(52300).length).assertEqual(6);
      expect(formatDuration(52300).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0150
     * @tc.name testDuration0150
     * @tc.desc Verify 53200 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0150', 0, () => {
      expect(formatDuration(53200)).assertEqual('53.2 s');
      expect(formatDuration(53200).length).assertEqual(6);
      expect(formatDuration(53200).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0151
     * @tc.name testDuration0151
     * @tc.desc Verify 54100 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0151', 0, () => {
      expect(formatDuration(54100)).assertEqual('54.1 s');
      expect(formatDuration(54100).length).assertEqual(6);
      expect(formatDuration(54100).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0152
     * @tc.name testDuration0152
     * @tc.desc Verify 55000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0152', 0, () => {
      expect(formatDuration(55000)).assertEqual('55.0 s');
      expect(formatDuration(55000).length).assertEqual(6);
      expect(formatDuration(55000).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0153
     * @tc.name testDuration0153
     * @tc.desc Verify 55900 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0153', 0, () => {
      expect(formatDuration(55900)).assertEqual('55.9 s');
      expect(formatDuration(55900).length).assertEqual(6);
      expect(formatDuration(55900).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0154
     * @tc.name testDuration0154
     * @tc.desc Verify 56800 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0154', 0, () => {
      expect(formatDuration(56800)).assertEqual('56.8 s');
      expect(formatDuration(56800).length).assertEqual(6);
      expect(formatDuration(56800).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0155
     * @tc.name testDuration0155
     * @tc.desc Verify 57700 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0155', 0, () => {
      expect(formatDuration(57700)).assertEqual('57.7 s');
      expect(formatDuration(57700).length).assertEqual(6);
      expect(formatDuration(57700).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0156
     * @tc.name testDuration0156
     * @tc.desc Verify 58600 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0156', 0, () => {
      expect(formatDuration(58600)).assertEqual('58.6 s');
      expect(formatDuration(58600).length).assertEqual(6);
      expect(formatDuration(58600).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0157
     * @tc.name testDuration0157
     * @tc.desc Verify 59500 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0157', 0, () => {
      expect(formatDuration(59500)).assertEqual('59.5 s');
      expect(formatDuration(59500).length).assertEqual(6);
      expect(formatDuration(59500).indexOf(' ')).assertEqual(4);
    });

  });
}
