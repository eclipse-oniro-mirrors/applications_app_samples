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
 * 时长文案网格的分钟段：1 → 60 分钟按步长 1 分钟推进，外加三个进位边界（59999 / 60000 / 60001）与负值。
 * 59999 会显示成 60.0 s，这是页面上真实出现的形态；负值统一落到 0 ms。
 * 毫秒段见 DistributedDurationGrid.test.ets，秒段见 DistributedDurationSecondGrid.test.ets。
 */
export default function distributedDurationMinuteGridTest() {
  describe('DistributedDurationMinuteGridTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0158
     * @tc.name testDuration0158
     * @tc.desc Verify 60000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0158', 0, () => {
      expect(formatDuration(60000)).assertEqual('1 min 0 s');
      expect(formatDuration(60000).length).assertEqual(9);
      expect(formatDuration(60000).indexOf(' ')).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0159
     * @tc.name testDuration0159
     * @tc.desc Verify 120000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0159', 0, () => {
      expect(formatDuration(120000)).assertEqual('2 min 0 s');
      expect(formatDuration(120000).length).assertEqual(9);
      expect(formatDuration(120000).indexOf(' ')).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0160
     * @tc.name testDuration0160
     * @tc.desc Verify 180000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0160', 0, () => {
      expect(formatDuration(180000)).assertEqual('3 min 0 s');
      expect(formatDuration(180000).length).assertEqual(9);
      expect(formatDuration(180000).indexOf(' ')).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0161
     * @tc.name testDuration0161
     * @tc.desc Verify 240000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0161', 0, () => {
      expect(formatDuration(240000)).assertEqual('4 min 0 s');
      expect(formatDuration(240000).length).assertEqual(9);
      expect(formatDuration(240000).indexOf(' ')).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0162
     * @tc.name testDuration0162
     * @tc.desc Verify 300000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0162', 0, () => {
      expect(formatDuration(300000)).assertEqual('5 min 0 s');
      expect(formatDuration(300000).length).assertEqual(9);
      expect(formatDuration(300000).indexOf(' ')).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0163
     * @tc.name testDuration0163
     * @tc.desc Verify 360000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0163', 0, () => {
      expect(formatDuration(360000)).assertEqual('6 min 0 s');
      expect(formatDuration(360000).length).assertEqual(9);
      expect(formatDuration(360000).indexOf(' ')).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0164
     * @tc.name testDuration0164
     * @tc.desc Verify 420000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0164', 0, () => {
      expect(formatDuration(420000)).assertEqual('7 min 0 s');
      expect(formatDuration(420000).length).assertEqual(9);
      expect(formatDuration(420000).indexOf(' ')).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0165
     * @tc.name testDuration0165
     * @tc.desc Verify 480000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0165', 0, () => {
      expect(formatDuration(480000)).assertEqual('8 min 0 s');
      expect(formatDuration(480000).length).assertEqual(9);
      expect(formatDuration(480000).indexOf(' ')).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0166
     * @tc.name testDuration0166
     * @tc.desc Verify 540000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0166', 0, () => {
      expect(formatDuration(540000)).assertEqual('9 min 0 s');
      expect(formatDuration(540000).length).assertEqual(9);
      expect(formatDuration(540000).indexOf(' ')).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0167
     * @tc.name testDuration0167
     * @tc.desc Verify 600000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0167', 0, () => {
      expect(formatDuration(600000)).assertEqual('10 min 0 s');
      expect(formatDuration(600000).length).assertEqual(10);
      expect(formatDuration(600000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0168
     * @tc.name testDuration0168
     * @tc.desc Verify 660000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0168', 0, () => {
      expect(formatDuration(660000)).assertEqual('11 min 0 s');
      expect(formatDuration(660000).length).assertEqual(10);
      expect(formatDuration(660000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0169
     * @tc.name testDuration0169
     * @tc.desc Verify 720000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0169', 0, () => {
      expect(formatDuration(720000)).assertEqual('12 min 0 s');
      expect(formatDuration(720000).length).assertEqual(10);
      expect(formatDuration(720000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0170
     * @tc.name testDuration0170
     * @tc.desc Verify 780000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0170', 0, () => {
      expect(formatDuration(780000)).assertEqual('13 min 0 s');
      expect(formatDuration(780000).length).assertEqual(10);
      expect(formatDuration(780000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0171
     * @tc.name testDuration0171
     * @tc.desc Verify 840000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0171', 0, () => {
      expect(formatDuration(840000)).assertEqual('14 min 0 s');
      expect(formatDuration(840000).length).assertEqual(10);
      expect(formatDuration(840000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0172
     * @tc.name testDuration0172
     * @tc.desc Verify 900000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0172', 0, () => {
      expect(formatDuration(900000)).assertEqual('15 min 0 s');
      expect(formatDuration(900000).length).assertEqual(10);
      expect(formatDuration(900000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0173
     * @tc.name testDuration0173
     * @tc.desc Verify 960000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0173', 0, () => {
      expect(formatDuration(960000)).assertEqual('16 min 0 s');
      expect(formatDuration(960000).length).assertEqual(10);
      expect(formatDuration(960000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0174
     * @tc.name testDuration0174
     * @tc.desc Verify 1020000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0174', 0, () => {
      expect(formatDuration(1020000)).assertEqual('17 min 0 s');
      expect(formatDuration(1020000).length).assertEqual(10);
      expect(formatDuration(1020000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0175
     * @tc.name testDuration0175
     * @tc.desc Verify 1080000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0175', 0, () => {
      expect(formatDuration(1080000)).assertEqual('18 min 0 s');
      expect(formatDuration(1080000).length).assertEqual(10);
      expect(formatDuration(1080000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0176
     * @tc.name testDuration0176
     * @tc.desc Verify 1140000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0176', 0, () => {
      expect(formatDuration(1140000)).assertEqual('19 min 0 s');
      expect(formatDuration(1140000).length).assertEqual(10);
      expect(formatDuration(1140000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0177
     * @tc.name testDuration0177
     * @tc.desc Verify 1200000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0177', 0, () => {
      expect(formatDuration(1200000)).assertEqual('20 min 0 s');
      expect(formatDuration(1200000).length).assertEqual(10);
      expect(formatDuration(1200000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0178
     * @tc.name testDuration0178
     * @tc.desc Verify 1260000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0178', 0, () => {
      expect(formatDuration(1260000)).assertEqual('21 min 0 s');
      expect(formatDuration(1260000).length).assertEqual(10);
      expect(formatDuration(1260000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0179
     * @tc.name testDuration0179
     * @tc.desc Verify 1320000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0179', 0, () => {
      expect(formatDuration(1320000)).assertEqual('22 min 0 s');
      expect(formatDuration(1320000).length).assertEqual(10);
      expect(formatDuration(1320000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0180
     * @tc.name testDuration0180
     * @tc.desc Verify 1380000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0180', 0, () => {
      expect(formatDuration(1380000)).assertEqual('23 min 0 s');
      expect(formatDuration(1380000).length).assertEqual(10);
      expect(formatDuration(1380000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0181
     * @tc.name testDuration0181
     * @tc.desc Verify 1440000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0181', 0, () => {
      expect(formatDuration(1440000)).assertEqual('24 min 0 s');
      expect(formatDuration(1440000).length).assertEqual(10);
      expect(formatDuration(1440000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0182
     * @tc.name testDuration0182
     * @tc.desc Verify 1500000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0182', 0, () => {
      expect(formatDuration(1500000)).assertEqual('25 min 0 s');
      expect(formatDuration(1500000).length).assertEqual(10);
      expect(formatDuration(1500000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0183
     * @tc.name testDuration0183
     * @tc.desc Verify 1560000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0183', 0, () => {
      expect(formatDuration(1560000)).assertEqual('26 min 0 s');
      expect(formatDuration(1560000).length).assertEqual(10);
      expect(formatDuration(1560000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0184
     * @tc.name testDuration0184
     * @tc.desc Verify 1620000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0184', 0, () => {
      expect(formatDuration(1620000)).assertEqual('27 min 0 s');
      expect(formatDuration(1620000).length).assertEqual(10);
      expect(formatDuration(1620000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0185
     * @tc.name testDuration0185
     * @tc.desc Verify 1680000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0185', 0, () => {
      expect(formatDuration(1680000)).assertEqual('28 min 0 s');
      expect(formatDuration(1680000).length).assertEqual(10);
      expect(formatDuration(1680000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0186
     * @tc.name testDuration0186
     * @tc.desc Verify 1740000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0186', 0, () => {
      expect(formatDuration(1740000)).assertEqual('29 min 0 s');
      expect(formatDuration(1740000).length).assertEqual(10);
      expect(formatDuration(1740000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0187
     * @tc.name testDuration0187
     * @tc.desc Verify 1800000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0187', 0, () => {
      expect(formatDuration(1800000)).assertEqual('30 min 0 s');
      expect(formatDuration(1800000).length).assertEqual(10);
      expect(formatDuration(1800000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0188
     * @tc.name testDuration0188
     * @tc.desc Verify 1860000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0188', 0, () => {
      expect(formatDuration(1860000)).assertEqual('31 min 0 s');
      expect(formatDuration(1860000).length).assertEqual(10);
      expect(formatDuration(1860000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0189
     * @tc.name testDuration0189
     * @tc.desc Verify 1920000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0189', 0, () => {
      expect(formatDuration(1920000)).assertEqual('32 min 0 s');
      expect(formatDuration(1920000).length).assertEqual(10);
      expect(formatDuration(1920000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0190
     * @tc.name testDuration0190
     * @tc.desc Verify 1980000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0190', 0, () => {
      expect(formatDuration(1980000)).assertEqual('33 min 0 s');
      expect(formatDuration(1980000).length).assertEqual(10);
      expect(formatDuration(1980000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0191
     * @tc.name testDuration0191
     * @tc.desc Verify 2040000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0191', 0, () => {
      expect(formatDuration(2040000)).assertEqual('34 min 0 s');
      expect(formatDuration(2040000).length).assertEqual(10);
      expect(formatDuration(2040000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0192
     * @tc.name testDuration0192
     * @tc.desc Verify 2100000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0192', 0, () => {
      expect(formatDuration(2100000)).assertEqual('35 min 0 s');
      expect(formatDuration(2100000).length).assertEqual(10);
      expect(formatDuration(2100000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0193
     * @tc.name testDuration0193
     * @tc.desc Verify 2160000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0193', 0, () => {
      expect(formatDuration(2160000)).assertEqual('36 min 0 s');
      expect(formatDuration(2160000).length).assertEqual(10);
      expect(formatDuration(2160000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0194
     * @tc.name testDuration0194
     * @tc.desc Verify 2220000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0194', 0, () => {
      expect(formatDuration(2220000)).assertEqual('37 min 0 s');
      expect(formatDuration(2220000).length).assertEqual(10);
      expect(formatDuration(2220000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0195
     * @tc.name testDuration0195
     * @tc.desc Verify 2280000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0195', 0, () => {
      expect(formatDuration(2280000)).assertEqual('38 min 0 s');
      expect(formatDuration(2280000).length).assertEqual(10);
      expect(formatDuration(2280000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0196
     * @tc.name testDuration0196
     * @tc.desc Verify 2340000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0196', 0, () => {
      expect(formatDuration(2340000)).assertEqual('39 min 0 s');
      expect(formatDuration(2340000).length).assertEqual(10);
      expect(formatDuration(2340000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0197
     * @tc.name testDuration0197
     * @tc.desc Verify 2400000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0197', 0, () => {
      expect(formatDuration(2400000)).assertEqual('40 min 0 s');
      expect(formatDuration(2400000).length).assertEqual(10);
      expect(formatDuration(2400000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0198
     * @tc.name testDuration0198
     * @tc.desc Verify 2460000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0198', 0, () => {
      expect(formatDuration(2460000)).assertEqual('41 min 0 s');
      expect(formatDuration(2460000).length).assertEqual(10);
      expect(formatDuration(2460000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0199
     * @tc.name testDuration0199
     * @tc.desc Verify 2520000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0199', 0, () => {
      expect(formatDuration(2520000)).assertEqual('42 min 0 s');
      expect(formatDuration(2520000).length).assertEqual(10);
      expect(formatDuration(2520000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0200
     * @tc.name testDuration0200
     * @tc.desc Verify 2580000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0200', 0, () => {
      expect(formatDuration(2580000)).assertEqual('43 min 0 s');
      expect(formatDuration(2580000).length).assertEqual(10);
      expect(formatDuration(2580000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0201
     * @tc.name testDuration0201
     * @tc.desc Verify 2640000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0201', 0, () => {
      expect(formatDuration(2640000)).assertEqual('44 min 0 s');
      expect(formatDuration(2640000).length).assertEqual(10);
      expect(formatDuration(2640000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0202
     * @tc.name testDuration0202
     * @tc.desc Verify 2700000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0202', 0, () => {
      expect(formatDuration(2700000)).assertEqual('45 min 0 s');
      expect(formatDuration(2700000).length).assertEqual(10);
      expect(formatDuration(2700000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0203
     * @tc.name testDuration0203
     * @tc.desc Verify 2760000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0203', 0, () => {
      expect(formatDuration(2760000)).assertEqual('46 min 0 s');
      expect(formatDuration(2760000).length).assertEqual(10);
      expect(formatDuration(2760000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0204
     * @tc.name testDuration0204
     * @tc.desc Verify 2820000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0204', 0, () => {
      expect(formatDuration(2820000)).assertEqual('47 min 0 s');
      expect(formatDuration(2820000).length).assertEqual(10);
      expect(formatDuration(2820000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0205
     * @tc.name testDuration0205
     * @tc.desc Verify 2880000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0205', 0, () => {
      expect(formatDuration(2880000)).assertEqual('48 min 0 s');
      expect(formatDuration(2880000).length).assertEqual(10);
      expect(formatDuration(2880000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0206
     * @tc.name testDuration0206
     * @tc.desc Verify 2940000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0206', 0, () => {
      expect(formatDuration(2940000)).assertEqual('49 min 0 s');
      expect(formatDuration(2940000).length).assertEqual(10);
      expect(formatDuration(2940000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0207
     * @tc.name testDuration0207
     * @tc.desc Verify 3000000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0207', 0, () => {
      expect(formatDuration(3000000)).assertEqual('50 min 0 s');
      expect(formatDuration(3000000).length).assertEqual(10);
      expect(formatDuration(3000000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0208
     * @tc.name testDuration0208
     * @tc.desc Verify 3060000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0208', 0, () => {
      expect(formatDuration(3060000)).assertEqual('51 min 0 s');
      expect(formatDuration(3060000).length).assertEqual(10);
      expect(formatDuration(3060000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0209
     * @tc.name testDuration0209
     * @tc.desc Verify 3120000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0209', 0, () => {
      expect(formatDuration(3120000)).assertEqual('52 min 0 s');
      expect(formatDuration(3120000).length).assertEqual(10);
      expect(formatDuration(3120000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0210
     * @tc.name testDuration0210
     * @tc.desc Verify 3180000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0210', 0, () => {
      expect(formatDuration(3180000)).assertEqual('53 min 0 s');
      expect(formatDuration(3180000).length).assertEqual(10);
      expect(formatDuration(3180000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0211
     * @tc.name testDuration0211
     * @tc.desc Verify 3240000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0211', 0, () => {
      expect(formatDuration(3240000)).assertEqual('54 min 0 s');
      expect(formatDuration(3240000).length).assertEqual(10);
      expect(formatDuration(3240000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0212
     * @tc.name testDuration0212
     * @tc.desc Verify 3300000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0212', 0, () => {
      expect(formatDuration(3300000)).assertEqual('55 min 0 s');
      expect(formatDuration(3300000).length).assertEqual(10);
      expect(formatDuration(3300000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0213
     * @tc.name testDuration0213
     * @tc.desc Verify 3360000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0213', 0, () => {
      expect(formatDuration(3360000)).assertEqual('56 min 0 s');
      expect(formatDuration(3360000).length).assertEqual(10);
      expect(formatDuration(3360000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0214
     * @tc.name testDuration0214
     * @tc.desc Verify 3420000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0214', 0, () => {
      expect(formatDuration(3420000)).assertEqual('57 min 0 s');
      expect(formatDuration(3420000).length).assertEqual(10);
      expect(formatDuration(3420000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0215
     * @tc.name testDuration0215
     * @tc.desc Verify 3480000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0215', 0, () => {
      expect(formatDuration(3480000)).assertEqual('58 min 0 s');
      expect(formatDuration(3480000).length).assertEqual(10);
      expect(formatDuration(3480000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0216
     * @tc.name testDuration0216
     * @tc.desc Verify 3540000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0216', 0, () => {
      expect(formatDuration(3540000)).assertEqual('59 min 0 s');
      expect(formatDuration(3540000).length).assertEqual(10);
      expect(formatDuration(3540000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0217
     * @tc.name testDuration0217
     * @tc.desc Verify 3600000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0217', 0, () => {
      expect(formatDuration(3600000)).assertEqual('60 min 0 s');
      expect(formatDuration(3600000).length).assertEqual(10);
      expect(formatDuration(3600000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0218
     * @tc.name testDuration0218
     * @tc.desc Verify 59999 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0218', 0, () => {
      expect(formatDuration(59999)).assertEqual('60.0 s');
      expect(formatDuration(59999).length).assertEqual(6);
      expect(formatDuration(59999).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0219
     * @tc.name testDuration0219
     * @tc.desc Verify 59990 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0219', 0, () => {
      expect(formatDuration(59990)).assertEqual('60.0 s');
      expect(formatDuration(59990).length).assertEqual(6);
      expect(formatDuration(59990).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0220
     * @tc.name testDuration0220
     * @tc.desc Verify 60001 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0220', 0, () => {
      expect(formatDuration(60001)).assertEqual('1 min 0 s');
      expect(formatDuration(60001).length).assertEqual(9);
      expect(formatDuration(60001).indexOf(' ')).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0221
     * @tc.name testDuration0221
     * @tc.desc Verify 61500 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0221', 0, () => {
      expect(formatDuration(61500)).assertEqual('1 min 1 s');
      expect(formatDuration(61500).length).assertEqual(9);
      expect(formatDuration(61500).indexOf(' ')).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0222
     * @tc.name testDuration0222
     * @tc.desc Verify 61000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0222', 0, () => {
      expect(formatDuration(61000)).assertEqual('1 min 1 s');
      expect(formatDuration(61000).length).assertEqual(9);
      expect(formatDuration(61000).indexOf(' ')).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0223
     * @tc.name testDuration0223
     * @tc.desc Verify 119999 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0223', 0, () => {
      expect(formatDuration(119999)).assertEqual('1 min 59 s');
      expect(formatDuration(119999).length).assertEqual(10);
      expect(formatDuration(119999).indexOf(' ')).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0224
     * @tc.name testDuration0224
     * @tc.desc Verify 3599999 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0224', 0, () => {
      expect(formatDuration(3599999)).assertEqual('59 min 59 s');
      expect(formatDuration(3599999).length).assertEqual(11);
      expect(formatDuration(3599999).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0225
     * @tc.name testDuration0225
     * @tc.desc Verify 3600000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0225', 0, () => {
      expect(formatDuration(3600000)).assertEqual('60 min 0 s');
      expect(formatDuration(3600000).length).assertEqual(10);
      expect(formatDuration(3600000).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0226
     * @tc.name testDuration0226
     * @tc.desc Verify 3600001 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0226', 0, () => {
      expect(formatDuration(3600001)).assertEqual('60 min 0 s');
      expect(formatDuration(3600001).length).assertEqual(10);
      expect(formatDuration(3600001).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0227
     * @tc.name testDuration0227
     * @tc.desc Verify 90061000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0227', 0, () => {
      expect(formatDuration(90061000)).assertEqual('1501 min 1 s');
      expect(formatDuration(90061000).length).assertEqual(12);
      expect(formatDuration(90061000).indexOf(' ')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0228
     * @tc.name testDuration0228
     * @tc.desc Verify -1 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0228', 0, () => {
      expect(formatDuration(-1)).assertEqual('0 ms');
      expect(formatDuration(-1).length).assertEqual(4);
      expect(formatDuration(-1).indexOf(' ')).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0229
     * @tc.name testDuration0229
     * @tc.desc Verify -0.1 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0229', 0, () => {
      expect(formatDuration(-0.1)).assertEqual('0 ms');
      expect(formatDuration(-0.1).length).assertEqual(4);
      expect(formatDuration(-0.1).indexOf(' ')).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0230
     * @tc.name testDuration0230
     * @tc.desc Verify -1000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0230', 0, () => {
      expect(formatDuration(-1000)).assertEqual('0 ms');
      expect(formatDuration(-1000).length).assertEqual(4);
      expect(formatDuration(-1000).indexOf(' ')).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0231
     * @tc.name testDuration0231
     * @tc.desc Verify -9001 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0231', 0, () => {
      expect(formatDuration(-9001)).assertEqual('0 ms');
      expect(formatDuration(-9001).length).assertEqual(4);
      expect(formatDuration(-9001).indexOf(' ')).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0232
     * @tc.name testDuration0232
     * @tc.desc Verify -60000 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0232', 0, () => {
      expect(formatDuration(-60000)).assertEqual('0 ms');
      expect(formatDuration(-60000).length).assertEqual(4);
      expect(formatDuration(-60000).indexOf(' ')).assertEqual(1);
    });

  });
}
