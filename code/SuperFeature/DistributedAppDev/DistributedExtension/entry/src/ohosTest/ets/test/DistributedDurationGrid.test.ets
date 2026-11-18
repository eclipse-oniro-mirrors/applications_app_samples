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
 * 时长文案网格的毫秒段：0 → 990 按步长 11 全扫，单位与空格位置逐条钉住。
 * 秒段见 DistributedDurationSecondGrid.test.ets，分钟段与进位边界见 DistributedDurationMinuteGrid.test.ets。
 */
export default function distributedDurationGridTest() {
  describe('DistributedDurationGridTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0001
     * @tc.name testDuration0001
     * @tc.desc Verify 0 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0001', 0, () => {
      expect(formatDuration(0)).assertEqual('0 ms');
      expect(formatDuration(0).length).assertEqual(4);
      expect(formatDuration(0).indexOf(' ')).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0002
     * @tc.name testDuration0002
     * @tc.desc Verify 11 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0002', 0, () => {
      expect(formatDuration(11)).assertEqual('11 ms');
      expect(formatDuration(11).length).assertEqual(5);
      expect(formatDuration(11).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0003
     * @tc.name testDuration0003
     * @tc.desc Verify 22 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0003', 0, () => {
      expect(formatDuration(22)).assertEqual('22 ms');
      expect(formatDuration(22).length).assertEqual(5);
      expect(formatDuration(22).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0004
     * @tc.name testDuration0004
     * @tc.desc Verify 33 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0004', 0, () => {
      expect(formatDuration(33)).assertEqual('33 ms');
      expect(formatDuration(33).length).assertEqual(5);
      expect(formatDuration(33).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0005
     * @tc.name testDuration0005
     * @tc.desc Verify 44 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0005', 0, () => {
      expect(formatDuration(44)).assertEqual('44 ms');
      expect(formatDuration(44).length).assertEqual(5);
      expect(formatDuration(44).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0006
     * @tc.name testDuration0006
     * @tc.desc Verify 55 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0006', 0, () => {
      expect(formatDuration(55)).assertEqual('55 ms');
      expect(formatDuration(55).length).assertEqual(5);
      expect(formatDuration(55).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0007
     * @tc.name testDuration0007
     * @tc.desc Verify 66 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0007', 0, () => {
      expect(formatDuration(66)).assertEqual('66 ms');
      expect(formatDuration(66).length).assertEqual(5);
      expect(formatDuration(66).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0008
     * @tc.name testDuration0008
     * @tc.desc Verify 77 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0008', 0, () => {
      expect(formatDuration(77)).assertEqual('77 ms');
      expect(formatDuration(77).length).assertEqual(5);
      expect(formatDuration(77).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0009
     * @tc.name testDuration0009
     * @tc.desc Verify 88 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0009', 0, () => {
      expect(formatDuration(88)).assertEqual('88 ms');
      expect(formatDuration(88).length).assertEqual(5);
      expect(formatDuration(88).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0010
     * @tc.name testDuration0010
     * @tc.desc Verify 99 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0010', 0, () => {
      expect(formatDuration(99)).assertEqual('99 ms');
      expect(formatDuration(99).length).assertEqual(5);
      expect(formatDuration(99).indexOf(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0011
     * @tc.name testDuration0011
     * @tc.desc Verify 110 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0011', 0, () => {
      expect(formatDuration(110)).assertEqual('110 ms');
      expect(formatDuration(110).length).assertEqual(6);
      expect(formatDuration(110).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0012
     * @tc.name testDuration0012
     * @tc.desc Verify 121 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0012', 0, () => {
      expect(formatDuration(121)).assertEqual('121 ms');
      expect(formatDuration(121).length).assertEqual(6);
      expect(formatDuration(121).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0013
     * @tc.name testDuration0013
     * @tc.desc Verify 132 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0013', 0, () => {
      expect(formatDuration(132)).assertEqual('132 ms');
      expect(formatDuration(132).length).assertEqual(6);
      expect(formatDuration(132).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0014
     * @tc.name testDuration0014
     * @tc.desc Verify 143 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0014', 0, () => {
      expect(formatDuration(143)).assertEqual('143 ms');
      expect(formatDuration(143).length).assertEqual(6);
      expect(formatDuration(143).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0015
     * @tc.name testDuration0015
     * @tc.desc Verify 154 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0015', 0, () => {
      expect(formatDuration(154)).assertEqual('154 ms');
      expect(formatDuration(154).length).assertEqual(6);
      expect(formatDuration(154).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0016
     * @tc.name testDuration0016
     * @tc.desc Verify 165 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0016', 0, () => {
      expect(formatDuration(165)).assertEqual('165 ms');
      expect(formatDuration(165).length).assertEqual(6);
      expect(formatDuration(165).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0017
     * @tc.name testDuration0017
     * @tc.desc Verify 176 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0017', 0, () => {
      expect(formatDuration(176)).assertEqual('176 ms');
      expect(formatDuration(176).length).assertEqual(6);
      expect(formatDuration(176).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0018
     * @tc.name testDuration0018
     * @tc.desc Verify 187 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0018', 0, () => {
      expect(formatDuration(187)).assertEqual('187 ms');
      expect(formatDuration(187).length).assertEqual(6);
      expect(formatDuration(187).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0019
     * @tc.name testDuration0019
     * @tc.desc Verify 198 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0019', 0, () => {
      expect(formatDuration(198)).assertEqual('198 ms');
      expect(formatDuration(198).length).assertEqual(6);
      expect(formatDuration(198).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0020
     * @tc.name testDuration0020
     * @tc.desc Verify 209 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0020', 0, () => {
      expect(formatDuration(209)).assertEqual('209 ms');
      expect(formatDuration(209).length).assertEqual(6);
      expect(formatDuration(209).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0021
     * @tc.name testDuration0021
     * @tc.desc Verify 220 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0021', 0, () => {
      expect(formatDuration(220)).assertEqual('220 ms');
      expect(formatDuration(220).length).assertEqual(6);
      expect(formatDuration(220).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0022
     * @tc.name testDuration0022
     * @tc.desc Verify 231 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0022', 0, () => {
      expect(formatDuration(231)).assertEqual('231 ms');
      expect(formatDuration(231).length).assertEqual(6);
      expect(formatDuration(231).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0023
     * @tc.name testDuration0023
     * @tc.desc Verify 242 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0023', 0, () => {
      expect(formatDuration(242)).assertEqual('242 ms');
      expect(formatDuration(242).length).assertEqual(6);
      expect(formatDuration(242).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0024
     * @tc.name testDuration0024
     * @tc.desc Verify 253 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0024', 0, () => {
      expect(formatDuration(253)).assertEqual('253 ms');
      expect(formatDuration(253).length).assertEqual(6);
      expect(formatDuration(253).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0025
     * @tc.name testDuration0025
     * @tc.desc Verify 264 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0025', 0, () => {
      expect(formatDuration(264)).assertEqual('264 ms');
      expect(formatDuration(264).length).assertEqual(6);
      expect(formatDuration(264).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0026
     * @tc.name testDuration0026
     * @tc.desc Verify 275 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0026', 0, () => {
      expect(formatDuration(275)).assertEqual('275 ms');
      expect(formatDuration(275).length).assertEqual(6);
      expect(formatDuration(275).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0027
     * @tc.name testDuration0027
     * @tc.desc Verify 286 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0027', 0, () => {
      expect(formatDuration(286)).assertEqual('286 ms');
      expect(formatDuration(286).length).assertEqual(6);
      expect(formatDuration(286).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0028
     * @tc.name testDuration0028
     * @tc.desc Verify 297 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0028', 0, () => {
      expect(formatDuration(297)).assertEqual('297 ms');
      expect(formatDuration(297).length).assertEqual(6);
      expect(formatDuration(297).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0029
     * @tc.name testDuration0029
     * @tc.desc Verify 308 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0029', 0, () => {
      expect(formatDuration(308)).assertEqual('308 ms');
      expect(formatDuration(308).length).assertEqual(6);
      expect(formatDuration(308).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0030
     * @tc.name testDuration0030
     * @tc.desc Verify 319 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0030', 0, () => {
      expect(formatDuration(319)).assertEqual('319 ms');
      expect(formatDuration(319).length).assertEqual(6);
      expect(formatDuration(319).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0031
     * @tc.name testDuration0031
     * @tc.desc Verify 330 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0031', 0, () => {
      expect(formatDuration(330)).assertEqual('330 ms');
      expect(formatDuration(330).length).assertEqual(6);
      expect(formatDuration(330).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0032
     * @tc.name testDuration0032
     * @tc.desc Verify 341 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0032', 0, () => {
      expect(formatDuration(341)).assertEqual('341 ms');
      expect(formatDuration(341).length).assertEqual(6);
      expect(formatDuration(341).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0033
     * @tc.name testDuration0033
     * @tc.desc Verify 352 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0033', 0, () => {
      expect(formatDuration(352)).assertEqual('352 ms');
      expect(formatDuration(352).length).assertEqual(6);
      expect(formatDuration(352).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0034
     * @tc.name testDuration0034
     * @tc.desc Verify 363 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0034', 0, () => {
      expect(formatDuration(363)).assertEqual('363 ms');
      expect(formatDuration(363).length).assertEqual(6);
      expect(formatDuration(363).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0035
     * @tc.name testDuration0035
     * @tc.desc Verify 374 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0035', 0, () => {
      expect(formatDuration(374)).assertEqual('374 ms');
      expect(formatDuration(374).length).assertEqual(6);
      expect(formatDuration(374).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0036
     * @tc.name testDuration0036
     * @tc.desc Verify 385 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0036', 0, () => {
      expect(formatDuration(385)).assertEqual('385 ms');
      expect(formatDuration(385).length).assertEqual(6);
      expect(formatDuration(385).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0037
     * @tc.name testDuration0037
     * @tc.desc Verify 396 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0037', 0, () => {
      expect(formatDuration(396)).assertEqual('396 ms');
      expect(formatDuration(396).length).assertEqual(6);
      expect(formatDuration(396).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0038
     * @tc.name testDuration0038
     * @tc.desc Verify 407 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0038', 0, () => {
      expect(formatDuration(407)).assertEqual('407 ms');
      expect(formatDuration(407).length).assertEqual(6);
      expect(formatDuration(407).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0039
     * @tc.name testDuration0039
     * @tc.desc Verify 418 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0039', 0, () => {
      expect(formatDuration(418)).assertEqual('418 ms');
      expect(formatDuration(418).length).assertEqual(6);
      expect(formatDuration(418).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0040
     * @tc.name testDuration0040
     * @tc.desc Verify 429 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0040', 0, () => {
      expect(formatDuration(429)).assertEqual('429 ms');
      expect(formatDuration(429).length).assertEqual(6);
      expect(formatDuration(429).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0041
     * @tc.name testDuration0041
     * @tc.desc Verify 440 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0041', 0, () => {
      expect(formatDuration(440)).assertEqual('440 ms');
      expect(formatDuration(440).length).assertEqual(6);
      expect(formatDuration(440).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0042
     * @tc.name testDuration0042
     * @tc.desc Verify 451 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0042', 0, () => {
      expect(formatDuration(451)).assertEqual('451 ms');
      expect(formatDuration(451).length).assertEqual(6);
      expect(formatDuration(451).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0043
     * @tc.name testDuration0043
     * @tc.desc Verify 462 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0043', 0, () => {
      expect(formatDuration(462)).assertEqual('462 ms');
      expect(formatDuration(462).length).assertEqual(6);
      expect(formatDuration(462).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0044
     * @tc.name testDuration0044
     * @tc.desc Verify 473 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0044', 0, () => {
      expect(formatDuration(473)).assertEqual('473 ms');
      expect(formatDuration(473).length).assertEqual(6);
      expect(formatDuration(473).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0045
     * @tc.name testDuration0045
     * @tc.desc Verify 484 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0045', 0, () => {
      expect(formatDuration(484)).assertEqual('484 ms');
      expect(formatDuration(484).length).assertEqual(6);
      expect(formatDuration(484).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0046
     * @tc.name testDuration0046
     * @tc.desc Verify 495 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0046', 0, () => {
      expect(formatDuration(495)).assertEqual('495 ms');
      expect(formatDuration(495).length).assertEqual(6);
      expect(formatDuration(495).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0047
     * @tc.name testDuration0047
     * @tc.desc Verify 506 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0047', 0, () => {
      expect(formatDuration(506)).assertEqual('506 ms');
      expect(formatDuration(506).length).assertEqual(6);
      expect(formatDuration(506).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0048
     * @tc.name testDuration0048
     * @tc.desc Verify 517 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0048', 0, () => {
      expect(formatDuration(517)).assertEqual('517 ms');
      expect(formatDuration(517).length).assertEqual(6);
      expect(formatDuration(517).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0049
     * @tc.name testDuration0049
     * @tc.desc Verify 528 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0049', 0, () => {
      expect(formatDuration(528)).assertEqual('528 ms');
      expect(formatDuration(528).length).assertEqual(6);
      expect(formatDuration(528).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0050
     * @tc.name testDuration0050
     * @tc.desc Verify 539 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0050', 0, () => {
      expect(formatDuration(539)).assertEqual('539 ms');
      expect(formatDuration(539).length).assertEqual(6);
      expect(formatDuration(539).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0051
     * @tc.name testDuration0051
     * @tc.desc Verify 550 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0051', 0, () => {
      expect(formatDuration(550)).assertEqual('550 ms');
      expect(formatDuration(550).length).assertEqual(6);
      expect(formatDuration(550).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0052
     * @tc.name testDuration0052
     * @tc.desc Verify 561 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0052', 0, () => {
      expect(formatDuration(561)).assertEqual('561 ms');
      expect(formatDuration(561).length).assertEqual(6);
      expect(formatDuration(561).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0053
     * @tc.name testDuration0053
     * @tc.desc Verify 572 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0053', 0, () => {
      expect(formatDuration(572)).assertEqual('572 ms');
      expect(formatDuration(572).length).assertEqual(6);
      expect(formatDuration(572).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0054
     * @tc.name testDuration0054
     * @tc.desc Verify 583 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0054', 0, () => {
      expect(formatDuration(583)).assertEqual('583 ms');
      expect(formatDuration(583).length).assertEqual(6);
      expect(formatDuration(583).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0055
     * @tc.name testDuration0055
     * @tc.desc Verify 594 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0055', 0, () => {
      expect(formatDuration(594)).assertEqual('594 ms');
      expect(formatDuration(594).length).assertEqual(6);
      expect(formatDuration(594).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0056
     * @tc.name testDuration0056
     * @tc.desc Verify 605 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0056', 0, () => {
      expect(formatDuration(605)).assertEqual('605 ms');
      expect(formatDuration(605).length).assertEqual(6);
      expect(formatDuration(605).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0057
     * @tc.name testDuration0057
     * @tc.desc Verify 616 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0057', 0, () => {
      expect(formatDuration(616)).assertEqual('616 ms');
      expect(formatDuration(616).length).assertEqual(6);
      expect(formatDuration(616).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0058
     * @tc.name testDuration0058
     * @tc.desc Verify 627 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0058', 0, () => {
      expect(formatDuration(627)).assertEqual('627 ms');
      expect(formatDuration(627).length).assertEqual(6);
      expect(formatDuration(627).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0059
     * @tc.name testDuration0059
     * @tc.desc Verify 638 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0059', 0, () => {
      expect(formatDuration(638)).assertEqual('638 ms');
      expect(formatDuration(638).length).assertEqual(6);
      expect(formatDuration(638).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0060
     * @tc.name testDuration0060
     * @tc.desc Verify 649 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0060', 0, () => {
      expect(formatDuration(649)).assertEqual('649 ms');
      expect(formatDuration(649).length).assertEqual(6);
      expect(formatDuration(649).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0061
     * @tc.name testDuration0061
     * @tc.desc Verify 660 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0061', 0, () => {
      expect(formatDuration(660)).assertEqual('660 ms');
      expect(formatDuration(660).length).assertEqual(6);
      expect(formatDuration(660).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0062
     * @tc.name testDuration0062
     * @tc.desc Verify 671 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0062', 0, () => {
      expect(formatDuration(671)).assertEqual('671 ms');
      expect(formatDuration(671).length).assertEqual(6);
      expect(formatDuration(671).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0063
     * @tc.name testDuration0063
     * @tc.desc Verify 682 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0063', 0, () => {
      expect(formatDuration(682)).assertEqual('682 ms');
      expect(formatDuration(682).length).assertEqual(6);
      expect(formatDuration(682).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0064
     * @tc.name testDuration0064
     * @tc.desc Verify 693 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0064', 0, () => {
      expect(formatDuration(693)).assertEqual('693 ms');
      expect(formatDuration(693).length).assertEqual(6);
      expect(formatDuration(693).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0065
     * @tc.name testDuration0065
     * @tc.desc Verify 704 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0065', 0, () => {
      expect(formatDuration(704)).assertEqual('704 ms');
      expect(formatDuration(704).length).assertEqual(6);
      expect(formatDuration(704).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0066
     * @tc.name testDuration0066
     * @tc.desc Verify 715 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0066', 0, () => {
      expect(formatDuration(715)).assertEqual('715 ms');
      expect(formatDuration(715).length).assertEqual(6);
      expect(formatDuration(715).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0067
     * @tc.name testDuration0067
     * @tc.desc Verify 726 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0067', 0, () => {
      expect(formatDuration(726)).assertEqual('726 ms');
      expect(formatDuration(726).length).assertEqual(6);
      expect(formatDuration(726).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0068
     * @tc.name testDuration0068
     * @tc.desc Verify 737 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0068', 0, () => {
      expect(formatDuration(737)).assertEqual('737 ms');
      expect(formatDuration(737).length).assertEqual(6);
      expect(formatDuration(737).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0069
     * @tc.name testDuration0069
     * @tc.desc Verify 748 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0069', 0, () => {
      expect(formatDuration(748)).assertEqual('748 ms');
      expect(formatDuration(748).length).assertEqual(6);
      expect(formatDuration(748).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0070
     * @tc.name testDuration0070
     * @tc.desc Verify 759 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0070', 0, () => {
      expect(formatDuration(759)).assertEqual('759 ms');
      expect(formatDuration(759).length).assertEqual(6);
      expect(formatDuration(759).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0071
     * @tc.name testDuration0071
     * @tc.desc Verify 770 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0071', 0, () => {
      expect(formatDuration(770)).assertEqual('770 ms');
      expect(formatDuration(770).length).assertEqual(6);
      expect(formatDuration(770).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0072
     * @tc.name testDuration0072
     * @tc.desc Verify 781 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0072', 0, () => {
      expect(formatDuration(781)).assertEqual('781 ms');
      expect(formatDuration(781).length).assertEqual(6);
      expect(formatDuration(781).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0073
     * @tc.name testDuration0073
     * @tc.desc Verify 792 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0073', 0, () => {
      expect(formatDuration(792)).assertEqual('792 ms');
      expect(formatDuration(792).length).assertEqual(6);
      expect(formatDuration(792).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0074
     * @tc.name testDuration0074
     * @tc.desc Verify 803 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0074', 0, () => {
      expect(formatDuration(803)).assertEqual('803 ms');
      expect(formatDuration(803).length).assertEqual(6);
      expect(formatDuration(803).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0075
     * @tc.name testDuration0075
     * @tc.desc Verify 814 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0075', 0, () => {
      expect(formatDuration(814)).assertEqual('814 ms');
      expect(formatDuration(814).length).assertEqual(6);
      expect(formatDuration(814).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0076
     * @tc.name testDuration0076
     * @tc.desc Verify 825 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0076', 0, () => {
      expect(formatDuration(825)).assertEqual('825 ms');
      expect(formatDuration(825).length).assertEqual(6);
      expect(formatDuration(825).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0077
     * @tc.name testDuration0077
     * @tc.desc Verify 836 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0077', 0, () => {
      expect(formatDuration(836)).assertEqual('836 ms');
      expect(formatDuration(836).length).assertEqual(6);
      expect(formatDuration(836).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0078
     * @tc.name testDuration0078
     * @tc.desc Verify 847 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0078', 0, () => {
      expect(formatDuration(847)).assertEqual('847 ms');
      expect(formatDuration(847).length).assertEqual(6);
      expect(formatDuration(847).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0079
     * @tc.name testDuration0079
     * @tc.desc Verify 858 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0079', 0, () => {
      expect(formatDuration(858)).assertEqual('858 ms');
      expect(formatDuration(858).length).assertEqual(6);
      expect(formatDuration(858).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0080
     * @tc.name testDuration0080
     * @tc.desc Verify 869 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0080', 0, () => {
      expect(formatDuration(869)).assertEqual('869 ms');
      expect(formatDuration(869).length).assertEqual(6);
      expect(formatDuration(869).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0081
     * @tc.name testDuration0081
     * @tc.desc Verify 880 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0081', 0, () => {
      expect(formatDuration(880)).assertEqual('880 ms');
      expect(formatDuration(880).length).assertEqual(6);
      expect(formatDuration(880).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0082
     * @tc.name testDuration0082
     * @tc.desc Verify 891 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0082', 0, () => {
      expect(formatDuration(891)).assertEqual('891 ms');
      expect(formatDuration(891).length).assertEqual(6);
      expect(formatDuration(891).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0083
     * @tc.name testDuration0083
     * @tc.desc Verify 902 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0083', 0, () => {
      expect(formatDuration(902)).assertEqual('902 ms');
      expect(formatDuration(902).length).assertEqual(6);
      expect(formatDuration(902).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0084
     * @tc.name testDuration0084
     * @tc.desc Verify 913 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0084', 0, () => {
      expect(formatDuration(913)).assertEqual('913 ms');
      expect(formatDuration(913).length).assertEqual(6);
      expect(formatDuration(913).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0085
     * @tc.name testDuration0085
     * @tc.desc Verify 924 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0085', 0, () => {
      expect(formatDuration(924)).assertEqual('924 ms');
      expect(formatDuration(924).length).assertEqual(6);
      expect(formatDuration(924).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0086
     * @tc.name testDuration0086
     * @tc.desc Verify 935 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0086', 0, () => {
      expect(formatDuration(935)).assertEqual('935 ms');
      expect(formatDuration(935).length).assertEqual(6);
      expect(formatDuration(935).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0087
     * @tc.name testDuration0087
     * @tc.desc Verify 946 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0087', 0, () => {
      expect(formatDuration(946)).assertEqual('946 ms');
      expect(formatDuration(946).length).assertEqual(6);
      expect(formatDuration(946).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0088
     * @tc.name testDuration0088
     * @tc.desc Verify 957 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0088', 0, () => {
      expect(formatDuration(957)).assertEqual('957 ms');
      expect(formatDuration(957).length).assertEqual(6);
      expect(formatDuration(957).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0089
     * @tc.name testDuration0089
     * @tc.desc Verify 968 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0089', 0, () => {
      expect(formatDuration(968)).assertEqual('968 ms');
      expect(formatDuration(968).length).assertEqual(6);
      expect(formatDuration(968).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0090
     * @tc.name testDuration0090
     * @tc.desc Verify 979 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0090', 0, () => {
      expect(formatDuration(979)).assertEqual('979 ms');
      expect(formatDuration(979).length).assertEqual(6);
      expect(formatDuration(979).indexOf(' ')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_DURATION_0091
     * @tc.name testDuration0091
     * @tc.desc Verify 990 milliseconds renders as the documented unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDuration0091', 0, () => {
      expect(formatDuration(990)).assertEqual('990 ms');
      expect(formatDuration(990).length).assertEqual(6);
      expect(formatDuration(990).indexOf(' ')).assertEqual(3);
    });

  });
}
