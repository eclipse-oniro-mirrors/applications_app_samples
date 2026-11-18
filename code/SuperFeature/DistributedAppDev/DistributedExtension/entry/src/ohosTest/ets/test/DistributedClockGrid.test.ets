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
import { formatTime } from '../../../main/ets/utils/FormatUtil';

/**
 * 时钟文案网格：24 个钟点 × 4 组时分秒（全 0 / 单位数 / 冒号边界 59 / 秒 1），共 96 条。
 * 日期用本地构造函数造，避免时区把 getHours 挪走，断言才对所有设备成立。
 */
export default function distributedClockGridTest() {
  describe('DistributedClockGridTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0001
     * @tc.name testClock0001
     * @tc.desc Verify clock 00:00:00 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0001', 0, () => {
      const date: Date = new Date(2026, 0, 2, 0, 0, 0);
      expect(formatTime(date)).assertEqual('00:00:00');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0002
     * @tc.name testClock0002
     * @tc.desc Verify clock 00:05:07 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0002', 0, () => {
      const date: Date = new Date(2026, 0, 2, 0, 5, 7);
      expect(formatTime(date)).assertEqual('00:05:07');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0003
     * @tc.name testClock0003
     * @tc.desc Verify clock 00:30:59 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0003', 0, () => {
      const date: Date = new Date(2026, 0, 2, 0, 30, 59);
      expect(formatTime(date)).assertEqual('00:30:59');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0004
     * @tc.name testClock0004
     * @tc.desc Verify clock 00:59:01 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0004', 0, () => {
      const date: Date = new Date(2026, 0, 2, 0, 59, 1);
      expect(formatTime(date)).assertEqual('00:59:01');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0005
     * @tc.name testClock0005
     * @tc.desc Verify clock 01:00:00 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0005', 0, () => {
      const date: Date = new Date(2026, 0, 2, 1, 0, 0);
      expect(formatTime(date)).assertEqual('01:00:00');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0006
     * @tc.name testClock0006
     * @tc.desc Verify clock 01:05:07 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0006', 0, () => {
      const date: Date = new Date(2026, 0, 2, 1, 5, 7);
      expect(formatTime(date)).assertEqual('01:05:07');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0007
     * @tc.name testClock0007
     * @tc.desc Verify clock 01:30:59 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0007', 0, () => {
      const date: Date = new Date(2026, 0, 2, 1, 30, 59);
      expect(formatTime(date)).assertEqual('01:30:59');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0008
     * @tc.name testClock0008
     * @tc.desc Verify clock 01:59:01 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0008', 0, () => {
      const date: Date = new Date(2026, 0, 2, 1, 59, 1);
      expect(formatTime(date)).assertEqual('01:59:01');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0009
     * @tc.name testClock0009
     * @tc.desc Verify clock 02:00:00 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0009', 0, () => {
      const date: Date = new Date(2026, 0, 2, 2, 0, 0);
      expect(formatTime(date)).assertEqual('02:00:00');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0010
     * @tc.name testClock0010
     * @tc.desc Verify clock 02:05:07 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0010', 0, () => {
      const date: Date = new Date(2026, 0, 2, 2, 5, 7);
      expect(formatTime(date)).assertEqual('02:05:07');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0011
     * @tc.name testClock0011
     * @tc.desc Verify clock 02:30:59 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0011', 0, () => {
      const date: Date = new Date(2026, 0, 2, 2, 30, 59);
      expect(formatTime(date)).assertEqual('02:30:59');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0012
     * @tc.name testClock0012
     * @tc.desc Verify clock 02:59:01 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0012', 0, () => {
      const date: Date = new Date(2026, 0, 2, 2, 59, 1);
      expect(formatTime(date)).assertEqual('02:59:01');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0013
     * @tc.name testClock0013
     * @tc.desc Verify clock 03:00:00 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0013', 0, () => {
      const date: Date = new Date(2026, 0, 2, 3, 0, 0);
      expect(formatTime(date)).assertEqual('03:00:00');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0014
     * @tc.name testClock0014
     * @tc.desc Verify clock 03:05:07 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0014', 0, () => {
      const date: Date = new Date(2026, 0, 2, 3, 5, 7);
      expect(formatTime(date)).assertEqual('03:05:07');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0015
     * @tc.name testClock0015
     * @tc.desc Verify clock 03:30:59 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0015', 0, () => {
      const date: Date = new Date(2026, 0, 2, 3, 30, 59);
      expect(formatTime(date)).assertEqual('03:30:59');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0016
     * @tc.name testClock0016
     * @tc.desc Verify clock 03:59:01 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0016', 0, () => {
      const date: Date = new Date(2026, 0, 2, 3, 59, 1);
      expect(formatTime(date)).assertEqual('03:59:01');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0017
     * @tc.name testClock0017
     * @tc.desc Verify clock 04:00:00 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0017', 0, () => {
      const date: Date = new Date(2026, 0, 2, 4, 0, 0);
      expect(formatTime(date)).assertEqual('04:00:00');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0018
     * @tc.name testClock0018
     * @tc.desc Verify clock 04:05:07 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0018', 0, () => {
      const date: Date = new Date(2026, 0, 2, 4, 5, 7);
      expect(formatTime(date)).assertEqual('04:05:07');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0019
     * @tc.name testClock0019
     * @tc.desc Verify clock 04:30:59 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0019', 0, () => {
      const date: Date = new Date(2026, 0, 2, 4, 30, 59);
      expect(formatTime(date)).assertEqual('04:30:59');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0020
     * @tc.name testClock0020
     * @tc.desc Verify clock 04:59:01 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0020', 0, () => {
      const date: Date = new Date(2026, 0, 2, 4, 59, 1);
      expect(formatTime(date)).assertEqual('04:59:01');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0021
     * @tc.name testClock0021
     * @tc.desc Verify clock 05:00:00 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0021', 0, () => {
      const date: Date = new Date(2026, 0, 2, 5, 0, 0);
      expect(formatTime(date)).assertEqual('05:00:00');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0022
     * @tc.name testClock0022
     * @tc.desc Verify clock 05:05:07 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0022', 0, () => {
      const date: Date = new Date(2026, 0, 2, 5, 5, 7);
      expect(formatTime(date)).assertEqual('05:05:07');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0023
     * @tc.name testClock0023
     * @tc.desc Verify clock 05:30:59 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0023', 0, () => {
      const date: Date = new Date(2026, 0, 2, 5, 30, 59);
      expect(formatTime(date)).assertEqual('05:30:59');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0024
     * @tc.name testClock0024
     * @tc.desc Verify clock 05:59:01 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0024', 0, () => {
      const date: Date = new Date(2026, 0, 2, 5, 59, 1);
      expect(formatTime(date)).assertEqual('05:59:01');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0025
     * @tc.name testClock0025
     * @tc.desc Verify clock 06:00:00 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0025', 0, () => {
      const date: Date = new Date(2026, 0, 2, 6, 0, 0);
      expect(formatTime(date)).assertEqual('06:00:00');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0026
     * @tc.name testClock0026
     * @tc.desc Verify clock 06:05:07 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0026', 0, () => {
      const date: Date = new Date(2026, 0, 2, 6, 5, 7);
      expect(formatTime(date)).assertEqual('06:05:07');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0027
     * @tc.name testClock0027
     * @tc.desc Verify clock 06:30:59 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0027', 0, () => {
      const date: Date = new Date(2026, 0, 2, 6, 30, 59);
      expect(formatTime(date)).assertEqual('06:30:59');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0028
     * @tc.name testClock0028
     * @tc.desc Verify clock 06:59:01 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0028', 0, () => {
      const date: Date = new Date(2026, 0, 2, 6, 59, 1);
      expect(formatTime(date)).assertEqual('06:59:01');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0029
     * @tc.name testClock0029
     * @tc.desc Verify clock 07:00:00 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0029', 0, () => {
      const date: Date = new Date(2026, 0, 2, 7, 0, 0);
      expect(formatTime(date)).assertEqual('07:00:00');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0030
     * @tc.name testClock0030
     * @tc.desc Verify clock 07:05:07 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0030', 0, () => {
      const date: Date = new Date(2026, 0, 2, 7, 5, 7);
      expect(formatTime(date)).assertEqual('07:05:07');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0031
     * @tc.name testClock0031
     * @tc.desc Verify clock 07:30:59 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0031', 0, () => {
      const date: Date = new Date(2026, 0, 2, 7, 30, 59);
      expect(formatTime(date)).assertEqual('07:30:59');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0032
     * @tc.name testClock0032
     * @tc.desc Verify clock 07:59:01 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0032', 0, () => {
      const date: Date = new Date(2026, 0, 2, 7, 59, 1);
      expect(formatTime(date)).assertEqual('07:59:01');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0033
     * @tc.name testClock0033
     * @tc.desc Verify clock 08:00:00 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0033', 0, () => {
      const date: Date = new Date(2026, 0, 2, 8, 0, 0);
      expect(formatTime(date)).assertEqual('08:00:00');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0034
     * @tc.name testClock0034
     * @tc.desc Verify clock 08:05:07 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0034', 0, () => {
      const date: Date = new Date(2026, 0, 2, 8, 5, 7);
      expect(formatTime(date)).assertEqual('08:05:07');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0035
     * @tc.name testClock0035
     * @tc.desc Verify clock 08:30:59 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0035', 0, () => {
      const date: Date = new Date(2026, 0, 2, 8, 30, 59);
      expect(formatTime(date)).assertEqual('08:30:59');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0036
     * @tc.name testClock0036
     * @tc.desc Verify clock 08:59:01 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0036', 0, () => {
      const date: Date = new Date(2026, 0, 2, 8, 59, 1);
      expect(formatTime(date)).assertEqual('08:59:01');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0037
     * @tc.name testClock0037
     * @tc.desc Verify clock 09:00:00 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0037', 0, () => {
      const date: Date = new Date(2026, 0, 2, 9, 0, 0);
      expect(formatTime(date)).assertEqual('09:00:00');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0038
     * @tc.name testClock0038
     * @tc.desc Verify clock 09:05:07 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0038', 0, () => {
      const date: Date = new Date(2026, 0, 2, 9, 5, 7);
      expect(formatTime(date)).assertEqual('09:05:07');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0039
     * @tc.name testClock0039
     * @tc.desc Verify clock 09:30:59 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0039', 0, () => {
      const date: Date = new Date(2026, 0, 2, 9, 30, 59);
      expect(formatTime(date)).assertEqual('09:30:59');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0040
     * @tc.name testClock0040
     * @tc.desc Verify clock 09:59:01 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0040', 0, () => {
      const date: Date = new Date(2026, 0, 2, 9, 59, 1);
      expect(formatTime(date)).assertEqual('09:59:01');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0041
     * @tc.name testClock0041
     * @tc.desc Verify clock 10:00:00 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0041', 0, () => {
      const date: Date = new Date(2026, 0, 2, 10, 0, 0);
      expect(formatTime(date)).assertEqual('10:00:00');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0042
     * @tc.name testClock0042
     * @tc.desc Verify clock 10:05:07 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0042', 0, () => {
      const date: Date = new Date(2026, 0, 2, 10, 5, 7);
      expect(formatTime(date)).assertEqual('10:05:07');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0043
     * @tc.name testClock0043
     * @tc.desc Verify clock 10:30:59 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0043', 0, () => {
      const date: Date = new Date(2026, 0, 2, 10, 30, 59);
      expect(formatTime(date)).assertEqual('10:30:59');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0044
     * @tc.name testClock0044
     * @tc.desc Verify clock 10:59:01 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0044', 0, () => {
      const date: Date = new Date(2026, 0, 2, 10, 59, 1);
      expect(formatTime(date)).assertEqual('10:59:01');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0045
     * @tc.name testClock0045
     * @tc.desc Verify clock 11:00:00 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0045', 0, () => {
      const date: Date = new Date(2026, 0, 2, 11, 0, 0);
      expect(formatTime(date)).assertEqual('11:00:00');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0046
     * @tc.name testClock0046
     * @tc.desc Verify clock 11:05:07 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0046', 0, () => {
      const date: Date = new Date(2026, 0, 2, 11, 5, 7);
      expect(formatTime(date)).assertEqual('11:05:07');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0047
     * @tc.name testClock0047
     * @tc.desc Verify clock 11:30:59 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0047', 0, () => {
      const date: Date = new Date(2026, 0, 2, 11, 30, 59);
      expect(formatTime(date)).assertEqual('11:30:59');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0048
     * @tc.name testClock0048
     * @tc.desc Verify clock 11:59:01 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0048', 0, () => {
      const date: Date = new Date(2026, 0, 2, 11, 59, 1);
      expect(formatTime(date)).assertEqual('11:59:01');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0049
     * @tc.name testClock0049
     * @tc.desc Verify clock 12:00:00 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0049', 0, () => {
      const date: Date = new Date(2026, 0, 2, 12, 0, 0);
      expect(formatTime(date)).assertEqual('12:00:00');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0050
     * @tc.name testClock0050
     * @tc.desc Verify clock 12:05:07 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0050', 0, () => {
      const date: Date = new Date(2026, 0, 2, 12, 5, 7);
      expect(formatTime(date)).assertEqual('12:05:07');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0051
     * @tc.name testClock0051
     * @tc.desc Verify clock 12:30:59 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0051', 0, () => {
      const date: Date = new Date(2026, 0, 2, 12, 30, 59);
      expect(formatTime(date)).assertEqual('12:30:59');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0052
     * @tc.name testClock0052
     * @tc.desc Verify clock 12:59:01 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0052', 0, () => {
      const date: Date = new Date(2026, 0, 2, 12, 59, 1);
      expect(formatTime(date)).assertEqual('12:59:01');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0053
     * @tc.name testClock0053
     * @tc.desc Verify clock 13:00:00 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0053', 0, () => {
      const date: Date = new Date(2026, 0, 2, 13, 0, 0);
      expect(formatTime(date)).assertEqual('13:00:00');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0054
     * @tc.name testClock0054
     * @tc.desc Verify clock 13:05:07 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0054', 0, () => {
      const date: Date = new Date(2026, 0, 2, 13, 5, 7);
      expect(formatTime(date)).assertEqual('13:05:07');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0055
     * @tc.name testClock0055
     * @tc.desc Verify clock 13:30:59 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0055', 0, () => {
      const date: Date = new Date(2026, 0, 2, 13, 30, 59);
      expect(formatTime(date)).assertEqual('13:30:59');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0056
     * @tc.name testClock0056
     * @tc.desc Verify clock 13:59:01 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0056', 0, () => {
      const date: Date = new Date(2026, 0, 2, 13, 59, 1);
      expect(formatTime(date)).assertEqual('13:59:01');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0057
     * @tc.name testClock0057
     * @tc.desc Verify clock 14:00:00 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0057', 0, () => {
      const date: Date = new Date(2026, 0, 2, 14, 0, 0);
      expect(formatTime(date)).assertEqual('14:00:00');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0058
     * @tc.name testClock0058
     * @tc.desc Verify clock 14:05:07 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0058', 0, () => {
      const date: Date = new Date(2026, 0, 2, 14, 5, 7);
      expect(formatTime(date)).assertEqual('14:05:07');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0059
     * @tc.name testClock0059
     * @tc.desc Verify clock 14:30:59 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0059', 0, () => {
      const date: Date = new Date(2026, 0, 2, 14, 30, 59);
      expect(formatTime(date)).assertEqual('14:30:59');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0060
     * @tc.name testClock0060
     * @tc.desc Verify clock 14:59:01 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0060', 0, () => {
      const date: Date = new Date(2026, 0, 2, 14, 59, 1);
      expect(formatTime(date)).assertEqual('14:59:01');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0061
     * @tc.name testClock0061
     * @tc.desc Verify clock 15:00:00 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0061', 0, () => {
      const date: Date = new Date(2026, 0, 2, 15, 0, 0);
      expect(formatTime(date)).assertEqual('15:00:00');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0062
     * @tc.name testClock0062
     * @tc.desc Verify clock 15:05:07 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0062', 0, () => {
      const date: Date = new Date(2026, 0, 2, 15, 5, 7);
      expect(formatTime(date)).assertEqual('15:05:07');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0063
     * @tc.name testClock0063
     * @tc.desc Verify clock 15:30:59 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0063', 0, () => {
      const date: Date = new Date(2026, 0, 2, 15, 30, 59);
      expect(formatTime(date)).assertEqual('15:30:59');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0064
     * @tc.name testClock0064
     * @tc.desc Verify clock 15:59:01 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0064', 0, () => {
      const date: Date = new Date(2026, 0, 2, 15, 59, 1);
      expect(formatTime(date)).assertEqual('15:59:01');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0065
     * @tc.name testClock0065
     * @tc.desc Verify clock 16:00:00 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0065', 0, () => {
      const date: Date = new Date(2026, 0, 2, 16, 0, 0);
      expect(formatTime(date)).assertEqual('16:00:00');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0066
     * @tc.name testClock0066
     * @tc.desc Verify clock 16:05:07 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0066', 0, () => {
      const date: Date = new Date(2026, 0, 2, 16, 5, 7);
      expect(formatTime(date)).assertEqual('16:05:07');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0067
     * @tc.name testClock0067
     * @tc.desc Verify clock 16:30:59 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0067', 0, () => {
      const date: Date = new Date(2026, 0, 2, 16, 30, 59);
      expect(formatTime(date)).assertEqual('16:30:59');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0068
     * @tc.name testClock0068
     * @tc.desc Verify clock 16:59:01 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0068', 0, () => {
      const date: Date = new Date(2026, 0, 2, 16, 59, 1);
      expect(formatTime(date)).assertEqual('16:59:01');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0069
     * @tc.name testClock0069
     * @tc.desc Verify clock 17:00:00 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0069', 0, () => {
      const date: Date = new Date(2026, 0, 2, 17, 0, 0);
      expect(formatTime(date)).assertEqual('17:00:00');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0070
     * @tc.name testClock0070
     * @tc.desc Verify clock 17:05:07 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0070', 0, () => {
      const date: Date = new Date(2026, 0, 2, 17, 5, 7);
      expect(formatTime(date)).assertEqual('17:05:07');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0071
     * @tc.name testClock0071
     * @tc.desc Verify clock 17:30:59 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0071', 0, () => {
      const date: Date = new Date(2026, 0, 2, 17, 30, 59);
      expect(formatTime(date)).assertEqual('17:30:59');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0072
     * @tc.name testClock0072
     * @tc.desc Verify clock 17:59:01 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0072', 0, () => {
      const date: Date = new Date(2026, 0, 2, 17, 59, 1);
      expect(formatTime(date)).assertEqual('17:59:01');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0073
     * @tc.name testClock0073
     * @tc.desc Verify clock 18:00:00 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0073', 0, () => {
      const date: Date = new Date(2026, 0, 2, 18, 0, 0);
      expect(formatTime(date)).assertEqual('18:00:00');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0074
     * @tc.name testClock0074
     * @tc.desc Verify clock 18:05:07 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0074', 0, () => {
      const date: Date = new Date(2026, 0, 2, 18, 5, 7);
      expect(formatTime(date)).assertEqual('18:05:07');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0075
     * @tc.name testClock0075
     * @tc.desc Verify clock 18:30:59 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0075', 0, () => {
      const date: Date = new Date(2026, 0, 2, 18, 30, 59);
      expect(formatTime(date)).assertEqual('18:30:59');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0076
     * @tc.name testClock0076
     * @tc.desc Verify clock 18:59:01 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0076', 0, () => {
      const date: Date = new Date(2026, 0, 2, 18, 59, 1);
      expect(formatTime(date)).assertEqual('18:59:01');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0077
     * @tc.name testClock0077
     * @tc.desc Verify clock 19:00:00 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0077', 0, () => {
      const date: Date = new Date(2026, 0, 2, 19, 0, 0);
      expect(formatTime(date)).assertEqual('19:00:00');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0078
     * @tc.name testClock0078
     * @tc.desc Verify clock 19:05:07 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0078', 0, () => {
      const date: Date = new Date(2026, 0, 2, 19, 5, 7);
      expect(formatTime(date)).assertEqual('19:05:07');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0079
     * @tc.name testClock0079
     * @tc.desc Verify clock 19:30:59 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0079', 0, () => {
      const date: Date = new Date(2026, 0, 2, 19, 30, 59);
      expect(formatTime(date)).assertEqual('19:30:59');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0080
     * @tc.name testClock0080
     * @tc.desc Verify clock 19:59:01 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0080', 0, () => {
      const date: Date = new Date(2026, 0, 2, 19, 59, 1);
      expect(formatTime(date)).assertEqual('19:59:01');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0081
     * @tc.name testClock0081
     * @tc.desc Verify clock 20:00:00 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0081', 0, () => {
      const date: Date = new Date(2026, 0, 2, 20, 0, 0);
      expect(formatTime(date)).assertEqual('20:00:00');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0082
     * @tc.name testClock0082
     * @tc.desc Verify clock 20:05:07 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0082', 0, () => {
      const date: Date = new Date(2026, 0, 2, 20, 5, 7);
      expect(formatTime(date)).assertEqual('20:05:07');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0083
     * @tc.name testClock0083
     * @tc.desc Verify clock 20:30:59 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0083', 0, () => {
      const date: Date = new Date(2026, 0, 2, 20, 30, 59);
      expect(formatTime(date)).assertEqual('20:30:59');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0084
     * @tc.name testClock0084
     * @tc.desc Verify clock 20:59:01 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0084', 0, () => {
      const date: Date = new Date(2026, 0, 2, 20, 59, 1);
      expect(formatTime(date)).assertEqual('20:59:01');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0085
     * @tc.name testClock0085
     * @tc.desc Verify clock 21:00:00 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0085', 0, () => {
      const date: Date = new Date(2026, 0, 2, 21, 0, 0);
      expect(formatTime(date)).assertEqual('21:00:00');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0086
     * @tc.name testClock0086
     * @tc.desc Verify clock 21:05:07 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0086', 0, () => {
      const date: Date = new Date(2026, 0, 2, 21, 5, 7);
      expect(formatTime(date)).assertEqual('21:05:07');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0087
     * @tc.name testClock0087
     * @tc.desc Verify clock 21:30:59 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0087', 0, () => {
      const date: Date = new Date(2026, 0, 2, 21, 30, 59);
      expect(formatTime(date)).assertEqual('21:30:59');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0088
     * @tc.name testClock0088
     * @tc.desc Verify clock 21:59:01 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0088', 0, () => {
      const date: Date = new Date(2026, 0, 2, 21, 59, 1);
      expect(formatTime(date)).assertEqual('21:59:01');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0089
     * @tc.name testClock0089
     * @tc.desc Verify clock 22:00:00 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0089', 0, () => {
      const date: Date = new Date(2026, 0, 2, 22, 0, 0);
      expect(formatTime(date)).assertEqual('22:00:00');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0090
     * @tc.name testClock0090
     * @tc.desc Verify clock 22:05:07 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0090', 0, () => {
      const date: Date = new Date(2026, 0, 2, 22, 5, 7);
      expect(formatTime(date)).assertEqual('22:05:07');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0091
     * @tc.name testClock0091
     * @tc.desc Verify clock 22:30:59 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0091', 0, () => {
      const date: Date = new Date(2026, 0, 2, 22, 30, 59);
      expect(formatTime(date)).assertEqual('22:30:59');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0092
     * @tc.name testClock0092
     * @tc.desc Verify clock 22:59:01 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0092', 0, () => {
      const date: Date = new Date(2026, 0, 2, 22, 59, 1);
      expect(formatTime(date)).assertEqual('22:59:01');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0093
     * @tc.name testClock0093
     * @tc.desc Verify clock 23:00:00 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0093', 0, () => {
      const date: Date = new Date(2026, 0, 2, 23, 0, 0);
      expect(formatTime(date)).assertEqual('23:00:00');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0094
     * @tc.name testClock0094
     * @tc.desc Verify clock 23:05:07 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0094', 0, () => {
      const date: Date = new Date(2026, 0, 2, 23, 5, 7);
      expect(formatTime(date)).assertEqual('23:05:07');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0095
     * @tc.name testClock0095
     * @tc.desc Verify clock 23:30:59 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0095', 0, () => {
      const date: Date = new Date(2026, 0, 2, 23, 30, 59);
      expect(formatTime(date)).assertEqual('23:30:59');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLOCK_0096
     * @tc.name testClock0096
     * @tc.desc Verify clock 23:59:01 is rendered from a local date without a locale shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClock0096', 0, () => {
      const date: Date = new Date(2026, 0, 2, 23, 59, 1);
      expect(formatTime(date)).assertEqual('23:59:01');
      expect(formatTime(date).length).assertEqual(8);
      expect(formatTime(date).split(':').length).assertEqual(3);
    });

  });
}
